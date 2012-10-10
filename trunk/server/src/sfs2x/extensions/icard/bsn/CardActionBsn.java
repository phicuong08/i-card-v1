package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import com.smartfoxserver.v2.entities.data.ISFSObject;

import sfs2x.extensions.icard.beans.CardActionBean;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.beans.CardInfoStoreBean;
import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Commands;
import sfs2x.extensions.icard.utils.Constants;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionBsn
{	
	public static int getActionCost(CardGameBean game,CardActionBean action){
		CardBean card = game.getCard(action.getSrc());
		if(card==null)
			return 911;
		int cost = 0;
		switch(action.getType()){
		case CardActionBean.DO_FIGHT_CARD:
			cost = getAtkCost(card.getCardID());
			break;
		case CardActionBean.DO_ENTER_CARD:
			cost = card.getCost();			
			break;
		case CardActionBean.DO_CARD_2_TURN:
		case CardActionBean.DO_CARD_2_TASK:
			cost = getUseCost(card.getCardID());
			break;	
		}
		return cost;
	}
	private static boolean procEnterCard(CardGameBean game,CardDeckBean deck,CardBean card,CardActionBean action){
		if(game.getStateBean().getState()!=BattleStateBean.ST_WAIT_PLAY_CARD)
			return false;
		if(deck.getCurRes()< card.getCost())
			return false;
		boolean ret = false;
		switch(card.getCardType()){
//		case CardInfoBean.HERO:
//			break;
		case CardInfoBean.ALLY:
			ret = procCard2FightSlot(game,deck,card);
			break;
		case CardInfoBean.WEAPON:
			ret = procCard2EquipSlot(deck,card);
			break;
		case CardInfoBean.ARMOR:
			ret = procCard2EquipSlot(deck,card);
			break;
		case CardInfoBean.SUPPORT:
			ret = procCard2SupportSlot(deck,card);
			break;
		case CardInfoBean.ABILITY:
			//procCard2Fight(game,deck,card,action);
			break;
		case CardInfoBean.QUEST:
			break;					
		}
		return ret;
	}
	public static boolean procCardAction(CardGameBean game, CardActionBean action,ICardExtension ext){
		if(action==null)
			return false;
		CardDeckBean deck = game.getDeck().get(action.getPlayerID());
		if(deck==null)
			return false;
		CardBean card = game.getCard(action.getSrc());
		if(card==null)
			return false;
		boolean ret = false;
		switch(action.getType()){
		case CardActionBean.DO_ENTER_CARD:
			ret = procEnterCard(game,deck,card,action);
			break;
		case CardActionBean.DO_FIGHT_CARD:
			ret = procCard2Fight(game,deck,card,action);
			break;
		case CardActionBean.DO_PLAY_RES_CARD:
			ret = procPlayResCard(deck,card);
			break;
		case CardActionBean.DO_ABILITY_2_OP:
			ret =procAbility2Op(game,deck,card,action);
			break;
		}
		return ret;
	}
	
	public static boolean IsFriendAction(CardGameBean game,CardActionBean action){
		if(action.getDes().size()==0)
			return true;
		int desID = action.getDes().get(0);
		return (game.getCardOwner(desID) == action.getPlayerID());
		
	}
	public static boolean IsAtkValidate(CardGameBean game,CardBean atk,CardBean def){
		int whichAtk = atk.IsHero()?CardAbilityBean.WHICH_MYHERO:CardAbilityBean.WHICH_MYSOLDIER;
		int whichDef = def.IsHero()?CardAbilityBean.WHICH_MYHERO:CardAbilityBean.WHICH_MYSOLDIER;
		if(GameBsn.ExistGameSupport(game,whichAtk,CardAbilityBean.BUF_ATK_UNABLE))
			return false;
		if(GameBsn.ExistGameSupport(game,whichDef,CardAbilityBean.BUF_UNABLE_ATKED))
			return false;
		CardDeckBean atkDeck = game.getDeck(atk.getOwner());
		if(CardSiteBsn.ExistDeckSupport(atkDeck, whichAtk, CardAbilityBean.BUF_ATK_UNABLE))
			return false;
		CardDeckBean defDeck = game.getDeck(def.getOwner());
		if(CardSiteBsn.ExistDeckSupport(defDeck, whichDef, CardAbilityBean.BUF_UNABLE_ATKED))
			return false;
		return true;
	}
	private static void procCard2Atk(CardGameBean game,CardBean card,CardActionBean action){
		int desID = action.getDes().get(0);
		CardBean card2 = game.getCard(desID);
		if(IsAtkValidate(game,card,card2)==false)
			return;
		if(card.IsAtkUnable(game,CardAbilityBean.WHEN_ATK))
			return;
		if(card2.IsUnableAtked(game,CardAbilityBean.WHEN_ATKED))
			return;
		CardUseBsn.AtkedCure(game, card2);
		CardUseBsn.Atk(game,card, card2);	
	}
	private static boolean procAbility2Cast(CardGameBean game,CardDeckBean site,CardBean card,CardActionBean action){
		return CardUseBsn.ability2Cast(game,site,card,action);
	}
	
	private static boolean procAbility2Op(CardGameBean game,CardDeckBean site,CardBean card,CardActionBean action){
		CardAbilityBean abilityBean = CardAbilityStoreBean.GetInstance().getAbilityOnID(game.getStateBean().getCurAbility());
		if(abilityBean==null)
			return false;
		
		Vector<Integer> desVect = action.getDes();
		if(desVect.size()==0)
			return false;
			
		int targetNum = (desVect.size()>abilityBean.getTargetNum())? abilityBean.getTargetNum():desVect.size();
		for(int i=0;i<targetNum;i++){
			int desID = desVect.get(i);
			if(CardAbilityBsn.IsWhichMatch(card.getRealID(),desID,abilityBean,game)==false)
				continue;
			CardBean desCard = game.getCard(desID);
			if(desCard==null)
				continue;
			CardUseBsn.DoWhatAbility(game,card,desCard,abilityBean);
		}
		card.AddHp(0);
		ISFSObject params = SFSObjectBsn.genFightResult(game,action);
		ICardExtension.getExt().SendGameCommand(Commands.CMD_S2C_FIGHT_CARD_RESULT, params, game);
		return true;
	}
	
	private static boolean procCard2Fight(CardGameBean game,CardDeckBean site,CardBean card,CardActionBean action){
		switch(card.getCardType()){
		case CardInfoBean.HERO:
		case CardInfoBean.ALLY:
			procCard2Atk(game,card,action);
			break;
		case CardInfoBean.ABILITY:
			procAbility2Cast(game,site,card,action);
			break;
		case CardInfoBean.ARMOR:
			procEquip2Use(game,card,action);
			break;
		case CardInfoBean.WEAPON:
			procWeapon2Use(game,card,action);
			break;
		}

		return true;
	}
	private static boolean procWeapon2Use(CardGameBean game,CardBean card,CardActionBean action){
//		CardInfoBean cardInfo = card.getInfo();
//		if(IsMatchUse(game,action,card)==false)
//			return false;
//		int desID = action.getDes().get(0);	
		return true;
	}
	private static boolean procEquip2Use(CardGameBean game,CardBean card,CardActionBean action){
//		CardInfoBean cardInfo = card.getInfo();
//		if(IsMatchUse(game,action,card)==false)
//			return false;
		return true;
	}
	
	private static boolean procCard2FightSlot(CardGameBean game,CardDeckBean site,CardBean card){
		site.useRes(card.getCost());
		card.setZoneID(CardBean.FIGHT_ZONE_ID);	
		card.setDirtyFlagBit(CardBean.ATK_DIRTY_BIT);
		card.setSide(3);
		return true;
	}
	private static boolean procCard2SupportSlot(CardDeckBean site,CardBean card){
		site.useRes(card.getCost());
		card.setZoneID(CardBean.SUPPORT_ZONE_ID);	
		card.setSide(0);
		
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.FIGHT_ZONE_ID,CardInfoBean.ALLY);
		cardVect.add(site.getHero());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			for(int j=0;j<cardVect.size();j++){
				CardBean c = cardVect.get(j);
				if(ability.IsWhichMatch(c.getWhich())==false)
					continue;
				if(ability.getWhen()!=CardAbilityBean.WHEN_ALL)
					continue;
				switch(ability.getType()){
				case CardAbilityBean.BUF_ATK_ADD:
					c.setDirtyFlagBit(CardBean.ATK_DIRTY_BIT);
					break;
				}
			}
		}
		return true;
	}
	private static boolean procCard2EquipSlot(CardDeckBean site,CardBean card){
		site.useRes(card.getCost());
		card.setZoneID(CardBean.EQUIP_ZONE_ID);	
		card.setSide(3);
		return true;
	}
	private static boolean procPlayResCard(CardDeckBean site,CardBean card){
		site.addRes();
		card.setCardID(Constants.BACK_CARD_ID);
		card.setZoneID(CardBean.GRAVE_ZONE_ID);
		card.setSide(0);
		return true;
	}
	private static int getUseCost(int cardID){
		CardInfoBean info = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
		
		if(info!=null){
			return info.getBaseUseCost();
		}
		else{
			return 911;
		}
	}
	
	public static boolean IsMatchFight(CardGameBean game,int src,int des){
	
		if(game.getStateBean().getState()== BattleStateBean.ST_WAIT_EX_OP)
			return true;
			
		CardBean card1 = game.getCard(src);
		CardBean card2 = game.getCard(des);
		if(card1==null ||card2==null)
			return false;
		if(card2.getZoneID()==CardBean.HAND_ZONE_ID||
				card2.getZoneID()==CardBean.RES_ZONE_ID)
				return false;
		boolean bMatch = false;
		switch(card1.getCardType()){
		case CardInfoBean.HERO:
		case CardInfoBean.ALLY:
		case CardInfoBean.WEAPON:
			bMatch = (card2.getCardType()==CardInfoBean.HERO || card2.getCardType()==CardInfoBean.ALLY) && (card2.IsHidden(game)==false);
			break;
		case CardInfoBean.ABILITY:
				if(card2.getCardType()==CardInfoBean.HERO || card2.getCardType()==CardInfoBean.ALLY)
				{
					bMatch = !card2.IsPointUnable(game);
				}
				else
					bMatch = true;
			break;	
		}
		return bMatch;
	}
	private static int getAtkCost(int cardID){
		int cost =0;
		CardInfoBean card = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
		if(card==null)
			return 0;
	//	CardInfoBean cardInfo = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
		switch(card.getType()){
			case CardInfoBean.WEAPON:
				cost = card.getBaseUseCost();
				break;
				
		}
		return cost;
	}	
}
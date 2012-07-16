package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import sfs2x.extensions.icard.beans.CardActionBean;

import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.beans.CardInfoStoreBean;
import sfs2x.extensions.icard.beans.CardSiteBean;
import sfs2x.extensions.icard.beans.CardUseBean;
import sfs2x.extensions.icard.beans.CardUseStoreBean;
import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Constants;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionBsn
{	
	
	public static void procAction(CardGameBean game,CardActionBean action){
		switch(action.getType()){
			case CardActionBean.DO_CARD_2_FIGHT:
				break;
			case CardActionBean.DO_CARD_2_DEF:
				break;
			case CardActionBean.DO_CARD_2_TASK:	
				break;
		}
	}
	public static Boolean Action2ChainAble(CardGameBean game,CardActionBean action){
		int cost = getActionCost(game,action);
		CardSiteBean site = game.getSites().get(action.getPlayerID());
		if(site==null)
			return false;
		if(site.getRemainRes()<cost)
			return false;
		Vector<CardActionBean> chain = game.getBattleChain().getActionChain();
		if(chain.size()!=0){
			if(action.getDes().size()!=1)
				return false;
			if(cardAlreadyInChain(chain,action.getSrc()))
				return false;
			int targetID= action.getDes().get(0);
			CardActionBean topAction = chain.lastElement();
			if(findActionTarget(topAction,targetID)==false)
				return false;
			CardInfoBean cardInfo = game.getCardInfo(action.getSrc());
			if(action.getType()!=CardActionBean.DO_CARD_2_TURN &&  //仅法术卡和英雄翻转才可进战斗链
			    action.getType()!=CardActionBean.DO_CARD_2_FIGHT)
				return false;
			if(cardInfo.getType()!= CardInfoBean.HERO &&
			   cardInfo.getType()!=CardInfoBean.SKILL &&
			   cardInfo.getType()!=CardInfoBean.SOLDIER)
				return false;
		}
		return true;
	}
	private static boolean cardAlreadyInChain(Vector<CardActionBean> chain,int srcID){
		for(int i=0;i<chain.size();i++){
			CardActionBean a1 = (CardActionBean)chain.get(i);
			if(a1.getSrc()==srcID)
				return true;
		}
		return false;
	}
	private static boolean findActionTarget(CardActionBean desCard,int targetID){
		if(desCard.getSrc()==targetID)
			return true;
		Vector<Integer> desVect = desCard.getDes();
		for(int i=0;i<desVect.size();i++){
			if(desVect.get(i)==targetID)
				return true;
		}
		return false;
	}
	public static int getActionCost(CardGameBean game,CardActionBean action){
		CardBean card = game.getCard(action.getSrc());
		if(card==null)
			return 911;
		int cost = 0;
		switch(action.getType()){
		case CardActionBean.DO_CARD_2_FIGHT:
			cost = getAtkCost(card.getCardID());
			break;
		case CardActionBean.DO_CARD_2_EQUIPSLOT:
		case CardActionBean.DO_CARD_2_FIGHTSLOT:
			cost = card.getCost();			
			break;
		case CardActionBean.DO_CARD_2_TURN:
		case CardActionBean.DO_CARD_2_TASK:
			cost = getUseCost(card.getCardID());
			break;	
		}
		return cost;
	}
	public static void procCardAction(CardGameBean game, CardActionBean action,ICardExtension ext){
		if(action==null)
			return;
		CardSiteBean site = game.getSites().get(action.getPlayerID());
		if(site==null)
			return;
		CardBean card = game.getCard(action.getSrc());
		if(card==null)
			return;
		switch(action.getType()){
		case CardActionBean.DO_CARD_2_FIGHT:
			procCard2Fight(game,site,card,action);
			break;
		case CardActionBean.DO_CARD_2_EQUIPSLOT:
			procCard2EquipSlot(site,card);
			break;
		case CardActionBean.DO_CARD_2_FIGHTSLOT:
			procCard2FightSlot(game,site,card);
			break;
		case CardActionBean.DO_CARD_2_RES:
			procCard2Res(site,card);
			break;
		case CardActionBean.DO_CARD_2_TURN:
			procCard2Turn(site,card);
			break;	
		case CardActionBean.DO_CARD_2_GUIDE:
			//procCard2Guide(site,card);
			break;	
		case CardActionBean.DO_CARD_2_TASK:
			procCard2Task(game,site,card,action);
			break;		
		}
	}
	public static boolean IsFriendAction(CardGameBean game,CardActionBean action){
		if(action.getDes().size()==0)
			return true;
		int desID = action.getDes().get(0);
		return (game.getCardOwner(desID) == action.getPlayerID());
		
	}
	private static void procCard2Atk(CardGameBean game,CardBean card,CardActionBean action){
		int desID = action.getDes().get(0);
		CardBean card2 = game.getCard(desID);
		CardUseBsn.Atk(card, card2);	
	}
	private static boolean procSkill2Cast(CardGameBean game,CardSiteBean site,CardBean card,CardActionBean action){
		return CardUseBsn.SkillCast(game,site,card,action);
	}
	
	private static boolean procCard2Fight(CardGameBean game,CardSiteBean site,CardBean card,CardActionBean action){
		switch(card.getCardType()){
		case CardInfoBean.HERO:
		case CardInfoBean.SOLDIER:
			procCard2Atk(game,card,action);
			break;
		case CardInfoBean.SKILL:
			procSkill2Cast(game,site,card,action);
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
		CardInfoBean cardInfo = card.getInfo();
		if(IsMatchUse(game,action,card)==false)
			return false;
		int desID = action.getDes().get(0);	
		return true;
	}
	private static boolean procEquip2Use(CardGameBean game,CardBean card,CardActionBean action){
		CardInfoBean cardInfo = card.getInfo();
		if(IsMatchUse(game,action,card)==false)
			return false;
//		int desID = action.getDes().get(0);
//		BufferBsn.AddBuf(game,desID,CardAbilityBean.BUF_DEF_ADD,card.getRealID(),card.getDef(),1);
		return true;
	}
	
	public static boolean IsMatchUse(CardGameBean game,CardActionBean action,
										CardBean card){
		if(card.getSide()>0)
			return false;								
		CardUseBean useInfo = CardUseStoreBean.GetInstance().getCardUse(card.getCardID());
		if(useInfo==null)
			return false;
		if(action.getDes().size()==0)
			return false;
		if(action.getDes().size()> useInfo.getTargetNum())
			return false;
		boolean IsFriend = IsFriendAction(game,action);
		boolean IsMatch = false;
		switch(card.getCardType()){
		case CardInfoBean.HERO:
			IsMatch = (IsFriend==true)? useInfo.getMyHero()>0:useInfo.getYourHero()>0 ;
			break;
		case CardInfoBean.SOLDIER:
			IsMatch = (IsFriend==true)? useInfo.getMySoldier()>0:useInfo.getYourSoldier()>0 ;
			break;	
		}
		return IsMatch;
	}
	
	private static void procCard2Task(CardGameBean game,CardSiteBean site,CardBean card,CardActionBean action){
		if(CardSiteBsn.getResNum(site)< card.getUseCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
	//	game.getBattleChain().PushAction(action);	
	}
	private static void procCard2Turn(CardSiteBean site,CardBean card){
		if(CardSiteBsn.getResNum(site)< card.getUseCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
		card.setTurn(1);
	}
	private static void procCard2FightSlot(CardGameBean game,CardSiteBean site,CardBean card){
		if(CardSiteBsn.getResNum(site)< card.getCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
		card.setSlotID(CardBean.FIGHT_SLOT_ID);	
		card.setSide(3);
		if(BufferBsn.IsExistAbility(card,CardAbilityBean.WHEN_ENTER)==true)
			BattleBsn.InitAbilityOp(game,card,CardAbilityBean.WHEN_ENTER);
	}
	private static void procCard2EquipSlot(CardSiteBean site,CardBean card){
		if(CardSiteBsn.getResNum(site)< card.getCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
		card.setSlotID(CardBean.EQUIP_SLOT_ID);	
		card.setSide(3);
	}
	private static void procCard2Res(CardSiteBean site,CardBean card){
		site.setAddResAble(false);
		if(card.getCardType() !=CardInfoBean.TASK)
			card.setCardID(Constants.BACK_CARD_ID);
		card.setSlotID(CardBean.RES_SLOT_ID);
		card.setSide(0);
	}
	private static int getUseCost(int cardID){
		CardUseBean useBean= CardUseStoreBean.GetInstance().getCardUse(cardID);
		if(useBean!=null){
			return useBean.getCost();
		}
		else{
			return 911;
		}
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
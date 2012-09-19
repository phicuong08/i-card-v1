package sfs2x.extensions.icard.bsn;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import sfs2x.extensions.icard.beans.AICardDeckBean;
import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.main.ICardExtension;



/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleAIBsn
{	
	// Store directions factors to move left,right,up,down
	
	public static void RunBattleAI(CardGameBean game,AICardDeckBean site,ICardExtension ext){
		if(game.getTurnPlayer()!= site.getPlayerID())
			return;
		if(site.getThinkNeed()>0){
			site.decThinkNeed();
			return;
		}
		site.setThinkNeed();
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_WAIT_PLAY_RES:
			procWaitPlayRes(game,site,ext);
			break;
		case BattleStateBean.ST_WAIT_PLAY_CARD:
			procWaitPlayCard(game,site,ext);
			break;	
		}
		
		//game.getStateBean().Jump2GodState();
	}
	
	private static void procWaitPlayRes(CardGameBean game,CardDeckBean site,ICardExtension ext){
		AddCard2ResSlot(game,site); 
		BattleBsn.DoPlayRes(game,ext);
	}
	private static void procWaitPlayCard(CardGameBean game,CardDeckBean site,ICardExtension ext){
		
		if(Card2Cast(game,site)) 
			return;
		else if (Card2EnterPlay(game,site,CardInfoBean.SUPPORT))
			return;
		else if (Card2EnterPlay(game,site,CardInfoBean.ALLY))
			return;
		else if(Card2Fight(game,site))
			return;
//		else if(AddCard2EquipSlot(game,site))
//			return;
		else
			BattleBsn.ClientEndOp(game,site.getPlayerID());
	}
	private static CardBean thinkAbilityCard(CardGameBean game,CardDeckBean site){
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_ZONE_ID,CardInfoBean.ABILITY);
		cardVect = WashCard(cardVect);
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getCost()<site.getRemainRes()){
				return card;
			}
		}
		return null;
	}
	private static Vector<Integer> filterOnAbility(CardGameBean game,CardBean cast,Vector<CardAbilityBean> abilityVec,Vector<Integer> targets){
		Vector<Integer> filters = new Vector<Integer>();
		
		for(int i=0;i<targets.size();i++){
			CardBean card = game.getCard(targets.get(i));
			for(int j=0;j<abilityVec.size();j++){
				CardAbilityBean ability = abilityVec.get(j);
				if(ability.getIsFriendly() )
				{
					if(cast.getOwner()!= card.getOwner())
						continue;
				}
				else{
					if(cast.getOwner()== card.getOwner())
						continue;
				}
				if( CardUseBsn.calcAbilityVal(ability,card)>0)
				{
					filters.add(card.getRealID());
					break;
				}
			}
		}
		return filters;
	}
	private static Vector<Integer>  thinkAbilityTarget(CardGameBean game,CardDeckBean site,CardBean cast){
		Vector<Integer> targets = CardUseBsn.getAbilityTarget(game,site,cast);
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(cast.getCardID());
		if(vec==null||vec.size()==0)
			return null;
		targets = filterOnAbility(game,cast,vec,targets);
		CardAbilityBean ability = vec.get(0);
		while(targets.size()>ability.getTargetNum()){
			int randomIndex = GameBsn._Random.nextInt(targets.size());
			targets.remove(randomIndex);
		}
		
		return targets;
	}
	private static Boolean Card2Cast(CardGameBean game,CardDeckBean site){
		CardBean cast = thinkAbilityCard(game,site);
		if(cast==null)
			return false;
		Vector<Integer>  destVect = thinkAbilityTarget(game,site,cast);
		CardActionBean action = new CardActionBean(cast.getRealID(),site.getPlayerID(),
													CardActionBean.DO_FIGHT_CARD,destVect);
		game.setCurAction(action);
		return true;
	}
	private static Boolean Card2Fight(CardGameBean game,CardDeckBean site){
		CardBean atk = getAtkCard(game,site,CardBean.FIGHT_ZONE_ID,CardInfoBean.ALLY);
		if(atk==null)
			atk = getAtkCard(game,site,CardBean.EQUIP_ZONE_ID,CardInfoBean.WEAPON);
		if(atk==null)
			return false;
		CardBean def = getDefCard(game,site);
		if(def==null)
			return false;
		Vector<Integer> desVect =new Vector<Integer>();
		desVect.add(def.getRealID());
		CardActionBean action = new CardActionBean(atk.getRealID(),site.getPlayerID(),CardActionBean.DO_FIGHT_CARD,desVect);
		game.setCurAction(action);
		return true;
	}
	
	private static CardBean getDefCard(CardGameBean game,CardDeckBean site){
		CardDeckBean enemy = BattleBsn.getOtherDeck(game,site.getPlayerID());
		if(enemy==null)
			return null;
		
		boolean atkAlly = true;
		boolean atkHero = true;
		if(CardSiteBsn.ExistDeckSupport(enemy, CardAbilityBean.WHICH_MYSOLDIER, CardAbilityBean.BUF_UNABLE_ATKED))
			atkAlly = false;
		if(CardSiteBsn.ExistDeckSupport(enemy, CardAbilityBean.WHICH_MYHERO, CardAbilityBean.BUF_UNABLE_ATKED))
			atkHero = false;
		if(atkAlly==false &&atkHero==false)
			return null;
		if(atkAlly==false)
			return enemy.getHero();
		
		int randomIndex = GameBsn._Random.nextInt(100);
		CardBean def = null;
		if(randomIndex<50)
		{
			Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(enemy,CardBean.FIGHT_ZONE_ID,CardInfoBean.ALLY);
			for(int i=0;i<cardVect.size();i++){
				CardBean card = cardVect.get(i);
				if(def==null || def.getHp()>card.getHp())
					def = card;
			}
		}
		if(def==null)
			def = enemy.getHero();
		return def;
	}
	private static CardBean getAtkCard(CardGameBean game,CardDeckBean site,int slot,int cardType){
		int which;
		if(slot ==CardBean.FIGHT_ZONE_ID)
			which = CardAbilityBean.WHICH_MYSOLDIER;
		else if(slot ==CardBean.HERO_ZONE_ID)
			which = CardAbilityBean.WHICH_MYHERO;
		else
			which = CardAbilityBean.WHICH_NULL;
		if(GameBsn.ExistGameSupport(game,which,CardAbilityBean.BUF_ATK_UNABLE))
			return null;
		if(CardSiteBsn.ExistDeckSupport(site, which, CardAbilityBean.BUF_ATK_UNABLE))
			return null;
		
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,slot,cardType);
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getSide()==0)
				return card;
		}
		return null;
	}
	private static Boolean Card2EnterPlay(CardGameBean game,CardDeckBean site,int cardType){
		int remainRes = site.getRemainRes();
		if(remainRes<=0)
			return false;
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_ZONE_ID,cardType);
		if(cardVect.size()==0)
			return false;
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getCost()<=remainRes)
			{
				CardActionBean action = new CardActionBean(card.getRealID(),site.getPlayerID(),CardActionBean.DO_ENTER_CARD,null);
				game.setCurAction(action);
				return true;
			}
		}
		return false;	
	}
	private static Boolean AddCard2ResSlot(CardGameBean game,CardDeckBean site){
		if(site.getAddResAble()==false)
			return false;
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_ZONE_ID,-1);
		if(cardVect.size()==0)
			return false;
		CardBean card = (CardBean)cardVect.firstElement();
		CardActionBean action = new CardActionBean(card.getRealID(),site.getPlayerID(),CardActionBean.DO_PLAY_RES_CARD,null);
		game.setCurAction(action);
		return true;
	}
	private static Boolean AddCard2EquipSlot(CardGameBean game,CardDeckBean site){
		int remainRes = site.getRemainRes();
		if(remainRes<=0)
			return false;
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_ZONE_ID,CardInfoBean.WEAPON);
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getCost()<=remainRes)
			{
				CardActionBean action = new CardActionBean(card.getRealID(),site.getPlayerID(),CardActionBean.DO_ENTER_CARD,null);
				game.setCurAction(action);
				return true;
			}
		}
		cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_ZONE_ID,CardInfoBean.ARMOR);
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getCost()<=remainRes)
			{
				CardActionBean action = new CardActionBean(card.getRealID(),site.getPlayerID(),CardActionBean.DO_FIGHT_CARD,null);
				game.setCurAction(action);
				return true;
			}
		}
		return false;	
	}
	
	public static Vector<CardBean> WashCard(Vector<CardBean> oldCards){
		Vector<CardBean> newCards = new Vector<CardBean>();
		List<CardBean> waitCards = new ArrayList<CardBean>();
		for(int i=0;i<oldCards.size();i++){
			waitCards.add(oldCards.get(i));
		}
		while(waitCards.size()>0){
			int count = waitCards.size();
			int randomIndex = GameBsn._Random.nextInt(count);
			newCards.add(waitCards.get(randomIndex));
			waitCards.remove(randomIndex);
		}
		return newCards;
	}
	
}
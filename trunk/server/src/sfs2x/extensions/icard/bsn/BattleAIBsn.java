package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import sfs2x.extensions.icard.beans.AICardDeckBean;
import sfs2x.extensions.icard.beans.BattleStateBean;
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
		
		if(AddCard2FightSlot(game,site))
			return;
		else if(Card2Fight(game,site))
			return;
//		else if(AddCard2EquipSlot(game,site))
//			return;
		else
			BattleBsn.ClientEndOp(game,site.getPlayerID());
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
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,slot,cardType);
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getSide()==0)
				return card;
		}
		return null;
	}
	private static CardBean getFightAlly(CardGameBean game,CardDeckBean site){
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.FIGHT_ZONE_ID,CardInfoBean.ALLY);
		for(int i=0;i<cardVect.size();i++){
			CardBean card = cardVect.get(i);
			if(card.getSide()==0)
				return card;
		}
		return null;
	}
	private static Boolean AddCard2FightSlot(CardGameBean game,CardDeckBean site){
		int remainRes = site.getRemainRes();
		if(remainRes<=0)
			return false;
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_ZONE_ID,CardInfoBean.ALLY);
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
}
package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import sfs2x.extensions.icard.beans.AICardSiteBean;
import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardSiteBean;
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
	
	public static void RunBattleAI(CardGameBean game,AICardSiteBean site,ICardExtension ext){
		if(game.getOpPlayer()!= site.getPlayerID())
			return;
		if(site.getThinkNeed()>0){
			site.decThinkNeed();
			return;
		}
		site.setThinkNeed();
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_WAIT_LOOP_OP:
			procWaitOp(game,site,ext);
			break;
		case BattleStateBean.ST_WAIT_CHAIN_OP:
			break;
		}
		
		//game.getStateBean().Jump2GodState();
	}
	private static void procWaitOp(CardGameBean game,CardSiteBean site,ICardExtension ext){
		if(AddCard2ResSlot(game,site))
			return;
		else
			BattleBsn.ClientEndOp(game,site.getPlayerID());
	}
	private static Boolean AddCard2ResSlot(CardGameBean game,CardSiteBean site){
		if(site.getAddResAble()==false)
			return false;
		Vector<CardBean> cardVect = CardSiteBsn.PickSlotCard(site,CardBean.HAND_SLOT_ID);
		if(cardVect.size()==0)
			return false;
		CardBean card = (CardBean)cardVect.firstElement();
		CardActionBean action = new CardActionBean(card.getRealID(),site.getPlayerID(),CardActionBean.DO_CARD_2_RES,null);
		game.setCurAction(action);
		return true;
	}
}
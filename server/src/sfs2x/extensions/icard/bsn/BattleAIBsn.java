package sfs2x.extensions.icard.bsn;

import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Random;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardSiteBean;
import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Commands;
import sfs2x.extensions.icard.utils.Constants;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;

/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleAIBsn
{	
	// Store directions factors to move left,right,up,down
	
	static private java.util.Random _Random = new java.util.Random();


	public static void RunBattleAI(CardGameBean game,CardSiteBean site,ICardExtension ext){
		if(game.getOpPlayer()!= site.getPlayerID())
			return;
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_WAIT_OP:
			procWaitOp(game,site,ext);
			break;
		case BattleStateBean.ST_CHAIN_WAIT_OP:
			break;
		}
		game.getStateBean().Jump2GodState();
	}
	private static void procWaitOp(CardGameBean game,CardSiteBean site,ICardExtension ext){
		if(AddCard2ResSlot(game,site))
			return;
		
	}
	private static Boolean AddCard2ResSlot(CardGameBean game,CardSiteBean site){
		if(site.getAddResAble()==false)
			return false;
		Vector<CardBean> cardVect = BattleBsn.PickSlotCard(site,CardBean.HAND_SLOT_ID);
		if(cardVect.size()==0)
			return false;
		CardBean card = (CardBean)cardVect.firstElement();
		CardActionBean action = new CardActionBean(card.getRealID(),site.getPlayerID(),CardActionBean.DO_CARD_2_RES,null);
		game.getActionStore().AddAction(action);
		return true;
	}
}
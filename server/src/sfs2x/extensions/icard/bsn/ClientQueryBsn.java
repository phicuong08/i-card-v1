package sfs2x.extensions.icard.bsn;


import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.beans.CardInfoBean;

/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class ClientQueryBsn
{	
	public static int getResNum(CardDeckBean site){
		int num=0;
		for (CardBean card : site.getCardMap().values()){
			if(card.getZoneID()==CardBean.RES_ZONE_ID && card.getSide()==0)
				num++;
		}
		return num;
	}
	public static boolean procGeneralVerify(CardGameBean game,int playerID,int realID){
		if(game.getStateBean().IsWaitPlayerOp(playerID)==false)
			return false;
		return game.getCardOwner(realID)== playerID;
	}
	public static boolean procPlayResCardRequest(CardGameBean game,int playerID,int realID){
		CardDeckBean deck = game.getDeck().get(playerID);
		if(deck==null)
			return false;
		if(game.getStateBean().getState()!=BattleStateBean.ST_WAIT_PLAY_RES)
			return false;
		if(deck.getAddResAble()==false)
			return false;
		
		CardBean card = game.getCard(realID);
		if(card==null || card.getZoneID()!=CardBean.HAND_ZONE_ID)
			return false;
			
		CardActionBean action = new CardActionBean(realID,playerID,CardActionBean.DO_PLAY_RES_CARD,null);
		game.setCurAction(action);
		return true;
	}
	//
	public static boolean procPlayCardRequest(CardGameBean game,int playerID,int realID,int target){
		CardBean card = game.getCard(realID);
		if(card==null || card.getZoneID()!=CardBean.HAND_ZONE_ID)
			return false;
		
		if(game.getStateBean().getState()!=BattleStateBean.ST_WAIT_PLAY_CARD)
				   return false;
		CardDeckBean deck = game.getDeck().get(playerID);
		if(deck==null)
			return false;
		if(CardSiteBsn.getResNum(deck)< card.getCost())
			return false;

		Vector<Integer> des = null;
		if(target>0){
			des = new Vector<Integer>();
			des.add(target);
		}
		CardActionBean action = new CardActionBean(realID,playerID,CardActionBean.DO_PLAY_CARD,des);
		game.setCurAction(action);
		return true;
	}
	
}
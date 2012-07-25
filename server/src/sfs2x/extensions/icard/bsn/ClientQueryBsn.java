package sfs2x.extensions.icard.bsn;


import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.utils.ErrorDef;

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
		if(game.getStateBean().getState()!=BattleStateBean.ST_WAIT_LOOP_OP)
			return false;
		if(deck.getAddResAble()==false)
			return false;
		CardActionBean action = new CardActionBean(realID,playerID,CardActionBean.DO_PLAY_RES_CARD,null);
		game.setCurAction(action);
		return true;
	}
	public static boolean procPlayCardRequest(CardGameBean game,int playerID,int realID,int target){
		CardBean card = game.getCard(realID);
		if(card==null)
			return false;
		
		CardDeckBean deck = game.getDeck().get(playerID);
		if(deck==null)
			return false;
		if(CardSiteBsn.getResNum(deck)< card.getCost())
			return false;
		boolean bOK = true;
		switch(card.getCardType()){
		case CardInfoBean.ALLY:
		case CardInfoBean.WEAPON:
		case CardInfoBean.ARMOR:
		case CardInfoBean.HERO:
			bOK  = game.getStateBean().getState()==BattleStateBean.ST_WAIT_LOOP_OP;
			break;
		case CardInfoBean.QUEST:
		case CardInfoBean.SKILL:
			bOK = (game.getStateBean().getState()==BattleStateBean.ST_WAIT_LOOP_OP ||
				   game.getStateBean().getState()==BattleStateBean.ST_WAIT_CHAIN_OP);
			break;
		}
		if(bOK)
		{
			Vector<Integer> des = null;
			if(target>0){
				des = new Vector<Integer>();
				des.add(target);
			}

			CardActionBean action = new CardActionBean(realID,playerID,CardActionBean.DO_PLAY_CARD,des);
			game.setCurAction(action);
		}
		return bOK;
	}
	
	public static void updateCardSlot(CardGameBean game,int playerID, int realID, int slot){
		if(game.getOpPlayer()!= playerID){
			ErrorDef._CurErr = ErrorDef.ERR_PLAYER_MATCH;
			return;
		}
		if(game.getStateBean().getState()!= BattleStateBean.ST_WAIT_LOOP_OP){
			ErrorDef._CurErr = ErrorDef.ERR_NOT_PLAYER_OP;
			return;
		}
		int cmdType=0;
		switch(slot){
		case CardBean.RES_ZONE_ID:
			cmdType = CardActionBean.DO_CARD_2_RES;
			break;
		case CardBean.EQUIP_ZONE_ID:
			cmdType = CardActionBean.DO_CARD_2_EQUIPSLOT;
			break;
		case CardBean.FIGHT_ZONE_ID:
			cmdType = CardActionBean.DO_CARD_2_FIGHTSLOT;
			break;
		default:
			return;
		}
		CardActionBean action = new CardActionBean(realID,playerID,cmdType,null);
		game.setCurAction(action);
	}
}
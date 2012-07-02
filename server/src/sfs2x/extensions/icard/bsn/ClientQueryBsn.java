package sfs2x.extensions.icard.bsn;


import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardSiteBean;
import sfs2x.extensions.icard.utils.ErrorDef;

/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class ClientQueryBsn
{	
	public static int getResNum(CardSiteBean site){
		int num=0;
		for (CardBean card : site.getCardMap().values()){
			if(card.getSlotID()==CardBean.RES_SLOT_ID && card.getSide()==0)
				num++;
		}
		return num;
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
		case CardBean.RES_SLOT_ID:
			cmdType = CardActionBean.DO_CARD_2_RES;
			break;
		case CardBean.EQUIP_SLOT_ID:
			cmdType = CardActionBean.DO_CARD_2_EQUIPSLOT;
			break;
		case CardBean.FIGHT_SLOT_ID:
			cmdType = CardActionBean.DO_CARD_2_FIGHTSLOT;
			break;
		default:
			return;
		}
		CardActionBean action = new CardActionBean(realID,playerID,cmdType,null);
		game.setCurAction(action);
	}
}
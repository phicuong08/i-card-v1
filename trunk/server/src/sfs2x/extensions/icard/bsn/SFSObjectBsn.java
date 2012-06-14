package sfs2x.extensions.icard.bsn;

import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Random;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardSiteBean;
import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Commands;
import sfs2x.extensions.icard.utils.Constants;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;
import sfs2x.extensions.icard.beans.*;
/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class SFSObjectBsn
{	
	public static ISFSObject genCardDirtyInfo(CardBean card,int player,int receiver){
		if(card.getDirtyFlag()==0)
			return null;
		ISFSObject cardInfo = new SFSObject();
		cardInfo.putInt("realID", card.getRealID());
		cardInfo.putInt("cardID", card.getClientCardID(player==receiver));
		if(card.getDirtyFlagBit(CardBean.SLOT_DIRTY_BIT))
			cardInfo.putInt("slot", card.getSlotID());
		if(card.getDirtyFlagBit(CardBean.SIDE_DIRTY_BIT))	
			cardInfo.putInt("side", card.getSide());
		if(card.getDirtyFlagBit(CardBean.TURN_DIRTY_BIT))	
			cardInfo.putInt("turn", card.getTurn());	
		if(card.getDirtyFlagBit(CardBean.HP_DIRTY_BIT))	
			cardInfo.putInt("hp", card.getHp());	
		cardInfo.putInt("playerID", player);
		return cardInfo;
	}
	
	public static void fillDirtyCardInfo(ISFSArray sfsa, CardSiteBean site,int player,int receiver){
		for (Enumeration<CardBean> e = site.getCardMap().elements(); e.hasMoreElements();){
			CardBean card = (CardBean) e.nextElement();
			ISFSObject cardInfo = genCardDirtyInfo(card,player,receiver);
			if(cardInfo!=null)
				sfsa.addSFSObject(cardInfo);
			card.setDirtyFlag(0);	
		}
	}
	public static ISFSArray genDirtyGameArr(CardGameBean game,int receiver){
			ISFSArray sfsa = new SFSArray();
			for (CardSiteBean site : game.getSites().values())
			{
				fillDirtyCardInfo(sfsa,site,site.getPlayerID(),receiver);
			}
			return sfsa;
	}
	public static ISFSObject genPlayerLoopInfo(int player,int time){
		ISFSObject params = new SFSObject();
		params.putInt("playerID", player);
		params.putInt("time", time);
		return params;
	}
	public static void fillBattleActionInfo(ISFSObject params,CardGameBean game,CardActionBean action){
		ISFSObject fightInfo = new SFSObject();
		fightInfo.putInt("player", action.getPlayerID());
		fightInfo.putInt("srcID",action.getSrc());
		fightInfo.putInt("type", action.getType());
		fightInfo.putInt("time", Constants.BATTLE_LOOP_TIME);
		params.putSFSObject("fight", fightInfo);
		params.putIntArray("target", action.getDes());
	
	}
	public static ISFSObject genBattleLoopResetInfo(CardGameBean game){
		ISFSObject params = new SFSObject();
		params.putInt("playerID", game.getOpPlayer());
		params.putInt("time", Constants.BATTLE_LOOP_TIME);
		return params;
	}
}
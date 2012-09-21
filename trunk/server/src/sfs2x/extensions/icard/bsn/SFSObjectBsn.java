package sfs2x.extensions.icard.bsn;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Vector;



import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardDeckBean;

import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;

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
		if(card.getDirtyFlagBit(CardBean.ZONE_DIRTY_BIT))
			cardInfo.putInt("slot", card.getZoneID());
		if(card.getDirtyFlagBit(CardBean.SIDE_DIRTY_BIT))	
		{
			cardInfo.putInt("side", card.getSide());
		}
		if(card.getDirtyFlagBit(CardBean.TURN_DIRTY_BIT))	
			cardInfo.putInt("turn", card.getTurn());	
		if(card.getDirtyFlagBit(CardBean.HP_DIRTY_BIT))	
			cardInfo.putInt("hp", card.getHp());	
		if(card.getDirtyFlagBit(CardBean.ATK_DIRTY_BIT))	
			cardInfo.putInt("atk", card.getAtk(-1));	
		
		if(card.getDirtyFlagBit(CardBean.BUF_DIRTY_BIT))
		{
			HashMap<Integer, BufferBean> bufMap = card.getBufStore().getBufMap();
			if(bufMap.size()==0){
				cardInfo.putInt("buf0", 0);		
			}
			else{
				int y=0;
				for(BufferBean buf:bufMap.values()){
					cardInfo.putInt("buf"+y, buf.getID());			
					y++;
				}
			}
		}		

		cardInfo.putInt("guy", player);
		return cardInfo;
	}
	
	public static ISFSObject genCardFightResultInfo(CardBean card){
		if(card.getDirtyFlag()==0)
			return null;
		ISFSObject cardInfo = new SFSObject();
		cardInfo.putInt("realID", card.getRealID());
		cardInfo.putInt("cardID", card.getCardID());
		if(card.getDirtyFlagBit(CardBean.ZONE_DIRTY_BIT))
			cardInfo.putInt("slot", card.getZoneID());
		if(card.getDirtyFlagBit(CardBean.SIDE_DIRTY_BIT))	
		{
			cardInfo.putInt("side", card.getSide());
		}
		if(card.getDirtyFlagBit(CardBean.TURN_DIRTY_BIT))	
			cardInfo.putInt("turn", card.getTurn());	
		if(card.getDirtyFlagBit(CardBean.HP_DIRTY_BIT))	
			cardInfo.putInt("hp", card.getHp());	
		return cardInfo;
	}
	
	public static void fillDirtyCardInfo(ISFSArray sfsa, CardDeckBean site,int player,int receiver){
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
			for (CardDeckBean site : game.getDeck().values())
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
	public static ISFSObject genFightResult(CardGameBean game,CardActionBean action){
		ISFSObject fightInfo = new SFSObject();
		fightInfo.putInt("res", game.getTurnDeck().getCurRes());
		fightInfo.putInt("srcID",action.getSrc());
		ISFSArray sfsa = new SFSArray();
		ISFSObject cardInfo;
		CardBean card;
		Vector<Integer> desVect = action.getDes();
		for(int i=0;i<desVect.size();i++){
			card = game.getCard(desVect.get(i));
			if(card==null)
				continue;
			cardInfo = genCardFightResultInfo(card);
			if(cardInfo!=null)
				sfsa.addSFSObject(cardInfo);
		}
		card = game.getCard(action.getSrc());
		cardInfo = genCardDirtyInfo(card,0,0);
		if(cardInfo!=null)
			sfsa.addSFSObject(cardInfo);
		fightInfo.putSFSArray("target", sfsa);
		return fightInfo;
	}
	public static void fillBattleActionInfo(ISFSObject params,CardGameBean game,CardActionBean action){
		ISFSObject fightInfo = new SFSObject();
		fightInfo.putInt("player", action.getPlayerID());
		fightInfo.putInt("srcID",action.getSrc());
		fightInfo.putInt("type", action.getType());
		params.putSFSObject("fight", fightInfo);
		Collection<Integer> desArr = new ArrayList<Integer>(); ;
		for(int i=0;i<action.getDes().size();i++){
			desArr.add(action.getDes().elementAt(i));
		}
		params.putIntArray("target", desArr);
	
	}
	public static ISFSObject genBattleLoopResetInfo(CardGameBean game){
		ISFSObject params = new SFSObject();
		params.putInt("playerID", game.getTurnPlayer());
		params.putInt("time", game.getStateBean().getWaitDuration());
		return params;
	}
}
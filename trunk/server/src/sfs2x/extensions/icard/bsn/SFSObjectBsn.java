package sfs2x.extensions.icard.bsn;

import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Random;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
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
import sfs2x.extensions.icard.beans.*;
/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class SFSObjectBsn
{	
	public static ISFSObject genCardDirtyInfo(CardBean card,int player){
		if(card.getDirtyFlag()==0)
			return null;
		ISFSObject cardInfo = new SFSObject();
		cardInfo.putInt("realID", card.getRealID());
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
	
	public static void fillDirtyCardInfo(ISFSArray sfsa, CardSiteBean site,int player){
		for (Enumeration<CardBean> e = site.getCardMap().elements(); e.hasMoreElements();){
			CardBean card = (CardBean) e.nextElement();
			ISFSObject cardInfo = genCardDirtyInfo(card,player);
			if(cardInfo)
				sfsa.addSFSObject(cardInfo);
			card.setDirtyFlag(0);	
		}
	}
	public static ISFSArray genDirtyGameArr(CardGameBean game){
			ISFSArray sfsa = new SFSArray();
			for (CardSiteBean site : game.getSites().values())
			{
				fillDirtyCardInfo(sfsa,site,playerID);
			}
			return sfsa;
	}

}
package sfs2x.extensions.icard.bsn;

import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Random;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardActionStoreBean;
import sfs2x.extensions.icard.beans.CardBean;
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

/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionBsn
{	
	public static void procCardActionStore(CardGameBean game, CardActionStoreBean actionStore,ICardExtension ext){
		for (Enumeration<CardActionBean> e = actionStore.getActionVect().elements(); e.hasMoreElements();){
			CardActionBean action = (CardActionBean)e.nextElement();
			procCardAction(game,action,ext);
		}
	}
	public static void procCardAction(CardGameBean game, CardActionBean action,ICardExtension ext){
		CardSiteBean site = game.getSites().get(action.getPlayerID());
		if(site==null)
			return;
		CardBean card = site.getCardMap().get(action.getSrc());
		if(card==null)
			return;
		switch(action.getType()){
		case CardActionBean.DO_CARD_2_ATK:
			break;
		case CardActionBean.DO_CARD_2_DEF:
			break;
		case CardActionBean.DO_CARD_2_EQUIPSLOT:
			procCard2EquipSlot(site,card);
			break;
		case CardActionBean.DO_CARD_2_FIGHTSLOT:
			procCard2FightSlot(site,card);
			break;
		case CardActionBean.DO_CARD_2_RES:
			procCard2Res(card);
			break;
		case CardActionBean.DO_CARD_2_TURN:
			procCard2Turn(site,card);
			break;	
		case CardActionBean.DO_CARD_2_USE:
			break;		
		}
	}
	private static void procCard2Turn(CardSiteBean site,CardBean card){
		if(CardSiteBsn.getResNum(site)< card.getUseCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
		card.setTurn(1);
	}
	private static void procCard2FightSlot(CardSiteBean site,CardBean card){
		if(CardSiteBsn.getResNum(site)< card.getCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
		card.setSlotID(CardBean.FIGHT_SLOT_ID);	
	}
	private static void procCard2EquipSlot(CardSiteBean site,CardBean card){
		if(CardSiteBsn.getResNum(site)< card.getCost())
			return;
		CardSiteBsn.useRes(site,card.getCost());
		card.setSlotID(CardBean.EQUIP_SLOT_ID);	
	}
	private static void procCard2Res(CardBean card){
		card.setSlotID(CardBean.RES_SLOT_ID);
		card.setSide(0);
	}
}
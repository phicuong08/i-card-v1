package sfs2x.extensions.icard.bsn;

import java.util.HashMap;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.BufferBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.beans.CardDeckBean;



/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class AttachCardBsn
{	

	public static void DoRemoveAttached(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				CardUseBsn.onCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
	public static void DoRemoveGoodAttached(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				if(CardAbilityBsn.IsGoodAbility(card))
					CardUseBsn.onCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
	public static boolean ExistAbility(CardGameBean game,int realID,int what,int when){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=realID)
					continue;
				if(CardAbilityBsn.IsCardAbility(card,when,what))
					return true;
			}
		}
		return false;
	}
	public static void DoRemoveBadAttached(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				if(CardAbilityBsn.IsGoodAbility(card)==false)
					CardUseBsn.onCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
}
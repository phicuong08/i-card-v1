package sfs2x.extensions.icard.bsn;


import java.util.Vector;


import sfs2x.extensions.icard.beans.CardBean;

import sfs2x.extensions.icard.beans.CardDeckBean;




/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardSiteBsn
{	
	public static int getResNum(CardDeckBean site){
		int num=0;
		for (CardBean card : site.getCardMap().values()){
			if(card.getZoneID()==CardBean.RES_ZONE_ID && card.getSide()==0)
				num++;
		}
		return num;
	}
	public static void onEvent(CardDeckBean site,int when){
		for (CardBean card : site.getCardMap().values()){
			if(card.getIsPlayZone()==false)
				continue;
			CardEventBsn.onCardEvent(card, when);
		}
	}
	public static void useRes(CardDeckBean site,int resNum){
		int remain=resNum;
		for (CardBean card : site.getCardMap().values()){
			if(card.getZoneID()==CardBean.RES_ZONE_ID && card.getSide()==0)
			{
				card.setSide(1);
				remain--;
			}
			if(remain==0)
				break;
		}

	}
	public static Vector<CardBean> PickSlotCard(CardDeckBean site,int slotID,int cardType){
		Vector<CardBean> pickVect =new Vector<CardBean>();
		for (CardBean card : site.getCardMap().values())
		{
				if(card.getZoneID() == slotID &&
				   (cardType==-1 || card.getCardType()==cardType))
					pickVect.add(card);
		}
		return pickVect;
	}
}
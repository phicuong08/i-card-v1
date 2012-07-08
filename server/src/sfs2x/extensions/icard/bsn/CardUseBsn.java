package sfs2x.extensions.icard.bsn;

import sfs2x.extensions.icard.beans.CardBean;



/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardUseBsn
{	
	
	public static void Atk(CardBean card1,CardBean card2){
		card1.AddHp(-card2.getAtk());
		card2.AddHp(-card1.getAtk());
		card1.setSide(1);
		if(card1.getHp()<=0)
			card1.setSlotID(CardBean.TOMB_SLOT_ID);
		if(card2.getHp()<=0)
			card2.setSlotID(CardBean.TOMB_SLOT_ID);
	}

}
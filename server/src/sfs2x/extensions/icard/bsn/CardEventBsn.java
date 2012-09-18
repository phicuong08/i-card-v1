package sfs2x.extensions.icard.bsn;


import java.util.Vector;


import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardDeckBean;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardEventBsn
{	
	public static void onCardBufEvent(CardBean card,CardDeckBean desDeck,int when){
		Vector<CardAbilityBean> vec = card.getBufStore().getAbilityOnWhen(when);
		if(vec==null)
			return;
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			BufferBsn.callCardAbility(card,ability);
		}
	}

}
package sfs2x.extensions.icard.bsn;




import java.util.HashMap;

import sfs2x.extensions.icard.beans.BufferBean;
import sfs2x.extensions.icard.beans.BufferStoreBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardSiteBean;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferBsn
{	
//	public static void AddBuf(CardGameBean game,int desID,int type,int src,int val,int loopNum){
//		CardBean card = game.getCard(desID);
//		if(card==null)
//			return;
//		card.getBufStore().AddBuf(type,src,val,loopNum);
//	}
	public static void AddBuf(CardBean cardSrc,CardBean cardDes,CardAbilityBean ability){
		cardDes.getBufStore().AddBuf(ability, cardSrc.getRealID());
		
	}
	public static boolean IsExistBuf(CardBean card,int type){
		HashMap<Integer, BufferBean> bufMap = card.getBufStore().getBufMap();
		for(BufferBean buf:bufMap.values()){
			if(buf.getType()==type)
				return true;
		}
		return false;
	}
}
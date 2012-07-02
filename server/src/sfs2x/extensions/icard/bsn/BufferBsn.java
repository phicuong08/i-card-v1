package sfs2x.extensions.icard.bsn;




import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferBsn
{	
	public static void AddBuf(CardGameBean game,int desID,int type,int src,int val,int loopNum){
		CardBean card = game.getCard(desID);
		if(card==null)
			return;
		card.getBufStore().AddBuf(type,src,val,loopNum);
	}
}
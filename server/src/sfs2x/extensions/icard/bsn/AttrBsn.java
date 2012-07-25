package sfs2x.extensions.icard.bsn;







import sfs2x.extensions.icard.beans.CardAttrBean;
import sfs2x.extensions.icard.beans.CardAttrStoreBean;



/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class AttrBsn
{	

	public static boolean IsExistAttr(int cardID,int attr){
		CardAttrBean attrBean = CardAttrStoreBean.GetInstance().getCardAttr(cardID);
		if(attrBean==null)
			return false;
		return attrBean.IsExistAttr(attr);
	}
	
}
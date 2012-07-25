package sfs2x.extensions.icard.bsn;




import java.util.HashMap;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BufferBean;
import sfs2x.extensions.icard.beans.BufferStoreBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.beans.CardSiteBean;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class AttrBsn
{	

	public static boolean IsExistAttr(int cardID,int attr){
		CardAttrBean attrBean = CardAbilityStoreBean.GetInstance().getAbilityBean(cardID);
		if(attrBean==null)
			return false;
		return attrBean.IsExistAttr(attr);
	}
	
}
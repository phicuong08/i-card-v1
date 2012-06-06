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
public class CardSiteBsn
{	
	public static int getResNum(CardSiteBean site){
		int num=0;
		for (CardBean card : site.getCardMap().values()){
			if(card.getSlotID()==CardBean.RES_SLOT_ID && card.getSide()==0)
				num++;
		}
		return num;
	}
	public static void useRes(CardSiteBean site,int resNum){
		int remain=resNum;
		for (CardBean card : site.getCardMap().values()){
			if(card.getSlotID()==CardBean.RES_SLOT_ID && card.getSide()==0)
			{
				card.setSide(1);
				remain--;
			}
			if(remain==0)
				break;
		}

	}
	
}
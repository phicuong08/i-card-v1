package sfs2x.extensions.icard.bsn;




import java.util.HashMap;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BufferBean;
import sfs2x.extensions.icard.beans.BufferStoreBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
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
	public static boolean IsExistBuf(CardBean card,int type,int when){
		HashMap<Integer, BufferBean> bufMap = card.getBufStore().getBufMap();
		for(BufferBean buf:bufMap.values()){
			if(buf.getType()==type && (buf.getWhen()== CardAbilityBean.WHEN_ALL|| buf.getWhen()==when))
				return true;
		}
		return false;
	}
	public static void callCardAbility(CardBean card,CardAbilityBean ability){
		switch(ability.getType()){
		case CardAbilityBean.BUF_CURE:
			card.AddHp(-ability.getVal());
			break;
		case CardAbilityBean.BUF_HEAL:
			card.AddHp(ability.getVal());
			break;	
		}
	}
	public static CardAbilityBean getCardAbility(CardBean card,int when){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.getWhen()!=when)
				return ability;
		}
		return null;
	}
	public static boolean IsCardAbility(CardBean card,int when,int type){
		return (getCardAbility(card,when,CardAbilityBean.WHICH_I,type)!=null);
	}
	public static CardAbilityBean getCardAbility(CardBean card,int when,int which,int type){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.getWhich()!=which)
				continue;
			if(ability.getType()==type && (ability.getWhen()== CardAbilityBean.WHEN_ALL|| ability.getWhen()==when)){
				return ability;
			}
		}
		return null;
	}
	public static int getAbilityVal(CardBean card,int when,int type){
		int val = 0;
		HashMap<Integer, BufferBean> bufMap = card.getBufStore().getBufMap();
		for(BufferBean buf:bufMap.values()){
			if(buf.getType()==type && (buf.getWhen()== CardAbilityBean.WHEN_ALL|| buf.getWhen()==when))
			{
				val += buf.getVal();
			}
		}
		return val;
	}
	
}
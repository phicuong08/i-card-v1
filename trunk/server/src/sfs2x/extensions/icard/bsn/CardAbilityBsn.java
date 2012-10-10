package sfs2x.extensions.icard.bsn;




import java.util.HashMap;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BufferBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;


/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardAbilityBsn
{	

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
	public static int AbilityVal(CardBean card,int what){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.getType()== what)
				return ability.getVal();
		}
		return 0;
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
	
	public static boolean IsGoodBuf(CardBean card){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.IsGoodBuf())
				return true;
		}
		return false;
	}
	public static CardAbilityBean getCardAbility(CardBean card,int when){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.getWhen()==when)
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

	public static boolean IsWhichMatch(int src,int des,CardAbilityBean ability,CardGameBean game){
		int srcOwner = game.getCardOwner(src);
		int desOwner = game.getCardOwner(des);
		CardBean card = game.getCard(des);
		if(card==null)
			return false;
		boolean bMatch;
		switch(ability.getWhich()){
		case CardAbilityBean.WHICH_MY:
			bMatch = (srcOwner==desOwner) && (card.getCardType()==CardInfoBean.HERO || card.getCardType()==CardInfoBean.ALLY);
			break;
		case CardAbilityBean.WHICH_MYHERO:
			bMatch = (srcOwner==desOwner) && (card.getCardType()==CardInfoBean.HERO);
			break;
		case CardAbilityBean.WHICH_MYSOLDIER:
			bMatch = (srcOwner==desOwner) && (card.getCardType()==CardInfoBean.ALLY);
			break;	
		case CardAbilityBean.WHICH_MYWEAPON:
			bMatch = (srcOwner==desOwner) && (card.getCardType()==CardInfoBean.WEAPON);
			break;
		case CardAbilityBean.WHICH_YOUR:
			bMatch = (srcOwner!=desOwner) && (card.getCardType()==CardInfoBean.HERO || card.getCardType()==CardInfoBean.ALLY);
			break;
		case CardAbilityBean.WHICH_YOURHERO:
			bMatch = (srcOwner!=desOwner) && (card.getCardType()==CardInfoBean.HERO);
			break;
		case CardAbilityBean.WHICH_YOURSOLDIER:
			bMatch = (srcOwner!=desOwner) && (card.getCardType()==CardInfoBean.ALLY);
			break;	
		case CardAbilityBean.WHICH_YOURWEAPON:
			bMatch = (srcOwner!=desOwner) && (card.getCardType()==CardInfoBean.WEAPON);
			break;		
		default:
			bMatch = false;
			break;
		}
		return bMatch;
	}
	
}
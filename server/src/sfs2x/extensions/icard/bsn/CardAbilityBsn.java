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
	public static void callCardAbility(CardBean card,CardAbilityBean ability){
		if(card==null)
			return;
		switch(ability.getType()){
		case CardAbilityBean.BUF_CURE:
			card.AddHp(-ability.getVal());
			break;
		case CardAbilityBean.BUF_HEAL:
			card.AddHp(ability.getVal());
			break;
		case CardAbilityBean.DO_ADD_ATK_INDICATE:	
			card.AddAtkIndicate(ability.getVal());
			break;
		case CardAbilityBean.DO_DROP_RES:
			card.getDeck().removeRes(ability.getVal());
			break;
		}
	}
	
	public static void doCardPostEventAbility(CardBean cardSrc,CardBean cardDes,int when){ //事件发生后的能力响应
	
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(cardSrc.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			CardBean match = null;
			if(ability.getWhen()!=when)
				continue;
				switch(ability.getWhich()){
						case CardAbilityBean.WHICH_SRC:
							match = cardSrc;
							break;
						case CardAbilityBean.WHICH_DES:
							match = cardDes;
							break;
				}
				callCardAbility(match,ability);
		}
	}
	
	public static int getAbilityVal(CardBean card,int when,int what){
		int val = 0;
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.getType()==what && (ability.getWhen()== CardAbilityBean.WHEN_ALL|| ability.getWhen()==when)){
				val += ability.getVal();
			}
		}
		return val;
	}
	
	public static boolean IsGoodAbility(CardBean card){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.IsGoodBuf())
				return true;
		}
		return false;
	}

	public static boolean IsCardAbility(CardBean card,int when,int what){
		return (getCardAbility(card,when,what)!=null);
	}
	public static CardAbilityBean getCardAbility(CardBean card,int when,int what){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(ability.getType()==what && (ability.getWhen()== CardAbilityBean.WHEN_ALL|| ability.getWhen()==when)){
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
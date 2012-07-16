package sfs2x.extensions.icard.bsn;


import java.util.Vector;


import sfs2x.extensions.icard.beans.CardBean;

import sfs2x.extensions.icard.beans.CardSiteBean;




/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardEventBsn
{	
	public static void onCardEvent(CardBean card,int when){
		Vector<CardAbilityBean> vec = card.getBufStore().getAbilityOnWhen(when);
		if(vec==null)
			return;
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			callCardAbility(card,ability);
		}
	}
	public static void callCardAbility(CardBean card,CardAbilityBean ability){
		switch(ability.getType()){
		case CardAbilityBean.BUF_ATK_DIST:
			break;
		case CardAbilityBean.BUF_ATK_WITH_EQUIP:
			break;
		case CardAbilityBean.BUF_ATK_ADD:
			break;
		case CardAbilityBean.BUF_ATK_UNABLE:
			break;			
		case CardAbilityBean.BUF_CURE:
			break;
		case CardAbilityBean.BUF_DAMAGE_UNSTOP:
			break;
		case CardAbilityBean.BUF_GUIDE:
			break;
		case CardAbilityBean.BUF_HEAL:
			break;	
		case CardAbilityBean.BUF_HIDDEN:
			break;
		case CardAbilityBean.BUF_HP_WITH_EQUIP:
			break;
		case CardAbilityBean.BUF_LATENT:
			break;
		case CardAbilityBean.BUF_SHIELD:
			break;	
		case CardAbilityBean.BUF_SIDE:
			break;	
		case CardAbilityBean.BUF_STRIKE_COST_ADD:
			break;	
		case CardAbilityBean.BUF_STRIKE_DAMAGE_ADD:
			break;	
		case CardAbilityBean.BUF_POINT_UNABLE:
			break;		
		case CardAbilityBean.BUF_DEF_ADD:
			break;	
		case CardAbilityBean.BUF_DEF_UNABLE:
			break;	
		}
	}
}
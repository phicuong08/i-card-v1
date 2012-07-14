package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardActionBean;
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
public class CardUseBsn
{	
	
	public static void Atk(CardBean card1,CardBean card2){
		card1.AddHp(-card2.getAtk());
		card2.AddHp(-card1.getAtk());
		card1.setSide(1);
		if(card1.getHp()<=0)
			card1.setSlotID(CardBean.TOMB_SLOT_ID);
		if(card2.getHp()<=0)
			card2.setSlotID(CardBean.TOMB_SLOT_ID);
	}
	public static boolean IsWhichMatch(CardGameBean game,CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability){
		int srcOwner = game.getCardOwner(cardSrc.getRealID());
		int desOwner = game.getCardOwner(cardDes.getRealID()); 
		boolean bMatch = false;
		switch(ability.getWhich()){
		case CardAbilityBean.WHICH_MY:
			bMatch = (srcOwner==desOwner)&& ((cardDes.getCardType()==CardInfoBean.HERO)||(cardDes.getCardType()==CardInfoBean.SOLDIER));
			break;
		case CardAbilityBean.WHICH_MYHERO:
			bMatch = ((srcOwner==desOwner)&& (cardDes.getCardType()==CardInfoBean.HERO));
			break;
		case CardAbilityBean.WHICH_MYSOLDIER:
			bMatch = ((srcOwner==desOwner)&& (cardDes.getCardType()==CardInfoBean.SOLDIER));
			break;
		case CardAbilityBean.WHICH_YOUR:
			bMatch = (srcOwner!=desOwner)&& ((cardDes.getCardType()==CardInfoBean.HERO)||(cardDes.getCardType()==CardInfoBean.SOLDIER));
			break;
		case CardAbilityBean.WHICH_YOURHERO:
			bMatch = ((srcOwner!=desOwner)&& (cardDes.getCardType()==CardInfoBean.HERO));
			break;
		case CardAbilityBean.WHICH_YOURSOLDIER:
			bMatch = ((srcOwner!=desOwner)&& (cardDes.getCardType()==CardInfoBean.SOLDIER));
			break;
		case CardAbilityBean.WHICH_YOURWEAPON:
			bMatch = ((srcOwner!=desOwner)&& (cardDes.getCardType()==CardInfoBean.WEAPON));
			break;
		case CardAbilityBean.WHICH_MYWEAPON:
			bMatch = ((srcOwner==desOwner)&& (cardDes.getCardType()==CardInfoBean.WEAPON));
			break;	
		case CardAbilityBean.WHICH_SKILL:
			bMatch = (cardDes.getCardType()==CardInfoBean.SKILL);
			break;	
		}
		return bMatch;
	}

	public static void DoWhatAbility(CardGameBean game,CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability)
	{
		switch(ability.getType()){
		case CardAbilityBean.DO_ATK_SIDE_ADD:
			break;
		case CardAbilityBean.DO_BREAK_SKILL:
			break;
		case CardAbilityBean.DO_DAMAGE:
			break;
		case CardAbilityBean.DO_DEAD:
			break;
		case CardAbilityBean.DO_DROP_HAND_CARD:
			break;
		case CardAbilityBean.DO_DROP_RES:
			break;
		case CardAbilityBean.DO_HEAL:
			break;
		case CardAbilityBean.DO_KILL:
			break;
		case CardAbilityBean.DO_KILL_COST_DOWN:
			break;
		case CardAbilityBean.DO_KILL_COST_UP:
			break;
		case CardAbilityBean.DO_RESET:
			cardDes.setSide(0);
			break;
		case CardAbilityBean.DO_SIDE:
			cardDes.setSide(1);
			break;
		default:
			BufferBsn.AddBuf(cardSrc, cardDes, ability);
		}
	}
	public static void DoCardAbility(CardGameBean game,CardBean cardSrc,CardBean cardDes){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(cardSrc.getCardID());
		
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(IsWhichMatch(game,cardSrc,cardDes,ability)==false)
				continue;
			DoWhatAbility(game,cardSrc,cardDes,ability);
		}
	}
	
	public static boolean SkillCast(CardGameBean game,CardSiteBean site,
										CardBean card,CardActionBean action){
		CardAbilityBean ability = CardAbilityStoreBean.GetInstance().getAbilityBean(card.getCardID());
		if(ability==null)
			return false;
		if(CardSiteBsn.getResNum(site)< ability.getCost())
			return false;
		CardSiteBsn.useRes(site,ability.getCost());
		int targetNum = (ability.getTargetNum()>action.getDes().size())?action.getDes().size():ability.getTargetNum();
		for(int i=0;i<targetNum;i++){
			CardBean targetCard = game.getCard(action.getDes().get(i));
			if(targetCard==null)
				continue;
			DoCardAbility(game,card,targetCard);
		}
		return true;
	}
}
package sfs2x.extensions.icard.bsn;

import java.util.HashMap;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.BufferBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardInfoBean;
import sfs2x.extensions.icard.beans.CardDeckBean;



/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardUseBsn
{	
	
	public static void Atk(CardBean card1,CardBean card2){
		if(card1.IsDistAtk(CardAbilityBean.WHEN_ATK)==false) //是否有远程攻击能力
			card1.AddHp(-card2.getAtk(CardAbilityBean.WHEN_ATK));
		card2.AddHp(-card1.getAtk(CardAbilityBean.WHEN_ATKED));
		card1.setSide(1);
		if(BufferBsn.IsCardAbility(card2,CardAbilityBean.WHEN_ATKED,CardAbilityBean.DO_KILL)==true)
			card1.setDead();
		if(card1.getHp()<=0)
		{
			card1.setZoneID(CardBean.GRAVE_ZONE_ID);
			if(BufferBsn.IsCardAbility(card1,CardAbilityBean.WHEN_DEAD,CardAbilityBean.DO_KILL)==true)
				card2.setDead();
		}
		if(card2.getHp()<=0)
		{
			card2.setZoneID(CardBean.GRAVE_ZONE_ID);
			if(BufferBsn.IsCardAbility(card2,CardAbilityBean.WHEN_DEAD,CardAbilityBean.DO_KILL)==true ||
			   BufferBsn.IsCardAbility(card2,CardAbilityBean.WHEN_DEF_DEAD,CardAbilityBean.DO_KILL)==true)
			   card1.setDead();
		}
	}
	public static boolean IsWhichMatch(CardGameBean game,CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability){
		int srcOwner = game.getCardOwner(cardSrc.getRealID());
		int desOwner = game.getCardOwner(cardDes.getRealID()); 
		boolean bMatch = true;
		switch(ability.getWhich()){
		case CardAbilityBean.WHICH_MY:
			bMatch = (srcOwner==desOwner)&& ((cardDes.getCardType()==CardInfoBean.HERO)||(cardDes.getCardType()==CardInfoBean.ALLY));
			break;
		case CardAbilityBean.WHICH_MYHERO:
			bMatch = ((srcOwner==desOwner)&& (cardDes.getCardType()==CardInfoBean.HERO));
			break;
		case CardAbilityBean.WHICH_MYSOLDIER:
			bMatch = ((srcOwner==desOwner)&& (cardDes.getCardType()==CardInfoBean.ALLY));
			break;
		case CardAbilityBean.WHICH_YOUR:
			bMatch = (srcOwner!=desOwner)&& ((cardDes.getCardType()==CardInfoBean.HERO)||(cardDes.getCardType()==CardInfoBean.ALLY));
			break;
		case CardAbilityBean.WHICH_YOURHERO:
			bMatch = ((srcOwner!=desOwner)&& (cardDes.getCardType()==CardInfoBean.HERO));
			break;
		case CardAbilityBean.WHICH_YOURSOLDIER:
			bMatch = ((srcOwner!=desOwner)&& (cardDes.getCardType()==CardInfoBean.ALLY));
			break;
		case CardAbilityBean.WHICH_YOURWEAPON:
			bMatch = ((srcOwner!=desOwner)&& (cardDes.getCardType()==CardInfoBean.WEAPON));
			break;
		case CardAbilityBean.WHICH_MYWEAPON:
			bMatch = ((srcOwner==desOwner)&& (cardDes.getCardType()==CardInfoBean.WEAPON));
			break;	
		case CardAbilityBean.WHICH_SKILL:
			bMatch = (cardDes.getCardType()==CardInfoBean.ABILITY);
			break;	
		}
		return bMatch;
	}
	public static void DoKillCostDown(CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability)
	{
		if(cardDes.getCost() <= ability.getVal()){
			cardDes.setDead();
		}
	}
	public static void DoKillCostUp(CardBean cardSrc,CardBean cardDes,
			CardAbilityBean ability)
	{
		if(cardDes.getCost() >= ability.getVal()){
			cardDes.setDead();
		}
	}
	
	public static void DoWhatAbility(CardGameBean game,CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability)
	{
		switch(ability.getType()){
		case CardAbilityBean.DO_ATK_SIDE_ADD:
			break;
		case CardAbilityBean.DO_REMOVE_SKILL:
			DoRemoveSkill(game,cardDes);
			break;
		case CardAbilityBean.DO_REMOVE_GOOD_SKILL:
			DoRemoveGoodSkill(game,cardDes);
			break;
		case CardAbilityBean.DO_REMOVE_BAD_SKILL:
			DoRemoveBadSkill(game,cardDes);
			break;	
		case CardAbilityBean.DO_DAMAGE:
			cardDes.AddHp(-ability.getVal());
			break;
		case CardAbilityBean.DO_DROP_HAND_CARD:
			
			break;
		case CardAbilityBean.DO_DROP_RES:
			break;
		case CardAbilityBean.DO_HEAL:
			cardDes.AddHp(ability.getVal());
			break;
		case CardAbilityBean.DO_KILL:
			cardDes.setDead();
			break;
		case CardAbilityBean.DO_KILL_COST_DOWN:
			DoKillCostDown(cardSrc,cardDes,ability);
			break;
		case CardAbilityBean.DO_KILL_COST_UP:
			DoKillCostUp(cardSrc,cardDes,ability);
			break;
		case CardAbilityBean.DO_RESET:
			cardDes.setSide(0);
			break;
		case CardAbilityBean.DO_SIDE:
			cardDes.setSide(1);
			break;
		case CardAbilityBean.DO_DRAW_HAND_CARD:
			BattleBsn.drawCard(game,cardSrc.getOwner(),ability.getVal());
			break;
		default:
			;//BufferBsn.AddBuf(cardSrc, cardDes, ability);
		}
	}
	public static Vector<Integer>  getAbilityTarget(CardGameBean game,CardDeckBean site,CardBean cast){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(cast.getCardID());
		Vector<Integer> targets = new Vector<Integer>();
		Vector<CardBean> myAllies = CardSiteBsn.PickSlotCard(site,CardBean.FIGHT_ZONE_ID,CardInfoBean.ALLY);
		myAllies.add(site.getHero());
		CardDeckBean enemy = BattleBsn.getOtherDeck(game,site.getPlayerID());
		Vector<CardBean> enemyAllies = CardSiteBsn.PickSlotCard(enemy,CardBean.FIGHT_ZONE_ID,CardInfoBean.ALLY);
		enemyAllies.add(enemy.getHero());
		
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(FillAbilityMatch(game,cast,ability,myAllies,targets))
				myAllies = null;
			if(FillAbilityMatch(game,cast,ability,enemyAllies,targets))
				enemyAllies = null;
		}
		return targets;
	}
	private static boolean FillAbilityMatch(CardGameBean game,CardBean cardSrc,CardAbilityBean ability,Vector<CardBean> vec,Vector<Integer> targets){
		if(vec==null)
			return false;
		boolean ret=false;
		for(int j=0;j<vec.size();j++)
		{
			CardBean desCard =vec.get(j);
			if(IsWhichMatch(game,cardSrc,desCard,ability)==true && !desCard.IsPointUnable()){
				targets.add(desCard.getRealID());
				ret = true;
			}
		}
		return ret;
	}
	public static int calcAbilityVal(CardAbilityBean ability,CardBean card){
		int ret = 0;
		switch(ability.getType()){
		case CardAbilityBean.DO_DAMAGE:
			if(card.IsHero())
				ret = ability.getVal()*2;
			else
				ret = (card.getHp()<= ability.getVal())? card.getCost()+2:card.getCost();
			break;
		case CardAbilityBean.DO_HEAL:
			ret = card.getMaxHp() - card.getHp();
			break;
		case CardAbilityBean.DO_KILL:
		case CardAbilityBean.DO_KILL_COST_UP:
		case CardAbilityBean.DO_KILL_COST_DOWN:
			ret = card.getCost();
			break;
		}
		return ret;
	}
	public static void DoRemoveSkill(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				onCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
	public static void DoRemoveGoodSkill(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				if(BufferBsn.IsGoodBuf(card))
					onCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
	public static void DoRemoveBadSkill(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				if(BufferBsn.IsGoodBuf(card)==false)
					onCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
	public static void DoCardAbility(CardGameBean game,CardBean cardSrc,CardBean cardDes){
		Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(cardSrc.getCardID());
		
		boolean bHaveBuf = false;
		for(int i=0;i<vec.size();i++){
			CardAbilityBean ability = vec.get(i);
			if(IsWhichMatch(game,cardSrc,cardDes,ability)==false)
				continue;
			DoWhatAbility(game,cardSrc,cardDes,ability);
			if(ability.IsBuf())
				bHaveBuf = true;
		}
		cardSrc.setDirtyFlagBit(CardBean.CARDID_DIRTY_BIT);
		if(bHaveBuf){
			cardSrc.setZoneID(CardBean.ATTACH_ZONE_ID);
			cardSrc.setAttachTo(cardDes.getRealID());
		}
		else
			onCardDead(game,cardSrc);
		if(cardDes.getIsDead())
			onCardDead(game,cardDes);
	}
	public static void onCardDead(CardGameBean game,CardBean card){
		card.setZoneID(CardBean.GRAVE_ZONE_ID);
		HashMap<Integer, BufferBean> bufMap = card.getBufStore().getBufMap();
		for(BufferBean buf:bufMap.values()){
			CardBean cardBuf = game.getCard(buf.getID());
			if(cardBuf!=null)
				onCardDead(game,cardBuf);
		}
	}
	
	public static boolean ability2Cast(CardGameBean game,CardDeckBean site,
										CardBean card,CardActionBean action){
		CardAbilityBean ability = CardAbilityStoreBean.GetInstance().getAbilityBean(card.getCardID());
		if(ability==null)
			return false;
		if(site.getCurRes()< card.getCost())
			return false;
		site.useRes(card.getCost());
		if(ability.IsRangeTarget()){
			Vector<Integer> des = new Vector<Integer>();
			Vector<CardBean> pickVect = PickCardOnWhich(game,site,ability.getWhich());
			for(int i=0;i<pickVect.size();i++){
				CardBean targetCard = pickVect.get(i);
				DoCardAbility(game,card,targetCard);
				des.add(targetCard.getRealID());
			}
			action.setDes(des);
		}
		else{
			int targetNum = (ability.getTargetNum()>action.getDes().size())?action.getDes().size():ability.getTargetNum();
			for(int i=0;i<targetNum;i++){
				CardBean targetCard = game.getCard(action.getDes().get(i));
				if(targetCard==null)
					continue;
				DoCardAbility(game,card,targetCard);
			}
		}

		return true;
	}
	
	public static Vector<CardBean> PickCardOnWhich(CardGameBean game,CardDeckBean site,int which){
		Vector<CardBean> pickVect =new Vector<CardBean>();
		CardDeckBean otherDeck = BattleBsn.getOtherDeck(game, site.getPlayerID());
		switch(which){
		case CardAbilityBean.WHICH_MY:
			CardSiteBsn.FillSlotCard(site, CardBean.HERO_ZONE_ID, -1, pickVect);
			CardSiteBsn.FillSlotCard(site, CardBean.FIGHT_ZONE_ID, -1, pickVect);
			break;
		case CardAbilityBean.WHICH_MYSOLDIER:
			CardSiteBsn.FillSlotCard(site, CardBean.FIGHT_ZONE_ID, -1, pickVect);
			break;
		case CardAbilityBean.WHICH_YOUR:
			CardSiteBsn.FillSlotCard(otherDeck, CardBean.HERO_ZONE_ID, -1, pickVect);
			CardSiteBsn.FillSlotCard(otherDeck, CardBean.FIGHT_ZONE_ID, -1, pickVect);
			break;
		case CardAbilityBean.WHICH_YOURSOLDIER:
			CardSiteBsn.FillSlotCard(site, CardBean.FIGHT_ZONE_ID, -1, pickVect);
			break;
		case CardAbilityBean.WHICH_IU:
			CardSiteBsn.FillSlotCard(site, CardBean.HERO_ZONE_ID, -1, pickVect);
			CardSiteBsn.FillSlotCard(site, CardBean.FIGHT_ZONE_ID, -1, pickVect);
			CardSiteBsn.FillSlotCard(otherDeck, CardBean.HERO_ZONE_ID, -1, pickVect);
			CardSiteBsn.FillSlotCard(otherDeck, CardBean.FIGHT_ZONE_ID, -1, pickVect);
			break;
		}

		return pickVect;
	}
}
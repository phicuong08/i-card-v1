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
	public static void AtkedCure(CardGameBean game,CardBean cardDes){
		int cureVal = 0;
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				cureVal += CardAbilityBsn.getAbilityVal(card,CardAbilityBean.BUF_CURE,CardAbilityBean.WHEN_ATKED);
			}
		}
		cardDes.AddHp(-cureVal);
	}
	private static int getCardAtk(CardBean card,int when){
		int damageVal = card.getAtk(CardAbilityBean.WHEN_ATK);
		if(card.IsWeapon())
			damageVal += CardSiteBsn.getHeroAbilityVal(card.getDeck(),CardAbilityBean.BUF_STRIKE_DAMAGE_ADD);
		return damageVal;
	}
	private static void AtkToHero(CardBean card1,CardBean card2){
		CardBean defCard = CardSiteBsn.getCard(card2.getDeck(), CardBean.EQUIP_ZONE_ID,CardInfoBean.ARMOR);
		int damageVal = getCardAtk(card1,CardAbilityBean.WHEN_ATK);
		if(defCard!=null){
			damageVal = defCard.useDef(damageVal);
		}
		card2.AddHp(-damageVal);
	}
	public static void WeaponAtk(CardGameBean game,CardBean card1,CardBean card2){
		
											
		if(card1.IsDistAtk(game,CardAbilityBean.WHEN_ATK)==false) //是否有远程攻击能力
			card1.getDeck().getHero().AddHp(-card2.getAtk(CardAbilityBean.WHEN_ATKED));
		if(card2.IsHero())
			AtkToHero(card1,card2);
		else
			card2.AddHp(-card1.getAtk(CardAbilityBean.WHEN_ATK));
		CheckCardHp(card2);
		CheckCardHp(card1.getDeck().getHero());
		onCardDoAtkDamage(card1,card2);
	}
	private static void onCardDoAtkDamage(CardBean card1,CardBean card2){ //成功造成攻击伤害
		if(card2.getDirtyFlagBit(CardBean.HP_DIRTY_BIT)==false)
			return;
		CardAbilityBsn.doCardPostEventAbility(card1,card2,CardAbilityBean.WHEN_ATK_DAMAGE);
	}
	public static void CheckCardHp(CardBean card){
		if(card.getHp()<=0)
			card.setZoneID(CardBean.WAITDEAD_ZONE_ID);
	}
	public static void Atk(CardGameBean game,CardBean card1,CardBean card2){
		if(card1.IsDistAtk(game,CardAbilityBean.WHEN_ATK)==false) //是否有远程攻击能力
			card1.AddHp(-card2.getAtk(CardAbilityBean.WHEN_ATKED));
		if(card2.IsHero())
			AtkToHero(card1,card2);
		else
			card2.AddHp(-getCardAtk(card1,CardAbilityBean.WHEN_ATK));

		if(CardAbilityBsn.IsCardAbility(card2,CardAbilityBean.WHEN_ATKED,CardAbilityBean.DO_KILL)==true)
			card1.setWaitDead();
		if(card1.getHp()<=0){
			card1.setZoneID(CardBean.WAITDEAD_ZONE_ID);
			if(CardAbilityBsn.IsCardAbility(card1,CardAbilityBean.WHEN_DEAD,CardAbilityBean.DO_KILL)==true)
				card2.setWaitDead();
		}
		if(card2.getHp()<=0){
			card2.setZoneID(CardBean.WAITDEAD_ZONE_ID);
			if(CardAbilityBsn.IsCardAbility(card2,CardAbilityBean.WHEN_DEAD,CardAbilityBean.DO_KILL)==true ||
					CardAbilityBsn.IsCardAbility(card2,CardAbilityBean.WHEN_DEF_DEAD,CardAbilityBean.DO_KILL)==true)
			   card1.setWaitDead();
		}
		onCardDoAtkDamage(card1,card2);
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
			cardDes.setWaitDead();
		}
	}
	public static void DoKillCostUp(CardBean cardSrc,CardBean cardDes,
			CardAbilityBean ability)
	{
		if(cardDes.getCost() >= ability.getVal()){
			cardDes.setWaitDead();
		}
	}
	private static void DoCastDamage(CardGameBean game,CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability)
	{
		cardDes.AddHp(-ability.getVal());
		CardDeckBean deck = game.getDeckOnCard(cardSrc.getRealID());
		int val = CardSiteBsn.getHeroAbilityVal(deck,CardAbilityBean.BUF_CAST_DAMAGE_ADD);
		cardDes.AddHp(-val);
	}
	public static void DoRemoveAttached(CardGameBean game,CardBean cardDes){
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean card : deck.getCardMap().values())
			{
				if(card.getZoneID() != CardBean.ATTACH_ZONE_ID)
					continue;
				if(card.getAttachTo()!=cardDes.getRealID())
					continue;
				DoCardDead(game,card);
			}
		}
		cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
	}
	public static void DoWhatAbility(CardGameBean game,CardBean cardSrc,CardBean cardDes,
										CardAbilityBean ability)
	{
		switch(ability.getType()){
		case CardAbilityBean.DO_ATK_SIDE_ADD:
			break;
		case CardAbilityBean.DO_REMOVE_SKILL:
			AttachCardBsn.DoRemoveAttached(game,cardDes);
			break;
		case CardAbilityBean.DO_REMOVE_GOOD_SKILL:
			AttachCardBsn.DoRemoveGoodAttached(game,cardDes);
			break;
		case CardAbilityBean.DO_REMOVE_BAD_SKILL:
			AttachCardBsn.DoRemoveBadAttached(game,cardDes);
			break;	
		case CardAbilityBean.DO_DAMAGE:
			DoCastDamage(game,cardSrc,cardDes,ability);

			break;
		case CardAbilityBean.DO_DROP_HAND_CARD:
			
			break;
		case CardAbilityBean.DO_DROP_RES:
			break;
		case CardAbilityBean.DO_HEAL:
			cardDes.AddHp(ability.getVal());
			break;
		case CardAbilityBean.DO_KILL:
			cardDes.setWaitDead();
			break;
		case CardAbilityBean.DO_KILL_COST_DOWN:
			DoKillCostDown(cardSrc,cardDes,ability);
			break;
		case CardAbilityBean.DO_KILL_COST_UP:
			DoKillCostUp(cardSrc,cardDes,ability);
			break;
		case CardAbilityBean.DO_RESET:
			cardDes.setReady();
			break;
		case CardAbilityBean.DO_SIDE:
			cardDes.setSide(1);
			break;
		case CardAbilityBean.DO_DRAW_HAND_CARD:
			BattleBsn.drawCard(game,cardSrc.getOwner(),ability.getVal());
			break;
		default:
			cardDes.setDirtyFlagBit(CardBean.BUF_DIRTY_BIT);
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
			if(IsWhichMatch(game,cardSrc,desCard,ability)==true && !desCard.IsPointUnable(game)){
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
			cardSrc.setZoneID(CardBean.WAITDEAD_ZONE_ID);
		if(cardDes.getIsDead())
			cardDes.setZoneID(CardBean.WAITDEAD_ZONE_ID);
	}
	
	public static void DoCardDead(CardGameBean game,CardBean card){
		card.setZoneID(CardBean.GRAVE_ZONE_ID);
		card.setAttachTo(0);
		for (CardDeckBean deck : game.getDeck().values()){
			for (CardBean attach : deck.getCardMap().values())
			{
				if(attach.getZoneID()!=CardBean.ATTACH_ZONE_ID ||
						attach.getAttachTo()!=card.getRealID())
							continue;
				DoCardDead(game,attach);
			}
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
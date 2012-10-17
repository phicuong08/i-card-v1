package sfs2x.extensions.icard.bsn;


import java.util.Vector;


import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;

import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.main.ICardExtension;




/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardSiteBsn
{	

	public static void onAttachCardEvent(CardGameBean game,CardDeckBean deck,int when){
		
		//buf event
		for (CardBean card : deck.getCardMap().values()){
			if(card.getZoneID()!=CardBean.ATTACH_ZONE_ID)
				continue;
			CardBean desCard = game.getCard(card.getAttachTo());
			if(desCard==null)
				continue;
			Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbilityOnWhen(card.getCardID(),when);
			if(vec==null)
				continue;
			for(int i=0;i<vec.size();i++){
				CardAbilityBean ability = vec.get(i);
				CardAbilityBsn.callCardAbility(desCard,ability);
			}
		}
		//support event
		
	}
	public static int supportAtkVal(CardDeckBean site,int which,int when){
		int atk = 0;
		Vector<CardBean> vec = PickSlotCard(site,CardBean.SUPPORT_ZONE_ID,-1);
		for(int i=0;i<vec.size();i++){
			CardBean card = vec.get(i);
			
			Vector<CardAbilityBean> abiVec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
			for(int j=0;j<abiVec.size();j++){
				CardAbilityBean ability = abiVec.get(j);
				if(ability.getType()==CardAbilityBean.BUF_ATK_ADD && ability.IsWhichMatch(which)&& ability.IsWhenMatch(when))
					atk += ability.getVal();
			}
		}
		
		return atk;
	}
	public static void FillSlotCard(CardDeckBean site,int slotID,int cardType,Vector<CardBean> pickVect){
		for (CardBean card : site.getCardMap().values())
		{
				if(card.getZoneID() == slotID &&
				   (cardType==-1 || card.getCardType()==cardType))
					pickVect.add(card);
		}
	}
	
	public static Vector<CardBean> PickSlotCard(CardDeckBean site,int slotID,int cardType){
		Vector<CardBean> pickVect =new Vector<CardBean>();
		FillSlotCard(site,slotID,cardType,pickVect);
		return pickVect;
	}
	public static CardBean getGuideCard(CardGameBean game,CardDeckBean deck){
		for(CardBean card:deck.getCardMap().values()){
			if(card.getZoneID()!=CardBean.HERO_ZONE_ID &&
				card.getZoneID()!=CardBean.FIGHT_ZONE_ID)
				continue;
			if(card.IsGuidable(game))
				return card;
		}
		return null;
	}
	public static CardBean getCard(CardDeckBean deck,int zone,int cardType){
		for(CardBean card:deck.getCardMap().values()){
			if(card.getZoneID()==zone &&
				card.getCardType()==cardType)
				return card;
		}
		return null;
	}
	public static int getHeroAbilityVal(CardDeckBean deck,int what){
		int val = 0;
		for(CardBean card:deck.getCardMap().values()){
			if(card.getZoneID()!=CardBean.EQUIP_ZONE_ID)
				continue;
			val += CardAbilityBsn.getAbilityVal(card,CardAbilityBean.WHEN_ALL,what);
		}
		return val;
	}
	public static void onTurnEnd(CardGameBean game,ICardExtension ext,CardDeckBean deck){
		boolean bDirty = false;
		for (CardBean card : deck.getCardMap().values())
		{
			card.IncLoop();
			if(card.getZoneID()!=CardBean.SUPPORT_ZONE_ID)
				continue;
			Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
			if(vec.size()==0)
				continue;
			CardAbilityBean ability = vec.get(0);
			if(card.getLoopNum()>ability.getLoopNum())
			{
				card.setWaitDead();
				bDirty = true;
			}
		}
		if(bDirty)
			ext.SendGameCardUpdate(game);
	}
	public static void IncCardLoop(CardDeckBean deck){
		
	}
	
}
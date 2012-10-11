package sfs2x.extensions.icard.bsn;







import java.util.Vector;

import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardAbilityStoreBean;
import sfs2x.extensions.icard.beans.CardAttrBean;
import sfs2x.extensions.icard.beans.CardAttrStoreBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.beans.CardGameBean;



/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class SupportCardBsn
{	
	public static void onSupportEvent(CardGameBean game,CardDeckBean srcDeck,CardDeckBean desDeck,int when){
		for (CardBean card: srcDeck.getCardMap().values()){
			if(card.getZoneID()!=CardBean.SUPPORT_ZONE_ID)
				continue;
			card.getZoneID();
		
			Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
			if(vec==null)
				continue;

			for(int i=0;i<vec.size();i++){
				CardAbilityBean ability = vec.get(i);
				if(ability.IsWhenMatch(when)==false)
					continue;
				switch(ability.getType()){
				case CardAbilityBean.DO_DRAW_HAND_CARD:
					BattleBsn.drawCard(game,desDeck.getPlayerID(),ability.getVal());
					break;
				}
			}
		}
	}
	public static Boolean ExistDeckSupport(CardDeckBean deck,int which,int type){
		for (CardBean card : deck.getCardMap().values())
		{
			if(card.getZoneID() != CardBean.SUPPORT_ZONE_ID)
				continue;
			Vector<CardAbilityBean> vec = CardAbilityStoreBean.GetInstance().getCardAbility(card.getCardID());
			for(int i=0;i<vec.size();i++){
				CardAbilityBean ability = vec.get(i);
				if(ability.getType()!=type)
					continue;
				if(ability.IsWhichMatch(which))
					return true;
			}
		}
		return false;
	}
}
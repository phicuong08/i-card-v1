package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import com.icard.cards.BaseCard;
import com.smartfoxserver.v2.entities.User;

/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardSiteBean
{	
	/** User id */
	private int _playerID = 0;
	private CardBean _hero;
	private ConcurrentHashMap<Integer, CardBean> _cardMap =new ConcurrentHashMap<Integer, CardBean>();
	private List<Integer> _cardSource ;

	public CardSiteBean(int player) {
		_playerID = player;
	}

	public int getPlayerID() {
		return _playerID;
	}
	public void AddCard(CardBean card){
		_cardMap.put(card.getRealID(), card);
	}
	public void setCardSource(List<Integer> cards){
		_cardSource = cards;
	}
	public void setEmptyCardMap(){
		_cardMap = new ConcurrentHashMap<Integer, CardBean>();
	}
	public ConcurrentHashMap<Integer, CardBean> getCardMap(){
		return _cardMap;
	}
	public List<Integer> getCardSource(){
		return _cardSource;
	}
	public Integer getCatchCard(){
		if(_cardSource.isEmpty())
			return 0;
		return _cardSource.remove(0);
	}
	
}
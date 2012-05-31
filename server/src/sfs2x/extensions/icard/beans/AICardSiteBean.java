package sfs2x.extensions.icard.beans;

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
	private ConcurrentHashMap<Integer, CardBean> _cardMap =new ConcurrentHashMap<Integer, CardBean>();
	

	public CardSiteBean(int player) {
		_playerID = player;
	}

	public int getPlayerID() {
		return _playerID;
	}
	public void AddCard(CardBean card){
		_cardMap.put(card.getRealID(), cardInfo);
	}
	

	
}
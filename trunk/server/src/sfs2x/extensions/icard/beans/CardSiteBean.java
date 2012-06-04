package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.icard.main.ICardExtension;

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
	private List<Integer> _drawCardSrc ;
	private User _sfsUser=null;
	public CardSiteBean(int player,User sfsUser) {
		_playerID = player;
		_sfsUser = sfsUser;
	}
	public User getSfsUser() {
		return _sfsUser;
	}
	public int getPlayerID() {
		return _playerID;
	}
	public void AddCard(CardBean card){
		_cardMap.put(card.getRealID(), card);
	}
	public void setCardSource(List<Integer> cards){
		_drawCardSrc = cards;
	}
	public void setEmptyCardMap(){
		_cardMap = new ConcurrentHashMap<Integer, CardBean>();
	}
	public ConcurrentHashMap<Integer, CardBean> getCardMap(){
		return _cardMap;
	}
	public List<Integer> getDrawCardSrc(){
		return _drawCardSrc;
	}
	public Integer getDrawCard(){
		if(_drawCardSrc.isEmpty())
			return 0;
		return _drawCardSrc.remove(0);
	}
	public void gameTick(CardGameBean game,ICardExtension ext){
		
	}
}
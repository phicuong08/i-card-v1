package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.icard.main.ICardExtension;

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
	private int _chainCost=0;
	private Boolean _addResAble = false;

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
	public int getChainCost(){
		return _chainCost;
	}
	public void addChainCost(int val){
		_chainCost += val;
	}
	public void clearChainCost(){
		_chainCost = 0 ;
	}
	public void setFreshLoop(){
		_addResAble = true;
		for(CardBean card:_cardMap.values()){
			if(card.getSlotID()!=CardBean.HAND_SLOT_ID &&
			   card.getSlotID()!=CardBean.TOMB_SLOT_ID)
				card.setSide(0);
		}
	}
	public void setAddResAble(Boolean flag){
		_addResAble = flag;
	}
	public Boolean getAddResAble(){
		return _addResAble;
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
	public int getRemainRes(){
		int ret = 0;
		for(CardBean card:_cardMap.values()){
			if(card.getSlotID()==CardBean.RES_SLOT_ID &&
				card.getSide()==0)
				ret++;
		}
		ret -= _chainCost;
		return ret;
	}
	public List<Integer> getDrawCardSrc(){
		return _drawCardSrc;
	}
	public Integer getDrawCard(){
		if(_drawCardSrc.isEmpty())
			return 0;
		return _drawCardSrc.remove(0);
	}
	public CardInfoBean getInfo(int id){
		CardBean card = _cardMap.get(id);
		if(card==null)
			return null;
		return card.getInfo();
	}
	public void gameTick(CardGameBean game,ICardExtension ext){
		
	}
}
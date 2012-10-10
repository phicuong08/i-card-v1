package sfs2x.extensions.icard.beans;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.icard.bsn.BufferBsn;
import sfs2x.extensions.icard.main.ICardExtension;

import com.smartfoxserver.v2.entities.User;

/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardDeckBean
{	
	/** User id */
	private int _playerID = 0;
	private CardBean _hero;
	private ConcurrentHashMap<Integer, CardBean> _cardMap =new ConcurrentHashMap<Integer, CardBean>();
	private List<Integer> _drawCardSrc ;
	private User _sfsUser=null;
	private Boolean _addResAble = false;
	private int _maxRes = 10;
	private int _curRes = 10;
	public CardDeckBean(int player,User sfsUser) {
		_playerID = player;
		_sfsUser = sfsUser;
	}
	public User getSfsUser() {
		return _sfsUser;
	}
	public CardBean getHero(){
		return _hero;
	}
	public int getPlayerID() {
		return _playerID;
	}
	public void setCardReady(){
		_addResAble = true;
		_curRes = _maxRes;
		for(CardBean card:_cardMap.values()){
			if(card.IsResetEnable()==false)
				continue;
			if(card.getZoneID()!=CardBean.HAND_ZONE_ID &&
			   card.getZoneID()!=CardBean.GRAVE_ZONE_ID)
				card.setSide(0);
		}
	}
	
	public void addRes(){
		if(_addResAble==false)
			return;
		_addResAble = false;
		_maxRes++;
		_curRes++;
	}
	public Boolean getAddResAble(){
		return _addResAble;
	}
	public void AddCard(CardBean card){
		if(card.getCardType()==CardInfoBean.HERO)
			_hero = card;
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
	public void useRes(int val){
		_curRes -= val;
	}
	public int getCurRes(){
		return _curRes;
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
	public int getHeroAbilityVal(int what){
		int val = 0;
		for(CardBean card:_cardMap.values()){
			if(card.getZoneID()!=CardBean.EQUIP_ZONE_ID)
				continue;
			val += BufferBsn.AbilityVal(card,what);
		}
		return val;
	}
}
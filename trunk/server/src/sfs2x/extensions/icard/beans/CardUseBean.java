package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.List;

public final class CardUseBean {

	private int _cardID = 0; // ÅÆµÄid
	private int _cost=0;
	private int _targetNum=0;
	private int _myHero=0;	
	private int _mySoldier=0;
	private int _yourHero=0;
	private int _yourSoldier=0;
	
	
	public CardUseBean(int cardID,int cost, int targetNum,int myHero,
											int mySoldier,int yourHero,int yourSoldier) {
		this._cardID = cardID;
		this._cost= cost;
		this._targetNum = targetNum;
		this._myHero =myHero;
		this._mySoldier = mySoldier;
		this._yourHero = yourHero;
		this._yourSoldier = yourSoldier;
	}
	
	public int getCardID() {
		return _cardID;
	}

	public int getCost() {
		return _cost;
	}

	public int getTargetNum() {
		return _targetNum;
	}

	public int getMyHero() {
		return _myHero;
	}

	public int getMySoldier() {
		return _mySoldier;
	}
	public int getYourHero() {
		return _yourHero;
	}

	public int getYourSoldier() {
		return _yourSoldier;
	}
	
}

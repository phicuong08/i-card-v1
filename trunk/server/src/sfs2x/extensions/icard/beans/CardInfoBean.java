package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.List;

public final class CardInfoBean {

	public static final int HERO = 0;
	public static final int SOLDIER = 1;
	public static final int WEAPON = 2;
	public static final int ARMOR = 3;
	public static final int SKILL = 4;
	public static final int TASK = 5;
		
	private int _cardID = 0; // 牌的id
	
	private int _BaseCost = 0; // 最初始的上场花费（对盟军，技能，武器有效）
	private int _BaseAttack = 0; // 最初始的攻击力
	private int _BaseHp = 0; // 最初始的生命
	private int _BaseDefence = 0;//最初的防御
	private int _BaseUseCost = 0; // 最初始的使用一次花费（对武器有效）
	
	public CardInfoBean(int cardID,int BaseCost, int BaseAttack,
			int BaseHp,int BaseDefence,int BaseUseCost) {
		this._cardID = cardID;
		this._BaseCost=BaseCost;
		this._BaseAttack =BaseAttack;
		this._BaseHp =BaseHp;
		this._BaseDefence = BaseDefence;
		this._BaseUseCost = BaseUseCost;
	}
	
	public int getCardID() {
		return _cardID;
	}

	//减少此种牌的全服务器计数
//	public void DecCountOfThisCard() {
//		synchronized (this){
//			CountOfThisCard--;
//		}
//	}

	public int getBaseCost() {
		return _BaseCost;
	}

	public int getBaseAttack() {
		return _BaseAttack;
	}

	public int getBaseHp() {
		return _BaseHp;
	}

	public int getBaseDefence() {
		return _BaseDefence;
	}

	public int getBaseUseCost() {
		return _BaseUseCost;
	}
	
	public int getType(){
				int ret=99;
				switch(_cardID/1000)
				{
				case 30:
					ret = WEAPON;
					break;
				case 31:
					ret = ARMOR;
					break;
				case 21:
				case 22:
				case 23:
					ret = SOLDIER;
					break;
				case 20:
					ret = HERO;
					break;
				case 50:
					ret = SKILL;
					break;
				case 40:
					ret = TASK;
					break;
			}
			return ret;
		}
}

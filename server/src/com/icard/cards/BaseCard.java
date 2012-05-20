package com.icard.cards;

import java.util.ArrayList;
import java.util.UUID;

import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardPower.CardPower;
import com.icard.cards.cardPower.PowerManager;
import com.icard.cards.cardPower.powerElement.PowerElement;

public class BaseCard {
	
	protected CardInfo cardInfo;	//牌的静态信息引用，多张牌对应一个cardInfo对象。
	protected CardPower cardPower;	//牌的能力，每张牌对应一个能力对象。
	protected int realId;			//牌桌上的中的uuid
	protected int Cost = 0; 		// 上场花费（对盟军，技能有效）
	protected int BaseAttack = 0; 	// 攻击力
	protected int BaseLife = 0; 	// 生命
	protected ArrayList<PowerElement> powerEleList = new ArrayList<PowerElement>();	//卡附着的技能列表
	
	public BaseCard(CardInfo info){
		
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//增加每种牌的计数

		cardPower = PowerManager.GetInstance().GetPower(this);
	}
	
	//删除此牌的资源
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//减少牌的计数
		cardPower =null;
	}



	public int getCost() {
		return Cost;
	}

	public void setCost(int cost) {
		Cost = cost;
	}

	public int getBaseAttack() {
		return BaseAttack;
	}

	public void setBaseAttack(int baseAttack) {
		BaseAttack = baseAttack;
	}

	public int getBaseLife() {
		return BaseLife;
	}

	public void setBaseLife(int baseLife) {
		BaseLife = baseLife;
	}

	public ArrayList<PowerElement> getPowerEleList() {
		return powerEleList;
	}

	public int getRealId() {
		return realId;
	}

	public void setRealId(int realId) {
		this.realId = realId;
	}

	public void setPowerEleList(ArrayList<PowerElement> powerEleList) {
		this.powerEleList = powerEleList;
	}

	public CardInfo getCardInfo() {
		return cardInfo;
	}

	public CardPower getCardPower() {
		return cardPower;
	}
	

	
	
}

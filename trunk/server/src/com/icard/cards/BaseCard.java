package com.icard.cards;

import java.util.ArrayList;
import java.util.UUID;

import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardPower.CardPower;
import com.icard.cards.cardPower.PowerManager;
import com.icard.cards.cardPower.powerElement.PowerElement;

public class BaseCard {
	
	public CardInfo cardInfo;	//牌的静态信息引用，多张牌对应一个cardInfo对象。
	public CardPower cardPower;	//牌的能力，每张牌对应一个能力对象。
	public String memUUID;		//服务器内存中的uuid
	public int Cost = 0; 		// 上场花费（对盟军，技能有效）
	public int BaseAttack = 0; 	// 攻击力
	public int BaseLife = 0; 	// 生命
	public ArrayList<PowerElement> powerEleList = new ArrayList<PowerElement>();	//卡附着的技能列表
	
	BaseCard(CardInfo info){
		
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//增加每种牌的计数
		memUUID = UUID.randomUUID().toString();
		cardPower = PowerManager.GetInstance().GetPower(this);
	}
	
	//删除此牌的资源
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//减少牌的计数
		cardPower =null;
	}
	
	
}

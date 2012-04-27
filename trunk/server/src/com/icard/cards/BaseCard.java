package com.icard.cards;

import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardPower.CardPower;
import com.icard.cards.cardPower.PowerManager;

public class BaseCard {
	
	public CardInfo cardInfo;//牌的静态信息引用，多张牌对应一个cardInfo对象。
	public CardPower cardPower;//牌的能力，每张牌对应一个能力对象。
	BaseCard(CardInfo info){
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//增加每种牌的计数
		cardPower = PowerManager.GetInstance().GetPower(cardInfo.getId());
	}
	
	//删除此牌的资源
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//减少牌的计数
		cardPower =null;
	}
}

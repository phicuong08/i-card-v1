package com.icard.cards;

import com.icard.cards.cardInfo.CardInfo;

public class BaseCard {
	
	public CardInfo cardInfo;//牌的静态信息引用
	BaseCard(CardInfo info){
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//增加牌的计数
	}
	
	//删除此牌的资源
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//减少牌的计数
	}
}

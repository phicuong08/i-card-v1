package com.icard.cards;

import com.icard.cards.cardInfo.CardInfo;

public class BaseCard {
	
	public CardInfo cardInfo;//�Ƶľ�̬��Ϣ����
	BaseCard(CardInfo info){
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//�����Ƶļ���
	}
	
	//ɾ�����Ƶ���Դ
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//�����Ƶļ���
	}
}

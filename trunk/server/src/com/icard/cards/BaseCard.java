package com.icard.cards;

import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardPower.CardPower;
import com.icard.cards.cardPower.PowerManager;

public class BaseCard {
	
	public CardInfo cardInfo;//�Ƶľ�̬��Ϣ���ã������ƶ�Ӧһ��cardInfo����
	public CardPower cardPower;//�Ƶ�������ÿ���ƶ�Ӧһ����������
	BaseCard(CardInfo info){
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//����ÿ���Ƶļ���
		cardPower = PowerManager.GetInstance().GetPower(cardInfo.getId());
	}
	
	//ɾ�����Ƶ���Դ
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//�����Ƶļ���
		cardPower =null;
	}
}

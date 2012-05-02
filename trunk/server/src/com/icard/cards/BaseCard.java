package com.icard.cards;

import java.util.ArrayList;
import java.util.UUID;

import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardPower.CardPower;
import com.icard.cards.cardPower.PowerManager;
import com.icard.cards.cardPower.powerElement.PowerElement;

public class BaseCard {
	
	public CardInfo cardInfo;	//�Ƶľ�̬��Ϣ���ã������ƶ�Ӧһ��cardInfo����
	public CardPower cardPower;	//�Ƶ�������ÿ���ƶ�Ӧһ����������
	public String memUUID;		//�������ڴ��е�uuid
	public int Cost = 0; 		// �ϳ����ѣ����˾���������Ч��
	public int BaseAttack = 0; 	// ������
	public int BaseLife = 0; 	// ����
	public ArrayList<PowerElement> powerEleList = new ArrayList<PowerElement>();	//�����ŵļ����б�
	
	BaseCard(CardInfo info){
		
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//����ÿ���Ƶļ���
		memUUID = UUID.randomUUID().toString();
		cardPower = PowerManager.GetInstance().GetPower(this);
	}
	
	//ɾ�����Ƶ���Դ
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//�����Ƶļ���
		cardPower =null;
	}
	
	
}

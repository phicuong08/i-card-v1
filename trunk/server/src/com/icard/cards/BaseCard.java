package com.icard.cards;

import java.util.ArrayList;
import java.util.UUID;

import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardPower.CardPower;
import com.icard.cards.cardPower.PowerManager;
import com.icard.cards.cardPower.powerElement.PowerElement;

public class BaseCard {
	
	protected CardInfo cardInfo;	//�Ƶľ�̬��Ϣ���ã������ƶ�Ӧһ��cardInfo����
	protected CardPower cardPower;	//�Ƶ�������ÿ���ƶ�Ӧһ����������
	protected int realId;			//�����ϵ��е�uuid
	protected int Cost = 0; 		// �ϳ����ѣ����˾���������Ч��
	protected int BaseAttack = 0; 	// ������
	protected int BaseLife = 0; 	// ����
	protected ArrayList<PowerElement> powerEleList = new ArrayList<PowerElement>();	//�����ŵļ����б�
	
	public BaseCard(CardInfo info){
		
		this.cardInfo = info;
		this.cardInfo.AddCountOfThisCard();//����ÿ���Ƶļ���

		cardPower = PowerManager.GetInstance().GetPower(this);
	}
	
	//ɾ�����Ƶ���Դ
	public void Delete(){
		this.cardInfo.DecCountOfThisCard();//�����Ƶļ���
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

package com.icard.cards.cardPower;

import java.util.ArrayList;
import java.util.List;

import com.icard.cards.BaseCard;

public abstract class CardPower {
	protected boolean 	isEnable = true;	//�����Ƿ�ʹ��
	protected BaseCard  fatherBaseCard;		//power��ӵ����
	
	public CardPower(BaseCard baseCard){
		fatherBaseCard 	= baseCard;
		isEnable		= true;
	}
	
	public abstract void OnBoard();		//�ϳ�����	
	public abstract void OnDisable();	//���ܱ���ֹ
	public abstract void OnOpen(List<BaseCard> affectCards);	//ʹ�ü��� ��Ӱ�쵽���ƣ�
	
}
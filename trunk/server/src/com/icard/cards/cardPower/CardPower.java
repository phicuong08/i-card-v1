package com.icard.cards.cardPower;

import java.util.ArrayList;
import java.util.List;

import com.icard.cards.BaseCard;

public abstract class CardPower {
	protected boolean isEnable = true;//�����Ƿ�ʹ��

	
	public abstract void OnBoard();		//�ϳ�����	
	public abstract void OnDisable();	//���ܱ���ֹ
	public abstract void OnOpen(List<BaseCard> affectCards);	//ʹ�ü��� ��Ӱ�쵽���ƣ�
	
}

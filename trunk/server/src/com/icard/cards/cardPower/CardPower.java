package com.icard.cards.cardPower;

import java.util.ArrayList;
import java.util.List;

import com.icard.cards.BaseCard;

public abstract class CardPower {
	protected boolean isEnable = true;//�����Ƿ�ʹ��
	//Ӱ����Ƶ��б�
	protected List<BaseCard> affectCards = new ArrayList<BaseCard> ();
	
	public abstract  void OnDisable();
	
}

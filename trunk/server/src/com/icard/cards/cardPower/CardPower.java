package com.icard.cards.cardPower;

import java.util.ArrayList;
import java.util.List;

import com.icard.cards.BaseCard;

public abstract class CardPower {
	protected boolean isEnable = true;//能力是否使能
	//影响的牌的列表
	protected List<BaseCard> affectCards = new ArrayList<BaseCard> ();
	
	public abstract  void OnDisable();
	
}

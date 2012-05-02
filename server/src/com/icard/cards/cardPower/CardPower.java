package com.icard.cards.cardPower;

import java.util.ArrayList;
import java.util.List;

import com.icard.cards.BaseCard;

public abstract class CardPower {
	protected boolean isEnable = true;//能力是否使能

	
	public abstract void OnBoard();		//上场技能	
	public abstract void OnDisable();	//技能被禁止
	public abstract void OnOpen(List<BaseCard> affectCards);	//使用技能 （影响到的牌）
	
}

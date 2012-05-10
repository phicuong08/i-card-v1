package com.icard.cards.cardPower.powerElement;

import com.icard.cards.cardPower.CardPower;

public class PowerElement {
	public String fromCardUUID;		//能力来源卡的uuid;
	PowerElement(String CardUUID){
		fromCardUUID = CardUUID;
	}
}

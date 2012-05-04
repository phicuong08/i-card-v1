package com.icard.room;

import java.util.HashMap;
import java.util.Map;

import com.icard.cards.BaseCard;

public class CardRoom {
	private int cardIndex =0;
	private Map<Integer,BaseCard> cardMap = new HashMap<Integer,BaseCard>();
	public void AddCard(BaseCard card){
		cardMap.put(cardIndex, card);
		card.setIDinRoom(cardIndex);
		cardIndex++;
	}
}

package com.icard.user;

import java.util.HashMap;
import java.util.Map;

import com.icard.cards.BaseCard;

public class CardUser {
	//在房间中的卡片map，Integer为房间中卡片唯一id 
	private Map<Integer,BaseCard> InRoomCardMap = new HashMap<Integer,BaseCard>();
}

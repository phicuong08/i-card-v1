package com.icard.room;

import java.util.HashMap;
import java.util.Map;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.smartfoxserver.v2.entities.data.SFSArray;

public class CardRoom {
	private int roomId;
	private int cardUniqueIndexOfRoom =0; //房间里卡片的递增id
	
	//房主
	private CardUser roomOwner;
	
	private CardUser gamePlayer;
	
	
	public CardRoom(int roomId){
		this.roomId = roomId;
	}
	
	//添加卡片的房间唯一id
	public void SetCardUniqueIdInRoom(BaseCard card){
		card.setRealIdInRoom(cardUniqueIndexOfRoom);
		cardUniqueIndexOfRoom++;
	}
	

	public int getRoomId() {
		return roomId;
	}
	
}

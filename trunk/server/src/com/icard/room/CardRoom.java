package com.icard.room;

import java.util.HashMap;
import java.util.Map;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.smartfoxserver.v2.entities.data.SFSArray;

public class CardRoom {
	private int roomId;
	private int cardUniqueIndexOfRoom =0; //�����￨Ƭ�ĵ���id
	
	//����
	private CardUser roomOwner;
	
	private CardUser gamePlayer;
	
	
	public CardRoom(int roomId){
		this.roomId = roomId;
	}
	
	//��ӿ�Ƭ�ķ���Ψһid
	public void SetCardUniqueIdInRoom(BaseCard card){
		card.setRealIdInRoom(cardUniqueIndexOfRoom);
		cardUniqueIndexOfRoom++;
	}
	

	public int getRoomId() {
		return roomId;
	}
	
}

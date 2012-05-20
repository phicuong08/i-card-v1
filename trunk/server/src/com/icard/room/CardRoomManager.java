package com.icard.room;

import java.util.HashMap;
import java.util.Map;



public class CardRoomManager {
	private Map<Integer,CardRoom> roomMap = new HashMap<Integer,CardRoom>();
	private static CardRoomManager mInstance =null;
	
	private CardRoomManager(){
	}
	
	public static CardRoomManager getInstance(){
		if(mInstance == null){
			mInstance = new CardRoomManager();
		}
		return mInstance;
	}
	
	
	public boolean AddRoom(CardRoom cardRoom){
		if(!roomMap.containsKey(cardRoom.getRoomId())){
			roomMap.put(cardRoom.getRoomId(), cardRoom);
			return true;
		}else{
			return false;
		}
	}
	
	public void RemoveRoom(int roomId){
		if(roomMap.containsKey(roomId)){
			roomMap.remove(roomId);
		}
	}
	
	public CardRoom GetRoom(int roomId){
		if(roomMap.containsKey(roomId)){
			return roomMap.get(roomId);
		}else{
			return null;
		}
	}
}

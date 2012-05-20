package com.icard.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.smartfoxserver.v2.entities.data.SFSArray;

public class CardRoom {
	private int roomId;
	
	//房主
	private CardUser roomOwner = null;
	
	//游戏者
	private CardUser gamePlayer =null;
	
	//观看者
	private HashMap <Integer,CardUser>	watchers = new HashMap <Integer,CardUser>();
	
	private CardDesktop desktop = new CardDesktop();
	
	 
	
	
	public CardRoom(int roomId){
		this.roomId = roomId;

	}
	
	//当有玩家离开房间
	public void OnUserLeave(CardUser user){
		if(user.getId() == roomOwner.getId()){
			roomOwner.siteUp();
			roomOwner = null;
			if(gamePlayer!=null){
				roomOwner = gamePlayer; //房主离开，装换房主
				gamePlayer =null;
			}
		}else{
			if(user.getId()==gamePlayer.getId()){
				gamePlayer.siteUp();
				gamePlayer =null;  //玩家离开
			}else{
				if(watchers.containsKey(user.getId())){
					watchers.remove(user.getId());	//观众离开
				}
			}
		}
	}
	
	//当有玩家加入房间
	public void OnPlayerJoinRoom(CardUser player){
		if(roomOwner==null){
			roomOwner = player;
			roomOwner.siteDown(desktop);
		}else{
			if(gamePlayer == null){
				gamePlayer = player;
				gamePlayer.siteDown(desktop);
			}else{
				watchers.put(player.getId(), player);
			}
		}
	}

	

	public int getRoomId() {
		return roomId;
	}

	public CardUser getRoomOwner() {
		return roomOwner;
	}

	public CardUser getGamePlayer() {
		return gamePlayer;
	}

	public HashMap<Integer, CardUser> getWatchers() {
		return watchers;
	}
	
}

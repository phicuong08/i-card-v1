package com.icard.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.smartfoxserver.v2.entities.data.SFSArray;

public class CardRoom {
	private int roomId;
	
	//����
	private CardUser roomOwner = null;
	
	//��Ϸ��
	private CardUser gamePlayer =null;
	
	//�ۿ���
	private HashMap <Integer,CardUser>	watchers = new HashMap <Integer,CardUser>();
	
	private CardDesktop desktop = new CardDesktop();
	
	 
	
	
	public CardRoom(int roomId){
		this.roomId = roomId;

	}
	
	//��������뿪����
	public void OnUserLeave(CardUser user){
		if(user.getId() == roomOwner.getId()){
			roomOwner.siteUp();
			roomOwner = null;
			if(gamePlayer!=null){
				roomOwner = gamePlayer; //�����뿪��װ������
				gamePlayer =null;
			}
		}else{
			if(user.getId()==gamePlayer.getId()){
				gamePlayer.siteUp();
				gamePlayer =null;  //����뿪
			}else{
				if(watchers.containsKey(user.getId())){
					watchers.remove(user.getId());	//�����뿪
				}
			}
		}
	}
	
	//������Ҽ��뷿��
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

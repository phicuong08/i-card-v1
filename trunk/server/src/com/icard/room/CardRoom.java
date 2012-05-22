package com.icard.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sfs2x.extensions.icard.main.ParentExtension;
import sfs2x.extensions.icard.utils.Commands;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;

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
	
	//���׼��״̬�ı�
	public void OnUserReadyStateUpdate (int userId, int userState ){
		for(CardSite site:desktop.getSites()){
			if(site.belongUserID == userId){
				site.userReadyState = userState;
				ISFSObject params = new SFSObject ();
				params.putInt("playerID", userId);
				params.putInt("state",userState);
				List<CardUser> cardUser = new ArrayList<CardUser>();
				if(roomOwner!=null){
					cardUser.add(roomOwner);
				}
				if(gamePlayer!=null){
					cardUser.add(gamePlayer);
				}
				cardUser.addAll(watchers.values());
				List<User> recipients = CardUserManager.getInstance().GetSFSUserByCardUser(cardUser);
				//����
				ParentExtension.getInstance().send(Commands.CMD_S2C_CLIENT_GAME_STATE_UPDATE, params, recipients);
				break;
			}
		}
		//�鿴�Ƿ�������Ҷ�׼�����
		boolean allSiteReady = true;
		for(CardSite site:desktop.getSites()){
			if(site.userReadyState == 0){
				allSiteReady = false;
			}
		}
		if(allSiteReady == true){
			//��ʼ��Ϸ
			desktop.startGame(roomOwner, gamePlayer, watchers);
		}
	}
}

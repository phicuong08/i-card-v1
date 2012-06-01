package sfs2x.extensions.icard.beans;

import java.util.concurrent.ConcurrentHashMap;

import com.smartfoxserver.v2.entities.User;

/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameLobbyBean
{
	private static int _inc_roomID = 1;
	private static GameLobbyBean _mInstance =null;
	private ConcurrentHashMap<Integer, CardGameBean> _cardGameMap =new ConcurrentHashMap<Integer, CardGameBean>();
	
	private GameLobbyBean(){
	}
	public static GameLobbyBean GetInstance(){
		if(_mInstance ==null){
			_mInstance = new GameLobbyBean();
			_mInstance.init();
		}
		return _mInstance;
	}
	public ConcurrentHashMap<Integer, CardGameBean> getGameMap(){
		return _cardGameMap;
	}
	public CardGameBean getNewCardGame(){
		int roomID = generateRoomID();
		CardGameBean newGame = new CardGameBean(roomID);
		_cardGameMap.put(roomID,newGame);
		return newGame;
	}
	private int generateRoomID(){
		int roomID=0;
		synchronized (this)
		{	
			roomID = _inc_roomID++;
		}
		return roomID;
	}


	
}
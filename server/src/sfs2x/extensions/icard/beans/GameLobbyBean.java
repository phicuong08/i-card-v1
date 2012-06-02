package sfs2x.extensions.icard.beans;

import java.util.concurrent.ConcurrentHashMap;



/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameLobbyBean
{
	private static int _inc_roomID = 1;
	private static int _inc_AIID = 0x0FFFFFFF;
	private static GameLobbyBean _mInstance =null;
	private ConcurrentHashMap<Integer, CardGameBean> _cardGameMap =new ConcurrentHashMap<Integer, CardGameBean>();
	
	private GameLobbyBean(){
	}
	public static GameLobbyBean GetInstance(){
		if(_mInstance ==null){
			_mInstance = new GameLobbyBean();
		}
		return _mInstance;
	}
	public ConcurrentHashMap<Integer, CardGameBean> getGameMap(){
		return _cardGameMap;
	}
	public CardGameBean getNewVSAIGame(){
		CardGameBean gameBean = getNewCardGame();
		gameBean.AddPlayer(generateAIID());
		return gameBean;
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
	private int generateAIID(){
		int AIID=0;
		synchronized (this)
		{	
			AIID = _inc_AIID++;
		}
		return AIID;
	}

	
}
package sfs2x.extensions.icard.bsn;

import java.util.LinkedList;
import java.util.Random;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;
import sfs2x.extensions.icard.beans.*;
/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameBsn
{	

	

	


	

	/**
	 *  Quit a running game (one of the player exits or disconnects)
	 *  
	 * @param gameBean		Game Object describing the game from which the user has exited
	 * @param extension		Reference to the main Battlefarm extension
	 */
	/*
	public static void quitGame(GameBean gameBean, BattleFarmExtension extension)
	{
		// Remove game from gameList
		extension.getGames().remove(gameBean);

		// Destroy game objects
		gameBean.setPlayers(null);
		gameBean.setBaseGameMapBean(null);

		extension.trace("Battlefarm: game " + gameBean.getId() + " destroyed");

		gameBean = null;
	}
	*/
	public static CardGameBean CreateVSAIGame(){
		return GameLobbyBean.GetInstance().getNewVSAIGame();
	}
	public static CardGameBean CreateGame(){
		return GameLobbyBean.GetInstance().getNewCardGame();
	}
	public static Boolean initVsAI(CardGameBean game,int playerID){

		return true;
	}
}
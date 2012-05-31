package sfs2x.extensions.icard.bsn;

import java.util.LinkedList;
import java.util.Random;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;

/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleBsn
{	
	// Store directions factors to move left,right,up,down
	private final static Object[] dirs = { new int[]{-1, 0}, new int[]{1, 0}, new int[]{0, -1}, new int[]{0, 1} };

	/**
	 * Bomb explosion management
	 * Collisions are checked by verifying if one of the players is in the same line (horiz / vert) with the bomb
	 * If so, a call to the checkCollision is sent in order to check if the bomb explosion can reach the player
	 * 
	 * @param gameBean	The Game object 
	 * @param bombBean 	The Bomb object describing the bomb that is exploding
	 * @param extension 	Reference to the main extension 
	 */

	

	/**
	 * Take a random place in the available tiles array and put an item in it
	 * 
	 * @param  gameBean 	The Game object 
	 * @return mt 			The generated tile
	 */
	/*
	private static MapTileBean regenItem(GameBean gameBean)
	{
		Random rnd = new Random();
		int i = rnd.nextInt(gameBean.getEmptyTiles().size());
		MapTileBean mt = (MapTileBean) gameBean.getEmptyTiles().remove(i);
		gameBean.getGameMap()[mt.getPy()][mt.getPx()] = gameBean.getBaseGameMapBean().getCollectibles().charAt(0); // Here we use the first available collectible item; on the client-side a random item will be displayed (among those available)
		return mt;
	}
	*/

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
}
package sfs2x.extensions.games.battlefarm.bsn;

import java.util.LinkedList;
import java.util.Random;

import sfs2x.extensions.games.battlefarm.beans.BombBean;
import sfs2x.extensions.games.battlefarm.beans.GameBean;
import sfs2x.extensions.games.battlefarm.beans.MapTileBean;
import sfs2x.extensions.games.battlefarm.beans.PlayerBean;
import sfs2x.extensions.games.battlefarm.main.BattleFarmExtension;
import sfs2x.extensions.games.battlefarm.utils.Commands;
import sfs2x.extensions.games.battlefarm.utils.Constants;

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
public class GameBsn
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
	public static void explodeBomb(GameBean gameBean, BombBean bombBean, SFSExtension extension)
	{	
		bombBean.setActive(false);

		// Delete bomb item from map
		gameBean.getGameMap()[bombBean.getPy()][bombBean.getPx()] = Constants.EMPTY_TILE;

		// Add the tile to the emptyTiles list
		synchronized (gameBean.getEmptyTiles()) {
			gameBean.getEmptyTiles().add(new MapTileBean(bombBean.getPx(), bombBean.getPy()));
		}

		PlayerBean p1 = (PlayerBean) gameBean.getPlayers().get(gameBean.getMaster());
		PlayerBean p2 = (PlayerBean) gameBean.getPlayers().get(gameBean.getSlave());

		boolean p1Gotcha = false;
		boolean p2Gotcha = false;

		// Check if player is on bomb
		p1Gotcha |= (p1.getX() == bombBean.getPx() && p1.getY() == bombBean.getPy());
		p2Gotcha |= (p2.getX() == bombBean.getPx() && p2.getY() == bombBean.getPy());

		// Check if player1 is on the same X or Y of the bomb
		for (int dir = Constants.LEFT; dir <= Constants.DOWN; dir++) {
			p1Gotcha |= checkCollision(gameBean, p1, bombBean, gameBean.getGameMap(), dir, extension);
		}

		// Check if player2 is one the same X or Y of the bomb
		for (int dir = Constants.LEFT; dir <= Constants.DOWN; dir++) {
			p2Gotcha |= checkCollision(gameBean, p2, bombBean, gameBean.getGameMap(), dir, extension);
		}

		// Redistribute items on map
		int realTax;
		String newItemsP1 = "";
		String newItemsP2 = "";

		if (p1Gotcha)
		{
			if (p1.getScore() < Constants.ITEM_TAX)
				realTax = p1.getScore();
			else
				realTax = Constants.ITEM_TAX;

			p1.setScore(p1.getScore()-realTax);

			for(int j = 0; j < realTax; j++)
			{
				MapTileBean mt = GameBsn.regenItem(gameBean);
				newItemsP1 += (mt.getPx() < 10) ? "0" + String.valueOf(mt.getPx()) : String.valueOf(mt.getPx());
				newItemsP1 += (mt.getPy() < 10) ? "0" + String.valueOf(mt.getPy()) : String.valueOf(mt.getPy());
			}
		}

		if (p2Gotcha)
		{
			if (p2.getScore() < Constants.ITEM_TAX)
				realTax = p2.getScore();
			else
				realTax = Constants.ITEM_TAX;

			p2.setScore(p2.getScore() - realTax);

			for(int j = 0; j < realTax; j++)
			{
				MapTileBean mt = regenItem(gameBean);
				newItemsP2 += (mt.getPx() < 10) ? "0" + String.valueOf(mt.getPx()) : String.valueOf(mt.getPx());
				newItemsP2 += (mt.getPy() < 10) ? "0" + String.valueOf(mt.getPy()) : String.valueOf(mt.getPy());
			}  
		}

		// Send Message to both clients
		ISFSObject resObj = new SFSObject();
		resObj.putInt("bb",bombBean.getId());        // bomb id
		resObj.putInt("bx",bombBean.getPx());        // bomb pos x
		resObj.putInt("by",bombBean.getPy()); 	     // bomb pos y
		resObj.putInt("kp1",(p1Gotcha) ? 1:0);       // killed player1?
		resObj.putInt("sc1",p1.getScore());          // update score player1
		resObj.putUtfString("it1",newItemsP1);       // items release by player1
		resObj.putInt("kp2",(p2Gotcha) ? 1:0);       // killed player2?
		resObj.putInt("sc2",p2.getScore());          // update score player2
		resObj.putUtfString("it2",newItemsP2);       // items released by player2
		resObj.putInt("uid",bombBean.getIdOwner());  // who left the bomb

		LinkedList<User> recipients = new LinkedList<User>();
		recipients.add(p1.getSfsUser());
		recipients.add(p2.getSfsUser());

		extension.send(Commands.XP, resObj, recipients);
	}

	/** 
	 * Check collision
	 * 
	 * @param g		The Game object 
	 * @param p		The Player object describing the player to check collision
	 * @param b		The Bomb object describing the bomb that is exploding
	 * @param map	The map 
	 * @param dir	The explosion direction
	 * 
	 * @return true If collision has been detected
	 */
	private static boolean checkCollision(GameBean gameBean, PlayerBean p, BombBean b, char[][] map, int dir, SFSExtension extension)
	{
		char item;
		boolean found = false;

		// NOTE:
		// dirs is an array of Objects
		// each of Object is a int[] with the addx in [0] and addy in [1]
		int addx = ((int[])GameBsn.dirs[dir])[0];
		int addy = ((int[])GameBsn.dirs[dir])[1];

		int px = b.getPx();
		int py = b.getPy();

		// NOTE:
		// if I am moving left or right I find the horizontal steps, otherwise the vertical steps
		int steps = Math.abs((dir == Constants.LEFT || dir == Constants.RIGHT) ? ( px - p.getX() ) : ( py - p.getY() ));

		// Make all steps from the bomb to the player
		while (steps > 0)
		{
			// New step
			steps--;
			
			// Move one step in the given direction
			px += addx;
			py += addy;

			if (px == p.getX() && py == p.getY())
			{
				found = true;
				
				// NOTE:
				// if you put a break; here the search will stop
				// otherwise the explosion will continue to run
				// setting off other chain reactions, if any
			}

			// Check if there's an obstacle in the path
			item = map[py][px];

			if (item >= 'A' && item <= 'Z')
			{
				if (Constants.CHAIN_REACTION && item == Constants.BOMB_SYMBOL)
				{
					// Search bomb
					for (int j = 0; j < gameBean.getBombList().size(); j++)
					{
						BombBean bmb = (BombBean) gameBean.getBombList().get(j);
						
						if (bmb.isActive() && bmb.getPx() == px && bmb.getPy() == py)
							bmb.setBoomTime(System.currentTimeMillis() + 50);
					}
				}
				break;
			}
		}

		return found;
	}

	/**
	 * Take a random place in the available tiles array and put an item in it
	 * 
	 * @param  gameBean 	The Game object 
	 * @return mt 			The generated tile
	 */
	private static MapTileBean regenItem(GameBean gameBean)
	{
		Random rnd = new Random();
		int i = rnd.nextInt(gameBean.getEmptyTiles().size());
		MapTileBean mt = (MapTileBean) gameBean.getEmptyTiles().remove(i);
		gameBean.getGameMap()[mt.getPy()][mt.getPx()] = gameBean.getBaseGameMapBean().getCollectibles().charAt(0); // Here we use the first available collectible item; on the client-side a random item will be displayed (among those available)
		return mt;
	}

	/**
	 * Send the openDoor message to clients
	 * NOTE: the door location is NOT saved in the array map but as separate property in game Object
	 * 
	 * @param gameBean	The Game object 
	 */
	public static void openTheDoor(GameBean gameBean, SFSExtension extension)
	{
		gameBean.setDoorOpen(true);

		// Get a random free tile
		if (gameBean.getEmptyTiles().size() > 0)
		{
			Random rnd = new Random();
			int i = rnd.nextInt(gameBean.getEmptyTiles().size());

			MapTileBean mt = (MapTileBean) gameBean.getEmptyTiles().remove(i);
			gameBean.setDoor(mt);

			// Send Message to both clients
			PlayerBean p1 = (PlayerBean) gameBean.getPlayers().get(gameBean.getMaster());
			PlayerBean p2 = (PlayerBean) gameBean.getPlayers().get(gameBean.getSlave());

			ISFSObject resObj = new SFSObject();
			resObj.putInt("px",mt.getPx());
			resObj.putInt("py",mt.getPy());

			LinkedList<User> recipients = new LinkedList<User>();
			recipients.add(p1.getSfsUser());
			recipients.add(p2.getSfsUser());

			extension.send(Commands.OPEN_DOOR, resObj, recipients);

		}
		else
		{
			// This should never happen, however if there's no empty tiles the game cannot open the EXIT DOOR
			extension.trace("BattleFarm: cannot open the exit door, no more free tiles! - game id: " + gameBean.getId());
		}

	}

	/**
	 * Remove the user from the game
	 * 
	 * @param user			User to be removed
	 * @param room			Room from which the user will be remove (room.id = game.id)
	 * @param extension		Reference to main battlefarm extension
	 */
	public static void removeUserFromGame(User user, Room room, BattleFarmExtension extension)
	{
		// Get the game related to this room
		GameBean currGame = (GameBean) extension.getGames().get(room.getId());

		if (currGame != null)
		{
			// Get the player that was gone and then delete it
			PlayerBean playerBean = (PlayerBean) currGame.getPlayers().get(user.getId());
			if (playerBean != null)
			{
				boolean wasMaster = ((PlayerBean) currGame.getPlayers().get(user.getId())).isMaster();
				currGame.getPlayers().remove(user.getId());

				// If one player is still alive, notify him and reset the game status
				if (currGame.getPlayers().size() > 0)
				{
					PlayerBean remaining;

					if (wasMaster)
					{
						currGame.setMaster(null);
						remaining = (PlayerBean) currGame.getPlayers().get(currGame.getSlave());
					}
					else
					{
						currGame.setSlave(null);
						remaining = (PlayerBean) currGame.getPlayers().get(currGame.getMaster());
					}

					// Reset remaining player
					remaining.setHasBomb(false);
					remaining.setScore(0);
					remaining.resetX();
					remaining.resetY();

					currGame.reset();

					// Notify the remaining user
					ISFSObject resObj = new SFSObject();
					resObj.putUtfString("_cmd","stop");

					// Send to remaining user
					extension.send(Commands.CMD_STOP, resObj, remaining.getSfsUser());

				}
				else
				{
					GameBsn.quitGame(currGame,extension);
				}
			}
		}

	}

	/**
	 *  Quit a running game (one of the player exits or disconnects)
	 *  
	 * @param gameBean		Game Object describing the game from which the user has exited
	 * @param extension		Reference to the main Battlefarm extension
	 */
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
}
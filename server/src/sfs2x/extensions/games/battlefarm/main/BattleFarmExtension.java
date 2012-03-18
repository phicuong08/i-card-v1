package sfs2x.extensions.games.battlefarm.main;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.games.battlefarm.beans.GameBean;
import sfs2x.extensions.games.battlefarm.beans.GameMapsInfoBean;
import sfs2x.extensions.games.battlefarm.bsn.GameMapBsn;
import sfs2x.extensions.games.battlefarm.utils.Commands;


import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;

/**
 * Main extension class file
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleFarmExtension extends SFSExtension
{	
	/** Maps information */
	private GameMapsInfoBean gameMapsInfoBean = null;

	/** Current games */
	private ConcurrentHashMap<Integer,GameBean> games = null;

	/** Game controller */
	private GameController gameController = null;


	@Override
	public void init()
	{
		trace("**************************************");
		trace("* Starting BattleFarm extension");
		trace("* - loading maps...");

		// Load maps information
		gameMapsInfoBean = GameMapBsn.loadMaps(this);

		trace("* - internal data initialization...");

		// Initialize games list
		games = new ConcurrentHashMap<Integer,GameBean>();

		// Initialize game controller
		gameController = new GameController(this);
		gameController.start();

		trace("* - registering handlers...");

		// REGISTER REQUEST HANDLERS

		// Get map list 
		addRequestHandler(Commands.CMD_MAP_LIST, MapListHandler.class);

		// Ready to start a game
		addRequestHandler(Commands.CMD_READY, ReadyHandler.class);

		// Restart game
		addRequestHandler(Commands.CMD_RESTART, RestartHandler.class);

		// Player movements
		addRequestHandler(Commands.MV, MovementHandler.class);

		// Handle bombs requests
		addRequestHandler(Commands.BOMB, BombHandler.class);
		
		// REGISTER EVENT HANDLERS

		// Event handler: join room
		addEventHandler(SFSEventType.USER_JOIN_ROOM, UserJoinedEventHandler.class);

		// Event handler: user leave game room
		addEventHandler(SFSEventType.USER_LEAVE_ROOM, UserLeavedEventHandler.class);

		// Event handler: user log out
		addEventHandler(SFSEventType.USER_LOGOUT, UserDisconnectedEventHandler.class);

		// Event handler: user disconnect
		addEventHandler(SFSEventType.USER_DISCONNECT, UserDisconnectedEventHandler.class);

		trace("* BattleFarm initialization completed");
		trace("**************************************");

	}

	/**
	 * Destroy
	 */
	public void destroy()
	{
		gameController.setTimeEventsRunning(false);
		gameController = null;
		
		removeEventHandler(SFSEventType.USER_JOIN_ROOM);
		removeEventHandler(SFSEventType.USER_LEAVE_ROOM);
		removeEventHandler(SFSEventType.USER_LOGOUT);
		removeEventHandler(SFSEventType.USER_DISCONNECT);
		removeRequestHandler(Commands.CMD_MAP_LIST);
		removeRequestHandler(Commands.CMD_READY);
		removeRequestHandler(Commands.CMD_RESTART);
		removeRequestHandler(Commands.MV);
		removeRequestHandler(Commands.BOMB);

		trace("BattleFarm extension destroyed");
	}

	/* GETTERS & SETTERS */

	public GameMapsInfoBean getGameMapsInfoBean() {
		return gameMapsInfoBean;
	}

	public void setGameMapsInfoBean(GameMapsInfoBean gameMapsInfoBean) {
		this.gameMapsInfoBean = gameMapsInfoBean;
	}

	public ConcurrentHashMap<Integer, GameBean> getGames() {
		return games;
	}

	/* PUBLIC METHODS */

	/**
	 * Send start game invocation
	 * 
	 * @param players	List of recipient players
	 */
	public void startGame(List<User> players)
	{
		// Empty obj
		ISFSObject resObj = new SFSObject();
		
		send(Commands.CMD_GO, resObj, players);
	}
}
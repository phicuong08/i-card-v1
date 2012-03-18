package sfs2x.extensions.games.battlefarm.beans;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Timer;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.games.battlefarm.main.BattleFarmExtension;
import sfs2x.extensions.games.battlefarm.utils.Constants;
import sfs2x.extensions.games.battlefarm.utils.SyncGameStart;

import com.smartfoxserver.v2.entities.User;


/**
 * GameBean: class describing a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameBean 
{
	/** Game id, corresponding to room id */
	private int id = 0;

	/** Game map */
	public char gameMap[][];

	/** Initial map information associated to this game */
	private GameMapBean baseGameMapBean = null;

	/** Master: user that created the room */
	Integer master = null;

	/** Slave: user that joined the room */
	Integer slave = null;

	/** Players */
	private ConcurrentHashMap<Integer,PlayerBean> players = null;

	/** Game start time */
	private long gameStartTime = 0L;

	/** Timer associated to the game */
	private Timer timer = null;

	/** Game started flag */
	private boolean started = false;

	/** Bombs list */
	private ArrayList<BombBean> bombList = null; 

	/** Empty tiles */
	private ArrayList<MapTileBean> emptyTiles = null;

	/** Is door opened flag */
	private boolean isDoorOpen = false;

	/** Door tile */
	private MapTileBean door = null;

	/** Match duration */
	private int matchDuration = 0;

	/**
	 * Constructor
	 * 
	 * @param gameMapBean  The map used to construct the game
	 * @param id           The id of the match
	 */
	public GameBean(GameMapBean gameMapBean, int id)
	{
		this.baseGameMapBean = gameMapBean;
		this.id = id;

		// Initialize internal data structure
		players = new ConcurrentHashMap<Integer,PlayerBean>();
		bombList = new ArrayList<BombBean>();
		emptyTiles = new ArrayList<MapTileBean>();
		gameMap = new char[Constants.MAP_HEIGHT][Constants.MAP_WIDTH];

		// Initialize bombs
		initBombs();

		// Reset game to its initial status
		reset(); 
	}
	
	/* GETTERS & SETTERS */

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public GameMapBean getBaseGameMapBean() {
		return baseGameMapBean;
	}

	public void setBaseGameMapBean(GameMapBean baseGameMapBean) {
		this.baseGameMapBean = baseGameMapBean;
	}

	public char[][] getGameMap() {
		return gameMap;
	}

	public void setGameMap(char[][] gameMap) {
		this.gameMap = gameMap;
	}

	public Integer getMaster() {
		return master;
	}

	public void setMaster(Integer master) {
		this.master = master;
	}

	public Integer getSlave() {
		return slave;
	}

	public void setSlave(Integer slave) {
		this.slave = slave;
	}

	public ConcurrentHashMap<Integer, PlayerBean> getPlayers() {
		return players;
	}

	public void setPlayers(ConcurrentHashMap<Integer, PlayerBean> players) {
		this.players = players;
	}

	public long getGameStartTime() {
		return gameStartTime;
	}

	public void setGameStartTime(long gameStartTime) {
		this.gameStartTime = gameStartTime;
	}

	public boolean isStarted() {
		return started;
	}

	public void setStarted(boolean started) {
		this.started = started;
	}

	public ArrayList<BombBean> getBombList() {
		return bombList;
	}

	public void setBombList(ArrayList<BombBean> bombList) {
		this.bombList = bombList;
	}

	public ArrayList<MapTileBean> getEmptyTiles() {
		return emptyTiles;
	}

	public void setEmptyTiles(ArrayList<MapTileBean> emptyTiles) {
		this.emptyTiles = emptyTiles;
	}

	public boolean isDoorOpen() {
		return isDoorOpen;
	}

	public void setDoorOpen(boolean isDoorOpen) {
		this.isDoorOpen = isDoorOpen;
	}

	public MapTileBean getDoor() {
		return door;
	}

	public void setDoor(MapTileBean door) {
		this.door = door;
	}

	public int getMatchDuration() {
		return matchDuration;
	}

	public void setMatchDuration(int matchDuration) {
		this.matchDuration = matchDuration;
	}
	
	/* PUBLIC METHODS */

	/**
	 * Reset the game to its initial status
	 */
	public void reset()
	{
		started = false;
		isDoorOpen = false;

		emptyTiles = new ArrayList<MapTileBean>();
		matchDuration = baseGameMapBean.getMatchDuration() * 1000;

		// Set map to initial state (given by xml map)
		// Analyze map to retrieve empty tiles and populate the relative list
		for (int y = 0; y < Constants.MAP_HEIGHT; y++)
		{
			for (int x = 0; x < Constants.MAP_WIDTH; x++)
			{
				gameMap[y][x] = baseGameMapBean.getMap()[y][x];
				if (gameMap[y][x] == '.')
					emptyTiles.add(new MapTileBean(x,y));
			}
		}
		
		// Reset player score
		for (Enumeration<PlayerBean> e = players.elements(); e.hasMoreElements();)
		{
			PlayerBean player = (PlayerBean) e.nextElement();
			player.setScore(0);
		}
	}

	/** 
	 * Start a new game 
	 */
	public void startGame(List<User> recipients, BattleFarmExtension ext)
	{
		gameStartTime = System.currentTimeMillis() + 3500;
		started = true;

		// Wait a number of seconds and then notify clients that the game starts!
		timer = new Timer();
		timer.schedule(new SyncGameStart(ext, recipients), 3000);
	}

	/**
	 * Initialize bombs
	 */
	public void initBombs()
	{
		for (int p = 1; p <= 2; p++)
		{
			for (int i = 0; i < Constants.BOMBS; i++)
				bombList.add(new BombBean(i, 0, 0, 0, 0));
		}
	}
}
package sfs2x.extensions.games.battlefarm.beans;

import com.smartfoxserver.v2.entities.User;

/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class PlayerBean
{	
	/** User id */
	private int id = 0;

	/** User x coordinate */
	private int x = 0;

	/** User y coordinate */
	private int y = 0;

	/** Master flag */
	private boolean master = false;

	/** Id of the game the user is playing */
	private int idGame = 0;

	/** Score */
	private int score = 0;

	/** Initial x coordinate */
	private int initX = 0;

	/** Initial y coordinate */
	private int initY = 0;

	/** Has bomb flag */
	private boolean hasBomb = false;

	/** Ready to play flag */
	private boolean readyToPlay = false;

	/** Reference to SFS User object */
	User sfsUser = null;

	/** 
	 * Empty constructor
	 */
	public PlayerBean() {}

	/**
	 * Constructor
	 * 
	 * @param id		Player id
	 * @param x			X coordinate for the player
	 * @param y			Y coordinate for the player
	 * @param sfsUser	Internal SFS user id
	 */
	public PlayerBean(int id, int x, int y, User sfsUser)
	{
		this.id = id;
		this.x = x;
		this.y = y;
		this.initX = x;
		this.initY = y;
		this.sfsUser = sfsUser;
	}
	
	/* GETTERS & SETTERS */

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public boolean isMaster() {
		return master;
	}

	public void setMaster(boolean master) {
		this.master = master;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getInitX() {
		return initX;
	}

	public void setInitX(int initX) {
		this.initX = initX;
	}

	public int getInitY() {
		return initY;
	}

	public void setInitY(int initY) {
		this.initY = initY;
	}

	public boolean isHasBomb() {
		return hasBomb;
	}

	public void setHasBomb(boolean hasBomb) {
		this.hasBomb = hasBomb;
	}

	public boolean isReadyToPlay() {
		return readyToPlay;
	}

	public void setReadyToPlay(boolean readyToPlay) {
		this.readyToPlay = readyToPlay;
	}

	public User getSfsUser() {
		return sfsUser;
	}

	public void setSfsUser(User sfsUser) {
		this.sfsUser = sfsUser;
	}

	public int getIdGame() {
		return idGame;
	}

	public void setIdGame(int idGame) {
		this.idGame = idGame;
	}

	/* PUBLIC METHODS */

	/**
	 * Reset x coordinate to initial value 
	 */
	public void resetX() {
		x = initX;
	}

	/** 
	 * Reset y coordinate to initial value 
	 */
	public void resetY() {
		y = initY;
	}
}
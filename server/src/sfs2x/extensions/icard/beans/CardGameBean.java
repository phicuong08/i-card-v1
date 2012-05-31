package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Timer;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Constants;
import sfs2x.extensions.icard.utils.SyncGameStart;

import com.smartfoxserver.v2.entities.User;


/**
 * GameBean: class describing a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardGameBean 
{
	/** Game id, corresponding to room id */
	private int _id = 0;


	/** Players */
	private ConcurrentHashMap<Integer,CardSiteBean> _sites = null;

	/** Game start time */
	private long gameStartTime = 0L;

	/** Timer associated to the game */
	private Timer timer = null;

	/** Game started flag */
	private boolean started = false;
	private BattleStateBean _StateBean;
	/**
	 * Constructor
	 * 
	 * @param gameMapBean  The map used to construct the game
	 * @param id           The id of the match
	 */
	public CardGameBean(int id)
	{
		this._id = id;

		// Initialize internal data structure
		_sites = new ConcurrentHashMap<Integer,CardSiteBean>();
		_StateBean = new BattleStateBean();
		// Reset game to its initial status
		reset(); 
	}
	
	/* GETTERS & SETTERS */

	public int getId() {
		return _id;
	}

	public void setId(int id) {
		this._id = id;
	}

	public ConcurrentHashMap<Integer, CardSiteBean> getSites() {
		return _sites;
	}

	public void setPlayers(ConcurrentHashMap<Integer, CardSiteBean> sites) {
		_sites = sites;
	}

	public long getGameStartTime() {
		return gameStartTime;
	}
	public BattleStateBean getStateBean(){
		return _StateBean;
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

	
	/* PUBLIC METHODS */

	/**
	 * Reset the game to its initial status
	 */
	public void reset()
	{
		started = false;
		// Set map to initial state (given by xml map)
			
		// Reset player score
		for (Enumeration<CardSiteBean> e = _sites.elements(); e.hasMoreElements();)
		{
			CardSiteBean site = (CardSiteBean) e.nextElement();
			//player.setScore(0);
		}
	}

	/** 
	 * Start a new game 
	 */
	public void startGame(List<User> recipients, ICardExtension ext)
	{
		gameStartTime = System.currentTimeMillis() + 3500;
		started = true;

		// Wait a number of seconds and then notify clients that the game starts!
		timer = new Timer();
		timer.schedule(new SyncGameStart(ext, recipients), 3000);
	}

}
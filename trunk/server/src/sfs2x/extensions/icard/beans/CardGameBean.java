package sfs2x.extensions.icard.beans;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Timer;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.icard.bsn.BattleBsn;
import sfs2x.extensions.icard.bsn.CardActionBsn;
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
	private int _inc_card_realID=1;

	/** Players */
	private ConcurrentHashMap<Integer,CardSiteBean> _sites = null;

	/** Game start time */
	private long gameStartTime = 0L;

	/** Timer associated to the game */
	private Timer timer = null;

	/** Game started flag */
	private boolean started = false;
	private BattleStateBean _StateBean;
	private CardActionChainBean _battleChain;
	private CardActionBean _curAction;
	private int _loopPlayer;
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
		_battleChain = new CardActionChainBean();
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
	public void setFreshLoop(int playerID){
		_loopPlayer = playerID;
		_StateBean.InitWaitOp(playerID);
		_StateBean.setState(BattleStateBean.ST_LOOP_INTERVAL);
		CardSiteBean site = _sites.get(playerID);
		if (site != null)
			site.setFreshLoop();
	}

	public int getOpPlayer(){
		return _StateBean.getOpPlayer();
	}
	public CardActionChainBean getBattleChain(){
		return _battleChain;
	}
	public Boolean AddCard(int playerID,int cardID,int slotID){
		CardSiteBean site = _sites.get(playerID);
		if(site==null)
			return false;
		site.AddCard(new CardBean(getGenCardRealID(),cardID,slotID));
		return true;
	}
	public void setCurAction(CardActionBean action){
		synchronized(this)
		{
			_curAction = action;
		}
	}
	public CardActionBean getCurAction(){
		return _curAction;
	}
	private int getGenCardRealID(){
		int realID= _inc_card_realID++;
		return realID;
	}
	public ConcurrentHashMap<Integer, CardSiteBean> getSites() {
		return _sites;
	}

	public void setPlayers(ConcurrentHashMap<Integer, CardSiteBean> sites) {
		_sites = sites;
	}
	public void AddPlayer(int playerID,User sfsUser){
		CardSiteBean site = new CardSiteBean(playerID,sfsUser);
		_sites.put(site.getPlayerID(),site);
	}
	public void AddAIPlayer(int playerID,User sfsUser){
		CardSiteBean site = new AICardSiteBean(playerID);
		_sites.put(site.getPlayerID(),site);
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
	}
	public CardActionBean pickCurAction(){
		CardActionBean action;
		synchronized(this)
		{
			action = _curAction;
			_curAction = null;
		}
		return action;
	}
	public void RunGodLogic(ICardExtension ext){
		CardActionBean action = pickCurAction();
		CardActionBsn.procCardAction(this,action,ext);
		ext.SendGameCardUpdate(this);
		if(_battleChain.ExistChainTop()){
			ext.SendBattleChainTop(this);
		}
		else
		{
			_StateBean.LeaveGodState();
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
	public void gameTick(ICardExtension ext,int elapsed){
		BattleBsn.RunBattleStateBean(this,ext,elapsed);
		for (CardSiteBean site : _sites.values())
		{
			site.gameTick(this,ext);
		}
	}
}
package sfs2x.extensions.icard.beans;

import java.util.List;
import java.util.Timer;
import java.util.concurrent.ConcurrentHashMap;

import sfs2x.extensions.icard.bsn.BattleBsn;
import sfs2x.extensions.icard.main.ICardExtension;
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
	private ConcurrentHashMap<Integer,CardDeckBean> _deck = null;

	/** Game start time */
	private long gameStartTime = 0L;

	/** Timer associated to the game */
	private Timer timer = null;

	/** Game started flag */
	private boolean _started = false;
	private boolean _needClose=false;
	private BattleStateBean _StateBean;
	private CardActionChainBean _battleChain;
	private CardActionBean _curAction;

	private int _curLoop;
	/**
	 * Constructor
	 * 
	 * @param gameMapBean  The map used to construct the game
	 * @param id           The id of the match
	 */
	public CardGameBean(int id){
		this._id = id;
		// Initialize internal data structure
		_deck = new ConcurrentHashMap<Integer,CardDeckBean>();
		_StateBean = new BattleStateBean();
		_battleChain = new CardActionChainBean();
		// Reset game to its initial status
		reset(); 
	}
	
	/* GETTERS & SETTERS */
	public void setNeedClose(){
		_needClose = true;
		_started =false;
	}
	public boolean getNeedClose(){
		return _needClose;
	}
	public int getId() {
		return _id;
	}

	public void setId(int id) {
		this._id = id;
	}
	public void setCardReady(){
		CardDeckBean deck = _deck.get(getTurnPlayer());
		if (deck != null)
			deck.setCardReady();
	}
	public void setTurnPlayer(int playerID){
		_StateBean.setTurnPlayer(playerID);
	}
	public int getTurnPlayer(){
		return _StateBean.getTurnPlayer();
	}
	public CardActionChainBean getBattleChain(){
		return _battleChain;
	}
	public Boolean AddCard(int playerID,int cardID,int slotID){
		CardDeckBean deck = _deck.get(playerID);
		if(deck==null)
			return false;
		deck.AddCard(new CardBean(getGenCardRealID(),cardID,slotID,deck));
		return true;
	}
	public Boolean setCurAction(CardActionBean action){
		if(action.getPlayerID()!=getTurnPlayer())
			return false;
		synchronized(this)
		{
			_curAction = action;
		}
		return true;
	}
	public CardActionBean getCurAction(){
		return _curAction;
	}
	private int getGenCardRealID(){
		int realID= _inc_card_realID++;
		return realID;
	}
	public ConcurrentHashMap<Integer, CardDeckBean> getDeck() {
		return _deck;
	}
	public CardDeckBean getDeck(int id){
		for(CardDeckBean deck:_deck.values()){
			if(deck.getPlayerID()==id)
				return deck;
		}
		return null;
	}
	public void setPlayers(ConcurrentHashMap<Integer, CardDeckBean> deck) {
		_deck = deck;
	}
	public void AddPlayer(int playerID,User sfsUser){
		CardDeckBean deck = new CardDeckBean(playerID,sfsUser);
		_deck.put(deck.getPlayerID(),deck);
	}
	public void AddAIPlayer(int playerID,User sfsUser){
		CardDeckBean site = new AICardDeckBean(playerID);
		_deck.put(site.getPlayerID(),site);
	}
	public long getGameStartTime() {
		return gameStartTime;
	}
	public int getCardOwner(int realID){
		for(CardDeckBean deck:_deck.values()){
			CardBean card = deck.getCardMap().get(realID);
			if(card!=null)
				return deck.getPlayerID();
		}
		return 0;
	}
	public CardBean getCard(int realID){
		for(CardDeckBean deck:_deck.values()){
			CardBean card = deck.getCardMap().get(realID);
			if(card!=null)
				return card;
		}
		return null;	
	}
	public CardDeckBean getTurnDeck(){
		for(CardDeckBean deck:_deck.values()){
			if(deck.getPlayerID()==_StateBean.getTurnPlayer())
				return deck;
		}
		return null;
	}
	public CardInfoBean getCardInfo(int realID){
		for(CardDeckBean deck:_deck.values()){
			CardBean card = deck.getCardMap().get(realID);
			if(card!=null)
				return card.getInfo();
		}
		return null;
	}
	public BattleStateBean getStateBean(){
		return _StateBean;
	}
	public void setGameStartTime(long gameStartTime) {
		this.gameStartTime = gameStartTime;
	}

	public boolean isStarted() {
		return _started;
	}
	
	public void setStarted(boolean started) {
		this._started = started;
	}
	/* PUBLIC METHODS */

	/**
	 * Reset the game to its initial status
	 */
	public void reset()
	{
		_started = false;
		_curLoop = 0;
	}
	public int getCurLoop(){
		return _curLoop;
	}
	public void incLoop(){
		_curLoop++;
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
	/** 
	 * Start a new game 
	 */
	public void startGame(List<User> recipients, ICardExtension ext)
	{
		gameStartTime = System.currentTimeMillis() + 3500;
		_started = true;
		// Wait a number of seconds and then notify clients that the game starts!
		timer = new Timer();
		timer.schedule(new SyncGameStart(ext, recipients), 3000);
	}
	public void gameTick(ICardExtension ext,int elapsed){
		BattleBsn.RunBattleStateBean(this,ext,elapsed);
		BattleBsn.onHeroDead(this);
		for (CardDeckBean site : _deck.values())
		{
			site.gameTick(this,ext);
		}
	}
}
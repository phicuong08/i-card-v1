package sfs2x.extensions.icard.bsn;

import java.util.ArrayList;
import java.util.List;





import sfs2x.extensions.icard.beans.*;
import sfs2x.extensions.icard.utils.*;
/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameBsn
{	

	//private Vector<Integer>  _cardStore ={1,2,3};
	/*
	static private int _cardStore[]={50001,50005,50008,
									 40001,40002,40003,40004,40005,40006,40007,40009,40010,
									 31001,31004,31005,
									 30001,30003,30004,
									 21001,21001,21001,21001,21001,
									 21001,21001,21001,21001,21001,
									 21001,21001,21001,21001,21001,
									 21001,21001,21001,21001,21001,
									 21001,21001,21001,21001,21001,
									 21001,21001,21001,21001,21001,
									 };
	*/								 
//	static private int _cardStore[]={21001,50005,21001,
//									21001,40002,21001,21001,21001,40006,21001,21001,40010,
//									21001,31004,21001,
//									 30001,21001,21001,
//									 21001,21002,21003,21004,21005,
//									 21001,21002,21003,21001,21001,
//									 22001,22002,22003,22004,22005,
//									 22001,22002,22003,21001,22005,
//									 23001,23002,23003,23004,21001,
//									 23001,23002,23003,21001,23005,
//									 };
	static private int _cardStore[]={23008,50003,21001,
									 60001,40002,21001,21001,21001,40006,21001,21001,40010,
									 21001,31004,21001,
									 30001,21001,21001,
									 21001,21002,21003,21004,21005,
									 21001,21002,21003,21001,21001,
									 22001,22002,22003,22004,22005,
									 22001,22002,22003,21001,22005,
									 23001,23002,23003,23004,21001,
									 23001,23002,23003,21001,23005,
									 };								 								 
	static public java.util.Random _Random = new java.util.Random();


	

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
	public static void RemovePlayer(int gameID,int playerID){
		CardGameBean game = GameLobbyBean.GetInstance().getGameMap().get(gameID);
		if(game==null)
			return;
		if(game.getDeck().get(playerID)==null)
			return;
		game.setNeedClose();
	}
	public static CardGameBean CreateVSAIGame(){
		return GameLobbyBean.GetInstance().getNewVSAIGame();
	}
	public static CardGameBean CreateGame(){
		return GameLobbyBean.GetInstance().getNewCardGame();
	}
	public static void GenCardSource(CardGameBean gameBean,int playerID)
	{
		CardDeckBean site = gameBean.getDeck().get(playerID);
		if(site==null)
			return;
		List<Integer> Cards = new ArrayList<Integer>();
		for(int i=0;i<_cardStore.length;i++)
		{
			Cards.add(_cardStore[i]);
		}
//		List<Integer> washCards = WashCard(Cards);
//		site.setCardSource(washCards);
		site.setCardSource(Cards);
	}
	
	public static void InitGameCard(CardGameBean newGame){
		for (CardDeckBean site : newGame.getDeck().values())
		{
			InitCardSite(newGame, site.getPlayerID());
		}
	}
	public static void StartGame(CardGameBean newGame){
		newGame.setStarted(true);
		newGame.getStateBean().setState(BattleStateBean.ST_INIT_BATTLE);
	}
	
	public static void InitCardSite(CardGameBean gameBean,int playerID){
		GenCardSource(gameBean,playerID);
		CardDeckBean site = gameBean.getDeck().get(playerID);
		if(site==null)
			return;
		site.setEmptyCardMap();
		gameBean.AddCard(playerID, 20001, CardBean.HERO_ZONE_ID);
		for(int i=0;i<Constants.DEFAULT_HAND_CARD_NUM;i++)
		{
			Integer cardID = site.getDrawCard();
			gameBean.AddCard(playerID, cardID, CardBean.HAND_ZONE_ID);
		}
	}
	
	public static List<Integer> WashCard(List<Integer> oldCards){
		List<Integer> newCards = new ArrayList<Integer>();
		
		while(oldCards.size()>0){
			int count = oldCards.size();
			int randomIndex = _Random.nextInt(count);
			newCards.add(oldCards.get(randomIndex));
			oldCards.remove(randomIndex);
		}
		return newCards;
	}
	
	public static Boolean initVsAI(CardGameBean game,int playerID){
		return true;
	}
	public static Boolean ExistDirtyCard(CardGameBean game){
		for (CardDeckBean site : game.getDeck().values())
		{
			for(CardBean card:site.getCardMap().values())
			{
				if(card.getDirtyFlag()>0)
					return true;
			}
		}
		return false;
	}
}
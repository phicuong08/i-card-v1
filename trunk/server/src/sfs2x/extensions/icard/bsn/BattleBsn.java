package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardAbilityBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardDeckBean;
import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Commands;
import sfs2x.extensions.icard.utils.Constants;

import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;

import sfs2x.extensions.icard.beans.*;
/**
 * GameBsn: class containing utility business classes for game processing
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleBsn
{	
	// Store directions factors to move left,right,up,down
	
	static private java.util.Random _Random = new java.util.Random();

	private static void procInitBattle(CardGameBean game,ICardExtension ext){
		
		game.getStateBean().setState(BattleStateBean.ST_SELECT_TURN_PLAYER);

	}
	private static void InitNewOpState(CardGameBean game,int state){
		game.getStateBean().setState(state);
		game.getStateBean().InitWaitDuration(Constants.PLAY_OP_TIME);	
	}
	public static void drawCard(CardGameBean game,int playerID,int num){
		ICardExtension ext = ICardExtension.getExt();
		CardDeckBean site = game.getDeck().get(playerID);
		if(site==null)
			return;
		for(int i=0;i<num;i++){
			Integer cardID = site.getDrawCard();
			game.AddCard(playerID, cardID, CardBean.HAND_ZONE_ID);	
		}
		ext.SendGameCardUpdate(game);
	}

	public static void ClientEndOp(CardGameBean game,int playerID){
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_WAIT_PLAY_RES:
			game.getStateBean().setState(BattleStateBean.ST_END_PLAY_RES);
			break;
		case BattleStateBean.ST_WAIT_PLAY_CARD:
			game.getStateBean().setState(BattleStateBean.ST_TURN_END);
			break;
		}
		ICardExtension.getExt().SendGameCommand(Commands.CMD_S2C_END_OP_OK, null, game);
	}
	
	public static void procWaitExOp(CardGameBean game,ICardExtension ext,int elapsed){
		//超时处理 TBD
		if(game.getStateBean().DecDuration(elapsed)==false){
			game.getStateBean().setState(BattleStateBean.ST_END_PLAY_CARD);
			return;
		}
		CardActionBean curAction = game.getCurAction();
		if(curAction==null)
			return;
		if(curAction.getType()!=CardActionBean.DO_ABILITY_2_OP)
			return;
		//game.getStateBean().Jump2GodState();
		//TBD

	}
	
	public static boolean VerifyClienRequest(CardGameBean game,int playerID,int card){
		if(card>0 && game.getCardOwner(card)!= playerID)
			return false;
		return game.getStateBean().IsWaitPlayerOp(playerID);
	}
	
	public static void RunBattleStateBean(CardGameBean game,ICardExtension ext,int elapsed){
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_INIT_BATTLE:
			procInitBattle(game,ext);
			break;
		case BattleStateBean.ST_SELECT_TURN_PLAYER:
			procSelectTurnPlayer(game,ext);
			break;
		case BattleStateBean.ST_TURN_BEGIN:
			procTurnBegin(game,ext);
			break;
		case BattleStateBean.ST_WAIT_PLAY_RES:
			procWaitPlayRes(game,elapsed,ext);
			break;	
		case BattleStateBean.ST_END_PLAY_RES:
			procEndPlayRes(game,ext);
			break;
		case BattleStateBean.ST_WAIT_PLAY_CARD:
			procWaitPlayCard(game,elapsed,ext);
			break;
		case BattleStateBean.ST_END_PLAY_CARD:
			procEndPlayCard(game,ext);
			break;
		case BattleStateBean.ST_TURN_END:
			procTurnEnd(game,ext);
			break;
		case BattleStateBean.ST_DELAY_JUMP:
			game.getStateBean().DecDelayDuration(elapsed);
			break;
		case BattleStateBean.ST_WAIT_EX_OP:
			procWaitExOp(game,ext,elapsed);
			break;
		case BattleStateBean.ST_GAME_END:
			procEndGame(game);
			break;
		}
	}
	private static void procEndGame(CardGameBean game){
		game.setStarted(false);
	}
	public static void procWaitPlayCard(CardGameBean game,int elapsed,ICardExtension ext){
		if(game.getStateBean().DecDuration(elapsed)==false){
			game.getStateBean().setState(BattleStateBean.ST_TURN_END);
			return;
		}
		CardActionBean curAction = game.pickCurAction();
		if(curAction==null)
			return;
		boolean ret = CardActionBsn.procCardAction(game,curAction,ext);
		if(ret==false)
			return;
//		CardBean card = game.getCard(curAction.getSrc());
		
		if(curAction.getType()==CardActionBean.DO_ENTER_CARD){
			ext.SendGameCardUpdate(game);
//			CardAbilityBean ability = BufferBsn.getCardAbility(card,CardAbilityBean.WHEN_ENTER);
//			if(ability!=null){
//				InitAbilityOp(game,card,ability);
//				return;
//			}
			game.getStateBean().setState(BattleStateBean.ST_END_PLAY_CARD);
		}
		else if(curAction.getType()==CardActionBean.DO_FIGHT_CARD){
			ISFSObject params = SFSObjectBsn.genFightResult(game,curAction);
			ICardExtension.getExt().SendGameCommand(Commands.CMD_S2C_FIGHT_CARD_RESULT, params, game);
			game.getStateBean().setDelayJump(BattleStateBean.ST_END_PLAY_CARD, Constants.SHOW_ACTION_TIME);
		}
		
	}
	
	private static void procEndPlayCard(CardGameBean game,ICardExtension ext){
		resetWaitPlayCard(game,ext);
	}
	private static void resetWaitPlayCard(CardGameBean game,ICardExtension ext){
		InitNewOpState(game,BattleStateBean.ST_WAIT_PLAY_CARD);
		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getStateBean().getTurnPlayer(),
				Constants.BATTLE_LOOP_TIME);
		ext.SendGameCommand(Commands.CMD_S2C_WAIT_PLAY_CARD, params,game);
	}
	public static void procWaitPlayRes(CardGameBean game,int elapsed,ICardExtension ext){
		if(game.getStateBean().DecDuration(elapsed)==false){
			game.getStateBean().setState(BattleStateBean.ST_END_PLAY_RES);
			return;
		}
		DoPlayRes(game,ext);
	}
	public static void DoPlayRes(CardGameBean game,ICardExtension ext){
		CardActionBean curAction = game.pickCurAction();
		if(curAction==null || curAction.getType()!=CardActionBean.DO_PLAY_RES_CARD)
			return;
		
		CardActionBsn.procCardAction(game,curAction,ext);
		//TBD 发送放置资源消息
		ext.SendGameCardUpdate(game);
		game.getStateBean().setState(BattleStateBean.ST_END_PLAY_RES);
	}
	public static void procEndPlayRes(CardGameBean game,ICardExtension ext){
		resetWaitPlayCard(game,ext);
	}
	public static void procSelectTurnPlayer(CardGameBean game,ICardExtension ext){
		int turnPlayer= game.getTurnPlayer();
		if(turnPlayer>=0){
			turnPlayer = getOtherPlayer(game,game.getTurnPlayer());
		}
		else{
			int count = game.getDeck().size();
			int randomIndex = _Random.nextInt(count);
			int index = 0;
			for (CardDeckBean site : game.getDeck().values()){
				turnPlayer = site.getPlayerID();
				if(index == randomIndex)
					break;
				index++;
			}	
		}
		game.setTurnPlayer(turnPlayer);
		//game.getStateBean().setDelayJump(BattleStateBean.ST_TURN_BEGIN,Constants.SHOW_ACTION_TIME);
		game.getStateBean().setState(BattleStateBean.ST_TURN_BEGIN);
	}

	public static void onEvent(CardGameBean game,int when){
		CardDeckBean desDeck = game.getTurnDeck();
		CardSiteBsn.onBufEvent(desDeck, when);
		for (CardDeckBean deck : game.getDeck().values()){
			CardSiteBsn.onSupportEvent(game,deck,desDeck, when);
		}
	}
	public static void procTurnBegin(CardGameBean game,ICardExtension ext){
		game.setCardReady();
		onEvent(game,CardAbilityBean.WHEN_MY_LOOP_BEGIN);
		if(game.getCurLoop()!=0) //先手不抓牌
			drawCard(game,game.getStateBean().getTurnPlayer(),1);
		
		InitNewOpState(game,BattleStateBean.ST_WAIT_PLAY_RES);
		game.incLoop();
		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getStateBean().getTurnPlayer(),
							Constants.BATTLE_LOOP_TIME);
		ext.SendGameCommand(Commands.CMD_S2C_BATTLE_PLAYER_LOOP, params,game);
	}
	public static boolean onHeroDead(CardGameBean game){
		for (CardDeckBean site : game.getDeck().values()){
			CardBean heroCard = site.getHero();
			if(heroCard.getHp()<=0){
				game.getStateBean().setState(BattleStateBean.ST_GAME_END);
				return true;
			}
		}
		return false;
	}

	public static void InitAbilityOp(CardGameBean game,CardBean card,CardAbilityBean ability){
		game.getStateBean().InitExOp(ability.getID());
		ISFSObject params = SFSObjectBsn.genBattleLoopResetInfo(game);
		params.putInt("ability", ability.getID());
		params.putInt("card", card.getRealID());
		ICardExtension.getExt().SendGameCommand(Commands.CMD_S2C_WAIT_EX_OP, params,game);
		InitNewOpState(game,BattleStateBean.ST_WAIT_EX_OP);
	}
	
	public static void procTurnEnd(CardGameBean game,ICardExtension ext){//
		int nextOp = getOtherPlayer(game,game.getTurnPlayer());
		game.setTurnPlayer(nextOp);
		game.getStateBean().setDelayJump(BattleStateBean.ST_TURN_BEGIN,Constants.SHOW_ACTION_TIME);
	}
	
	public static int  getOtherPlayer(CardGameBean game,int meID)
	{
		for (CardDeckBean site : game.getDeck().values()){
			if(site.getPlayerID() != meID)
			{
				return site.getPlayerID();
			}
		}
		return 0;		
	}
	public static CardDeckBean  getOtherDeck(CardGameBean game,int meID)
	{
		for (CardDeckBean site : game.getDeck().values()){
			if(site.getPlayerID() != meID)
			{
				return site;
			}
		}
		return null;		
	}
}
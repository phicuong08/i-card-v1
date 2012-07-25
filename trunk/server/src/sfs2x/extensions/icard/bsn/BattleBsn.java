package sfs2x.extensions.icard.bsn;

import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
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
		int count = game.getSites().size();
		int randomIndex = _Random.nextInt(count);
		int index = 0;
		int rndPlayer = 0;
		for (CardDeckBean site : game.getSites().values()){
			rndPlayer = site.getPlayerID();
			if(index == randomIndex)
				break;
			index++;
		}
		game.setFreshLoop(rndPlayer);
	}
	
	public static void drawCard(CardGameBean game,ICardExtension ext,int playerID,int num){
		CardDeckBean site = game.getSites().get(playerID);
		if(site==null)
			return;
		for(int i=0;i<num;i++){
			Integer cardID = site.getDrawCard();
			game.AddCard(playerID, cardID, CardBean.HAND_SLOT_ID);	
		}
		ext.SendGameCardUpdate(game);
	}

	public static void ClientEndOp(CardGameBean game,int playerID){
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_WAIT_LOOP_OP:
			game.getStateBean().setState(BattleStateBean.ST_LOOP_END);
			break;
		case BattleStateBean.ST_WAIT_CHAIN_OP:
			game.getStateBean().setState(BattleStateBean.ST_WAIT_CHAIN_OVER);
			break;
		case BattleStateBean.ST_WAIT_EX_OP:
			game.getStateBean().setState(BattleStateBean.ST_INIT_LOOP_RESET);
			break;
		}
		ICardExtension.getExt().SendGameCommand(Commands.CMD_S2C_END_OP_OK, null, game);
	}
	
	public static void procWaitExOp(CardGameBean game,ICardExtension ext,int elasped){
		//超时处理 TBD
		if(game.getStateBean().DecDuration(elasped)==false){
			procLoopReset(game,ext);
			return;
		}
		CardActionBean curAction = game.getCurAction();
		if(curAction==null)
			return;
		if(curAction.getType()!=CardActionBean.DO_ABILITY_2_OP)
			return;
		game.getStateBean().Jump2GodState();

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
		case BattleStateBean.ST_WAIT_EX_OP:
			procWaitExOp(game,ext,elapsed);
			break;
		case BattleStateBean.ST_WAIT_LOOP_OP:
			procWaitLoopOP(game,ext,elapsed);
			break;
		case BattleStateBean.ST_WAIT_CHAIN_OP:
			procWaitChainOP(game,ext,elapsed);
			break;
		case BattleStateBean.ST_WAIT_CHAIN_OVER:
			procWaitChainOver(game,ext);
			break;
		case BattleStateBean.ST_LOOP_END:
			procLoopEnd(game,ext);
			break;
		case BattleStateBean.ST_WAIT_GOD:
			procGodLogic(game,ext);
			break;
		case BattleStateBean.ST_DELAY_JUMP:
			game.getStateBean().DecDelayDuration(elapsed);
			break;	
		case BattleStateBean.ST_INIT_WAIT_LOOP_OP:
			InitWaitLoopOp(game,ext);
			break;
		case BattleStateBean.ST_INIT_WAIT_CHAIN_OP:
			InitWaitChainOp(game,ext);
			break;
		case BattleStateBean.ST_INIT_LOOP_RESET:
			procLoopReset(game,ext);
			break;
		}
		
	}
	
	public static void InitWaitChainOp(CardGameBean game,ICardExtension ext){
		game.getStateBean().InitWaitDuration(Constants.BATTLE_CHAIN_OP_TIME);
		game.getStateBean().setState(BattleStateBean.ST_WAIT_CHAIN_OP);
		ISFSObject params = SFSObjectBsn.genBattleLoopResetInfo(game);
		ext.SendGameCommand(Commands.CMD_S2C_PRI_PLAYER_LOOP, params,game);
	}
	
	public static void InitWaitLoopOp(CardGameBean game,ICardExtension ext){
		if(game.getCurLoop()!=0) //先手不抓牌
			drawCard(game,ext,game.getStateBean().getOpPlayer(),1);
		game.getStateBean().resetWaitLoopOp(game.getLoopPlayer());
		game.incLoop();
		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getStateBean().getOpPlayer(),
							Constants.BATTLE_LOOP_TIME);
		ext.SendGameCommand(Commands.CMD_S2C_BATTLE_PLAYER_LOOP, params,game);
	}
	
	public static void procGodLogic(CardGameBean game,ICardExtension ext){
		if(procBattleChain(game,ext))
			return;
		CardActionBean action = game.pickCurAction();
		if(action!=null){
			CardActionBsn.procCardAction(game,action,ext);
			ext.SendGameCardUpdate(game);		
			//ISFSObject params = SFSObjectBsn.genBattleResult(game,action);
			//ext.SendGameCommand(Commands.CMD_S2C_CARD_FIGHT_RESULT, params, game);
		
			if(game.getStateBean().getState()==BattleStateBean.ST_WAIT_GOD) //状态未跳转
				game.getStateBean().setDelayJump(BattleStateBean.ST_INIT_LOOP_RESET,Constants.SHOW_ACTION_TIME);
		}
		else{
			game.getStateBean().setState(BattleStateBean.ST_LOOP_END);
		}
	}
	public static void InitAbilityOp(CardGameBean game,CardBean card,CardAbilityBean ability){
		game.getStateBean().InitExOp(ability.getID());
		ISFSObject params = SFSObjectBsn.genBattleLoopResetInfo(game);
		params.putInt("ability", ability.getID());
		params.putInt("card", card.getRealID());
		ICardExtension.getExt().SendGameCommand(Commands.CMD_S2C_WAIT_EX_OP, params,game);
	}
	public static void procLoopReset(CardGameBean game,ICardExtension ext){
		game.getStateBean().resetWaitLoopOp(game.getLoopPlayer());
		ISFSObject params = SFSObjectBsn.genBattleLoopResetInfo(game);
		
		ext.SendGameCommand(Commands.CMD_S2C_BATTLE_LOOP_RESET, params,game);
	}
	
	public static boolean procBattleChain(CardGameBean game,ICardExtension ext){
		Vector<CardActionBean> chain = game.getBattleChain().getActionChain();
		if(chain.size()==0)
			return false;
		CardActionBean action = chain.lastElement();
		chain.removeElement(action);
		CardActionBsn.procCardAction(game,action,ext);
		
		ISFSObject params = SFSObjectBsn.genBattleResult(game,action);
		ext.SendGameCommand(Commands.CMD_S2C_CARD_FIGHT_RESULT, params, game);

		if(chain.size()>0){
			CardActionBean topAction = game.getBattleChain().getChainTop();
			int nextOp = topAction.getPlayerID();//getOtherPlayer(game,topAction.getPlayerID());
			game.getStateBean().setOp(nextOp);
		}
		else{
			game.getStateBean().setOp(game.getLoopPlayer());
		}
		game.getStateBean().setDelayJump(BattleStateBean.ST_INIT_WAIT_LOOP_OP,Constants.SHOW_ACTION_TIME);
		return true;
	}
	
	public static void procLoopEnd(CardGameBean game,ICardExtension ext){//
		int nextOp = getOtherPlayer(game,game.getLoopPlayer());
		game.setFreshLoop(nextOp);
//		ext.SendGameCardUpdate(game);
	}
	
	public static void procWaitChainOver(CardGameBean game,ICardExtension ext){
		game.getStateBean().addWaitChainPass();
		if(game.getStateBean().getWaitChainPass()==2){
			game.getStateBean().Jump2GodState();
		}
		else{
			int nextOp = getOtherPlayer(game,game.getOpPlayer());
			game.getStateBean().setOp(nextOp);
			game.getStateBean().setState(BattleStateBean.ST_INIT_WAIT_CHAIN_OP);
		}
	}
	
	public static void procWaitChainOP(CardGameBean game,ICardExtension ext,int elapsed){
		if(game.getStateBean().DecDuration(elapsed)==false){ //超时
			game.getStateBean().setState(BattleStateBean.ST_WAIT_CHAIN_OVER);
			return;
		}
		CardActionBean curAction = game.pickCurAction();
		if(curAction==null)
			return;
		if(game.getOpPlayer()!=curAction.getPlayerID())
			return;
		if(CardActionBsn.Action2ChainAble(game,curAction)==false)
			return;
		
		game.getStateBean().clearWaitChainPass();
		//game.getStateBean().setOp(curAction.getPlayerID());
		game.getBattleChain().PushAction(curAction);
		addChainActionCost(game,curAction);
		game.getStateBean().setDelayJump(BattleStateBean.ST_INIT_WAIT_CHAIN_OP,Constants.SHOW_ACTION_TIME);
		
		ISFSObject params = new SFSObject();
		SFSObjectBsn.fillBattleActionInfo(params,game,curAction);
		ext.SendGameCommand(Commands.CMD_S2C_CARD_FIGHT, params,game);
	}
	
	private static void addChainActionCost(CardGameBean game,CardActionBean action){
		CardDeckBean site = game.getSites().get(action.getPlayerID());
		if(site==null)
			return;
		site.addChainCost(CardActionBsn.getActionCost(game,action));
	}
	
	public static void procWaitLoopOP(CardGameBean game,ICardExtension ext,int elasped){
		//超时处理 TBD
		if(game.getStateBean().DecDuration(elasped)==false){
			game.getStateBean().setState(BattleStateBean.ST_LOOP_END);
			return;
		}
		CardActionBean curAction = game.getCurAction();
		if(curAction==null)
			return;
			
		//检测是否操作方	
		if(game.getOpPlayer()!=curAction.getPlayerID())
			return;
		if(needActiveBattleChain(game,curAction)){
			if(CardActionBsn.Action2ChainAble(game,curAction)){
				game.EmptyBattleChain();
				procWaitChainOP(game,ext,0);
			}
		}
		else{
			game.getStateBean().Jump2GodState();
		}
	}
	public static boolean needActiveBattleChain(CardGameBean game,CardActionBean curAction){
		return true;
		//return (curAction.getDes()!=null);
	}
	public static int  getOtherPlayer(CardGameBean game,int meID)
	{
		for (CardDeckBean site : game.getSites().values()){
			if(site.getPlayerID() != meID)
			{
				return site.getPlayerID();
			}
		}
		return 0;		
	}
	
}
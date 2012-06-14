package sfs2x.extensions.icard.bsn;

import java.util.Enumeration;
import java.util.LinkedList;
import java.util.Random;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.CardSiteBean;
import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Commands;
import sfs2x.extensions.icard.utils.Constants;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.SFSExtension;
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
		for (CardSiteBean site : game.getSites().values()){
			rndPlayer = site.getPlayerID();
			if(index == randomIndex)
				break;
			index++;
		}
		game.setFreshLoop(rndPlayer);
	}
	
	public static void procLoopInterval(CardGameBean game,ICardExtension ext,int elapsed){
		if(game.getStateBean().DecLoopInterval(elapsed)==false){
			game.getStateBean().setState(BattleStateBean.ST_WAIT_LOOP_OP);
			
			ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getStateBean().getOpPlayer(),
								Constants.BATTLE_LOOP_TIME);
			ext.SendGameCommand(Commands.CMD_S2C_BATTLE_PLAYER_LOOP, params,game);
		}
	}
	
	public static void RunBattleStateBean(CardGameBean game,ICardExtension ext,int elapsed){
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_INIT_BATTLE:
			procInitBattle(game,ext);
			break;
		case BattleStateBean.ST_LOOP_INTERVAL:
			procLoopInterval(game,ext,elapsed);
			break;
		case BattleStateBean.ST_WAIT_LOOP_OP:
			procWaitLoopOP(game,ext,elapsed);
			break;
		case BattleStateBean.ST_WAIT_CHAIN_OP:
			procWaitChainOP(game,ext,elapsed);
			break;
		case BattleStateBean.ST_LOOP_END:
			procLoopEnd(game,ext);
			break;
		case BattleStateBean.ST_WAIT_GOD:
			procGodLogic(game,ext);
			break;
		}
	}
	public static void procGodLogic(CardGameBean game,ICardExtension ext){
		CardActionBean action = game.pickCurAction();
		if(action!=null){
			CardActionBsn.procCardAction(this,action,ext);
			ext.SendGameCardUpdate(this);
		}
		procBattleChain(game,ext);
		
		game.getStateBean().resetWaitLoopOp(game.getLoopPlayer());
		ISFSObject params =SFSObjectBsn.genBattleLoopResetInfo(game);
		ext.SendGameCommand(Commands.CMD_S2C_BATTLE_LOOP_RESET, params,game);
	}
	
	public static void procBattleChain(CardGameBean game,ICardExtension ext){
	
	}
	public static void procLoopEnd(CardGameBean game,ICardExtension ext){//
		int nextOp = getOtherPlayer(game,game.getOpPlayer());
		game.setFreshLoop(nextOp);
//		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getOpPlayer(), Constants.BATTLE_LOOP_TIME);
//		ext.SendGameCommand(Commands.CMD_S2C_BATTLE_PLAYER_LOOP, params,game);
	}
	
	public static Boolean procWaitChainOP(CardGameBean game,ICardExtension ext,int elapsed){
		if(game.getStateBean().DecDuration(elapsed)==false){ //超时
			game.getStateBean().Jump2GodState();
		}
		CardActionBean curAction = game.pickCurAction();
		if(curAction==null)
			return false;
		if(game.getOpPlayer()!=curAction.getPlayerID())
			return false;
		game.getBattleChain().PushAction(curAction);		
		int nextOp = getOtherPlayer(game,game.getOpPlayer());
		game.getStateBean().InitWaitOp(nextOp);
		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getOpPlayer(), Constants.BATTLE_LOOP_TIME);
		SFSObjectBsn.fillBattleActionInfo(params,game,curAction);
		ext.SendGameCommand(Commands.CMD_S2C_PRI_PLAYER_LOOP, params,game);
		return true;
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
		if(needActiveBattleChain(curAction)){
			game.getStateBean().setState(BattleStateBean.ST_WAIT_CHAIN_OP);
		}
		else{
			game.getStateBean().Jump2GodState();
		}
		
	}
	public static boolean needActiveBattleChain(CardActionBean curAction){
		return true;
	}
	public static int  getOtherPlayer(CardGameBean game,int meID)
	{
		for (CardSiteBean site : game.getSites().values()){
			if(site.getPlayerID() != meID)
			{
				return site.getPlayerID();
			}
		}
		return 0;		
	}

}
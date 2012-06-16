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
		case BattleStateBean.ST_SELECT_CHAIN_RESP:
			procSelectChainResp(game,ext);
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
	public static void procSelectChainResp(CardGameBean game,ICardExtension ext){
		CardActionBean topAction = game.getBattleChain().getChainTop();
		if(topAction==null)
			game.getStateBean().setState(BattleStateBean.ST_WAIT_GOD);
		
		int nextOp = getOtherPlayer(game,topAction.getPlayerID());
		game.getStateBean().InitWaitOp(nextOp);
		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getOpPlayer(), Constants.BATTLE_LOOP_TIME);
		SFSObjectBsn.fillBattleActionInfo(params,game,topAction);
		ext.SendGameCommand(Commands.CMD_S2C_PRI_PLAYER_LOOP, params,game);
		game.getStateBean().setState(BattleStateBean.ST_WAIT_CHAIN_OP);
	}
	public static void procGodLogic(CardGameBean game,ICardExtension ext){
		if(procBattleChain(game,ext))
			return;
		CardActionBean action = game.pickCurAction();
		if(action!=null){
			CardActionBsn.procCardAction(game,action,ext);
			ext.SendGameCardUpdate(game);
			procLoopReset(game,ext);
		}
		else{
			game.getStateBean().setState(BattleStateBean.ST_LOOP_END);
		}
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
		ext.SendGameCardUpdate(game);
		if(chain.size()>0){
			game.getStateBean().setState(BattleStateBean.ST_SELECT_CHAIN_RESP);
		}
		else{
			procLoopReset(game,ext);
		}
		return true;
	}
	public static void procLoopEnd(CardGameBean game,ICardExtension ext){//
		int nextOp = getOtherPlayer(game,game.getLoopPlayer());
		game.setFreshLoop(nextOp);
	}
	
	public static void procWaitChainOP(CardGameBean game,ICardExtension ext,int elapsed){
		if(game.getStateBean().DecDuration(elapsed)==false){ //超时
			game.getStateBean().Jump2GodState();
		}
		CardActionBean curAction = game.pickCurAction();
		if(curAction==null)
			return;
		if(game.getOpPlayer()!=curAction.getPlayerID())
			return;
		if(CardActionBsn.Action2ChainAble(game,curAction)==false)
			return;
		game.getBattleChain().PushAction(curAction);
		addChainActionCost(game,curAction);
		
		game.getStateBean().setState(BattleStateBean.ST_SELECT_CHAIN_RESP);
		return;
	}
	private static void addChainActionCost(CardGameBean game,CardActionBean action){
		CardSiteBean site = game.getSites().get(action.getPlayerID());
		if(site==null)
			return;
		site.addChainCost(CardActionBsn.getActionCost(action));
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
		if(CardActionBsn.Action2ChainAble(game,curAction)==false)
			return;
		if(needActiveBattleChain(game,curAction)){
			if(CardActionBsn.Action2ChainAble(game,curAction)){
				CardActionBean pickAction = game.pickCurAction();
				game.EmptyBattleChain();
				game.getBattleChain().PushAction(pickAction);
				game.getStateBean().setState(BattleStateBean.ST_SELECT_CHAIN_RESP);
			}
		}
		else{
			game.getStateBean().Jump2GodState();
		}
		
	}
	public static boolean needActiveBattleChain(CardGameBean game,CardActionBean curAction){
		if(	curAction.getDes().size()==0)
			return false;
		for(Integer realID:curAction.getDes()){
			if(game.getCardOwner(realID)!=game.getOpPlayer())
				return true;
		}
		return false;
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
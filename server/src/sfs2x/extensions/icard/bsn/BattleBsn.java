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


	private static void procStateInit(CardGameBean game,ICardExtension ext){
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
		ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(rndPlayer, Constants.BATTLE_LOOP_TIME);
		ext.SendGameCommand(Commands.CMD_S2C_BATTLE_PLAYER_LOOP, params,game);
	}
	public static void RunBattleStateBean(CardGameBean game,ICardExtension ext,int elasped){
		switch(game.getStateBean().getState()){
		case BattleStateBean.ST_INIT:
			procStateInit(game,ext);
			break;
		case BattleStateBean.ST_WAIT_OP:
			procWaitOP(game,ext,elasped);
			break;
		case BattleStateBean.ST_WAIT_GOD:
			game.RunGodLogic(ext);
			break;
		}
	}
	public static Boolean procOpTimeout(CardGameBean game,ICardExtension ext,int elasped){
		if(game.getStateBean().DecDuration(elasped))
			return false;
		SwitchOpPlayer(game);
		if(game.getBattleChain().IsEmpty()){
			game.setFreshLoop(game.getOpPlayer());
			ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getOpPlayer(), Constants.BATTLE_LOOP_TIME);
			ext.SendGameCommand(Commands.CMD_S2C_BATTLE_PLAYER_LOOP, params,game);
		}
		else{
			
			ISFSObject params = SFSObjectBsn.genPlayerLoopInfo(game.getOpPlayer(), Constants.BATTLE_LOOP_TIME);
			ext.SendGameCommand(Commands.CMD_S2C_PRI_PLAYER_LOOP, params,game);
		}
		return true;
	}
	public static void procWaitOP(CardGameBean game,ICardExtension ext,int elasped){
		//超时处理 TBD
		if(procOpTimeout(game,ext,elasped)){
			return;
		}
		CardActionBean curAction = game.getCurAction();
		if(curAction==null)
			return;
			
		//检测是否操作方	
		if(game.getOpPlayer()!=curAction.getPlayerID())
			return;
		game.getStateBean().Jump2GodState();
	}

	public static void SwitchOpPlayer(CardGameBean game)
	{
		int op = game.getOpPlayer();
		for (CardSiteBean site : game.getSites().values()){
			if(site.getPlayerID() != op)
			{
				op =site.getPlayerID();
				break;
			}
		}
		Integer opInt = op;
		game.getStateBean().InitWaitOp(op);

	}

}
package sfs2x.extensions.icard.beans;


import java.util.*;

import sfs2x.extensions.icard.main.ICardExtension;
import sfs2x.extensions.icard.utils.Constants;


/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleStateBean
{	
	public static final int ST_NONE_STATE= 0;
	public static final int ST_INIT_BATTLE=1;
	public static final int ST_WAIT_LOOP_OP = 2;
	public static final int ST_WAIT_CHAIN_OP = 3;
	public static final int ST_WAIT_CHAIN_OVER = 4;
	public static final int ST_SELECT_CHAIN_RESP = 5;
	public static final int ST_WAIT_GOD = 6;
	public static final int ST_LOOP_END = 7;
	public static final int ST_LOOP_INTERVAL=8;
	
	
	private Vector<Integer>  _battleChain;
	/** User id */
	private int _opPlayerID = 0;  //等待操作的玩家
	
	private int _state;	
	private int _waitDuration = 60;
	private int _loopInterval;
	private int _waitChainPass;
	public BattleStateBean() {
		_state =ST_NONE_STATE;
	}
	public void setState(int val){
		_state = val;
	}
	public int getState(){
		return _state;
	}
	public int getOpPlayer() {
		return _opPlayerID;
	}
	public Boolean getIsWaitTimeOut(){
		return _waitDuration <= 0;
	}
	public void Jump2GodState(){
		setState(ST_WAIT_GOD);
	}
	public int getWaitChainPass(){
		return _waitChainPass;
	}
	public void addWaitChainPass(){
		_waitChainPass++;
	}
	public void clearWaitChainPass(){
		_waitChainPass = 0;
	}
	public void resetWaitLoopOp(int playerID){
		_opPlayerID = playerID;
		_waitDuration = Constants.BATTLE_LOOP_TIME;
		_state =  ST_WAIT_LOOP_OP;
	}
	public void InitWaitOp(int playerID,int during){
		_opPlayerID = playerID;
		_loopInterval = 3*1000;
		//_state = ST_LOOP_INTERVAL;
		_waitDuration = during;
	}
	public Boolean DecLoopInterval(int val){
		_loopInterval -= val;
		return (_loopInterval>0);
	}
	public Boolean DecDuration(int val){
		_waitDuration -= val;
		return (_waitDuration>0);
	}
	public void setChainCard(int realID){
		_battleChain.addElement(realID);
	}
	public Boolean IsWaitPlayerOp(int playerID){
		if(_opPlayerID!=playerID)
			return false;
		return (_state==ST_WAIT_LOOP_OP || _state==ST_WAIT_CHAIN_OP);
	}

}
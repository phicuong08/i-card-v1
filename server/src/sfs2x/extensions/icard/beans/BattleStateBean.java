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
	public static final int ST_INIT=1;
	public static final int ST_WAIT_OP = 2;
	public static final int ST_CHAIN_WAIT_OP = 3;
	private Vector<Integer>  _battleChain;
	/** User id */
	private int _waitPlayerID = 0;  //等待操作的玩家
	
	private int _state;	
	private int _waitDuration = 60;

	public BattleStateBean() {
		_state =ST_NONE_STATE;
	}
	public void setState(int val){
		_state = val;
	}
	public int getState(){
		return _state;
	}
	public int getWaitPlayer() {
		return _waitPlayerID;
	}
	public Boolean getIsWaitTimeOut(){
		return _waitDuration <= 0;
	}
	public void InitWaitOp(int playerID){
		_waitPlayerID = playerID;
		_state = ST_WAIT_OP;
		_waitDuration = Constants.BATTLE_WAIT_OP_DURATION;
	}
	public void InitChainWaitOp(int playerID){
		_waitPlayerID = playerID;
		_battleChain = new Vector<Integer>();
		_state = ST_CHAIN_WAIT_OP;
		_waitDuration = Constants.BATTLE_WAIT_OP_DURATION;
	}
	public void setChainCard(int realID){
		_battleChain.addElement(realID);
	}
	

}
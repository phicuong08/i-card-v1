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
	/*
	 *	TURN_START, (ready +draw)
	 *  TURN_ACTION,(combat step)
	 *  TURN_END
	 */
	public static final int ST_NONE_STATE= 0;
	public static final int ST_INIT_BATTLE=1;
	public static final int ST_WAIT_TURN_ACTION = 3;
	public static final int ST_INIT_WAIT_CHAIN_OP = 4;
	public static final int ST_WAIT_CHAIN_OP = 5;
	public static final int ST_WAIT_CHAIN_OVER = 6;
	public static final int ST_WAIT_GOD = 7;
	public static final int ST_TURN_END = 8;
	public static final int ST_WAIT_EX_OP=9;//牌进场时操作
	public static final int ST_DELAY_JUMP=10;
	public static final int ST_INIT_TURN_RESET=11;
	public static final int ST_TURN_BEGIN=12;
	
	
	
	private Vector<Integer>  _battleChain;
	/** User id */
	private int _opPlayer = -1;  //等待操作的玩家
	private int _turnPlayer=-1;
	private int _state;	
	private int _waitDuration = 60;
	private int _waitChainPass;
	private int _delayState;
	private int _delayDuration;
	private int _ability;
	public BattleStateBean() {
		_state =ST_NONE_STATE;
	}
	public void setDelayJump(int state,int duration){
		setState(ST_DELAY_JUMP);
		_delayState = state;
		_delayDuration = duration;
	}
	public void DecDelayDuration(int val){
		_delayDuration =_delayDuration - val;
		if( _delayDuration<=0)
		{
			setState(_delayState);
		}
	}
	
	public void setState(int val){
		synchronized(this)
		{
			_state = val;		
		}
		
		ICardExtension ext = ICardExtension.getExt();
		switch(_state){
		case ST_INIT_BATTLE:
			ext.trace("STATE== BattleStateBean.ST_INIT_BATTLE");
			break;
		case ST_WAIT_TURN_ACTION:
			ext.trace("STATE== BattleStateBean.ST_WAIT_LOOP_OP");
			break;
		case ST_WAIT_CHAIN_OP:
			ext.trace("STATE== BattleStateBean.ST_WAIT_CHAIN_OP");
			break;
		case ST_WAIT_CHAIN_OVER:
			ext.trace("STATE== BattleStateBean.ST_WAIT_CHAIN_OVER");
			break;
		case ST_TURN_END:
			ext.trace("STATE== BattleStateBean.ST_LOOP_END");
			break;
		case ST_WAIT_GOD:
			ext.trace("STATE== BattleStateBean.ST_WAIT_GOD");
			break;
		case ST_WAIT_EX_OP:
			ext.trace("STATE== BattleStateBean.ST_WAIT_EX_OP");
			break;
		case ST_INIT_TURN_RESET:
			ext.trace("STATE== BattleStateBean.ST_INIT_TURN_RESET");
			break;	
		}
	}
	public void setTurnPlayer(int playerID){
		_turnPlayer = playerID;
	}
	public int getTurnPlayer() {
		return _turnPlayer;
	}
	public void setOpPlayer(int playerID){
		_opPlayer = playerID;
	}
	public int getState(){
		return _state;
	}
	public int getOpPlayer() {
		return _opPlayer;
	}
	public int getWaitDuration(){
		return _waitDuration;
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
		_opPlayer = playerID;
		_waitDuration = Constants.BATTLE_LOOP_TIME;
	}
	public void InitWaitDuration(int during){
		_waitDuration = during;
	}
	public void InitExOp(int ability){
		_waitDuration = Constants.BATTLE_LOOP_TIME;
		setState(BattleStateBean.ST_WAIT_EX_OP);
		_ability = ability;
	}
	public int getCurAbility(){
		return _ability;
	}
	public void InitWaitOp(int playerID,int during){
		_opPlayer = playerID;
		_waitDuration = during;
	}
	public Boolean DecDuration(int val){
		_waitDuration =_waitDuration - val;
		return (_waitDuration>0);
	}
	public void setChainCard(int realID){
		_battleChain.addElement(realID);
	}
	public Boolean IsWaitPlayerOp(int playerID){
		if(_opPlayer!=playerID)
			return false;
		return (_state==ST_WAIT_TURN_ACTION || _state==ST_WAIT_CHAIN_OP ||_state==ST_WAIT_EX_OP);
	}

}
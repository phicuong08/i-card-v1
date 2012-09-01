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
	public static final int ST_SELECT_TURN_PLAYER=2;//选择回合玩家
	public static final int ST_TURN_BEGIN=3;//回合前处理
	public static final int ST_WAIT_PLAY_RES=4;//等待放置资源
	public static final int ST_END_PLAY_RES=5;//等待放置资源
	public static final int ST_WAIT_PLAY_CARD=6;
	public static final int ST_END_PLAY_CARD=7;
	public static final int ST_WAIT_EX_OP=8;

	public static final int ST_TURN_END = 9;
	public static final int ST_GAME_END=10;
	
	public static final int ST_DELAY_JUMP=11;
	
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
		case ST_SELECT_TURN_PLAYER:
			ext.trace("STATE== BattleStateBean.ST_SELECT_TURN_PLAYER");
			break;
		case ST_TURN_BEGIN:
			ext.trace("STATE== BattleStateBean.ST_TURN_BEGIN");
			break;
		case ST_WAIT_PLAY_RES:
			ext.trace("STATE== BattleStateBean.ST_WAIT_PLAY_RES");
			break;
		case ST_WAIT_PLAY_CARD:
			ext.trace("STATE== BattleStateBean.ST_WAIT_PLAY_CARD");
			break;
		case ST_TURN_END:
			ext.trace("STATE== BattleStateBean.ST_TURN_END");
			break;
		case ST_GAME_END:
			ext.trace("STATE== BattleStateBean.ST_GAME_END");
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
		return (_state==ST_WAIT_PLAY_RES || _state==ST_WAIT_PLAY_CARD);
	}

}
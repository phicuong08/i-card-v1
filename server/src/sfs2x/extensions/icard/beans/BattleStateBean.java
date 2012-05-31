package sfs2x.extensions.icard.beans;

import com.smartfoxserver.v2.entities.User;

/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BattleStateBean
{	
	public static final int NONE_STATE= 0;
	public static final int WAIT_OP = 1;
	public static final int CHAIN_WAIT_OP = 2;
	/** User id */
	private int _waitPlayerID = 0;  //等待操作的玩家
	
	private int _state;	
	private int _waitDuration = 60;

	public BattleStateBean() {
		_state = NONE_STATE;
	}
	
	public int getState(){
		return _state;
	}
	public int getWaitPlayer() {
		return _waitPlayerID;
	}
	public bool getIsWaitTimeOut(){
		return _waitDuration <= 0;
	}
	public void InitWaitOp(int playerID)
		_waitPlayerID = playerID;
		_state = WAIT_OP;
		_waitDuration = Constants.BATTLE_WAIT_OP_DURATION;
	}
	public void InitChainWaitOp(int playerID)
		_waitPlayerID = playerID;
		_state = CHAIN_WAIT_OP;
		_waitDuration = Constants.BATTLE_WAIT_OP_DURATION;
	}
	
}
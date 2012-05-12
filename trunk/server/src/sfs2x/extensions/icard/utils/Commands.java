package sfs2x.extensions.icard.utils;

public class Commands {
	/** Ready to start a game */
	//server
	public static final String CMD_S2C_GAME_START = "s2c_game_start";
	  //game start 开始游戏，参数1:玩家牌更新信息; 
	//{player1{card1{realID,cardID},card2,...},player2,...}
	
	//player id [realID,cardID,slot id], 对方牌信息[real,0001]
	  //move card 
	public static final String CMD_S2C_CLIENT_STATE_UPDATE="s2c_client_state_update";
	//参数1: playerId,参数2: 状态 [ 0--初始状态， 1--就绪]
	
	public static final String CMD_S2C_CARD_UPDATE="s2c_card_update";
	//参数1. playerId,参数2:牌状态{realID,cardID,slot_id,side_state,turn_state,hp,atk,def]; key-value
	
	public static final String CMD_S2C_CARD_FIGHT_RESULT="s2c_card_fight_result";
	//参数1. playerId,参数2:牌状态{realID,cardID,slot_id,side_state,turn_state,hp,atk,def]; key-value
	
	public static final String CMS_S2C_CARD_FIGHT="s2c_card_fight";
	//参数1:源卡{realID},参数2:目标卡{目标卡数，realID,realID,...};
	
	//client commands
	//
	public static final String CMD_C2S_CLIENT_STATE_UPDATE = "c2s_client_state_update";
	//玩家状态修改   参数1: 状态[ 0--初始状态， 1--就绪]
	
	public static final String CMD_C2S_CARD_UPDATE="c2s_card_update";
	//参数1:牌状态{realID,slot_id,side_state,turn_state]; 
	public static final String CMD_C2S_CARD_USE="c2s_card_use"; //施法，战斗
	//参数1:源卡{realID},参数2:目标卡{目标卡数，realID,realID,...};
}


// client Commands
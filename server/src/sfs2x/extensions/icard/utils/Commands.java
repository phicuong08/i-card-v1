package sfs2x.extensions.icard.utils;

public class Commands {
							//
							//server commands
							//
	
	
	public static final String CMD_S2C_GAME_START 				= "10001";
	//game start 开始游戏，参数1:玩家牌更新信息; 
	//{player1{card1{realID,cardID},card2,...},player2,...}	
	//player id [realID,cardID,slot id], 对方牌信息[real,0001]

	public static final String CMD_S2C_CLIENT_GAME_STATE_UPDATE	="10002";
	//参数1: playerId,参数2: 状态 [ 0--初始状态， 1--就绪]
	
	public static final String CMD_S2C_CARD_UPDATE				="11001";
	//{参数1(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
	//卡片状态改变

	public static final String CMD_S2C_CARD_FIGHT				="11002";
	//参数1(srcID);参数2(target):目标卡{(realID,slot)...},参数3(timer):反应时间(秒);
	//卡片使用，包括施法与卡片战斗
	
	public static final String CMD_S2C_CARD_FIGHT_RESULT		="11003";
	//参数1(srcID):, 参数2(target):{ {realID,card_battle_state,val} ,...}--受作用卡结果
	//战斗表现
	
	
	


	
							//
							//client commands
							//
	public static final String CMD_C2S_CLIENT_GAME_STATE_UPDATE = "1";
	//玩家状态修改   参数1: 状态[ 0--初始状态， 1--就绪]
	
	public static final String CMD_C2S_CARD_USE					="1001"; //施法，战斗
	//参数1:源卡{realID},参数2:目标卡{目标卡数，realID,realID,...};
	
	public static final String CMD_C2S_CARD_UPDATE				="1002";
	//参数1:牌状态{realID,slot_id,side_state,turn_state]; 
	
	
//	realID --卡片唯一ID
//	cardID --卡片ID
//	slot   --槽位 
//	side   --是否横置 1-横，0-非横
//	turn   --是否翻转 1-翻转
//	hp     --血量
//	atk    --攻击力
//	def    --防御力
//	
//	//参数1: playerId,参数2: 状态 [ 0--初始状态， 1--就绪]
//
//	
//	state   --玩家状态  0--初始，1--就绪  2--开始人机对战
	

}
package sfs2x.extensions.icard.utils;

public class Commands {
							//
							//server commands
							//
	
	public static final String CMD_S2C_ERROR              =  "9002";
	public static final String CMD_S2C_GAME_START 				= "10001";
	//参数1(me)--我方playerID ;参数2(you):--对方playerID,参数3(card)--(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}  side=1,横置， turn=1,翻转


	public static final String CMD_S2C_CLIENT_GAME_STATE_UPDATE	="10002";
	//参数1(playerID) ;参数2(state): 状态 [ 0--初始状态， 1--就绪]
	
	public static final String CMD_S2C_CARD_UPDATE				="11001";
	//{参数1(card)--(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
	//卡片状态改变

	public static final String CMD_S2C_CARD_FIGHT				="11002";
	//参数1(srcID);参数2(target):目标卡{(realID)...},参数3(time):反应时间(秒),参数4(defender);
	//卡片使用，包括施法与卡片战斗
	
	public static final String CMD_S2C_CARD_FIGHT_RESULT		="11003";
	//参数1(srcID):, 参数2(target):{ {realID,hpAdd,def,atk,slot,turn,side} ,...}--受作用卡结果,参数3(bEnemy)[0-对已方，1-对敌方]
	//战斗表现
	public static final String CMD_S2C_BATTLE_PLAYER_LOOP       ="11004";//回合转化
	public static final String CMD_S2C_PRI_PLAYER_LOOP       ="11005";//优先权转化
	
	


	
							//
							//client commands
							//
	public static final String CMD_C2S_CLIENT_BATTLE_STATE_UPDATE = "1";
	//玩家状态修改   参数1: 状态[ 0--初始状态， 1--就绪]
	
	public static final String CMD_C2S_CARD_USE					="1001"; //使用卡片 
	//参数1(srcID):int;参数2(target):{realID,...};
	
	public static final String CMD_C2S_CARD_UPDATE				="1002"; //请求改变卡状态,上牌
	//参数1(realID):int;参数2(slot):int, 
	

	

}
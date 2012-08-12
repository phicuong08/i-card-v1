//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	
	
	public class ICardMsgDef{
		
		//clinet msg
		
		public static var c2s_client_battle_state_update:String ="1";  //玩家状态修改
		//参数1(state);状态 [ 0--初始状态， 1--就绪]
		
		//卡片消息
		public static var c2s_battle_card_taskuse:String ="1001";       //使用卡片  
		//参数1(srcID):int;参数2(target):{realID,...};
		public static var c2s_battle_play_card:String="1002";     //请求改变卡状态
		//参数1(realID):int;参数2(slot):int, 
	
		public static var c2s_end_op:String	="1003"; //请求结束操作
		//参数1(gameID):int;
		
		public static var c2s_battle_card_fight:String ="1004";       //卡片atk  
		//参数1(srcID):int;参数2(target):{realID,...};
		
		//server msg
		
		//game start 开始游戏，参数1:玩家牌更新信息; 
		//{player1{card1{realID,cardID},card2,...},player2,...}
		public static var s2c_client_battle_start:String ="10001";   //开始游戏
		//参数1(me)--我方playerID ;参数2(you):--对方playerID,参数3(card)--(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
		
		public static var s2c_client_battle_state_update:String ="10002"; //玩家状态改变
		//参数1(playerID) ;参数2(state): 状态 [ 0--初始状态， 1--就绪]
		
		public static var s2c_battle_card_update:String ="11001"; //卡片状态改变
		//{参数1(card)--(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
		
		public static var s2c_battle_card_fight:String = "11002";//卡片使用，包括施法与卡片战斗
		//参数1(srcID);参数2(target):目标卡{(realID)...},参数3(time):反应时间(秒),参数4(defender);
		
		
		public static var s2c_battle_card_fight_result:String = "11003"; //战斗表现
		//参数1(srcID):, 参数2(target):{ {realID,hpAdd,def,atk,slot,turn,side} ,...}--受作用卡结果,参数3(bEnemy)[0-对已方，1-对敌方]
		
		public static var s2c_battle_player_loop:String ="11004";//回合转化
		//参数1 playerID--出牌玩家ID,参数2-time --单位秒
		public static var  s2c_pri_player_loop:String       ="11005";
		public static var  s2c_battle_reset_player_loop:String ="11006";
		public static var  s2c_end_op_ok:String                ="11007";
		public static var  s2c_card_ex_op:String                ="11008";
	}
}//package ICard.protocols 

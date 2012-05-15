//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	
	
	public class ICardMsgDef{
		
		//clinet msg
		
		public static var c2s_client_battle_state_update:String ="1";  //玩家状态修改
		
		
		//卡片消息
		public static var c2s_battle_card_use:String ="1001";       //使用卡片  
		//参数1(srcID):int;参数2(target):{realID,...};
		public static var c2s_battle_card_update:String="1002";     //请求改变卡状态
		//参数1(realID):int;参数2(slot):int, 
	
		//server msg
		
		//game start 开始游戏，参数1:玩家牌更新信息; 
		//{player1{card1{realID,cardID},card2,...},player2,...}
		public static var s2c_client_battle_start:String ="10001";   //开始游戏
		//参数1(me)--我方playerID ;参数2(you):--对方playerID,
		
		public static var s2c_client_battle_state_update:String ="10002"; //玩家状态改变
		//参数1(playerID) ;参数2(state): 状态 [ 0--初始状态， 1--就绪]
		
		public static var s2c_battle_card_update:String ="11001"; //卡片状态改变
		//{参数1(playerID,realID,cardID,slot,side,turn,hp,atk,def),...}
		
		public static var s2c_battle_card_fight:String = "11002";//卡片使用，包括施法与卡片战斗
		//参数1(srcID);参数2(target):目标卡{(realID,slot)...},参数3(timer):反应时间(秒);
		
		
		public static var s2c_battle_card_fight_result:String = "11003"; //战斗表现
		//参数1(srcID):, 参数2(target):{ {realID,slot} ,...}--受作用卡结果
	}
}//package ICard.protocols 

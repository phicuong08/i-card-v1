//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
   
	import ICard.SFSMod.*;
	import ICard.assist.*;
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.entities.match.*;
	import com.smartfoxserver.v2.requests.*;
	
	import flash.events.*;
    public class SFSDataBase extends DataBase {
		private var _mod_roomList:Mod_RoomList;
		private var _mod_roomUser:Mod_RoomUser;
		private var _mod_UserMgr:Mod_UserMgr;
		private var _mod_Battle:Mod_Battle;
	
		public function SFSDataBase():void{
			super();
			_mod_roomList = new Mod_RoomList(SFS);
			_mod_roomUser = new Mod_RoomUser(SFS);
			_mod_UserMgr = new Mod_UserMgr(SFS);
			_mod_Battle = new Mod_Battle(SFS);
		}
		public function SFS_login(name:String,pwd:String,callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.LOGIN, callback_ok);
			SFS.addEventListener(SFSEvent.LOGIN_ERROR, callback_fail);
			SFS.addEventListener(SFSEvent.EXTENSION_RESPONSE, onExtensionResponse);
			//vs room
	
			// Login
			SFS.send(new LoginRequest(name,pwd));

		}
		
		public function destroyGame(params:Object = null):void
		{
			SFS.removeEventListener(SFSEvent.EXTENSION_RESPONSE, onExtensionResponse)
		}
		public function get _Mod_Battle():Object{
			return _mod_Battle;
		}
		public function get _Mod_RoomList():Object{
			return _mod_roomList;
		}
		public function get _Mod_RoomUser():Object{
			return _mod_roomUser;
		}
		public function get _Mod_UserMgr():Object{
			return _mod_UserMgr;
		}
	
		public function onExtensionResponse(evt:SFSEvent):void
		{
			var params:ISFSObject = evt.params.params
			var cmd:String = evt.params.cmd
			
			switch(cmd)
			{
				case ICardMsgDef.s2c_client_battle_start:
					_mod_Battle.onBattleStart(params);
					break;
				case ICardMsgDef.s2c_battle_card_update:
					_mod_Battle.onCardUpdate(params);
					break;
				case ICardMsgDef.s2c_battle_card_fight:
					_mod_Battle.onCardFight(params);
					break;
				case ICardMsgDef.s2c_battle_card_fight_result:
					_mod_Battle.onCardFightResult(params);
					break;
				case ICardMsgDef.s2c_battle_player_loop:
					_mod_Battle.onCardPlayerLoop(params);
					break;
				case ICardMsgDef.s2c_pri_player_loop:
					_mod_Battle.onPriPlayerLoop(params);
					break;
				case ICardMsgDef.s2c_end_op_ok:
					_mod_Battle.onEndOpOK(params);
					break;
//				case ICardMsgDef.s2c_battle_reset_player_loop;
//					_mod_Battle.onResetPlayerLoop(params);
//					break;
			}
		}
		
    }
}//package com 

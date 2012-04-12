//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
   
	import ICard.assist.*;
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.entities.match.*;
	import com.smartfoxserver.v2.requests.*;
	
	import flash.events.*;
    public class SFSDataBase extends DataBase {

		private var _notifyJoinVSRoom:Function;
		private const GAME_ROOMS_GROUP_NAME:String = "battle";
		
		
		public function SFSDataBase():void{
			 
		}
		public function SFS_login(name:String,pwd:String,callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.LOGIN, callback_ok);
			SFS.addEventListener(SFSEvent.LOGIN_ERROR, callback_fail);
			
			//vs room
			SFS.addEventListener(SFSEvent.ROOM_ADD, onRoomAdd);
			SFS.addEventListener(SFSEvent.ROOM_JOIN, onRoomAdd);
			SFS.addEventListener(SFSEvent.ROOM_CREATION_ERROR, onRoomAdd_Err);
			SFS.addEventListener(SFSEvent.ROOM_JOIN_ERROR, onRoomAdd_Err);
			// Login
			SFS.send(new LoginRequest(name,pwd));

		}
		public function SFS_subscribeVSRoomGroup(callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE, callback_ok);
			SFS.addEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE_ERROR, callback_fail);
			if (!SFS.roomManager.containsGroup(GAME_ROOMS_GROUP_NAME))
				SFS.send(new SubscribeRoomGroupRequest(GAME_ROOMS_GROUP_NAME));
		}
		
		
		public function SFS_joinVSRoom(arg1:int,callback_ok:Function,callback_fail:Function):void
		{
			_notifyJoinVSRoom = callback_ok;
			var roomName:String = "vs_room_" +arg1;
			var room:Room = SFS.getRoomByName(roomName);
			if(room ==null)
			{
				var settings:RoomSettings = new RoomSettings(roomName);
				settings.groupId = GAME_ROOMS_GROUP_NAME;
				SFS.send(new CreateRoomRequest(settings));
			}
			else
			{
				SFS.send(new JoinRoomRequest("vs_room_" + arg1));				
			}
		}
		private function onRoomAdd(evt:SFSEvent):void{
			
		}
		private function onRoomAdd_Err(evt:SFSEvent):void{
			
		}
    }
}//package com 

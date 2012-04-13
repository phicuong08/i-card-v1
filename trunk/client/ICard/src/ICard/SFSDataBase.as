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

		private var _onJoinVSRoom_OK:Function;
		private var _onJoinVSRoom_Fail:Function;
		private var _onUpdataVSRoom:Function;
		private const GAME_ROOMS_GROUP_NAME:String = "battle";
		private var _joinRoomName:String;
		private var _vsRoom:Room;
		public function SFSDataBase():void{
			 
		}
		public function SFS_login(name:String,pwd:String,callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.LOGIN, callback_ok);
			SFS.addEventListener(SFSEvent.LOGIN_ERROR, callback_fail);
			
			//vs room
			SFS.addEventListener(SFSEvent.ROOM_ADD, onRoomAdd);
			SFS.addEventListener(SFSEvent.ROOM_JOIN, onRoomJoin);
			SFS.addEventListener(SFSEvent.ROOM_CREATION_ERROR, onRoomAdd_Err);
			SFS.addEventListener(SFSEvent.ROOM_JOIN_ERROR, onRoomAdd_Err);
			SFS.addEventListener(SFSEvent.USER_EXIT_ROOM, onUserExitRoom);

			// Login
			SFS.send(new LoginRequest(name,pwd));

		}
		public function SFS_subscribeVSRoomGroup(callback_ok:Function,callback_fail:Function,onUpdata:Function):void
		{
			SFS.addEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE, callback_ok);
			SFS.addEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE_ERROR, callback_fail);
			_onUpdataVSRoom = onUpdata;
			if (!SFS.roomManager.containsGroup(GAME_ROOMS_GROUP_NAME))
				SFS.send(new SubscribeRoomGroupRequest(GAME_ROOMS_GROUP_NAME));
		}
		
		
		public function SFS_joinVSRoom(arg1:int,callback_ok:Function,callback_fail:Function):void
		{
			_onJoinVSRoom_OK = callback_ok;
			_onJoinVSRoom_Fail = callback_fail;
			
			var roomName:String = "vs_room_" +arg1;
			var room:Room = SFS.getRoomByName(roomName);
			if(room ==null)
			{
				var settings:RoomSettings = new RoomSettings(roomName);
				settings.groupId = GAME_ROOMS_GROUP_NAME;
				settings.maxUsers = 2;
				settings.isGame = true;
				_joinRoomName = roomName;
				SFS.send(new CreateRoomRequest(settings));
			}
			else
			{
				SFS.send(new JoinRoomRequest("vs_room_" + arg1));				
			}
		}
		public function SFS_LeaveVSRoom():void{
			if(_vsRoom !=null)
			{
				SFS.send(new LeaveRoomRequest(_vsRoom));
				_vsRoom = null;
			}
		}
		private function onRoomAdd(evt:SFSEvent):void{
			if(evt.params.room.name == _joinRoomName)
			{
				SFS.send(new JoinRoomRequest(_joinRoomName));
			}
			if(_onUpdataVSRoom!=null){
				_onUpdataVSRoom(evt);
			}
			trace("Room created: " + evt.params.room);
		}
		private function onRoomJoin(evt:SFSEvent):void{
			if( _onJoinVSRoom_OK!=null && evt.params.room.isJoined){
				_onJoinVSRoom_OK(evt);
				_vsRoom = evt.params.room;
				_onJoinVSRoom_OK = null;
			}
			else if(_onUpdataVSRoom!=null)
			{
				_onUpdataVSRoom(evt);
			}
			trace("Room Join: " + evt.params.room);
		}
		
		private function onRoomAdd_Err(evt:SFSEvent):void{
			trace("Room creation failure: " + evt.params.errorMessage);
		}
		private function onUserExitRoom(evt:SFSEvent):void
		{
			var room:Room = evt.params.room;
			var user:User = evt.params.user;
			
			trace("User " + user.name + " just left Room " + room.name);
		}

		
    }
}//package com 

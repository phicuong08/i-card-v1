//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.requests.*;
	
	public class Mod_RoomList extends Object{
		
		public var _smartFox : SmartFox;
		private var _joinRoomName:String;
		private var _onJoinVSRoom_OK:Function;
		private var _onJoinVSRoom_Fail:Function;
		private var _onUpdataVSRoom:Function;
		private const GAME_ROOMS_GROUP_NAME:String = "battle";
		
		private var _vsRoom:Room;
		
		public function Init(arg1:SmartFox):void{
			SFS = arg1;
			SFS.addEventListener(SFSEvent.ROOM_ADD, onRoomAdd);
			SFS.addEventListener(SFSEvent.ROOM_JOIN, onRoomJoin);
			SFS.addEventListener(SFSEvent.ROOM_CREATION_ERROR, onRoomAdd_Err);
			SFS.addEventListener(SFSEvent.ROOM_JOIN_ERROR, onRoomAdd_Err);
			SFS.addEventListener(SFSEvent.USER_EXIT_ROOM, onUserExitRoom);
			SFS.addEventListener(SFSEvent.USER_COUNT_CHANGE,onUserCountChange);
		}
		public function get SFS():SmartFox{
			return _smartFox;
		}
		public function set SFS(arg1:SmartFox):void{
			_smartFox = arg1;
		}
		
		private function onRoomAdd(evt:SFSEvent):void{
			if(evt.params.room.name == _joinRoomName)
			{
				SFS.send(new JoinRoomRequest(_joinRoomName));
			}
			trace("Room created: " + evt.params.room);
		}
		private function onRoomJoin(evt:SFSEvent):void{
			if( _onJoinVSRoom_OK!=null && evt.params.room.isJoined){
				_onJoinVSRoom_OK(evt);
				_vsRoom = evt.params.room;
				_onJoinVSRoom_OK = null;
			}
			
			trace("Room Join: " + evt.params.room);
		}
		private function onUserCountChange(evt:SFSEvent):void{
			if(_onUpdataVSRoom!=null){
				_onUpdataVSRoom(evt);
			}
			trace("User count change: ");
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
		
		public function regOnUpdateVSRoom(callback:Function):void
		{
			_onUpdataVSRoom = callback;
		}
		
		public function subscribeVSRoomGroup(callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE, callback_ok);
			SFS.addEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE_ERROR, callback_fail);
			
			if (!SFS.roomManager.containsGroup(GAME_ROOMS_GROUP_NAME))
				SFS.send(new SubscribeRoomGroupRequest(GAME_ROOMS_GROUP_NAME));
		}
		
		public function unSubscribeVSRoomGroup(callback_ok:Function,callback_fail:Function):void{
			SFS.removeEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE,callback_ok);
			SFS.removeEventListener(SFSEvent.ROOM_GROUP_SUBSCRIBE_ERROR, callback_fail);
			_onUpdataVSRoom = null;
			SFS.send(new UnsubscribeRoomGroupRequest(GAME_ROOMS_GROUP_NAME));
			
		}
		
		public function joinVSRoom(arg1:int,callback_ok:Function,callback_fail:Function):void
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
		public function leaveVSRoom():void{
			if(_vsRoom !=null)
			{
				SFS.send(new LeaveRoomRequest(_vsRoom));
				_vsRoom = null;
			}
		}
	}
}//package ICard.protocols 

//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
	import ICard.haloer.data.oObject;
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.entities.match.*;
	import com.smartfoxserver.v2.requests.*;
	
    public class SFSProtocol {

     		
		
        public static function NewRooms(evt:SFSEvent):Array{
			var roomList:Array = [];
			var room:SFSRoom;
			var _local4:Object={};
			for each (room in evt.params.newRooms) {
				_local4.id = room.id;
				_local4.name = room.name;
				_local4.maxUsers = room.maxUsers;
				_local4.userCount = room.userCount;
				roomList.push(_local4);
			}
			return roomList;
        }
		public static function AddRooms(evt:SFSEvent):Object{
			var local4:Object={};
			var room:SFSRoom = evt.params.room;
			local4.id = room.id;
			local4.name = room.name;
			local4.maxUsers = room.maxUsers;
			local4.userCount = room.userCount;
			return local4;
		}

    }
   // var _local1:* = Protocol.init();
    //return (_local1);
}//package com 

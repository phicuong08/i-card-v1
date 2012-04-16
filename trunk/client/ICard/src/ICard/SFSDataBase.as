﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
   
	import ICard.assist.*;
	import ICard.SFSMod.*;
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
	
		public function SFSDataBase():void{
			super();
			_mod_roomList = new Mod_RoomList(SFS);
			_mod_roomUser = new Mod_RoomUser(SFS);
			_mod_UserMgr = new Mod_UserMgr(SFS);
		}
		public function SFS_login(name:String,pwd:String,callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.LOGIN, callback_ok);
			SFS.addEventListener(SFSEvent.LOGIN_ERROR, callback_fail);
			
			//vs room
	
			// Login
			SFS.send(new LoginRequest(name,pwd));

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
	

		
    }
}//package com 

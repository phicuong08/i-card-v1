﻿//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
    
    import com.smartfoxserver.v2.core.SFSEvent;
    
    import flash.events.MouseEvent;
    import flash.net.*;
    public class WaitRoomView extends Base implements IView {

		private var _waitroom:IWaitRoom;
		private var _playerList:Array;
		
		public function init(evt:SFSEvent):void
		{
			_playerList = SFSProtocol.PlayerList(evt);
			show();
		}
		public function show():void{
			loadAssets("waitroom", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			this._waitroom = (_viewMgr.getAssetsObject("waitroom", "waitroom") as IWaitRoom);
			this._waitroom.onInvite = this.onInvite;
			this._waitroom.onBye = this.onBye;
			this._waitroom.onLock = this.onLock;
			this._waitroom.onStart = this.onStart;
			this._waitroom.UpdatePlayerList(_playerList);
			_Mod_RoomList.regOnUpdateVSRoom(OnUpdateVSRoom);
			this.render();
		}
		
		private function render():void{
			if(this._waitroom){
				_popup.addView(this, this._waitroom.content);
			}
		}
	
		private function OnUpdateVSRoom(evt:SFSEvent):void{ 
			if(this.inStage ==true){
				_playerList = SFSProtocol.PlayerList(evt);
				_waitroom.UpdatePlayerList(_playerList);
				//this._roomlist.AddVSRoom(room);				
			}
		}
		
		private function onInvite(e:MouseEvent):void{
		}
		
		private function onBye(e:MouseEvent):void{
		}
		private function onLock(e:MouseEvent):void{
		}
		private function onStart(e:MouseEvent):void{
		}
		
		public function close():void{
			_Mod_RoomList.regOnUpdateVSRoom(null);
			_Mod_RoomList.leaveVSRoom();
		}
		public function clear():void{
		}
		
	}
}//package com.views 

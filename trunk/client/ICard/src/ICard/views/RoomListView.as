//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.SFSProtocol;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
    
    import com.smartfoxserver.v2.core.SFSEvent;
    
	import ICard.SFSMod.Mod_RoomList;
	
    import flash.events.MouseEvent;
    import flash.net.*;
	import flash.utils.*;
	
    public class RoomListView extends Base implements IView {

		
		private var _roomlist:IRoomList;
		
		public function show():void{
			loadAssets("roomlist", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			
			this._roomlist = (_viewMgr.getAssetsObject("roomlist", "roomlist") as IRoomList);
			this._roomlist.InitCallback(onWatch,onJoin,onFresh,onQuick);
			var modRoomList:Mod_RoomList =  (_data._Mod_RoomList as Mod_RoomList);
			modRoomList.subscribeVSRoomGroup(SubscribeRoomGroup_OK,SubscribeRoomGroup_FAIL);
			modRoomList.regOnUpdateVSRoom(onNotifyRoom_OK);
			this.render();
		}
		private function render():void{
			if(this._roomlist){
				_popup.addView(this, this._roomlist.content);
			}
		}
		private function SubscribeRoomGroup_OK(evt:SFSEvent):void{
			
			var roomArr:Array = SFSProtocol.NewRooms(evt);
			this._roomlist.UpdateVSRooms(roomArr);
			
			trace("Group subscribed. The following rooms are now accessible: " + evt.params.newRooms);
			var len:int  = evt.params.newRooms.length;
			var id:int = 0;
		
		}
		private function SubscribeRoomGroup_FAIL(evt:SFSEvent):void{
			trace("Group subscription failed: " + evt.params.errorMessage);
		}
		private function onWatch(arg1:int):void{
			trace("on watch=",arg1);
		}
		private function onJoin(arg1:int):void{
			
			_Mod_RoomList.joinVSRoom(arg1,onJoinRoom_OK,onJoinRoom_FAIL);
			trace("on join=",arg1);
		}
		
		private function onJoinRoom_OK(evt:SFSEvent):void{
			if(this.inStage ==true)
			{
				_Mod_RoomList.unSubscribeVSRoomGroup(SubscribeRoomGroup_OK,SubscribeRoomGroup_FAIL);
				_viewMgr.waitroom.show();
			}
			
			trace("join room ok");
		}
		private function onJoinRoom_FAIL(evt:SFSEvent):void{
			trace("join room fail");
		}
		

		private function onNotifyRoom_OK(evt:SFSEvent):void{ //新房间创建
			if(this.inStage ==true){
				var room:Object = SFSProtocol.AddRooms(evt);
				this._roomlist.AddVSRoom(room);				
			}
		}
		
		
		private function onFresh(arg1:int):void{
			trace("on fresh=",arg1);
		}
		private function onQuick(arg1:int):void{
			trace("on quick=",arg1);
		}
		public function close():void{
			_popup.closeView(this);
		}
		public function clear():void{
		}
	
		
	}
}//package com.views 

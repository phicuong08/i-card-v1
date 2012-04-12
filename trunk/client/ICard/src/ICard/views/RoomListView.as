//Created by Action Script Viewer - http://www.buraks.com/asv
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
	
	
	
    public class RoomListView extends Base implements IView {

		
		private var _roomlist:IRoomList;
		
		public function show():void{
			loadAssets("roomlist", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			
			this._roomlist = (_viewMgr.getAssetsObject("roomlist", "roomlist") as IRoomList);
			this._roomlist.InitCallback(onWatch,onJoin,onFresh,onQuick);
			_data.SFS_subscribeVSRoomGroup(SubscribeRoomGroup_OK,SubscribeRoomGroup_FAIL);
			this.render();
		}
		private function render():void{
			if(this._roomlist){
				_popup.addView(this, this._roomlist.content);
			}
		}
		private function SubscribeRoomGroup_OK(evt:SFSEvent):void{
			trace("Group subscribed. The following rooms are now accessible: " + evt.params.newRooms);
		}
		private function SubscribeRoomGroup_FAIL(evt:SFSEvent):void{
			trace("Group subscription failed: " + evt.params.errorMessage);
		}
		private function onWatch(arg1:int):void{
			trace("on watch=",arg1);
		}
		private function onJoin(arg1:int):void{
			
			_data.SFS_joinVSRoom(arg1,onJoinRoom_OK,onJoinRoom_FAIL);
			trace("on join=",arg1);
		}
		
		private function onJoinRoom_OK(evt:SFSEvent):void{
			_viewMgr.waitroom.show();
			trace("join room ok");
		}
		private function onJoinRoom_FAIL(evt:SFSEvent):void{
			trace("join room fail");
		}
		
		private function onNotifyRoom_OK(evt:SFSEvent):void{
			_viewMgr.waitroom.show();
			trace("join room ok");
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

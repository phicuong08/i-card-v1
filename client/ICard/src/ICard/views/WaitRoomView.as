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
	
	
	
    public class WaitRoomView extends Base implements IView {

		
		private var _waitroom:IWaitRoom;
		
		public function show():void{
			loadAssets("roomlist", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			
			this._waitroom = (_viewMgr.getAssetsObject("waitroom", "waitroom") as IWaitRoom);
			this.render();
		}
		private function render():void{
			if(this._waitroom){
				_popup.addView(this, this._waitroom.content);
			}
		}
	
		public function close():void{
			_popup.closeView(this);
		}
		public function clear():void{
		}
	
		
	}
}//package com.views 

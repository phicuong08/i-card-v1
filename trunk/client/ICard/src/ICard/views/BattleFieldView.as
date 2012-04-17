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
    public class BattleFieldView extends Base implements IView {
		private var _battleField:IBattleField;
	
		public function init(evt:SFSEvent):void
		{
			show();
		}
		public function show():void{
			loadAssets("battlefield", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			this._battleField = (_viewMgr.getAssetsObject("battlefield", "battleField") as IBattleField);
			this.render();
		}
		
		private function render():void{
			if(this._battleField){
				_popup.addView(this, this._battleField.content);
			}
		}

		public function close():void{

		}
		public function clear():void{
		}
		
	}
}//package com.views 

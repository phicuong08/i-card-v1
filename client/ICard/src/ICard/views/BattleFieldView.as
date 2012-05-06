//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
	import ICard.assist.view.controls.BattleFieldType;
    import com.smartfoxserver.v2.core.SFSEvent;
    
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.net.*;

    public class BattleFieldView extends Base implements IView {
		private var _battleField:IBattleField;
		private var _cardDB:ICardDB;
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
			this._cardDB = (_viewMgr.getAssetsObject("carddb", "carddb") as ICardDB);
			test();
			this.render();
		}
		
		private function render():void{
			if(this._battleField){
				_popup.addView(this, this._battleField.content);
			}
		}
		private function test():void{
			var card:Array = CardType.GetCardInfo(20001);
			var c1:MovieClip = _cardDB.CreateCard(1,card);
			//_battleField.RunTest();
			
			_battleField.Add2Slot(BattleFieldType.MyFightSlotId,c1);
			
		}
		public function close():void{

		}
		public function clear():void{
		}
		
	}
}//package com.views 

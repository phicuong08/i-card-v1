//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.controls.BattleFieldType;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
    
    import com.smartfoxserver.v2.core.SFSEvent;
    
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.geom.Point;
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
			
			this._battleField.tip = _viewMgr.tip.iTip;
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
			var card1:Array = CardType.GetCardInfo(20001);
			var card0:Array = CardType.GetCardInfo(20000);
			
			var strCardHtml:String = cardTipHtml.CreateCardHtmlTip(card1,card0);
			var c1:MovieClip = _cardDB.CreateCard(1,card1);
			var card2:Array = CardType.GetCardInfo(20002);
			var c2:MovieClip = _cardDB.CreateCard(1,card2);
			//_battleField.RunTest();
			
			
			_viewMgr.tip.iTip.addFixedTarget(c1,strCardHtml,new Point(0,0),true);
			_battleField.Add2Slot(BattleFieldType.MyHandSlotId,c1);
			_battleField.Add2Slot(BattleFieldType.MyHandSlotId,c2);
			
		}
		public function close():void{

		}
		public function clear():void{
		}
		
	}
}//package com.views 

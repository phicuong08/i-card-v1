//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.controls.BattleFieldType;
    import ICard.assist.view.interfaces.*;
    import ICard.datas.BattleGuyData;
    import ICard.datas.CardDiffData;
    import ICard.datas.card.CardData;
    import ICard.lang.client.com.views.*;
    import ICard.logic.*;
    import ICard.logic.BattleStage;
    import ICard.protocols.*;
    
    import com.smartfoxserver.v2.core.SFSEvent;
    
    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.net.*;

    public class BattleFieldView extends Base implements IView {
		private var _updateTimeCardNotify:String = "timer_card_notify";
		private var _battleField:IBattleField;
		private var _cardDB:ICardDB;
		private var _battleStage:BattleStage;

		public function show():void{
			loadAssets("battlefield", this.loadCallback, "");
				
		}
		
		private function loadCallback():void
		{
			_battleStage = BattleStage.getInstance();
			this._battleField = (_viewMgr.getAssetsObject("battlefield", "battleField") as IBattleField);
			
			this._battleField.tip = _viewMgr.tip.iTip;
			this._battleField.onCard2Fight = onCard2Fight;
			this._battleField.onCard2Res = onCard2Res;
			this._cardDB = (_viewMgr.getAssetsObject("carddb", "carddb") as ICardDB);
			test();
			_viewMgr.addToTimerProcessList(this._updateTimeCardNotify, this.CardNotifyTimer);
			this.render();
		}
		private function CardNotifyTimer():void{
			var abc:int =0;
			var cardInfo:Array = CardDiffData.PopCard();
			if(cardInfo!=null)
			{
				if(CardDiffData.IsSlotDiff(cardInfo[0],cardInfo[1])||
					 CardDiffData.IsTurnDiff(cardInfo[0],cardInfo[1]))
				{
						var newCard:MovieClip = CreateCard(cardInfo[1]);
						_battleField.Add2Slot(cardInfo[1]["slot"],newCard);
				}
				else if(CardDiffData.IsAttrDiff(cardInfo[0],cardInfo[1]))
				{
						vard cardMC:MovieClip = _battleField.FindCard(cardInfo[1]);
						this._cardDB.UpdateAttr(cardMC,cardInfo[1]);
				}
				else if(CardDiffData.IsSideDiff(cardInfo[0],cardInfo[1]))
				{
						_battleField.SideCard(cardInfo[1]);
				}
			}
		}
		private function CreateCard(info:Object,bTip:Boolean=true):MovieClip{
				var cardMC:MovieClip = _cardDB.CreateCard(cardInfo[1]);
				if(cardMC==null || bTip==false)
						return cardMC;
				var strCardHtml:String = cardTipHtml.CreateCardHtmlTip(cardInfo["cardID"]);		
				cardMC.tipInfo = strCardHtml;
				return cardMC;
		}
		private function render():void{
			if(this._battleField){
				_popup.addView(this, this._battleField.content);
			}
			
		}
		private function onCard2Fight(arg1:int):Boolean{
			return true;	
		}
		private function onCard2Res(arg1:int):Boolean{
			return true;	
		}
		
		private function test():void{
			_battleStage.InitGuy([{realID:1},{realID:2}]);
			
			var card1:Object={realID:1,cardID:20001,hp:22,atk:0,def:0,side:false,turn:false,slot:BattleFieldType.MyHandSlotId};
			var card2:Object={realID:1,cardID:20001,hp:22,atk:0,def:0,side:false,turn:false,slot:BattleFieldType.MyResourceSlotId};
			_battleStage.UpdateCards(1,[card1]);
			_battleStage.UpdateCards(1,[card2]);
			
			
			var strCardHtml:String = cardTipHtml.CreateCardHtmlTip(card1["cardID"]);
			var c1:MovieClip = CreateCard(card1);
			_battleField.Add2Slot(card1["slot"],c1);
			

//			
//			var i:int;
//			while(i<4)
//			{
//				var strCardHtml:String = cardTipHtml.CreateCardHtmlTip(card1,cardTitle);
//				var c1:MovieClip = _cardDB.CreateCard(1,card1);
//				var card2:Array = CardType.GetCardInfo(20002);
//				var c2:MovieClip = _cardDB.CreateCard(1,card2);
//				var strCardHtml2:String = cardTipHtml.CreateCardHtmlTip(card2,cardTitle);
//				//_battleField.RunTest();
//				
//				//_viewMgr.tip.iTip.addFixedTarget(c1,strCardHtml,new Point(0,0),true);
//				c1.tipInfo = strCardHtml;
//				c2.tipInfo = strCardHtml2;
//				_battleField.Add2Slot(BattleFieldType.MyHandSlotId,c1);
//				_battleField.Add2Slot(BattleFieldType.MyHandSlotId,c2);
//				i++;
//			}
		
			
		}
		public function close():void{

		}
		public function clear():void{
		}
		
	}
}//package com.views 

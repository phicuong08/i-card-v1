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
		private var _updateFrameCardNotify:String = "frame_card_notify";
		private var _battleField:IBattleField;
		private var _cardDB:ICardDB;
		private var _battleStage:BattleStage;

		public function show():void{
			loadAssets("battlefield", this.loadCallback, "");
			QueryNewGame();	
		}
		
		private function loadCallback():void
		{
			_battleStage = BattleStage.getInstance();
			_battleStage.settle(_data);
			_battleStage.CardFightResultCallback = this.onCardFightResult;
			_battleStage.PlayerLoopFreshCallback = this.onPlayerLoopFresh;
			
			_battleField = (_viewMgr.getAssetsObject("battlefield", "battleField") as IBattleField);
			_battleField.tip = _viewMgr.tip.iTip;
			_battleField.BattleStage = _battleStage;
			
			this._cardDB = (_viewMgr.getAssetsObject("carddb", "carddb") as ICardDB);
			_viewMgr.addToFrameProcessList(this._updateFrameCardNotify, this.CardNotifyFrame);
			
			this.render();
		}
		private function CardNotifyFrame():void{
			var cardInfo:Array = CardDiffData.PopCard();
			if(cardInfo!=null)
			{
				var cardObj:CardData = (cardInfo[1] as CardData);
				 if(CardDiffData.IsAttrDiff(cardInfo[0],cardInfo[1]))
				{
						var cardMC:MovieClip = _battleField.FindCard(cardObj.RealID);
						if(cardMC)
							this._cardDB.UpdateAttr(cardMC,cardObj.Info);
						if(CardDiffData.IsSideDiff(cardInfo[0],cardInfo[1]))
						{
								_battleField.SideCard(cardObj.Info);
						}		
				}
				else
				{
					var newCard:MovieClip = CreateCard(cardObj.Info);
					_battleField.Add2Slot(_battleStage.GetUISlot(cardObj.Info),newCard);
				}
			}
		}
		private function CreateCard(info:Object,bTip:Boolean=true):MovieClip{
				trace("create card",info["cardID"]);
				if(info["cardID"]==0)
					return null;
				var cardMC:MovieClip = _cardDB.CreateCard(info);
				if(cardMC==null || bTip==false)
						return cardMC;
				var strCardHtml:String = cardTipHtml.CreateCardHtmlTip(info["cardID"]);		
				cardMC.tipInfo = strCardHtml;
				return cardMC;
		}
		private function render():void{
			if(this._battleField){
				_popup.addView(this, this._battleField.content);
			}
			//_viewMgr.fightMovie.show();
		}
		private function DoTurnCard(arg1:int):Boolean{
			return true;	
		}
		
		public function onPlayerLoopFresh(myLoop:Boolean,secNum:int):void{
			_battleField.LoopFresh(myLoop,secNum);
		}
		public function onCardFightResult(srcID:int,targets:Array,oldCards:Array,bEnemy:Boolean):void{
			_viewMgr.fightMovie.InitShow(srcID,targets,oldCards,bEnemy);
		}
		private function test():void{
			
			_battleStage.InitGuy(1,2,0);
			
			//_viewMgr.fightMovie.show();
			//_battleStage.InitGuy(1,2);
			
			_battleStage.PlayerLoopFresh(1,30);
			var card1:Object={playerID:1,realID:1,cardID:20001,slot:BattleFieldType.MyHeroSlotId};
			var card2:Object={playerID:1,realID:2,cardID:31001,slot:BattleFieldType.MyHandSlotId};
			var card3:Object={playerID:1,realID:2,cardID:31001,side:1,slot:BattleFieldType.MyEquipSlotId};
		//	_battleStage.onUpdateCard(card1);
		//	_battleStage.onUpdateCard(card2);
			
			_battleStage.onUpdateCard(card3);
			
			
			//var card2:Object={realID:1,cardID:20001,hp:22,atk:0,def:0,side:false,turn:false,slot:BattleFieldType.MyResourceSlotId};
			
			//_battleStage.UpdateCards(1,[card2]);
			
//			var c1:MovieClip = CreateCard(card1);
//			_battleField.Add2Slot(card1["slot"],c1);
			

		
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
		private function QueryNewGame():void{
			_data._Mod_Battle.QueryStartGame();
		}
		public function close():void{

		}
		public function clear():void{
		}
		
	}
}//package com.views 

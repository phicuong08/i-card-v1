//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.card.*;
	
	import flash.utils.*;
	public class BattleGuyData {
		private var _cardArr:Dictionary;	
		private var _cardDiff:CardDiffData;
		
		public function BattleGuyData():void{
			_cardArr = new Dictionary;
			_cardDiff = new CardDiffData;
		}
	
		public function EmptyCards():void{
			_cardArr = new Dictionary;
		}
		public function SetCardSlot(realID:int,slot:int):Boolean{
			if(!_cardArr[realID])
				return false;
			_cardArr[realID]._slot = slot;
			return true;
		}
		
		public function FindCard(arg1:int):CardData{
			return _cardArr[arg1];
		}
		
		public function onUpdateCard(info:Object):void{
			var realID:int = info["realID"];
			var oldCard:CardData;
			var newCard:CardData = new CardData(info);
			if(_cardArr[realID])
			{
				oldCard = new CardData(new Object);
				oldCard.Clone(_cardArr[realID]);
			}
			_cardArr[realID] = newCard;
			CardDiffData.UpdateCard(oldCard,newCard);
		}
		
		public function ResetCards():void{
			for each( var card:CardData in _cardArr)
			{
				if( card.Slot == BattleFieldType.MyResourceSlotId ||
					card.Slot == BattleFieldType.MyHeroSlotId ||
					card.Slot ==BattleFieldType.YouResourceSlotId||
					card.Slot ==BattleFieldType.YouHeroSlotId)
					card.Side = 0;
			}
		}
		
		public function ResetRes():void{
			for each( var card:CardData in _cardArr)
			{
				if( card.Slot == BattleFieldType.MyResourceSlotId)
					card.Side = 0;
			}
		}
		
		public function ResNum():int{
			var val:int = 0;
			for each( var card:CardData in _cardArr)
			{
				if( card.Slot == BattleFieldType.MyResourceSlotId &&
					card.Side ==0)
				{
					val++;
				}
			}
			return val;
		}
		
		public function UseRes(val:int):Boolean{ 
			if(val>ResVal())
				return false;
			for each( var card:CardData in _cardArr)
			{
				
				if( card.Slot == BattleFieldType.MyResourceSlotId &&
					card.Side ==0)
				{
					card.Side = 1;
					val++;
				}
				if(val==0)
					break;		
			}
			return true;
		}
		
		public function ResVal():int{
			var resVal:int = 0;
			for each( var card:CardData in _cardArr)
			{
				if( card.Slot == BattleFieldType.MyResourceSlotId &&
					card.Side ==false)
					resVal++;
			}
			return resVal;
		}
	}
}//package com.assist.data.mission 

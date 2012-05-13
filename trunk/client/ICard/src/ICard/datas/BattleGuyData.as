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
		
		
		public function UpdateCardArray(info:Array):void{
			for each( var cardInfo:Object in info) 
			{
				UpdateCard(cardInfo);
			}
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
		
		public function UpdateCard(info:Object):void{
			var realID:int = info["realID"];
			var oldCard:CardData;
			var newCard:CardData = new CardData;
			newCard.format(info);
			if(_cardArr[realID])
			{
				oldCard = new CardData;
				oldCard.Clone(_cardArr[realID]);
			}
			else
			{
				_cardArr[realID] = new CardData;
			}
			_cardArr[realID].format(info);
			CardDiffData.UpdateCard(oldCard,newCard);
		}
		
		public function ResetCards():void{
			for each( var card:CardData in _cardArr)
			{
				if( card._slot == BattleFieldType.MyResourceSlotId ||
					card._slot == BattleFieldType.MyHeroSlotId ||
					card._slot ==BattleFieldType.YouResourceSlotId||
					card._slot ==BattleFieldType.YouHeroSlotId)
					card._side = false;
			}
		}
		public function ResetRes():void{
			for each( var card:CardData in _cardArr)
			{
				if( card._slot == BattleFieldType.MyResourceSlotId)
					card._side = false;
			}
		}

		public function UseRes(val:int):Boolean{ 
			if(val>ResVal())
				return false;
			for each( var card:CardData in _cardArr)
			{
				
				if( card._slot == BattleFieldType.MyResourceSlotId &&
					card._side ==false)
				{
					card._side = true;
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
				if( card._slot == BattleFieldType.MyResourceSlotId &&
					card._side ==false)
					resVal++;
			}
			return resVal;
		}
	}
}//package com.assist.data.mission 

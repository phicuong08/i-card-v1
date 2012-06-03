//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.card.*;
	
	import flash.utils.*;
	public class BattleGuyData {
		private var _cardArr:Dictionary;	
		
		public function BattleGuyData():void{
			_cardArr = new Dictionary;
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
//			if(info["slot"]!=BattleFieldType.YouHandSlotId)
//				return;
			var newCard:CardData = new CardData(info);
			var oldCard:CardData = FindCard(info["realID"]);
			if(oldCard)
			{
				oldCard = newCard;
			}
			else
			{
				_cardArr[newCard.RealID]=newCard;
			}
			CardDiffData.UpdateCard(newCard);
			
		}
		
		public function ResetCards():void{
			for each( var card:CardData in _cardArr)
			{
				if( card.Slot == BattleFieldType.MyResourceSlotId ||
					card.Slot == BattleFieldType.MyFightSlotId ||
					card.Slot == BattleFieldType.MyEquipSlotId )
				{
					var oldCard:CardData = new CardData(new Object);
					oldCard.Clone(card);
					card.Side = 0;
					CardDiffData.UpdateCard(card);
				}
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

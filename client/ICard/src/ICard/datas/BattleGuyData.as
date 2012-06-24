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
			
			if(info.hasOwnProperty("side") && info["side"]==0)
			{
				var kk:int=0;
			}
			var newCard:CardData = new CardData(info);
			var oldCard:CardData = FindCard(info["realID"]);
			if(oldCard)
			{
				oldCard.Update(info);
			}
			else
			{
				_cardArr[newCard.RealID]=newCard;
			}
			CardDiffData.UpdateCard(newCard);
			
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
				if(card.Side!=0)
					continue;
				if( card.Slot == BattleFieldType.MyResourceSlotId ||
					card.Slot == BattleFieldType.YouResourceSlotId)
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

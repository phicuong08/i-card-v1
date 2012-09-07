//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	import ICard.assist.server.CardType;
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
			var newCard:CardData = FindCard(info["realID"]);
			if(newCard==null)
			{
				var cardInfo:Object =CardType.CreateCardInfo(info["cardID"]);
				newCard = new CardData(cardInfo);
				_cardArr[info["realID"]]=newCard;
			}
			newCard.Update(info);
			CardDiffData.UpdateCard(newCard);
			
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
		public function getActiveCardOnSlot(costLimit:int,fillArr:Array):void{
			for each( var card:CardData in _cardArr)
			{
				if(card.IsActive()==false)
					continue;
				if(card.Cost>costLimit)
					continue;
				var bAdd:Boolean = false;
				switch(card.Slot)
				{
					case BattleFieldType.MyHandSlotId:
						bAdd = (card.Type==CardType.SkillType || card.Type==CardType.TaskType)?true:false;
						break;
					case BattleFieldType.MyFightSlotId:
						bAdd = true;
						break;
					case BattleFieldType.MyEquipSlotId:
						bAdd = (card.Type==CardType.WeaponType)?true:false;
						break;
				}
				if(bAdd)
					fillArr.push(card.RealID);
			}
		}
		public function getCardOnSlot(slotArr:Array,fillArr:Array):void{
			for each( var card:CardData in _cardArr)
			{
				for each( var slot:int in slotArr)
				{
					if(card.Slot == slot)
					{
						fillArr.push(card.RealID);
						break;
					}
				}
			}
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

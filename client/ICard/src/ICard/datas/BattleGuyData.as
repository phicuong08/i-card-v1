//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.card.*;
	import ICard.logic.AbilityHelper;
	
	import flash.utils.*;
	public class BattleGuyData {
		private var _cardArr:Dictionary;	
		private var _resNum:int;
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
		
		public function set ResNum(val:int):void{
			_resNum = val;
		}
		
		public function get ResNum():int{
			return _resNum;
		}
		public function getAttachCard(attachTo:int,fillArr:Array):void{
			for each( var card:CardData in _cardArr)
			{
				if(card.Slot != BattleFieldType.AttachSlotId)
					continue;
				if(card.AttachTo ==attachTo)
					fillArr.push(card);
			}
		}
		public function getActiveCardOnSlot(costLimit:int,fillArr:Array):void{
			for each( var card:CardData in _cardArr)
			{
				if(card.IsActive()==false)
					continue;
				var bAdd:Boolean = false;
				switch(card.Slot)
				{
					case BattleFieldType.HandSlotId:
						bAdd = (card.Cost<=costLimit)?true:false;
						break;
					case BattleFieldType.FightSlotId:
						bAdd = true;
						break;
					case BattleFieldType.EquipSlotId:
						bAdd = (card.Type==CardType.WeaponType)?true:false;
						break;
				}
				if(bAdd)
					fillArr.push(card);
			}
		}
		public function getCardOnSlot(slotArr:Array,fillArr:Array):void{
			for each( var card:CardData in _cardArr)
			{
				for each( var slot:int in slotArr)
				{
					if(card.Slot == slot)
					{
						fillArr.push(card);
						break;
					}
				}
			}
		}
		
	}
}//package com.assist.data.mission 

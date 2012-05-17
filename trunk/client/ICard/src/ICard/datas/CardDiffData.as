//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.card.*;
	
	import flash.utils.*;
	public class CardDiffData {
		private static var _cardOld:Dictionary;
		private static var _cardNew:Dictionary;

		
		public static function init():void{
			if(_cardOld==null)
			{
				_cardOld = new Dictionary
			}
			if(_cardNew==null)
			{
				_cardNew = new Dictionary
			}
			
		}
		public static function Empty():void{
			_cardOld = new Dictionary;
			_cardNew = new Dictionary;
		}
			
		
		public static function UpdateCard(oldCard:CardData,newCard:CardData):void{
			
			if(oldCard)
				_cardOld[oldCard.RealID] = oldCard;
			if(newCard)
				_cardNew[newCard.RealID] = newCard;
		}
		public static function PopCard():Array{
			
			var cardInfo:Array;
			for each( var card:CardData in _cardNew)
			{
				cardInfo = new Array;
				cardInfo[0] = _cardOld[card.RealID];
				cardInfo[1] = card;
				delete _cardOld[card.RealID];
				delete _cardNew[card.RealID];
			}
			return cardInfo;
		}

		public static function IsSlotDiff(oldCard:CardData,newCard:CardData):Boolean{
			if(oldCard==null || newCard==null)
				return false;
			return (oldCard.Slot!=newCard.Slot);
		}
		public static function IsAttrDiff(oldCard:CardData,newCard:CardData):Boolean{
			if(oldCard==null || newCard==null)
				return false;
			if(oldCard.HP!=newCard.HP)
				return true;
			else if(oldCard.Atk!=newCard.Atk)
				return true;
			else if(oldCard.Def!=newCard.Def)
				return true;
			else if(oldCard.Side!=newCard.Side)
				return true;
			return false;
		}

		public static function IsSideDiff(oldCard:CardData,newCard:CardData):Boolean{
			if(oldCard==null || newCard==null)
				return false;
			return (oldCard.Side!=newCard.Side);		
		}
		public static function IsTurnDiff(oldCard:CardData,newCard:CardData):Boolean{
			if(oldCard==null || newCard==null)
				return false;
			return (oldCard.Turn!=newCard.Turn);		
		}
	}
	//var _local1:* = CardDiffData.init();

}//package com.assist.data.mission 

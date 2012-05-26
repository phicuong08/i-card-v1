//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.card.*;
	
	import flash.utils.*;
	public class CardDiffData {
		private static var _cardDifArr:Array;

		
		public static function init():void{
			if(_cardDifArr==null)
			{
				_cardDifArr = new Array
			}
			
		}
		public static function Empty():void{
			_cardDifArr = new Array;
		}
		
			
		
		public static function UpdateCard(newCard:CardData):void{
			for each(var cardArr:Array in _cardDifArr)
			{
				var card:CardData = cardArr[0] as CardData;
				if(card.RealID ==newCard.RealID) //exist old card 
				{
					cardArr[0] = cardArr[1];
					cardArr[1] = newCard;
					return;
				}
			}
			var oldCard:CardData = new CardData(new Object);
			oldCard.Clone(newCard);
			
			var diff:Array = new Array;
			diff[0] = oldCard;
			diff[1] = newCard;
			_cardDifArr.push(diff);
		}
		
		public static function PopCard():Array{
			return _cardDifArr.pop();
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

//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
	
			public class BattleGuyData {
					private var _cardArr:Dictionary;		
					public function BattleGuyData():void{
							_cardArr = new Dictionary;
					}
					public function InitBattle(cards:Array):void{
							for each( var cardInfo:Object in cards) 
							{
									var newCard:CardData = new CardData(cardInfo["realID"],cardInfo["cardID"],
																					cardInf["slot"]);
									hpAdd = hpAdd + buf.HpAdd;
							}
					}
    }
}//package com.assist.data.mission 

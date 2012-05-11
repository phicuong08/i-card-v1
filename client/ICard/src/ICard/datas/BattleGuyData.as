//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.datas {
			import ICard.assist.view.controls.BattleFieldType;
			
			public class BattleGuyData {
					private var _cardArr:Dictionary;		
					public function BattleGuyData():void{
							_cardArr = new Dictionary;
					}
					
					public function AddCards(cards:Array):void{
							for each( var cardInfo:Object in cards) 
							{
									var newCard:CardData = new CardData(cardInfo["realID"],cardInfo["cardID"],
																					cardInf["slot"]);
									AddCard(newCard);
							}
					}
					
					public function SetCardSlot(realID:int,slot:int):Boolean{
							if(!_cardArr[realID])
									return false;
							_cardArr[realID]._slot = slot;
					}
					
					private function AddCard(newCard:CardData):void{
							_cardArr[newCard._realID]=newCard;
					}
					
					public function UpdateCard(realID:int,info:Object):void{
							if(_cardArr[realID])
									_cardArr[realID].format(info);
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

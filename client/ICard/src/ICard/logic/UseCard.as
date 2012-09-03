//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.Dictionary;

	public class UseCard {
		
		public static function ResEnough(card:CardData,resVal:int):Boolean{
			var useInfo:Array = CardType.UseCardInfo(card.CardID);
			if(useInfo==null)
			{
				return (card.Cost<=resVal);
			}
			return (resVal >= useInfo[1]);
		}
		
		public static function Is2ResAble(card:CardData):Boolean{
			return (card.Slot == BattleFieldType.MyHandSlotId);
		}
				
		public static function IsCastAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyHandSlotId)
				return false;
			if(card.Type != CardType.SkillType)
				return false;
			return (card.Cost<= resVal);
		}
		
		public static function Is2FightAble(card:CardData,resVal:int):Boolean{
			if(card.Side!=0)
				return false;
			if(card.Slot != BattleFieldType.MyEquipSlotId &&
				card.Slot != BattleFieldType.MyFightSlotId)
				return false;
			if(card.Type == CardType.DefType ||
				card.Type == CardType.SoldierType)
				return true;
			return UseAble(card,resVal);
		}
		public static function Is2EnterAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyHandSlotId)
				return false;
			var cardType:int =card.Type;
			if(cardType != CardType.DefType &&
				cardType != CardType.WeaponType &&
				cardType != CardType.SoldierType)
				return false;
			return (card.Cost<=resVal);
		}
		
		public static function CopyData(fillCard:Object,card:CardData):void{
			if(card==null)
			{
				return;
			}
			fillCard["realID"] = card.RealID;
			fillCard["cardID"] = card.CardID;
			if(card.CardID>10000){
				fillCard["hp"] = card.HP;
				fillCard["atk"] = card.Atk;
				fillCard["def"] = card.Def;		
				fillCard["cost"] = card.Cost;
			}

			fillCard["side"] = card.Side;
			fillCard["turn"] = card.Turn;
			fillCard["slot"] = card.Slot;
		}
		
		public static function genMenuFlag(card:CardData,state:int,resNum:int):Object{
			var flagArr:Object = new Object;
			flagArr["res"] = (state==BattleStage.state_play_res)?Is2ResAble(card):false;                             //��Դ
			flagArr["enter"] = Is2EnterAble(card,resNum);  //��
			flagArr["fight"] = (state==BattleStage.state_play_card)?Is2FightAble(card,resNum):false;  //ս��  
			flagArr["cast"] = (state==BattleStage.state_play_card)?IsCastAble(card,resNum):false; //ʩ��
			return flagArr;
		}
		
		public static function IsCast2MyHero(cardID:int):Boolean{
			var info:Object = CardType.UseCardInfo(cardID);
			if(info==null)
				return false;
			return (info[2]>0);
		}
		public static function IsCast2MySoldier(cardID:int):Boolean{
			var info:Object = CardType.UseCardInfo(cardID);
			if(info==null)
				return false;
			return (info[3]>0);
		}
		public static function IsCast2YourHero(cardID:int):Boolean{
			var info:Object = CardType.UseCardInfo(cardID);
			if(info==null)
				return false;
			return (info[4]>0);
		}
		public static function IsCast2YourSoldier(cardID:int):Boolean{
			var info:Object = CardType.UseCardInfo(cardID);
			if(info==null)
				return false;
			return (info[5]>0);
		}
		public static function getCastTargetNum(cardID:int):int{
			var info:Object = CardType.UseCardInfo(cardID);
			if(info==null)
				return 0;
			return info[1];
		}
		public static function  getType(cardID:int):int{
				var ret:int=0;
				var typeId:int = cardID/1000;
				switch(typeId)
				{
				case 30:
					ret = CardType.WeaponType;
					break;
				case 31:
					ret = CardType.DefType;
					break;
				case 21:
				case 22:
				case 23:
					ret = CardType.SoldierType;
					break;
				case 20:
					ret = CardType.HeroType;
					break;
				case 50:
					ret = CardType.SkillType;
					break;
				case 40:
					ret = CardType.TaskType;
					break;
			}
			return ret;
		}	
		
		public static function UseAble(card:CardData,resVal:int):Boolean{
			if(ResEnough(card,resVal)==false)
			{
				return false;
			}
			switch(card.Type)
			{
				case CardType.HeroType:
				{
					if(card.Slot ==BattleFieldType.MyHeroSlotId &&
						card.Turn == false)
						return true;
				}
					break;
				case CardType.SoldierType:
				{
					if(card.Slot ==BattleFieldType.MyFightSlotId &&
						card.Turn == false)
						return true;
				}
					break;
				case CardType.SkillType:
				{
					if(card.Slot ==BattleFieldType.MyHandSlotId)
						return true;
				}
					break;
				case CardType.WeaponType:
				case CardType.DefType:
				{
					if(card.Slot ==BattleFieldType.YouEquipSlotId &&
						card.Turn == false)
						return true;
				}
					break;
				case CardType.TaskType:
				{
					if((card.Slot ==BattleFieldType.MyHandSlotId ||card.Slot ==BattleFieldType.MyResourceSlotId)&&
						card.Turn == false)
						return true;
				}
					break;
			}
			return false;
		}
		
	}
}//package com.assist.data.mission 

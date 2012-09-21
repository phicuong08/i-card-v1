//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	
	import flash.utils.Dictionary;

	public class UseCard {
		
		public static function Is2ResAble(card:CardData):Boolean{
			return (card.Slot == BattleFieldType.HandSlotId);
		}
				
		public static function IsCastAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.HandSlotId)
				return false;
			if(card.Type != CardType.SkillType)
				return false;
			return (card.Cost<= resVal);
		}
		
		public static function Is2FightAble(card:CardData,resVal:int,allyFightable:Boolean):Boolean{
			if(card.Side!=0)
				return false;
			if(card.Slot != BattleFieldType.EquipSlotId &&
				card.Slot != BattleFieldType.FightSlotId)
				return false;
			if(card.Type == CardType.SoldierType)
				return allyFightable;
			if(card.Type == CardType.DefType )
				return true;
			return UseAble(card,resVal);
		}
		public static function Is2EnterAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.HandSlotId)
				return false;
			var cardType:int =card.Type;
			if(cardType != CardType.DefType &&
				cardType != CardType.WeaponType &&
				cardType != CardType.SoldierType&&
				cardType != CardType.SupportType)
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
		
		public static function genMenuFlag(card:CardData,state:int,resNum:int,allyFightable:Boolean):Object{
			var flagArr:Object = new Object;
			flagArr["res"] = (state==BattleStage.state_play_res)?Is2ResAble(card):false;                             //��Դ
			flagArr["enter"] = (state==BattleStage.state_play_card)?Is2EnterAble(card,resNum):false;  //��
			flagArr["fight"] = (state==BattleStage.state_play_card)?Is2FightAble(card,resNum,allyFightable):false;  //ս��  
			flagArr["cast"] = (state==BattleStage.state_play_card)?IsCastAble(card,resNum):false; //ʩ��
			return flagArr;
		}
		
		public static function IsCast2MyHero(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_MYHERO);
		}
		public static function IsCast2MySoldier(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_MYSOLDIER);
		}
		public static function IsCast2YourHero(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_YOURHERO);
		}
		public static function IsCast2YourSoldier(cardID:int):Boolean{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return false;
			return ability.IsWhichMatch(CardAbility.WHICH_YOURSOLDIER);
		}
		public static function getCastTargetNum(cardID:int):int{
			var ability:CardAbility = CardAbilityDB.getCardAbility(cardID*10);
			if(ability==null)
				return 0;
			return ability.targetNum;
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
				case 60:
					ret = CardType.SupportType;
					break;
			}
			return ret;
		}	
		
		public static function UseAble(card:CardData,resVal:int):Boolean{
			if(card.IsUseResEnough(resVal)==false)
			{
				return false;
			}
			switch(card.Type)
			{
				case CardType.HeroType:
				{
					if(card.Slot ==BattleFieldType.HeroSlotId &&
						card.Turn == false)
						return true;
				}
					break;
				case CardType.SoldierType:
				{
					if(card.Slot ==BattleFieldType.FightSlotId &&
						card.Turn == false)
						return true;
				}
					break;
				case CardType.SkillType:
				{
					if(card.Slot ==BattleFieldType.HandSlotId)
						return true;
				}
					break;
				case CardType.WeaponType:
				case CardType.DefType:
				{
					if(card.Slot ==BattleFieldType.EquipSlotId &&
						card.Turn == false)
						return true;
				}
					break;
				case CardType.TaskType:
				{
					if((card.Slot ==BattleFieldType.HandSlotId ||card.Slot ==BattleFieldType.ResourceSlotId)&&
						card.Turn == false)
						return true;
				}
					break;
			}
			return false;
		}
		
	}
}//package com.assist.data.mission 

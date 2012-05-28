//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.logic {
	import ICard.SFSMod.*;
	import ICard.assist.server.CardType;
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.datas.*;
	import ICard.datas.card.*;
	public class UseCard {
		
		public static function ResEnough(card:CardData,resVal:int):Boolean{
			var useInfo:Array = CardType.UseCardInfo(card.CardID);
			if(useInfo==false)
				return true;
			return (resVal >= useInfo[1]);
		}
		public static function Card2FightSlot(card:CardData,mod:Mod_Battle):Boolean{
			var ret:Boolean=false;
			switch(card.Type)
			{
				case CardType.SoldierType:
				{
					mod.QueryUpdateCard(card.RealID,BattleFieldType.MyFightSlotId);
					ret = true;
				}
					break;
				case CardType.WeaponType:
				case CardType.DefType:
				{
					mod.QueryUpdateCard(card.RealID,BattleFieldType.MyEquipSlotId);
					ret = true;
				}
					break;
			}
			return ret;
		}
		public static function Is2ResAble(card:CardData):Boolean{
			return (card.Slot == BattleFieldType.MyHandSlotId);
		}
		public static function IsTurnAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyHeroSlotId)
				return false;
			if( card.Turn==0)
				return false;
			return ResEnough(card,resVal);
		}
		
		public static function IsCastAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyHandSlotId)
				return false;
			if(card.Type != CardType.SkillType)
				return false;
			return (card.Cost<= resVal);
		}
		public static function IsTaskAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyResourceSlotId)
				return false;
			return ResEnough(card,resVal);
		}
		public static function Is2FightAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyEquipSlotId ||
				card.Slot != BattleFieldType.MyFightSlotId)
				return false;
			if(card.Side==false)
				return false;
			return UseAble(card,resVal);
		}
		public static function Is2EnterAble(card:CardData,resVal:int):Boolean{
			if(card.Slot != BattleFieldType.MyHandSlotId)
				return false;
			return (card.Cost<=resVal);
		}
		public static function UseAble(card:CardData,resVal:int):Boolean{
			if(ResEnough(card,resVal)==false)
				return false;
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

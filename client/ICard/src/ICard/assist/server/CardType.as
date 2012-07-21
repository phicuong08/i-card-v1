//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {
	
	public class CardType {
		
		public static const HeroType:int = 0;
		public static const SoldierType:int = 1;
		public static const WeaponType:int = 2;
		public static const DefType:int = 3;
		public static const SkillType:int = 4;
		public static const TaskType:int = 5;
		
		
		private static var _HeroCards:Object = null;
		private static var _SoldierCards:Object = null;
		private static var _WeaponCards:Object = null;
		private static var _DefCards:Object = null;
		private static var _SkillCards:Object = null;
		private static var _TaskCards:Object = null;
		private static var _UseCard:Object = null;
		private static var _CardAbility:Object = null;
		
		public static function get CardAbility():Object{
			if (_CardAbility == null){
				throw (new Error("还未赋值！"));
			};
			return (_CardAbility);
		}
		public static function set CardAbility(_arg1:Object):void{
			if (_CardAbility != null){
				throw (new Error("非法赋值"));
			};
			_CardAbility = _arg1;
		}
		public static function CardAbilityInfo(id:int):Array{
			return _UseCard[id];
		}
		
		public static function get HeroCards():Object{
			if (_HeroCards == null){
				throw (new Error("还未赋值！"));
			};
			return (_HeroCards);
		}
		public static function set HeroCards(_arg1:Object):void{
			if (_HeroCards != null){
				throw (new Error("非法赋值"));
			};
			_HeroCards = _arg1;
		}
		public static function get SoldierCards():Object{
			if (_SoldierCards == null){
				throw (new Error("还未赋值！"));
			};
			return (_SoldierCards);
		}
		public static function set SoldierCards(_arg1:Object):void{
			if (_SoldierCards != null){
				throw (new Error("非法赋值"));
			};
			_SoldierCards = _arg1;
		}
		public static function get WeaponCards():Object{
			if (_WeaponCards == null){
				throw (new Error("还未赋值！"));
			};
			return (_WeaponCards);
		}
		public static function set WeaponCards(_arg1:Object):void{
			if (_WeaponCards != null){
				throw (new Error("非法赋值"));
			};
			_WeaponCards = _arg1;
		}
		public static function get DefCards():Object{
			if (_DefCards == null){
				throw (new Error("还未赋值！"));
			};
			return (_DefCards);
		}
		public static function set DefCards(_arg1:Object):void{
			if (_DefCards != null){
				throw (new Error("非法赋值"));
			};
			_DefCards = _arg1;
		}
		public static function get SkillCards():Object{
			if (_SkillCards == null){
				throw (new Error("还未赋值！"));
			};
			return (_SkillCards);
		}
		public static function set SkillCards(_arg1:Object):void{
			if (_SkillCards != null){
				throw (new Error("非法赋值"));
			};
			_SkillCards = _arg1;
		}
		public static function get TaskCards():Object{
			if (_TaskCards == null){
				throw (new Error("还未赋值！"));
			};
			return (_TaskCards);
		}
		public static function set TaskCards(_arg1:Object):void{
			if (_TaskCards != null){
				throw (new Error("非法赋值"));
			};
			_TaskCards = _arg1;
		}
			
		public static function UseCardInfo(id:int):Array{
				return _UseCard[id];
		}
		
		private static function CreateWeaponCardInfo(id:int):Object{
			var cardInfo:Array = _WeaponCards[id];
			if(!cardInfo)
				return null;
			var card:Object = new Object;
			card["cardID"] = cardInfo[0];
			card["title"] = cardInfo[1];
			card["camp"] = cardInfo[2];
			card["race"]= cardInfo[3];
			card["cost"]=cardInfo[4];
			card["turncost"]=cardInfo[5];
			card["atk"]=cardInfo[6];
			card["detail"]=cardInfo[7];
			return card;
		}
		private static function CreateDefCardInfo(id:int):Object{
			var cardInfo:Array = _DefCards[id];
			if(!cardInfo)
				return null;
			var card:Object = new Object;
			card["cardID"] = cardInfo[0];
			card["title"] = cardInfo[1];
			card["camp"] = cardInfo[2];
			card["race"]= cardInfo[3];
			card["cost"]=cardInfo[4];
			card["def"]=cardInfo[5];
			card["detail"]=cardInfo[6];
			return card;
		}
		private static function CreateSoldierCardInfo(id:int):Object{
			var cardInfo:Array = _SoldierCards[id];
			if(!cardInfo)
				return null;
			var card:Object = new Object;
			card["cardID"] = cardInfo[0];
			card["title"] = cardInfo[1];
			card["camp"] = cardInfo[2];
			card["race"]= cardInfo[3];
			card["cost"]=cardInfo[4];
			card["hp"]=cardInfo[5];
			card["atk"]=cardInfo[6];
			card["detail"]=cardInfo[7];
			return card;
		}
		private static function CreateHeroCardInfo(id:int):Object{
			var cardInfo:Array = _HeroCards[id];
			if(!cardInfo)
				return null;
			var card:Object = new Object;
			card["cardID"] = cardInfo[0];
			card["title"] = cardInfo[1];
			card["camp"] = cardInfo[2];
			card["race"]= cardInfo[3];
			card["cost"]=cardInfo[4];
			card["hp"]=cardInfo[5];
			card["detail"]=cardInfo[6];
			return card;
		}
		private static function CreateUnKnowCardInfo(id:int):Object{
			var card:Object = new Object;
			card["cardID"] = id;
			return card;
		}
		private static function CreateSkillCardInfo(id:int):Object{
			var cardInfo:Array = _SkillCards[id];
			if(!cardInfo)
				return null;
			var card:Object = new Object;
			card["cardID"] = cardInfo[0];
			card["title"] = cardInfo[1];
			card["camp"] = cardInfo[2];
			card["race"]= cardInfo[3];
			card["cost"]=cardInfo[4];
			card["detail"]=cardInfo[5];
			return card;
		}
		private static function CreateTaskCardInfo(id:int):Object{
			var cardInfo:Array = _TaskCards[id];
			if(!cardInfo)
				return null;
			var card:Object = new Object;
			card["cardID"] = cardInfo[0];
			card["title"] = cardInfo[1];
			card["camp"] = cardInfo[2];
			card["race"]= cardInfo[3];
			card["cost"]=cardInfo[4];
			card["detail"]=cardInfo[5];
			return card;
		}
		
		public static function CreateCardInfo(id:int):Object{
			var typeId:int = id/1000;
			var cardInfo:Object;
			var cardGroup:Object;
			switch(typeId)
			{
				case 0:
					cardInfo = CreateUnKnowCardInfo(id);
					break;
				case 30:
					cardInfo = CreateWeaponCardInfo(id);
					break;
				case 31:
					cardInfo = CreateDefCardInfo(id);
					break;
				case 21:
				case 22:
				case 23:
					cardInfo = CreateSoldierCardInfo(id);
					break;
				case 20:
					cardInfo = CreateHeroCardInfo(id);
					break;
				case 50:
					cardInfo = CreateSkillCardInfo(id);
					break;
				case 40:
					cardInfo = CreateTaskCardInfo(id);
					break;
				default:
					return null;
			}
			return cardInfo;
		}
		
	}
}//package com.assist.server 

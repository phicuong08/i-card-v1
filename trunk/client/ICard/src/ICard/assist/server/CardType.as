//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {
	
	public class CardType {
		
		public static const HeroType = 0;
		public static const SoldierType = 1;
		public static const WeaponType = 2;
		public static const DefType = 3;
		public static const SkillType = 4;
		public static const TaskType = 5;
		
		private static var _HeroCards:Object = null;
		private static var _SoldierCards:Object = null;
		private static var _WeaponCards:Object = null;
		private static var _DefCards:Object = null;
		private static var _SkillCards:Object = null;
		private static var _TaskCards:Object = null;
		private static var _UseCard:Object = null;
		
		public static function get UseCard():Object{
			if (_UseCard == null){
				throw (new Error("还未赋值！"));
			};
			return (_UseCard);
		}
		public static function set UseCard(_arg1:Object):void{
			if (_UseCard != null){
				throw (new Error("非法赋值"));
			};
			_UseCard = _arg1;
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
		public static function GetCardBattleInfo(id:int):Object{
			var cardInfo:Array = GetCardInfo(id);
			var battleInfo:Object = {};
			if(cardInfo==null)
				return null;
			var typeId:int = cardInfo[0];
			battleInfo["id"] = cardInfo[0];
			battleInfo["cost"] =cardInfo[4];
			switch(typeId)
			{
				case 30:
					battleInfo["atk"]= cardInfo[6];
					battleInfo["turncost"]= cardInfo[5];
					break;
				case 31:
					battleInfo["def"] =cardInfo[5];
					break;
				case 21:
				case 22:
				case 23:
					battleInfo["atk"]= cardInfo[6];
					battleInfo["hp"]= cardInfo[5];
					break;
				case 20:
					battleInfo["hp"]= cardInfo[5];
					break;
			}
			return battleInfo;
		}
		
		public static function UseCardInfo(id:int):Array{
				return _UseCard[id];
		}
		
		public static function GetCardInfo(id:int):Array{
			var typeId:int = id/1000;
			var cardGroup:Object;
			switch(typeId)
			{
				case 30:
					cardGroup = _WeaponCards;
					break;
				case 31:
					cardGroup = _DefCards;
					break;
				case 21:
				case 22:
				case 23:
					cardGroup = _SoldierCards;
					break;
				case 20:
					cardGroup = _HeroCards;
					break;
				case 50:
					cardGroup = _SkillCards;
					break;
				case 40:
					cardGroup = _TaskCards;
					break;
				default:
					return null;
			}
			return cardGroup[id];
		}
		
	}
}//package com.assist.server 

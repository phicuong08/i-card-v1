//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {

    public class CardType {
    
        private static var _HeroCards:Object = null;
		private static var _SoldierCards:Object = null;
		private static var _WeaponCards:Object = null;
		private static var _DefCards:Object = null;
		private static var _SkillCards:Object = null;
		private static var _TaskCards:Object = null;

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
		
		public static function GetCardInfo(id:int):Object{
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
			}
			return cardGroup[id];
		}

    }
}//package com.assist.server 

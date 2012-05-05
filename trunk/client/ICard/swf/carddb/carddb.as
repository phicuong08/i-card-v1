package {
    import flash.display.*;
	import flash.utils.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class carddb extends MovieClip implements ICardDB{
		public static const _title_x:int = 60;
		public static const _title_y:int = 20;
		public static const _cost_x = 15;
		public static const _cost_y = 6;
		public static const _hp_x = 100;
		public static const _hp_y = 120;
		public static const _at_x = 18;
		public static const _at_y = 120;
        public function carddb(){
			//var cardInfo:Array = [21001,"血爪"           ,"中立",   "DPS",   1,   2,       1,     "不可被指定"];
			//var card1:MovieClip =CreateCard(cardInfo);
			
			
			//var card1:MovieClip = CreateCard(cardInfo);
			//var card1:MovieClip = CreateHeroCard("c_20005",26);
			//var card1:MovieClip = CreateSoldierCard("c_20005",26,8,7);
			//var card1:MovieClip = CreateTaskCard("c_40010");
			//var card1:MovieClip = CreateSkillCard("c_50009");
			//var card1:MovieClip = CreateEquipCard("c_31007",3,2);
			//var card1:MovieClip = CreateWeaponCard("c_30007",3,2,1);
			//addChild(card1);

		}
		
		public function CreateCard(info:Array):MovieClip{
			var typeId:int = info[0]/1000;
			var cardMC:MovieClip;
			var title:String = "c_" + info[0].toString();
			switch(typeId)
			{
				case 30:
					cardMC = CreateWeaponCard(title,info[4],info[5],info[6]);
					break;
				case 31:
					cardMC = CreateEquipCard(title,info[4],info[5]);
					break;
				case 21:
				case 22:
				case 23:
					cardMC = CreateSoldierCard(title,info[4],info[5],info[6]);
					break;
				case 20:
					cardMC = CreateHeroCard(title,info[5]);
					break;
				case 50:
					cardMC = CreateSkillCard(title,info[4]);
					break;
				case 40:
					cardMC = CreateTaskCard(title);
					break;
			}
			return cardMC;
		}
		public function CreateSkillCard(title:String,cost:int):MovieClip{
			var skillMC:MovieClip = new card_skill;
			skillMC.addChild(CreateTitleMC(title));
			skillMC.addChild(CreateCostMC(cost));
			return skillMC;
			
		}
		
		public function CreateTaskCard(title:String):MovieClip{
			var taskMC:MovieClip = new card_yuan;
			taskMC.addChild(CreateTitleMC(title));
			return taskMC;
			
		}
		
		public function CreateHeroCard(title:String,hp:int):MovieClip{
			var hero:MovieClip = new card_hero;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(hp));
			return hero;
			
		}
		public function CreateWeaponCard(title:String,cost:int,turncost:int,at:int):MovieClip{
			var weapon:MovieClip = new card_weapon;
			weapon.addChild(CreateTitleMC(title));
			weapon.addChild(CreateCostMC(cost));
			weapon.addChild(CreateAtMC(at));
			weapon.addChild(CreateHpMC(turncost));
			return weapon;
		}
		
		public function CreateEquipCard(title:String,cost:int,def:int):MovieClip{
			var equip:MovieClip = new card_equip;
			equip.addChild(CreateTitleMC(title));
			equip.addChild(CreateCostMC(cost));
			equip.addChild(CreateHpMC(def));
			return equip;
		}
		public function CreateSoldierCard(title:String,cost:int,hp:int,at:int):MovieClip{
			var soldier:MovieClip = new card_soldier;
			soldier.addChild(CreateTitleMC(title));
			soldier.addChild(CreateHpMC(hp));
			soldier.addChild(CreateCostMC(cost));
			soldier.addChild(CreateAtMC(at));
			return soldier;
		}
		
		private function CreateHpMC(hp:int):MovieClip{
			var hpMC:MovieClip = CreateNum(hp);
			hpMC.x = _hp_x-hpMC.width/2;
			hpMC.y = _hp_y;
			return hpMC;
		}
		
		private function CreateCostMC(cost:int):MovieClip{
			var costMC:MovieClip = CreateNum(cost);
			costMC.x = _cost_x-costMC.width/2;
			costMC.y = _cost_y;
			return costMC;
		}
		private function CreateAtMC(at:int):MovieClip{
			var atMC:MovieClip = CreateNum(at);
			atMC.x = _at_x-atMC.width/2;
			atMC.y = _at_y;
			return atMC;
		}
		private function CreateTitleMC(title:String):MovieClip{
			var classTitle:Class = getDefinitionByName(title) as Class;
			var titlePic:MovieClip = new classTitle;
			titlePic.x = _title_x +titlePic.width/20;
			titlePic.y = _title_y;
			titlePic.scaleX = .9;
			titlePic.scaleY = .9;
			return titlePic;
		}
		
		
		private function CreateNum(val:int):MovieClip{
			var valMC:MovieClip = new MovieClip;
			var lowVal:int =val%10;
			var highVal:int = val/10;
			var offSet:int = 0;
			if(highVal>0)
			{
				var classVal:Class = getDefinitionByName("num_"+highVal) as Class;
				var highPic:MovieClip = new classVal;
				valMC.addChild(highPic);
				offSet = 10;
			}
			var classVal2:Class = getDefinitionByName("num_"+lowVal) as Class;
			var lowPic:MovieClip = new classVal2;
			lowPic.x = offSet;
			valMC.addChild(lowPic);
			return valMC;
		}
		
        public function get content():MovieClip{
            return (this);
        }

    }
}//package 

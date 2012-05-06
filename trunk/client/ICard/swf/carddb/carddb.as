﻿package {
    import flash.display.*;
	import flash.utils.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class carddb extends MovieClip implements ICardDB{
		public static const _cardWidth =120;
		public static const _cardHeight = 150;
		public static const _title_x:int = 60;
		public static const _title_y:int = 20;
		public static const _cost_x = 15;
		public static const _cost_y = 6;
		public static const _hp_x = 100;
		public static const _hp_y = 120;
		public static const _at_x = 18;
		public static const _at_y = 120;
        public function carddb(){
			//var cardInfo:Array = [30001,"上古骨弓"        ,"中立","种族",   3,   2,       2,     "当你使用上古骨弓进行打击时，你的英雄在此次战斗中具有远程攻击（防御者不会对你造成战斗伤害）。"];
			//var card1:MovieClip =CreateCard(12,cardInfo);
			//card1.x = card1.width/2;
			//card1.y = card1.height/2;
			//SetAtk(card1,87);
			//addChild(card1);

		}
		public function CreateBackCard(realID:int,cardID:int=0,hp:int=0):MovieClip{
			var typeId:int = cardID/1000;
			var cardMC:MovieClip;
			var title:String = "c_" + cardID.toString();
			switch(typeId)
			{
				case 20:
					cardMC = CreateHeroBackCard(title,hp);
					break;
				default:
					cardMC = new card_back;
					cardMC.stand ="back";
					break;
			}
			cardMC.realID = realID;
			return cardMC;
		}
		public function SetHp(card:MovieClip,hp:int):Boolean{
			var index:int = 0;
			while(index < card.numChildren)
			{
				var elem0:MovieClip = (card.getChildAt(index) as MovieClip);
				if(elem0 && elem0.cardpart=="hp")
				{
					card.removeChildAt(index);
					card.addChild(CreateHpMC(hp));
					return true;
				}
				index++;
			}
			return false;
		}
		public function SetAtk(card:MovieClip,atk:int):Boolean{
			var index:int = 0;
			while(index < card.numChildren)
			{
				var elem0:MovieClip = (card.getChildAt(index) as MovieClip);
				if(elem0 && elem0.cardpart=="atk")
				{
					card.removeChildAt(index);
					card.addChild(CreateAtMC(atk));
					return true;
				}
				index++;
			}
			return false;
		}
		
		public function CreateCard(realID:int,info:Array):MovieClip{
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
			cardMC.realID = realID;
			return cardMC;
		}
		private function CreateSkillCard(title:String,cost:int):MovieClip{
			var skillMC:MovieClip = new card_skill;
			skillMC.addChild(CreateTitleMC(title));
			skillMC.addChild(CreateCostMC(cost));
			skillMC.stand ="normal";
			return skillMC;
			
		}
		
		private function CreateTaskCard(title:String):MovieClip{
			var taskMC:MovieClip = new card_yuan;
			taskMC.addChild(CreateTitleMC(title));
			hero.stand ="normal";
			return taskMC;
			
		}
		
		private function CreateHeroCard(title:String,hp:int):MovieClip{
			var hero:MovieClip = new card_hero;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(hp));
			hero.stand ="normal";
			return hero;
			
		}
		private function CreateHeroBackCard(title:String,hp:int):MovieClip{
			var hero:MovieClip = new card_back;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(hp));
			hero.stand ="back";
			return hero;
			
		}
		
		private function CreateWeaponCard(title:String,cost:int,turncost:int,at:int):MovieClip{
			var weapon:MovieClip = new card_weapon;
			weapon.addChild(CreateTitleMC(title));
			weapon.addChild(CreateCostMC(cost));
			weapon.addChild(CreateAtMC(at));
			weapon.addChild(CreateHpMC(turncost));
			weapon.stand ="normal";
			return weapon;
		}
		
		private function CreateEquipCard(title:String,cost:int,def:int):MovieClip{
			var equip:MovieClip = new card_equip;
			equip.addChild(CreateTitleMC(title));
			equip.addChild(CreateCostMC(cost));
			equip.addChild(CreateHpMC(def));
			equip.stand ="normal";
			return equip;
		}
		private function CreateSoldierCard(title:String,cost:int,hp:int,at:int):MovieClip{
			var soldier:MovieClip = new card_soldier;
			soldier.addChild(CreateTitleMC(title));
			soldier.addChild(CreateHpMC(hp));
			soldier.addChild(CreateCostMC(cost));
			soldier.addChild(CreateAtMC(at));
			soldier.stand ="normal";
			return soldier;
		}
		
		private function CreateHpMC(hp:int):MovieClip{
			var hpMC:MovieClip = CreateNum(hp);
			hpMC.x = _hp_x -hpMC.width/2 - _cardWidth/2;
			hpMC.y = _hp_y - _cardHeight/2;
			hpMC.cardpart = "hp";
			return hpMC;
		}
		
		private function CreateCostMC(cost:int):MovieClip{
			var costMC:MovieClip = CreateNum(cost);
			costMC.x = _cost_x -costMC.width/2-_cardWidth/2;
			costMC.y = _cost_y -_cardHeight/2;
			costMC.cardpart = "cost";
			return costMC;
		}
		private function CreateAtMC(at:int):MovieClip{
			var atMC:MovieClip = CreateNum(at);
			atMC.x = _at_x- atMC.width/2 -_cardWidth/2;
			atMC.y = _at_y -_cardHeight/2;
			atMC.cardpart = "atk";
			return atMC;
		}
		private function CreateTitleMC(title:String):MovieClip{
			var classTitle:Class = getDefinitionByName(title) as Class;
			var titlePic:MovieClip = new classTitle;
			titlePic.x = _title_x +titlePic.width/20 -_cardWidth/2;
			titlePic.y = _title_y -_cardHeight/2;;
			titlePic.scaleX = .9;
			titlePic.scaleY = .9;
			titlePic.cardpart = "title";
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

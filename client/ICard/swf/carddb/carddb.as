package {
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
			
			//var info:Object={realID:1,cardID:40001,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			//var card1:MovieClip =CreateCard(info);
			//card1.x = card1.width/2;
			//card1.y = card1.height/2;
			//SetAtk(card1,87);
			//addChild(card1);

		}

		public function UpdateAttr(card:MovieClip,info:Object):Boolean{
				if(card==null)
						return false;
				return true;
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
					card.addChild(CreateAtkMC(atk));
					return true;
				}
				index++;
			}
			return false;
		}
		private function CreateBackCard(info:Object):MovieClip{
			if((!info.hasOwnProperty("turn") ||info["turn"]==0)&&
			  info["cardID"]!=1)
				return null;
			var typeId:int = info["cardID"]/1000;
			var cardMC:MovieClip;
			var title:String = "c_" + info["cardID"].toString();
			switch(typeId)
			{
				case 20:
					cardMC = CreateHeroBackCard(title,info);
					break;
				default:
					cardMC = new card_back;
					break;
			}
			cardMC.realID = info["realID"];
			cardMC.turn = 1;
			return cardMC;
		}
		public function CreateCard(info:Object):MovieClip{
			var typeId:int = info["cardID"]/1000;
			trace("card turn",info["turn"]);
			var cardMC:MovieClip = CreateBackCard(info);
			if(cardMC)
				return cardMC;
				
			var title:String = "c_" + info["cardID"].toString();
			switch(typeId)
			{
				case 30:
					cardMC = CreateWeaponCard(title,info);
					break;
				case 31:
					cardMC = CreateEquipCard(title,info);
					break;
				case 21:
				case 22:
				case 23:
					cardMC = CreateSoldierCard(title,info);
					break;
				case 20:
					cardMC = CreateHeroCard(title,info);
					break;
				case 50:
					cardMC = CreateSkillCard(title,info);
					break;
				case 40:
					cardMC = CreateTaskCard(title);
					break;
			}
			cardMC.realID = info["realID"];
			cardMC.turn = 0;
			
			return cardMC;
		}
		private function CreateSkillCard(title:String,info:Object):MovieClip{
			var skillMC:MovieClip = new card_skill;
			skillMC.addChild(CreateTitleMC(title));
			skillMC.addChild(CreateCostMC(info["cost"]));
			return skillMC;
			
		}
		
		private function CreateTaskCard(title:String):MovieClip{
			var taskMC:MovieClip = new card_yuan;
			taskMC.addChild(CreateTitleMC(title));
			return taskMC;
			
		}
		
		private function CreateHeroCard(title:String,info:Object):MovieClip{
			var hero:MovieClip = new card_hero;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(info["hp"]));
			return hero;
			
		}
		private function CreateHeroBackCard(title:String,info:Object):MovieClip{
			var hero:MovieClip = new card_back;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(info["hp"]));
			return hero;
			
		}
		
		private function CreateWeaponCard(title:String,info:Object):MovieClip{
			var weapon:MovieClip = new card_weapon;
			weapon.addChild(CreateTitleMC(title));
			weapon.addChild(CreateCostMC(info["cost"]));
			weapon.addChild(CreateAtkMC(info["atk"]));
			weapon.addChild(CreateHpMC(info["turncost"]));
			return weapon;
		}
		
		private function CreateEquipCard(title:String,info:Object):MovieClip{
			var equip:MovieClip = new card_equip;
			equip.addChild(CreateTitleMC(title));
			equip.addChild(CreateCostMC(info["cost"]));
			equip.addChild(CreateHpMC(info["def"]));
			return equip;
		}
		private function CreateSoldierCard(title:String,info:Object):MovieClip{
			var soldier:MovieClip = new card_soldier;
			soldier.addChild(CreateTitleMC(title));
			soldier.addChild(CreateHpMC(info["hp"]));
			soldier.addChild(CreateCostMC(info["cost"]));
			soldier.addChild(CreateAtkMC(info["atk"]));
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
		private function CreateAtkMC(at:int):MovieClip{
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

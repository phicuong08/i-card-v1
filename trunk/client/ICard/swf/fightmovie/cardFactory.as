package {
    import flash.display.*;
	import flash.utils.*;
    import flash.text.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class cardFactory extends MovieClip{
		public static const _cardWidth =180;
		public static const _cardHeight = 225;
		public static const _title_x:int = 90;
		public static const _title_y:int = 30;
		public static const _cost_x = 22;
		public static const _cost_y = 16;
		public static const _hp_x = 150;
		public static const _hp_y = 184;
		public static const _at_x = 28;
		public static const _at_y = 184;
        public function cardFactory(){
		}

			
		public static function SetHp(card:MovieClip,hp:int):Boolean{
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
		public static function SetAtk(card:MovieClip,atk:int):Boolean{
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
		
		public static function CreateCard(info:Object):MovieClip{
			var typeId:int = info["cardID"]/1000;
			var cardMC:MovieClip;
			var title:String = "c_" + info["cardID"].toString();
			switch(typeId)
			{
				case 1:
					cardMC = new card_back;
					info["turn"] = true;
					break;
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
					if(info["turn"]==true)
					{
						cardMC = CreateHeroBackCard(title,info);
					}
					else
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
			cardMC.turn = info["turn"];
			return cardMC;
		}
		private static function CreateSkillCard(title:String,info:Object):MovieClip{
			var skillMC:MovieClip = new card_skill;
			skillMC.addChild(CreateTitleMC(title));
			skillMC.addChild(CreateCostMC(info["cost"]));
			return skillMC;
			
		}
		
		private static function CreateTaskCard(title:String):MovieClip{
			var taskMC:MovieClip = new card_yuan;
			taskMC.addChild(CreateTitleMC(title));
			return taskMC;
			
		}
		
		private static function CreateHeroCard(title:String,info:Object):MovieClip{
			var hero:MovieClip = new card_hero;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(info["hp"]));
			return hero;
			
		}
		private static function CreateHeroBackCard(title:String,info:Object):MovieClip{
			var hero:MovieClip = new card_back;
			hero.addChild(CreateTitleMC(title));
			hero.addChild(CreateHpMC(info["hp"]));
			return hero;
			
		}
		
		private static function CreateWeaponCard(title:String,info:Object):MovieClip{
			var weapon:MovieClip = new card_weapon;
			weapon.addChild(CreateTitleMC(title));
			weapon.addChild(CreateCostMC(info["cost"]));
			weapon.addChild(CreateAtkMC(info["atk"]));
			weapon.addChild(CreateHpMC(info["turncost"]));
			return weapon;
		}
		
		private static function CreateEquipCard(title:String,info:Object):MovieClip{
			var equip:MovieClip = new card_equip;
			equip.addChild(CreateTitleMC(title));
			equip.addChild(CreateCostMC(info["cost"]));
			equip.addChild(CreateHpMC(info["def"]));
			return equip;
		}
		private static function CreateSoldierCard(title:String,info:Object):MovieClip{
			var soldier:MovieClip = new card_soldier;
			soldier.addChild(CreateTitleMC(title));
			soldier.addChild(CreateHpMC(info["hp"]));
			soldier.addChild(CreateCostMC(info["cost"]));
			soldier.addChild(CreateAtkMC(info["atk"]));
			return soldier;
		}
		
		private static function CreateHpMC(hp:int):MovieClip{
			var hpMC:MovieClip = CreateNum("num_",hp);
			hpMC.x = _hp_x -hpMC.width/2 - _cardWidth/2;
			hpMC.y = _hp_y - _cardHeight/2;
			hpMC.cardpart = "hp";
			return hpMC;
		}
		
		private static function CreateCostMC(cost:int):MovieClip{
			var costMC:MovieClip = CreateNum("num_",cost);
			costMC.x = _cost_x -costMC.width/2-_cardWidth/2;
			costMC.y = _cost_y -_cardHeight/2;
			costMC.cardpart = "cost";
			return costMC;
		}
		private static function CreateAtkMC(at:int):MovieClip{
			var atMC:MovieClip = CreateNum("num_",at);
			atMC.x = _at_x- atMC.width/2 -_cardWidth/2;
			atMC.y = _at_y -_cardHeight/2;
			atMC.cardpart = "atk";
			return atMC;
		}
		private static function CreateTitleMC(title:String):MovieClip{
			var classTitle:Class = getDefinitionByName(title) as Class;
			var titlePic:MovieClip = new classTitle;
			titlePic.x = _title_x +titlePic.width/20 -_cardWidth/2;
			titlePic.y = _title_y -_cardHeight/2;;
			titlePic.cardpart = "title";
			return titlePic;
		}
		
		public static function CreateFightIcon(bEnemy:Boolean):MovieClip{
			var classVal:Class;
			if(bEnemy)
			{
				classVal = getDefinitionByName("fight_icon") as Class;
			}
			else
			{
				classVal = getDefinitionByName("help_icon") as Class;
			}
			return new classVal;
		}
			
		public static function CreateDebuf_Big(val:int):MovieClip{
			var valMC:MovieClip = new MovieClip;
			var delMC:MovieClip = CreateIcon("big_sub");	
			var numMC:MovieClip = CreateNum("big_y_",val);
			valMC.addChild(delMC);
			numMC.x = delMC.width;
			valMC.addChild(numMC);
			valMC.showVal=1;
			valMC.alpha =0;
			return valMC;
		}
		public static function CreateDebuf_Mini(val:int):MovieClip{
			var valMC:MovieClip = new MovieClip;
			var delMC:MovieClip = CreateIcon("mini_sub");	
			var numMC:MovieClip = CreateNum("mini_y_",val);
			valMC.addChild(delMC);
			numMC.x = delMC.width;
			valMC.addChild(numMC);
			valMC.showVal=1;
			valMC.alpha =0;
			return valMC;
		}
		
		public static function CreateGain_Big(val:int):MovieClip{
			var valMC:MovieClip = new MovieClip;
			var addMC:MovieClip = CreateIcon("big_add");	
			var numMC:MovieClip = CreateNum("big_g_",val);
			valMC.addChild(addMC);
			numMC.x = addMC.width;
			valMC.addChild(numMC);
			valMC.showVal=1;
			valMC.alpha =0;
			return valMC;
		}
		public static function CreateGain_Mini(val:int):MovieClip{
			var valMC:MovieClip = new MovieClip;
			var addMC:MovieClip = CreateIcon("mini_add");	
			var numMC:MovieClip = CreateNum("mini_g_",val);
			valMC.addChild(addMC);
			numMC.x = addMC.width;
			valMC.addChild(numMC);
			valMC.showVal=1;
			valMC.alpha =0;
			return valMC;
		}
		
		public static function ResultAlphaInc(cardMC:MovieClip):Boolean{
			var index:int = 0;
			var doAlpha:Boolean=false;
			while(index < cardMC.numChildren)
			{
				var elem:MovieClip = (cardMC.getChildAt(index) as MovieClip);
				if(elem && elem["showVal"]==1 && elem.alpha<80)
				{
					doAlpha = true;
					elem.alpha +=2;
					trace("here go",elem.alpha);
				}
				index++;
			}
			return doAlpha;
		}
		private static function CreateIcon( icon:String):MovieClip{
				var classVal:Class = getDefinitionByName(icon) as Class;
				var iconMC:MovieClip = new classVal;
				return iconMC;
		}
		private static function CreateNum(title:String,val:int):MovieClip{
			var valMC:MovieClip = new MovieClip;
			var lowVal:int =val%10;
			var highVal:int = val/10;
			var offSet:int = 0;
			if(highVal>0)
			{
				var classVal:Class = getDefinitionByName(title+highVal) as Class;
				var highPic:MovieClip = new classVal;
				valMC.addChild(highPic);
				offSet = 10;
			}
			var classVal2:Class = getDefinitionByName(title+lowVal) as Class;
			var lowPic:MovieClip = new classVal2;
			lowPic.x = offSet;
			valMC.addChild(lowPic);
			valMC.alpha=60;
			return valMC;
		}
    }
}//package 

package {
    import flash.display.*;
	import SlotBar;
	import HeroBar;
	import flash.utils.Dictionary;
    import ICard.assist.view.interfaces.*;
	import ICard.assist.view.controls.BattleFieldType;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class battleField extends MovieClip implements IBattleField{
		private var _slots:Array;
		private var _tip:ITip;
		public static var _AskTurnCardFunc:Function;
		public static var _AskCardToEnterFunc:Function;
		public static var _AskCardToResFunc:Function;
        public function battleField(){
			InitSlot();
			//RunTest();
			
			
		}
		private function InitSlot():void{
			_slots  = [];
			
			
			_slots[BattleFieldType.MyHandSlotId] = new MyHandBar;
			_slots[BattleFieldType.MyHandSlotId].Init(BattleFieldType.MyHandSlotId,2,650,1180);
			
			
			_slots[BattleFieldType.MyResourceSlotId] = new ResourceBar;
			_slots[BattleFieldType.MyResourceSlotId].Init(BattleFieldType.MyResourceSlotId,2,500,826);
			
			_slots[BattleFieldType.MyEquipSlotId] = new SlotBar;
			_slots[BattleFieldType.MyEquipSlotId].Init(BattleFieldType.MyEquipSlotId,2,500,856);
			
			_slots[BattleFieldType.MyFightSlotId] = new SlotBar;
			_slots[BattleFieldType.MyFightSlotId].Init(BattleFieldType.MyFightSlotId,2,350,1180);
			
			_slots[BattleFieldType.MyTombSlotId] = new SlotBar;
			_slots[BattleFieldType.MyTombSlotId].Init(BattleFieldType.MyTombSlotId,2,350,1180);
			
			_slots[BattleFieldType.MyHeroSlotId] = new HeroBar;
			_slots[BattleFieldType.MyHeroSlotId].Init(BattleFieldType.MyHeroSlotId,880,500,1180);
			
			_slots[BattleFieldType.YouHandSlotId] = new SlotBar;
			_slots[BattleFieldType.YouHandSlotId].Init(BattleFieldType.YouHandSlotId,2,-100,1180);
			
			_slots[BattleFieldType.YouResourceSlotId] = new ResourceBar;
			_slots[BattleFieldType.YouResourceSlotId].Init(BattleFieldType.YouResourceSlotId,2,50,826);
			
			_slots[BattleFieldType.YouEquipSlotId] = new SlotBar;
			_slots[BattleFieldType.YouEquipSlotId].Init(BattleFieldType.YouEquipSlotId,2,500,856);
			
			_slots[BattleFieldType.YouFightSlotId] = new SlotBar;
			_slots[BattleFieldType.YouFightSlotId].Init(BattleFieldType.YouFightSlotId,2,350,1180);
			
			_slots[BattleFieldType.YouTombSlotId] = new SlotBar;
			_slots[BattleFieldType.YouTombSlotId].Init(BattleFieldType.YouTombSlotId,2,350,1180);
			
			_slots[BattleFieldType.YouHeroSlotId] = new HeroBar;
			_slots[BattleFieldType.YouHeroSlotId].Init(BattleFieldType.YouHeroSlotId,2,350,1180);
		
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
			{
				addChild(_slots[id]);
				id++;
			}
					
			
		}
	    public function get content():MovieClip{
            return (this);
        }
    public function FindCard(realID:int):MovieClip{
    	var id:int = BattleFieldType.MyHandSlotId;
    	var card:MovieClip;
			while(id <= BattleFieldType.YouHeroSlotId)
			{
				card = _slots[id].FindCard(realID);
				if(card)
						return card;
				id++;
			}	
			return null;
    }    
		public function SetMyHero(card:MovieClip):void{
			
		}
		
		public function Add2Slot(slotId:int,cardMC:MovieClip):void{
			if(cardMC==null)
					return;
				RemoveCard(cardMC.realID);
				_slots[slotId].AddCard(cardMC);
		}
		
		 public function RemoveCard(realID:int):void{
	    	var id:int = BattleFieldType.MyHandSlotId;
	    	var card:MovieClip;
				while(id <= BattleFieldType.YouHeroSlotId)
				{
					card = _slots[id].FindCard(realID);
					if(card)
					{
							_slots[id].RemoveCard(realID);
							break;
					}
					id++;
				}	
    }    
    public function LoopFresh(myLoop:Boolean,secNum:int):void{
    
    }
		public function SideCard(info:Object):void{
				if(info==null)
						return;
				var cardMC = FindCard(info["realID"]);
				if(cardMC==null)
						return;
				battleAssis.SideCard(info["side"]==1,cardMC);
		}
		
		public function set tip(_arg1:ITip):void{
			_tip = _arg1;
		   
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
			{
				_slots[id].tip = _tip;
				id++;
			}
			
		}

		public function set AskTurnCard(arg1:Function):void{
			_AskTurnCardFunc = arg1;
		}
		public function set AskCard2FightSlot(arg1:Function):void{
			_AskCardToEnterFunc = arg1;
		}
		public function set AskCard2ResSlot(arg1:Function):void{
			_AskCardToResFunc = arg1;
		}
		public function RunTest():void{
			var index:int=1;
			var c1:MovieClip;
			while(index <8)
			{
				c1 = new c_20005;
				c1.stand ="normal";
				c1.realID = index;
				c1.tipInfo = "abc";
				Add2Slot(BattleFieldType.MyHandSlotId,c1);
				index++;
			}
	//		RemoveCard(BattleFieldType.YouResourceSlotId,3);
			
			
			index = 1;
			
			
				
			//while(index <11)
//			{
//				c1 = new c_20005;
//				c1.realId = index;
//				Add2Slot(BattleFieldType.YouFightSlotId,c1);
//				index++;
//			}
//			index = 1;
//			while(index <11)
//			{
//				c1 = new c_20005;
//				c1.realId = index;
//				Add2Slot(BattleFieldType.MyResourceSlotId,c1);
//				index++;
//			}
			
			//_slots[BattleFieldType.MyFightSlotId].PrintChild();
			
		}
    }
}//package 

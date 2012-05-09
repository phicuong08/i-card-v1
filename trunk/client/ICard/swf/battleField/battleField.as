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
			_slots[BattleFieldType.MyHeroSlotId].Init(BattleFieldType.MyHeroSlotId,878,500,1180);
			
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
		public function SetMyHero(card:MovieClip):void{
			
		}
		public function Add2Slot(slotId:int,card:MovieClip,tipInfo:String):void{
			_slots[slotId].AddCard(card,tipInfo);
		}
		public function RemoveCard(slotId:int,realID:int):void{
			_slots[slotId].RemoveCard(realID);
		}
		
		public function SideCard(slotId:int,realID:int):void{
			_slots[slotId].SideCard(realID);
		}
		
		public function set tip(_arg1:ITip):void{
		  _tip = _arg1;
		    
		  var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouHeroSlotId)
			{
				_slots[id]._tip = _tip;
				id++;
			}
			
		}

		public function RunTest():void{
			var index:int=1;
			var c1:MovieClip;
			while(index <8)
			{
				c1 = new c_20005;
				c1.stand ="normal";
				c1.realID = index;
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

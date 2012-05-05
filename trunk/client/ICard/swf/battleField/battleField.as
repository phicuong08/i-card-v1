package {
    import flash.display.*;
	import SlotBar;
	import flash.utils.Dictionary;
    import ICard.assist.view.interfaces.*;
	import ICard.assist.view.controls.BattleFieldType;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class battleField extends MovieClip implements IBattleField{
		private var _slots:Array;
		
        public function battleField(){
			//_slots  = [];
			//_slots[BattleFieldType.MyFightSlotId] = new SlotBar;
			//_slots[BattleFieldType.MyFightSlotId].x =10;
			InitSlot();
			//Add2Slot(1,CreateWeapon());
		}
		private function InitSlot():void{
			//_slots = new Object;
			_slots  = [];
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouTombSlotId)
			{
				_slots[id] = new SlotBar;
				addChild(_slots[id]);
				id++;
			}
			_slots[BattleFieldType.MyFightSlotId].x =10;
			_slots[BattleFieldType.MyFightSlotId].y =400;
		}
	    public function get content():MovieClip{
            return (this);
        }
		public function Add2Slot(slotId:int,card:MovieClip):void{
			//addChild(card);
			_slots[slotId].AddCard(card);
		}
		public function RunTest():void{
			var c1:MovieClip = new c_20005;
			Add2Slot(BattleFieldType.MyFightSlotId,c1);
		}
    }
}//package 

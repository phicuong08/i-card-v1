package {
    import flash.display.*;
	import flash.utils.Dictionary;
    import ICard.assist.view.interfaces.*;
	import ICard.assist.view.controls.BattleFieldType;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class battleField extends MovieClip implements IBattleField{
		private var _slots:Object;
		
        public function battleField(){
			InitSlot();
		}
		private function InitSlot():void{
			_slots = new Object;
			var id:int = BattleFieldType.MyHandSlotId;
			while(id <= BattleFieldType.YouTombSlotId)
			{
				_slots[id] = new SlotBar;
				id++;
			}
			this.stage.width;
			trace("stage width",stage.width,"height",stage.height);
			_slots[BattleFieldType.MyFightSlotId].x =10;
			_slots[BattleFieldType.MyFightSlotId].y =400;
			_slots[BattleFieldType.MyFightSlotId].width = 1100;
			_slots[BattleFieldType.MyFightSlotId].height =150;
		}
	    public function get content():MovieClip{
            return (this);
        }
		public function Add2Slot(slotId:int,card:MovieClip):void{
			_slots[slotId].AddCard(card);
		}
    }
}//package 

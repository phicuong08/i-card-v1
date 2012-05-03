package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class SlotBar extends MovieClip {
   

        public function SlotBar():void{
            super();
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStage);
        }
        private function addedToStage(_arg1:Event):void{
            removeEventListener(Event.ADDED_TO_STAGE, this.addedToStage);
        }
 		public function AddCard(card:MovieClip){
			this.addChild(card);
		}
    }
}//package 

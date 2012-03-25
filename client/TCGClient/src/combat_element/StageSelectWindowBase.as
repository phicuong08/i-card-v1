//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import flash.events.*;
    import spark.components.*;
    import combat_element_script.*;

    public class StageSelectWindowBase extends Group {

		public var __slot1;
        public function StageSelectWindowBase(){
            this.addEventListener(Event.ADDED_TO_STAGE, this.addToStageHandler);
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
        }
        protected function addToStageHandler(_arg1:Event):void{
            CombatConsole.getInstance().addEventListener(CombatConsole.CLEAR_ALL_SELECT_WINDOW, this.consoleClearHandler);
        }
        protected function removeFromStageHandler(_arg1:Event):void{
            CombatConsole.getInstance().removeEventListener(CombatConsole.CLEAR_ALL_SELECT_WINDOW, this.consoleClearHandler);
        }
        protected function consoleClearHandler(_arg1:Event):void{
            this.removeSelf();
        }
        public function removeSelf():void{
            dispatchEvent(new Event("removeSelf"));
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }

    }
}//package combat_element 

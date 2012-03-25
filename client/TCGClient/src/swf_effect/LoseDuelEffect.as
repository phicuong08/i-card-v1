//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import flash.events.*;
    import source_manager.*;

    public class LoseDuelEffect extends SwfEffectBase {

        public function LoseDuelEffect(){
            swfFramePersecend = 32;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("loseDuel"));
        }
        override public function removeSelf():void{
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }

    }
}//package swf_effect 

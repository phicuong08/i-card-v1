//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import flash.events.*;
    import source_manager.*;
    import flash.utils.*;
    import combat_element_script.*;

    public class HeadEffect extends SwfEffectBase {

        public function HeadEffect(){
            depth = (CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO + 350);
            swfFramePersecend = 16;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("headEffect"));
            mouseChildren = false;
            mouseEnabled = false;
        }
        override protected function enterLastFrame():void{
            effectStartTime = getTimer();
            mc.gotoAndStop(1);
        }
        public function removeListener():void{
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }

    }
}//package swf_effect 

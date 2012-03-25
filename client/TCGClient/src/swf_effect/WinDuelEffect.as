//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import flash.events.*;
    import source_manager.*;

    public class WinDuelEffect extends SwfEffectBase {

        public function WinDuelEffect(){
            swfFramePersecend = 32;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("winDuel"));
        }
        override public function removeSelf():void{
            removeEventListener(Event.ENTER_FRAME, enterFrameHandler);
        }

    }
}//package swf_effect 

//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import source_manager.*;

    public class DuelBeginEffect extends SwfEffectBase {

        public function DuelBeginEffect(){
            swfFramePersecend = 30;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("duelBeginEffect"));
        }
    }
}//package swf_effect 

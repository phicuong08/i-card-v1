//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import source_manager.*;

    public class TrainBeginEffect extends SwfEffectBase {

        public function TrainBeginEffect(){
            swfFramePersecend = 30;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("trainBeginEffect"));
        }
    }
}//package swf_effect 

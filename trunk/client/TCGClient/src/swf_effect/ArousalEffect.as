//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import source_manager.*;

    public class ArousalEffect extends SwfEffectBase {

        public function ArousalEffect(){
            swfFramePersecend = 30;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("arousalEffect"));
        }
    }
}//package swf_effect 

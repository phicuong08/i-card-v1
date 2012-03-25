//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import source_manager.*;
    import combat_element_script.*;

    public class MonsterAttackEffect extends SwfEffectBase {

        public function MonsterAttackEffect(){
            depth = (CombatStageDepthInfo.DEPTH_OF_DUEL_PALYERS_INFO + 1);
            swfFramePersecend = 30;
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("attackEffect"));
        }
    }
}//package swf_effect 

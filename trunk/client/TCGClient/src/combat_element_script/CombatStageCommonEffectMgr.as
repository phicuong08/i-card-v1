//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import combat_element.*;
    import custom_effect.*;
    import SoundSystem.*;
    import swf_effect.*;

    public class CombatStageCommonEffectMgr {

        private static var headEffect:HeadEffect;

        public static function showHeadEffect(_arg1:Boolean):void{
            if (!headEffect){
                headEffect = new HeadEffect();
                headEffect.x = 13;
                headEffect.y = 5;
                headEffect.scaleX = 1.1;
                headEffect.scaleY = 1.1;
            };
            if (_arg1){
                CombatStage.getInstance().playersInfo.userHead.mainFrame.addElement(headEffect);
            } else {
                CombatStage.getInstance().playersInfo.enemyHead.mainFrame.addElement(headEffect);
            };
        }
        public static function showCoinRotationEffect(_arg1:Boolean):void{
            var _local2:CoinRotateEffect = new CoinRotateEffect(CombatStage.getInstance(), _arg1, 584, 344);
            _local2.play();
        }
        public static function showDuelBeginEffect():void{
            SoundMgr.getInstance().playEffectSound("duel_begin");
            var _local1:DuelBeginEffect = new DuelBeginEffect();
            CombatStage.getInstance().addElement(_local1);
        }
        public static function showTrainBeginEffect():void{
            SoundMgr.getInstance().playEffectSound("duel_begin");
            var _local1:TrainBeginEffect = new TrainBeginEffect();
            CombatStage.getInstance().addElement(_local1);
        }

    }
}//package combat_element_script 

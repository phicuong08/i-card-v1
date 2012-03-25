//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import source_manager.*;
    import spark.effects.*;
    import SoundSystem.*;
    import combat_element_script.*;

    public class CombatMessageEffect extends SwfEffectBase {

        private var bmp:Bitmap;
        private var bmpFadeLastFrame:int = 6;
        private var fadeEffect:Fade;
        private var matrix:Array;
        private var sound:String;

        public function CombatMessageEffect(_arg1:String){
            var _local2:Class;
            super();
            depth = CombatStageDepthInfo.DEPTH_OF_MESSAGE_WINDOW;
            this.sound = "step";
            switch (_arg1){
                case "playerRound":
                    this.matrix = [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
                    _local2 = CombatStageSourceMgr.getInstance().getSourceClass("playerRoundText");
                    break;
                case "enemyRound":
                    this.matrix = [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0];
                    _local2 = CombatStageSourceMgr.getInstance().getSourceClass("enemyRoundText");
                    break;
                case "playerAttack":
                    _local2 = CombatStageSourceMgr.getInstance().getSourceClass("playerAttackText");
                    this.sound = "begin_attack";
                    break;
                case "enemyAttack":
                    _local2 = CombatStageSourceMgr.getInstance().getSourceClass("enemyAttackText");
                    this.sound = "begin_attack";
                    break;
                case "roundEnd":
                    this.matrix = [0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0];
                    _local2 = CombatStageSourceMgr.getInstance().getSourceClass("roundEndText");
                    this.sound = "round_end";
                    break;
            };
            this.bmp = new (_local2)();
            this.fadeEffect = new Fade(this.bmp);
            this.fadeEffect.duration = ((this.bmpFadeLastFrame / swfFramePersecend) * 1000);
            initSource(CombatStageSourceMgr.getInstance().getSourceClass("hong"));
        }
        override protected function startPlay():void{
            var _local1:ColorMatrixFilter;
            super.startPlay();
            SoundMgr.getInstance().playEffectSound(this.sound);
            if (this.matrix){
                _local1 = new ColorMatrixFilter();
                _local1.matrix = this.matrix;
                mc.filters = [_local1];
            } else {
                mc.filters = null;
            };
            addChild(this.bmp);
            this.bmp.x = ((mc.width - this.bmp.width) / 2);
            this.bmp.y = (132 - (this.bmp.height / 2));
            this.fadeEffect.alphaFrom = 0;
            this.fadeEffect.alphaTo = 1;
            this.fadeEffect.play();
        }
        override protected function enterFrameHandler(_arg1:Event):void{
            super.enterFrameHandler(_arg1);
            if (mc.currentFrame == 16){
                this.fadeEffect.alphaFrom = 1;
                this.fadeEffect.alphaTo = 0;
                this.fadeEffect.play();
            };
        }

    }
}//package swf_effect 

//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import mx.events.*;
    import custom_effect.*;

    public class GuidePrologueWindow4_2 extends GuidePrologueWindowBase {

        private var __moduleFactoryInitialized:Boolean = false;

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        override protected function creationCompleteHandler():void{
            bodyText.text = (((((((((((((((("三英战吕布之后，\n" + "董卓挟天子迁都长安，\n") + "把洛阳洗劫一空，\n") + "付之一炬。\n") + "\n") + "\n") + "十八路诸侯兵力雄厚，\n") + "无奈不能齐心。\n") + "众人各为私利，\n") + "不愿犯险。\n") + "\n") + "\n") + "因为利益的争夺，\n") + "袁绍、公孙瓒，\n") + "孙坚、刘表，\n") + "纷纷背弃盟约，\n") + "不惜殊死相争。\n");
        }
        override protected function fadeIn_effectEndHandler(_arg1:EffectEvent):void{
            super.fadeIn_effectEndHandler(_arg1);
            this.playMoveEffect();
        }
        protected function playMoveEffect():void{
            var m:* = null;
            var moveEffectEndHandler:* = null;
            moveEffectEndHandler = function (_arg1:CustomEffectEvent):void{
                m.removeEventListener(CustomEffectEvent.END, removeSelf);
                removeSelf();
            };
            m = new MoveEffect(bodyText);
            m.duration = 22000;
            m.yTo = -500;
            m.xTo = bodyText.x;
            m.play();
            m.addEventListener(CustomEffectEvent.END, moveEffectEndHandler);
        }

    }
}//package task_guide 

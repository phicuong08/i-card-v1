//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import mx.events.*;
    import custom_effect.*;

    public class GuidePrologueWindow4 extends GuidePrologueWindowBase {

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
            bodyText.text = (((((((((((((((("关羽温酒斩华雄之后，\n" + "董卓派兵死守汜水关，\n") + "十八路诸侯一时不能推进。\n") + "\n") + "另有一处关隘名曰虎牢关，\n") + "董卓亲率大军屯驻，\n") + "部将之中，\n") + "武有吕布，文有李儒，\n") + "对联军虎视眈眈。\n") + "\n") + "各路诸侯来攻虎牢关，\n") + "几次交战，\n") + "均被吕布击败。\n") + "\n") + "乱军之中，\n") + "只见吕布东西冲杀，\n") + "如入无人之境。\n");
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
            m.duration = 25000;
            m.yTo = -420;
            m.xTo = bodyText.x;
            m.play();
            m.addEventListener(CustomEffectEvent.END, moveEffectEndHandler);
        }

    }
}//package task_guide 

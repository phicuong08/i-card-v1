//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import mx.events.*;
    import custom_effect.*;

    public class GuidePrologueWindow7 extends GuidePrologueWindowBase {

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
            bodyText.text = ((((((((((((((((("董卓死后，\n" + "众多势力割据一方，\n") + "开始了长期的混战。\n") + "\n") + "\n") + "从黄巾起义开始，\n") + "张角，何进，袁绍，\n") + "本希望救世济民，\n") + "却一步一步，\n") + "把濒危的国家，\n") + "推向无底深渊。\n") + "\n") + "\n") + "乱世的序曲，\n") + "已经响彻朝野。\n") + "\n") + "破碎的山河，\n") + "究竟由谁来收拾？\n");
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
            m.duration = 35000;
            m.yTo = -600;
            m.xTo = bodyText.x;
            m.play();
            m.addEventListener(CustomEffectEvent.END, moveEffectEndHandler);
        }

    }
}//package task_guide 

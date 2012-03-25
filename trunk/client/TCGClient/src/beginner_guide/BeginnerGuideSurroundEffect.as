//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
    import custom_effect.*;

    public class BeginnerGuideSurroundEffect extends SurroundElfEffect implements IBeginnerGuideOperation {

        public function BeginnerGuideSurroundEffect(_arg1, _arg2:Number=4, _arg3:Number=0xCDEB00, _arg4:Number=0xFFFFFF, _arg5:Number=6){
            super(_arg1, _arg2, _arg3, _arg4, _arg5);
            addToWindow = TCGClient.getInstance().mainGroup;
        }
        override public function play():void{
            super.play();
            effectContainer.x = target.x;
            effectContainer.y = target.y;
            effectContainer.depth = BeginnerGuideUtil.NOTICE_WINDOW_DEPTH;
        }
        public function setInfo(_arg1:Object):void{
        }
        public function removeOperation(_arg1:Object=null):void{
            end();
        }
        public function doCmd(_arg1:Object=null){
        }

    }
}//package beginner_guide 

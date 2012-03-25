//Created by Action Script Viewer - http://www.buraks.com/asv
package swf_effect {
    import mx.core.*;
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class SwfEffectBase extends UIComponent {

        public static var SWF_EFFECT_END:String = "特效播放完毕";

        protected var mc:MovieClip;
        protected var swfFramePersecend:int = 24;
        protected var effectStartTime:Number;

        protected function initSource(_arg1):void{
            var _local2:MovieClipLoaderAsset;
            var _local3:Loader;
            if ((_arg1 is Class)){
                _local2 = new (_arg1)();
                _local3 = new Loader();
                _local3.contentLoaderInfo.addEventListener(Event.COMPLETE, this.swfLoaderComplete);
                _local3.loadBytes(_local2.movieClipData);
            } else {
                if ((_arg1 is MovieClip)){
                    this.mc = _arg1;
                    this.startPlay();
                };
            };
        }
        protected function swfLoaderComplete(_arg1:Event):void{
            (_arg1.target as LoaderInfo).removeEventListener(Event.COMPLETE, this.swfLoaderComplete);
            this.mc = (_arg1.target.loader.content as MovieClip);
            this.startPlay();
        }
        protected function startPlay():void{
            addChild(this.mc);
            this.mc.gotoAndStop(1);
            this.effectStartTime = getTimer();
            addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        protected function enterFrameHandler(_arg1:Event):void{
            var _local2:int = Math.ceil((((getTimer() - this.effectStartTime) / 1000) * this.swfFramePersecend));
            if (_local2 < 1){
                return;
            };
            if (_local2 > this.mc.totalFrames){
                this.mc.gotoAndStop(this.mc.totalFrames);
                this.enterLastFrame();
            } else {
                this.mc.gotoAndStop(_local2);
            };
        }
        protected function enterLastFrame():void{
            this.removeSelf();
            dispatchEvent(new Event(SWF_EFFECT_END));
        }
        public function removeSelf():void{
            removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }

    }
}//package swf_effect 

//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_effect {
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class CustomEffectBase extends EventDispatcher {

        protected static var FRAME_RATE:int = 60;
        private static var _shape:Shape = new Shape();

        public var isPlaying:Boolean;
        protected var effectStartTime:uint;

        public function play():void{
            this.effectStartTime = getTimer();
            this.isPlaying = true;
            _shape.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            dispatchEvent(new CustomEffectEvent(CustomEffectEvent.START));
        }
        public function end():void{
            this.isPlaying = false;
            _shape.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            dispatchEvent(new CustomEffectEvent(CustomEffectEvent.END));
        }
        public function stop():void{
            this.isPlaying = false;
            _shape.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            dispatchEvent(new CustomEffectEvent(CustomEffectEvent.STOP));
        }
        public function pause():void{
            this.isPlaying = false;
            _shape.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            dispatchEvent(new CustomEffectEvent(CustomEffectEvent.PAUSE));
        }
        public function resume():void{
            this.isPlaying = true;
            _shape.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            dispatchEvent(new CustomEffectEvent(CustomEffectEvent.RESUME));
        }
        protected function enterFrameHandler(_arg1:Event):void{
        }

    }
}//package custom_effect 

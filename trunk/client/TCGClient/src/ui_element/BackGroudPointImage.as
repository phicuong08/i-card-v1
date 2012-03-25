//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.utils.*;
    import flash.display.*;
    import flash.events.*;

    public class BackGroudPointImage extends Shape {

        protected var img:Class;

        public function BackGroudPointImage(){
            this.img = BackGroudPointImage_img;
            super();
            this.addEventListener(Event.ADDED_TO_STAGE, this.addToStageHandler);
        }
        private function addToStageHandler(_arg1:Event):void{
            this.removeEventListener(Event.ADDED_TO_STAGE, this.drawImage);
            this.drawImage();
            stage.addEventListener(Event.RESIZE, this.stageResizeHandler, false, -255);
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
        }
        private function removeFromStageHandler(_arg1:Event):void{
            stage.removeEventListener(Event.RESIZE, this.stageResizeHandler, false);
            this.removeEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
        }
        protected function stageResizeHandler(_arg1:Event=null):void{
            var t:* = null;
            var timerHandler:* = null;
            var e = _arg1;
            timerHandler = function (_arg1:TimerEvent):void{
                t.removeEventListener(TimerEvent.TIMER, timerHandler);
                t.stop();
                drawImage();
            };
            t = new Timer(100, 1);
            t.addEventListener(TimerEvent.TIMER, timerHandler);
            t.start();
        }
        public function drawImage(_arg1:Event=null):void{
            if (stage){
                this.graphics.clear();
                this.graphics.beginBitmapFill((new this.img() as Bitmap).bitmapData, null, true);
                this.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
                this.graphics.endFill();
            };
        }

    }
}//package ui_element 

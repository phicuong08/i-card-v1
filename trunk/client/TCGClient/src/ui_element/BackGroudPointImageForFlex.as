//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import flash.display.*;
    import flash.geom.*;
    import flash.events.*;
    import flash.utils.*;

    public class BackGroudPointImageForFlex extends BackGroudPointImage {

        protected var lastInfo:Object;
        protected var refreshTimer:Timer;

        public function BackGroudPointImageForFlex(){
            this.lastInfo = new Object();
            super();
            this.refreshTimer = new Timer(1500, 1);
            this.refreshTimer.addEventListener(TimerEvent.TIMER, this.timerHandler);
        }
        override public function drawImage(_arg1:Event=null):void{
            var _local2:Rectangle;
            if (((TCGClient.getInstance()) && (TCGClient.getInstance().bgMap))){
                TCGClient.getInstance().validateNow();
                _local2 = TCGClient.getInstance().bgMap.getRect(stage);
                this.doBmpFill(stage.stageWidth, stage.stageHeight, _local2, false);
            };
        }
        protected function doBmpFill(_arg1:Number, _arg2:Number, _arg3:Rectangle, _arg4:Boolean):void{
            this.graphics.clear();
            this.graphics.beginBitmapFill((new img() as Bitmap).bitmapData, null, true);
            this.graphics.drawRect(0, 0, _arg1, _arg2);
            this.graphics.drawRect(_arg3.x, _arg3.y, _arg3.width, _arg3.height);
            if (!_arg4){
                this.lastInfo.stageWidth = _arg1;
                this.lastInfo.stageHeight = _arg2;
                this.lastInfo.x = _arg3.x;
                this.lastInfo.y = _arg3.y;
                this.lastInfo.width = _arg3.width;
                this.lastInfo.height = _arg3.height;
                this.refreshTimer.reset();
                this.refreshTimer.start();
            };
            this.graphics.endFill();
        }
        protected function timerHandler(_arg1:TimerEvent):void{
            var _local2:Rectangle = TCGClient.getInstance().bgMap.getRect(stage);
            if ((((((((((((stage.stageWidth == this.lastInfo.stageWidth)) && ((stage.stageHeight == this.lastInfo.stageHeight)))) && ((this.lastInfo.x == _local2.x)))) && ((this.lastInfo.y == _local2.y)))) && ((this.lastInfo.width == _local2.width)))) && ((this.lastInfo.height == _local2.height)))){
                return;
            };
            this.doBmpFill(stage.stageWidth, stage.stageHeight, _local2, true);
        }

    }
}//package ui_element 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view {
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;

    public class FunctionOpen extends Sprite {

        private var _onMcEnd:Function;
        private var _lockMc:MovieClip;
        private var _timer:Timer;
        private var _playNum:int = 0;
        private var _stageWidth:Number = 1250;
        private var _stageHeight:Number = 650;
        private var _rect:Sprite;
        private var _black:MovieClip;

        public function FunctionOpen(){
            this._onMcEnd = new Function();
            this._timer = new Timer(20);
            super();
            this.alpha = 0;
            this.blackMc();
            this.loadFunctionOpenEffect();
            this.drawBlack();
            this._timer.addEventListener(TimerEvent.TIMER, this.mcTime);
        }
        public function set onMcEnd(_arg1:Function):void{
            this._onMcEnd = _arg1;
        }
        private function mcTime(_arg1:TimerEvent):void{
            if (this._playNum == 1){
                if (this.alpha < 1){
                    this.alpha = (this.alpha + 0.05);
                } else {
                    this._timer.stop();
                    this.startPlay();
                };
            };
            if (this._playNum == 2){
                if (this.alpha > 0){
                    this.alpha = (this.alpha - 0.08);
                } else {
                    this._playNum = 0;
                    this._timer.stop();
                    this._onMcEnd();
                };
            };
        }
        public function mcPlay():void{
            this._playNum = 1;
            this.alpha = 0;
            this._timer.start();
        }
        private function startPlay():void{
            this._lockMc.gotoAndPlay(2);
        }
        private function loadFunctionOpenEffect():void{
            var _local1:Class = FunctionBarEffect.functionOpen;
            this._lockMc = (new (_local1)() as MovieClip);
            addChild(this._lockMc);
            this._lockMc.addEventListener("finish", this.mcEnd);
        }
        private function mcEnd(_arg1:Event):void{
            this._lockMc.removeEventListener("finish", this.mcEnd);
            this._playNum = 2;
            this._timer.start();
        }
        public function structureData(_arg1:Number, _arg2:Number):void{
            this._stageWidth = _arg1;
            this._stageHeight = _arg2;
            this.drawBlack();
        }
        public function drawBlack():void{
            this._rect.graphics.beginFill(0);
            this._rect.graphics.drawRect(0, 0, this._stageWidth, this._stageHeight);
            this._rect.graphics.endFill();
            this._lockMc.x = (this._stageWidth / 2);
            this._lockMc.y = (this._stageHeight / 2);
        }
        private function blackMc():void{
            if (this._black != null){
                return;
            };
            this._black = new MovieClip();
            addChild(this._black);
            this._black.alpha = 0.5;
            this._rect = new Sprite();
            this._black.addChild(this._rect);
        }
        public function clear():void{
            this._rect.parent.removeChild(this._rect);
            this._rect = null;
            this._black.parent.removeChild(this._black);
            this._black = null;
            this._lockMc = null;
            this._timer.removeEventListener(TimerEvent.TIMER, this.mcTime);
            this._timer.stop();
            this._timer = null;
        }

    }
}//package com.assist.view 

//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.haloer.display {
    import flash.events.*;
    import flash.display.*;
    import ICard.haloer.net.*;
    import flash.utils.*;

    public class Image extends Sprite {

        public static var errorImage:BitmapData = new BitmapData(1, 1, true, 0);
        public static var loadClass:Class = Sprite;
        private static var _cacheList:Object = {};
        private static var listFadeIn:Array = [];
        private static var listCall:Array = [];
        private static var enterFrameSprite:Sprite = new Sprite();

        private var _file:File;
        private var _time:int = 0;
        private var _startTime:int = 0;
        public var url:String;
        public var onComplete:Function;

        public function Image(_arg1:String, _arg2:Boolean=false, _arg3:int=100){
            this.url = _arg1;
            this._time = _arg3;
            if (_cacheList[_arg1]){
                if ((_cacheList[_arg1] is BitmapData)){
                    addChild(new Bitmap(_cacheList[_arg1], "auto", true));
                    this.runComplete();
                } else {
                    if ((_cacheList[_arg1] is Class)){
                        addChild(new (_cacheList[_arg1])());
                        this.runComplete();
                    };
                };
            } else {
                this._file = new File();
                this._file.onComplete = this.completeHandler;
                this._file.onError = this.ioErrorHandler;
                this._file.load(_arg1);
                if (_arg2 == true){
                    this.addChild(new loadClass());
                };
            };
        }
        public static function isInCache(_arg1:String):Boolean{
            return (_cacheList.hasOwnProperty(_arg1));
        }
        private static function enterFrameImage(_arg1:Event):void{
            var _local2:Function;
            if (listCall.length > 0){
                for each (_local2 in listCall) {
                    _local2();
                };
                listCall = [];
            };
            for each (_local2 in listFadeIn) {
                _local2();
            };
        }
        public static function initImage():void{
            enterFrameSprite.addEventListener(Event.ENTER_FRAME, enterFrameImage);
        }

        public function set smoothing(_arg1:Boolean):void{
        }
        private function ioErrorHandler():void{
            this.clear();
            addChild(new Bitmap(errorImage));
            this.runComplete();
        }
        private function completeHandler():void{
            var _local3:Object;
            this.clear();
            var _local1:Loader = this._file.loader;
            addChild(_local1.content);
            var _local2:Boolean;
            if (_local1){
                _local3 = _local1.content;
                if ((_local3 is Bitmap)){
                    (_local3 as Bitmap).smoothing = true;
                    if (_cacheList[this.url] == null){
                        _cacheList[this.url] = (_local3 as Bitmap).bitmapData.clone();
                    };
                } else {
                    if (((((!((this.url.indexOf("icons/farm/") == -1))) || (!((this.url.indexOf("icons/fate/") == -1))))) && ((_cacheList[this.url] == null)))){
                        _cacheList[this.url] = (_local3.constructor as Class);
                    };
                };
            };
            this.runComplete();
        }
        private function runComplete():void{
            listCall.push(this.runCompleteCallback);
            if (this._time > 0){
                this.fadeIn();
            };
        }
        private function runCompleteCallback():void{
            if ((this.onComplete is Function) == false){
                return;
            };
            if (this.onComplete.length == 0){
                this.onComplete();
            } else {
                this.onComplete(this);
            };
        }
        private function clear():void{
            while (this.numChildren) {
                this.removeChildAt(0);
            };
        }
        private function fadeIn():void{
            this._startTime = getTimer();
            alpha = 0;
            listFadeIn.push(this.fadeInPass);
        }
        private function fadeInPass():void{
            var _local1:int = (getTimer() - this._startTime);
            this.alpha = (_local1 / this._time);
            if (this.alpha >= 1){
                this.alpha = 1;
                _local1 = listFadeIn.indexOf(this.fadeInPass);
                listFadeIn.splice(_local1, 1);
            };
        }

    }
    var _local1:* = Image.initImage();
    return (_local1);
}//package com.haloer.display 

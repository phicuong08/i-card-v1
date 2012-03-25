//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.utils.*;
    import flash.display.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.events.*;
    import mx.events.*;
    import mx.preloaders.*;
    import ui_element.*;
    import flash.filters.*;

    public class MyDownloadProgressBar extends Sprite implements IPreloaderDisplay {

        private var tipWindow:LoadingTipWindow;
        private var descTxt:TextField;
        private var percentTxt:TextField;
        private var _preloader:Sprite;
        private var ball:Bitmap;
        private var bar:Sprite;
        private var frameUp:Bitmap;
        private var frameDown:Bitmap;
        private var backGoundColor:Shape;
        private var backGroundFrame:BackGroudFrameWindow;
        private var backGroundPoint:BackGroudPointImage;
        private var drawPercent:Number = 0;
        private var realPercent:Number = 0;
        private var initHasComplete:Boolean = false;
        private var bd:BitmapData;
        private var logo:Bitmap;
        private var logoBg:Sprite;
        private var logoEffectStartTime:int = -1;
        private var logoEffectStartDelayTime:int = 2000;
        private var logoFadeInTime:int = 500;
        private var logoStayTime:int = 2000;
        private var logoFadeOutTime:int = 500;
        private var loadingBarImg:Class;
        private var ballImg:Class;
        private var frameImg:Class;
        private var logoImg:Class;

        public function MyDownloadProgressBar(){
            this.loadingBarImg = MyDownloadProgressBar_loadingBarImg;
            this.ballImg = MyDownloadProgressBar_ballImg;
            this.frameImg = MyDownloadProgressBar_frameImg;
            this.logoImg = MyDownloadProgressBar_logoImg;
            super();
        }
        public function initialize():void{
            this.backGroundPoint = new BackGroudPointImage();
            addChild(this.backGroundPoint);
            this.backGoundColor = new Shape();
            this.backGoundColor.graphics.beginFill(0);
            this.backGoundColor.graphics.drawRect(0, 0, 0x0500, 800);
            this.backGoundColor.graphics.endFill();
            addChild(this.backGoundColor);
            this.backGroundFrame = new BackGroudFrameWindow();
            addChild(this.backGroundFrame);
            this.bd = (new this.loadingBarImg() as Bitmap).bitmapData;
            this.frameUp = new this.frameImg();
            addChild(this.frameUp);
            this.frameDown = new this.frameImg();
            this.frameDown.rotation = 180;
            addChild(this.frameDown);
            this.bar = new Sprite();
            addChild(this.bar);
            this.ball = new this.ballImg();
            addChild(this.ball);
            this.tipWindow = new LoadingTipWindow();
            this.descTxt = new TextField();
            this.descTxt.defaultTextFormat = new TextFormat("宋体", 14, 0xFFFFFF);
            this.descTxt.selectable = false;
            this.descTxt.text = "...载入中...";
            addChild(this.descTxt);
            this.percentTxt = new TextField();
            this.percentTxt.defaultTextFormat = new TextFormat("宋体", 14, 0, null, null, null, null, null, "center");
            this.percentTxt.width = 30;
            this.percentTxt.height = 16;
            this.percentTxt.selectable = false;
            addChild(this.percentTxt);
            this.logoBg = new Sprite();
            addChild(this.logoBg);
            this.logoBg.graphics.beginFill(0);
            this.logoBg.graphics.drawRect(0, 300, 0x0500, 200);
            this.logoBg.graphics.endFill();
            this.logo = (new this.logoImg() as Bitmap);
            this.logo.alpha = 0;
            this.logoBg.addChild(this.logo);
            this.logo.x = ((0x0500 - this.logo.width) / 2);
            this.logo.y = ((800 - this.logo.height) / 2);
            this.logo.filters = [new GlowFilter(0xFFFFFF, 1, 20, 20, 5, 5)];
            this.logoEffectStartTime = getTimer();
        }
        public function set preloader(_arg1:Sprite):void{
            this._preloader = _arg1;
            this._preloader.addEventListener(ProgressEvent.PROGRESS, this.loadProgress);
            this._preloader.addEventListener(Event.COMPLETE, this.loadComplete);
            this._preloader.addEventListener(FlexEvent.INIT_PROGRESS, this.initProgress);
            this._preloader.addEventListener(FlexEvent.INIT_COMPLETE, this.initComplete);
            this._preloader.addEventListener(RSLEvent.RSL_PROGRESS, this.rslProgress);
            this._preloader.addEventListener(RSLEvent.RSL_COMPLETE, this.rslComplete);
            stage.addEventListener(Event.RESIZE, this.resize);
            stage.addEventListener(Event.ENTER_FRAME, this.drawLoadingProgress);
            this.resize();
        }
        private function remove():void{
            this._preloader.removeEventListener(ProgressEvent.PROGRESS, this.loadProgress);
            this._preloader.removeEventListener(Event.COMPLETE, this.loadComplete);
            this._preloader.removeEventListener(FlexEvent.INIT_PROGRESS, this.initProgress);
            this._preloader.removeEventListener(FlexEvent.INIT_COMPLETE, this.initComplete);
            this._preloader.removeEventListener(RSLEvent.RSL_PROGRESS, this.rslProgress);
            this._preloader.removeEventListener(RSLEvent.RSL_COMPLETE, this.rslComplete);
            stage.removeEventListener(Event.RESIZE, this.resize);
            stage.removeEventListener(Event.ENTER_FRAME, this.drawLoadingProgress);
        }
        private function resize(_arg1:Event=null):void{
            var _local2:Number = ((stage.stageWidth - 0x0500) / 2);
            var _local3:Number = ((stage.stageHeight - 800) / 2);
            this.backGoundColor.x = _local2;
            this.backGoundColor.y = _local3;
            this.backGroundFrame.x = _local2;
            this.backGroundFrame.y = _local3;
            this.frameUp.x = _local2;
            this.frameUp.y = (_local3 + 352);
            this.frameDown.x = (_local2 + 0x0500);
            this.frameDown.y = (_local3 + 447);
            this.bar.x = _local2;
            this.bar.y = (_local3 + 394);
            this.ball.x = (_local2 + 623);
            this.ball.y = (_local3 + 383);
            this.tipWindow.x = (_local2 + 320);
            this.tipWindow.y = (_local3 + 650);
            this.descTxt.x = (_local2 + 599);
            this.descTxt.y = (_local3 + 332);
            this.percentTxt.x = (_local2 + 626);
            this.percentTxt.y = (_local3 + 391);
            this.logoBg.x = _local2;
            this.logoBg.y = _local3;
        }
        private function drawLoadingProgress(_arg1=null):void{
            var _local2:Matrix;
            this.doLogoEffect();
            if (this.realPercent > this.drawPercent){
                this.drawPercent = (this.drawPercent + 0.01);
                this.drawPercent = ((this.drawPercent > this.realPercent)) ? this.realPercent : this.drawPercent;
                this.percentTxt.text = (int((this.drawPercent * 100)) + "%");
                _local2 = new Matrix();
                _local2.ty = 1;
                this.bar.graphics.beginBitmapFill(this.bd, _local2);
                this.bar.graphics.drawRect((640 * (1 - this.drawPercent)), 1, (this.drawPercent * 0x0500), 10);
                this.bar.graphics.endFill();
            } else {
                if (((this.initHasComplete) && ((this.logoEffectStartTime == -1)))){
                    this.remove();
                    dispatchEvent(new Event(Event.COMPLETE));
                };
            };
        }
        private function doLogoEffect():void{
            if (this.logoEffectStartTime == -1){
                return;
            };
            var _local1:int = ((getTimer() - this.logoEffectStartTime) - this.logoEffectStartDelayTime);
            if (_local1 < 0){
                return;
            };
            if (_local1 < this.logoFadeInTime){
                this.logo.alpha = (_local1 / this.logoFadeInTime);
            } else {
                if (_local1 < (this.logoFadeInTime + this.logoStayTime)){
                    this.logo.alpha = 1;
                } else {
                    if (_local1 < ((this.logoFadeInTime + this.logoFadeOutTime) + this.logoStayTime)){
                        this.logoBg.alpha = ((((this.logoFadeInTime + this.logoFadeOutTime) + this.logoStayTime) - _local1) / this.logoFadeOutTime);
                    } else {
                        this.logoEffectStartTime = -1;
                        removeChild(this.logoBg);
                        addChild(this.tipWindow);
                    };
                };
            };
        }
        private function setLoadingProgress(_arg1:Number):void{
            this.realPercent = _arg1;
        }
        private function loadProgress(_arg1:ProgressEvent):void{
            this.setLoadingProgress(((_arg1.bytesLoaded / _arg1.bytesTotal) * 0.8));
        }
        private function loadComplete(_arg1:Event):void{
            this.setLoadingProgress(0.8);
        }
        private function initProgress(_arg1:FlexEvent):void{
        }
        private function initComplete(_arg1:FlexEvent):void{
            this.initHasComplete = true;
        }
        private function rslProgress(_arg1:RSLEvent):void{
            this.setLoadingProgress(0.81);
        }
        private function rslComplete(_arg1:RSLEvent):void{
            this.setLoadingProgress(0.82);
        }
        public function get backgroundAlpha():Number{
            return (0);
        }
        public function set backgroundAlpha(_arg1:Number):void{
        }
        public function get backgroundColor():uint{
            return (0);
        }
        public function set backgroundColor(_arg1:uint):void{
        }
        public function get backgroundImage():Object{
            return (null);
        }
        public function set backgroundImage(_arg1:Object):void{
        }
        public function get backgroundSize():String{
            return (null);
        }
        public function set backgroundSize(_arg1:String):void{
        }
        public function get stageHeight():Number{
            return (0);
        }
        public function set stageHeight(_arg1:Number):void{
        }
        public function get stageWidth():Number{
            return (0);
        }
        public function set stageWidth(_arg1:Number):void{
        }

    }
}//package custom_control 

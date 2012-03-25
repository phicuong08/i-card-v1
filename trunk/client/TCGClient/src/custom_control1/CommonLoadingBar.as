//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;

    public class CommonLoadingBar extends UIComponent {

        public static const BAR_DISPLAY_COMPLETE:String = "进度条满格";

        private static var cls:Class = CommonLoadingBar_cls;

        protected var mc:MovieClip;
        protected var descTxt:TextField;
        protected var _loadingPercent:Number = 0;
        protected var _displayPercent:Number = 0;
		public var __slot1;
        public function CommonLoadingBar(){
            mouseChildren = false;
            this.loadMovieClip();
            this.descTxt = new TextField();
            this.descTxt.defaultTextFormat = new TextFormat("宋体", 14, 0xFFFFFF);
            this.descTxt.selectable = false;
            addChild(this.descTxt);
            this.descTxt.width = 300;
            this.descTxt.x = 115;
            this.descTxt.y = 204;
        }
        protected function enterFrameHandler(_arg1:Event):void{
            var _local2:int;
            if (this.mc){
                if (this._displayPercent < this._loadingPercent){
                    this._displayPercent = (this._displayPercent + 0.02);
                };
                if (this._displayPercent >= this._loadingPercent){
                    this.removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
                };
                _local2 = int((this._displayPercent * 100));
                _local2 = ((_local2 < 1)) ? 1 : _local2;
                _local2 = ((_local2 > 100)) ? 100 : _local2;
                this.mc.gotoAndStop(_local2);
                if ((((_local2 == 100)) && ((this._loadingPercent >= 1)))){
                    dispatchEvent(new Event(BAR_DISPLAY_COMPLETE));
                };
            };
        }
        protected function loadMovieClip():void{
            var _local1:MovieClipLoaderAsset = new cls();
            var _local2:Loader = new Loader();
            _local2.contentLoaderInfo.addEventListener(Event.COMPLETE, this.swfLoaderComplete);
            _local2.loadBytes(_local1.movieClipData);
        }
        protected function swfLoaderComplete(_arg1:Event):void{
            (_arg1.target as LoaderInfo).removeEventListener(Event.COMPLETE, this.swfLoaderComplete);
            this.mc = (_arg1.target.loader.content as MovieClip);
            addChild(this.mc);
            this.swapChildren(this.mc, this.descTxt);
            this.mc.gotoAndStop(0);
        }
        public function set loadingTitle(_arg1:String):void{
            this.descTxt.text = _arg1;
        }
        public function set loadingPercent(_arg1:Number):void{
            this._loadingPercent = _arg1;
            this.addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
        }
        public function get loadingPercent():Number{
            return (this._loadingPercent);
        }
        public function reset():void{
            this._displayPercent = 0;
            this._loadingPercent = 0;
            if (this.mc){
                this.mc.gotoAndStop(0);
            };
        }

    }
}//package custom_control 

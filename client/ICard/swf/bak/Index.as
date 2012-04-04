//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
    import ICard.lang.*;
    import flash.net.*;

    public class Index extends Sprite {

        private var _tf:TextField;
        private var _l:Loader;
        private var _e:Loader;
        public var args:Object;

        public function Index(){
            this.args = {};
            super();
            addEventListener(Event.ADDED_TO_STAGE, this.addedToStage);
        }
        private function addedToStage(_arg1:Event):void{
            var _local4:String;
            var _local5:String;
            var _local6:URLRequest;
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            this._tf = new TextField();
            addChild(this._tf);
            this._tf.autoSize = TextFieldAutoSize.LEFT;
        //    this._tf.text = "IndexLang.Init";
            this._tf.textColor = 0xFFFFFF;
            this._tf.selectable = false;
            var _local2 = "?";
            var _local3:Object = stage.loaderInfo.parameters;
            for (_local4 in _local3) {
                if (_local4 == "rnd"){
                    _local2 = (_local2 + ("rnd=" + _local3["rnd"]));
                } else {
                    this.args[_local4] = ((_local3[_local4]) || (""));
                };
            };
            _local5 = ((this.args["client_url"]) || (Config.ResourcesPathPrefix));
            this._e = new Loader();
            addChild(this._e);
            this._e.load(new URLRequest((_local5 + "assets/init_effect.swf")));
            this._l = new Loader();
            this.addEvent();
            //_local6 = new URLRequest(((_local5 + "Main.swf") + _local2));
			_local6 = new URLRequest(((_local5 + "Main.swf")));
            this._l.load(_local6);
            this.center();
            stage.addEventListener(Event.RESIZE, this.center);
        }
        private function center(_arg1:Event=null):void{
            this._tf.x = ((stage.stageWidth - this._tf.width) / 2);
            this._tf.y = ((stage.stageHeight - this._tf.height) / 2);
            this._e.x = ((stage.stageWidth - 40) / 2);
            this._e.y = ((this._tf.y - 40) - 5);
        }
        private function addEvent():void{
            var _local1:LoaderInfo = this._l.contentLoaderInfo;
            var _local2:LoaderInfo = this._e.contentLoaderInfo;
            _local1.addEventListener(Event.COMPLETE, this.ch);
            _local2.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.hsh);
            _local2.addEventListener(Event.INIT, this.ih);
            _local2.addEventListener(IOErrorEvent.IO_ERROR, this.ieh);
            _local2.addEventListener(Event.OPEN, this.oh);
            _local2.addEventListener(ProgressEvent.PROGRESS, this.ph);
            _local2.addEventListener(Event.UNLOAD, this.uh);
        }
        private function removeEvent():void{
            var _local1:LoaderInfo = this._l.contentLoaderInfo;
            var _local2:LoaderInfo = this._e.contentLoaderInfo;
            _local1.removeEventListener(Event.COMPLETE, this.ch);
            _local2.removeEventListener(HTTPStatusEvent.HTTP_STATUS, this.hsh);
            _local2.removeEventListener(Event.INIT, this.ih);
            _local2.removeEventListener(IOErrorEvent.IO_ERROR, this.ieh);
            _local2.removeEventListener(Event.OPEN, this.oh);
            _local2.removeEventListener(ProgressEvent.PROGRESS, this.ph);
            _local2.removeEventListener(Event.UNLOAD, this.uh);
        }
        private function ch(_arg1:Event):void{
            this.removeEvent();
            stage.removeEventListener(Event.RESIZE, this.center);
            stage.addChild(this._l.content);
            this._l = null;
        }
        private function hsh(_arg1:HTTPStatusEvent):void{
        }
        private function ih(_arg1:Event):void{
        }
        private function ieh(_arg1:IOErrorEvent):void{
        }
        private function oh(_arg1:Event):void{
        }
        private function ph(_arg1:ProgressEvent):void{
        }
        private function uh(_arg1:Event):void{
        }

    }
}//package 

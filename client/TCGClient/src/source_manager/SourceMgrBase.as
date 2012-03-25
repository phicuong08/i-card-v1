//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {
    import flash.display.*;
    import flash.events.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.net.*;

    public class SourceMgrBase extends EventDispatcher {

        public var loadingComplete:Boolean = false;
        public var isLoading:Boolean = false;
        protected var loader:Loader;
        protected var swfPath:String;
        protected var loadTime:int = 0;

        public function SourceMgrBase(_arg1:IEventDispatcher=null){
            super(_arg1);
        }
        public function getSourceClass(_arg1:String):Class{
            var mainCls:* = null;
            var resultClass:* = null;
            var className:* = _arg1;
            if (!this.loadingComplete){
                throw (new Error("swf 文件尚未加载完毕!"));
            };
            try {
                mainCls = (this.loader.contentLoaderInfo.applicationDomain.getDefinition(this.getSwfFileName()) as Class);
                resultClass = (mainCls[className] as Class);
                if (!resultClass){
                    throw (new Error((((("在" + this.swfPath) + "中找不到名为 ") + className) + "的类")));
                } else {
                    return (resultClass);
                };
            } catch(e:Error) {
                throw (new Error((((("在" + swfPath) + "中找不到名为 ") + className) + "的类")));
            };
            return (null);
        }
        protected function getSwfFileName():String{
            return ("");
        }
        public function loadSwfFile():void{
            if (((this.isLoading) || (this.loadingComplete))){
                return;
            };
            this.loadTime++;
            this.loader = new Loader();
            this.addListener();
            this.swfPath = (((("source/" + this.getSwfFileName()) + "/") + this.getSwfFileName()) + ".swf");
            var _local1:LoaderContext = new LoaderContext();
            _local1.applicationDomain = ApplicationDomain.currentDomain;
            this.loader.load(new URLRequest(this.swfPath), _local1);
        }
        protected function addListener():void{
            this.isLoading = true;
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loadCompleteHandler);
            this.loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.progressHandler);
            this.loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
        }
        protected function removeListener():void{
            this.isLoading = false;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.loadCompleteHandler);
            this.loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.progressHandler);
            this.loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorHandler);
            this.loader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityErrorHandler);
        }
        protected function progressHandler(_arg1:ProgressEvent):void{
            dispatchEvent(_arg1);
        }
        protected function loadCompleteHandler(_arg1:Event):void{
            this.loadingComplete = true;
            this.removeListener();
            dispatchEvent(_arg1);
        }
        protected function ioErrorHandler(_arg1:Event):void{
            this.removeListener();
            if (this.loadTime > 3){
                NoticeWindow.showNotice((this.swfPath + "载入失败(ioError),尝试重新载入!"));
                this.loadSwfFile();
            } else {
                NoticeWindow.showNotice((this.swfPath + "无法正常载入!"));
            };
        }
        protected function securityErrorHandler(_arg1:Event):void{
            this.removeListener();
            if (this.loadTime > 3){
                NoticeWindow.showNotice((this.swfPath + "载入失败(securityError),尝试重新载入!"));
                this.loadSwfFile();
            } else {
                NoticeWindow.showNotice((this.swfPath + "无法正常载入!"));
            };
        }

    }
}//package source_manager 

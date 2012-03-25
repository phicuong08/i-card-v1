//Created by Action Script Viewer - http://www.buraks.com/asv
package file_read {
    import flash.display.*;
    import flash.events.*;
    import custom_control1.*;
    import flash.net.*;

    public class MyImageLoader {

        public static var imagesData:Object = new Object();
        private static var isLoadingOn:Boolean = false;
        private static var waitList:Array = new Array();

        protected var _url:String;
        protected var _image:MyImage;
        protected var _loader:Loader;
        private var repeatTime:int = 0;

        public function MyImageLoader(_arg1:MyImage, _arg2:String){
            this._image = _arg1;
            this._url = _arg2;
            if (imagesData[this._url] != null){
                this.passImageDataToMyImage(imagesData[this._url]);
                return;
            };
            addToWaitList(this);
        }
        private static function addToWaitList(_arg1:MyImageLoader):void{
            waitList.push(_arg1);
            tryToLoad();
        }
        private static function tryToLoad():void{
            var _local1:MyImageLoader;
            if (((!(isLoadingOn)) && ((waitList.length > 0)))){
                isLoadingOn = true;
                _local1 = (waitList.pop() as MyImageLoader);
                _local1.startLoading();
            };
        }
        private static function loadingComplete():void{
            isLoadingOn = false;
            tryToLoad();
        }

        public function startLoading():void{
            if (imagesData[this._url] != null){
                this.passImageDataToMyImage(imagesData[this._url]);
                loadingComplete();
                return;
            };
            this._loader = new Loader();
            this._loader.load(new URLRequest(this._url));
            this.addEvent();
        }
        public function refuseAcceptImageData():void{
            this._image = null;
        }
        protected function passImageDataToMyImage(_arg1:BitmapData):void{
            if (this._image){
                this._image.setLoaderSource(_arg1);
            };
        }
        protected function addEvent():void{
            this._loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, this.progressFun);
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.completeFun);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.ioErrorFun);
        }
        protected function delEvent():void{
            this._loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.progressFun);
            this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.completeFun);
            this._loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.ioErrorFun);
            loadingComplete();
        }
        protected function completeFun(_arg1:Event):void{
            var _local2:BitmapData = (this._loader.content as Bitmap).bitmapData.clone();
            imagesData[this._url] = _local2;
            this.delEvent();
            this.passImageDataToMyImage(_local2);
        }
        protected function progressFun(_arg1:ProgressEvent):void{
            if (this._image){
                this._image.dispatchEvent(_arg1);
            };
        }
        protected function ioErrorFun(_arg1:Event):void{
            this.repeatTime++;
            var _local2:NoticeWindow = new NoticeWindow();
            _local2.noticeText = (this._url + "载入失败！\n 重新尝试。");
            TCGClient.getInstance().mainGroup.addElement(_local2);
            if (this.repeatTime > 1){
                this.delEvent();
                _local2.noticeText = (this._url + "载入异常！");
            } else {
                this._loader.load(new URLRequest(this._url));
            };
        }

    }
}//package file_read 

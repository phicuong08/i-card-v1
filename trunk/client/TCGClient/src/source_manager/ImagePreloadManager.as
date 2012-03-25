//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {
    import flash.events.*;
    import custom_control1.*;

    public class ImagePreloadManager extends EventDispatcher {

        public static const LOAD_IMAGE_WHEN_INIT_COMPLETE:String = "初始化过程图片预加载";

        public function ImagePreloadManager(_arg1:IEventDispatcher=null){
            super(_arg1);
        }
        public function loadImageWhenInit():void{
            var _local1:Array = new Array();
            var _local2 = 1;
            while (_local2 <= 20) {
                _local1.push((("source/userHead/" + _local2) + ".jpg"));
                _local2++;
            };
            _local1.push("source/cardImages/card_back.png");
            this.loadImages(_local1, LOAD_IMAGE_WHEN_INIT_COMPLETE);
        }
        private function loadImages(_arg1:Array, _arg2:String):void{
            var totalNum:* = 0;
            var path:* = null;
            var complete:* = null;
            var imagePathArr:* = _arg1;
            var eventName:* = _arg2;
            var loadImage:* = function (_arg1:String):void{
                totalNum++;
                var _local2:MyImage = new MyImage(_arg1);
                _local2.addEventListener(MyImage.IMAGE_LOAD_COMPLETE, complete);
            };
            complete = function (_arg1:Event):void{
                (_arg1.currentTarget as MyImage).removeEventListener(MyImage.IMAGE_LOAD_COMPLETE, complete);
                if (++completeNum == totalNum){
                    debugWindow.myTrace((((eventName + "完成!共载入 ") + totalNum) + " 个文件"));
                    dispatchEvent(new Event(eventName));
                };
            };
            totalNum = 0;
            var completeNum:* = 0;
            for each (path in imagePathArr) {
                loadImage(path);
            };
        }

    }
}//package source_manager 

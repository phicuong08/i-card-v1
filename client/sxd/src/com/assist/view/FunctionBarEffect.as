//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view {
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.*;

    public class FunctionBarEffect {

        private static var _fileList:Array;

        public static function loadEffect():void{
            var _local1:Array = [(URI.addonsUrl + "function_bar_effect.swf"), (URI.addonsUrl + "function_open.swf")];
            File.loadList(_local1, loadEffectComplete);
        }
        private static function loadEffectComplete(_arg1:Array):void{
            _fileList = _arg1;
        }
        public static function get light():Class{
            var _local1:Class = ((_fileList[0] as File).getClassByName("Light") as Class);
            return (_local1);
        }
        public static function get functionOpen():Class{
            var _local1:Class = ((_fileList[1] as File).getClassByName("FunctionOpen") as Class);
            return (_local1);
        }
        public static function get video():MovieClip{
            var _local1:MovieClip = ((_fileList[0] as File).getClassObject("MyVideo") as MovieClip);
            _local1.gotoAndStop(1);
            _local1.blendMode = BlendMode.SCREEN;
            _local1.mouseEnabled = false;
            _local1.mouseChildren = false;
            return (_local1);
        }

    }
}//package com.assist.view 

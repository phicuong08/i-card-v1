//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.pack {
    import ICard.haloer.display.*;

    public class BoxIconCache {

        private static var _cacheList:Array = [];

        public static function pushImg(_arg1:Image):void{
            if (_arg1 == null){
                return;
            };
            var _local2:String = _arg1.url;
            _cacheList[_local2] = ((_cacheList[_local2]) || ([]));
            _cacheList[_local2].push(_arg1);
        }
        public static function getImg(_arg1:String, _arg2:Boolean):Image{
            var _local3:Image;
            _cacheList[_arg1] = ((_cacheList[_arg1]) || ([]));
            if (_cacheList[_arg1].length > 0){
                _local3 = (_cacheList[_arg1].pop() as Image);
                _local3.x = 0;
                _local3.y = 0;
                return (_local3);
            };
            return (new Image(_arg1, _arg2));
        }

    }
}//package com.assist.view.pack 

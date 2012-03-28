//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist {
    import flash.display.*;
    import flash.ui.*;

    public class MouseCursor {

        private static var _arr:Array = [];
        private static var _cursor:DisplayObject;
        private static var _offX:int = 0;
        private static var _offY:int = 0;
        private static var _layder:Sprite;
        private static var idx:int = 1;
        public static var Map1Cursor:int = idx++;
        public static var Map2Cursor:int = idx++;
        public static var Map3Cursor:int = idx++;

        public static function init(_arg1:Sprite, _arg2:Stage):void{
            _layder = _arg1;
        }
        public static function updateCursorXY():void{
            if (_cursor){
                _cursor.x = (_layder.mouseX + _offX);
                _cursor.y = (_layder.mouseY + _offY);
            };
        }
        private static function updateCursor():void{
            var _local1:int = _arr.length;
            var _local2:Object;
            while (_local1 > 0) {
                _local1--;
                _local2 = _arr[_local1];
                if (_local2){
                    break;
                };
            };
            if (_cursor == _local2){
                return;
            };
            if (((_cursor) && ((_cursor.parent == _layder)))){
                _layder.removeChild(_cursor);
            };
            _cursor = null;
            if (_local2){
                _cursor = (_local2.m as DisplayObject);
                _layder.addChild(_cursor);
                _offX = _local2.x;
                _offY = _local2.y;
                _cursor.x = (_layder.mouseX + _offX);
                _cursor.y = (_layder.mouseY + _offY);
                Mouse.hide();
            } else {
                Mouse.show();
            };
        }
        public static function showMouseCursor(_arg1:int, _arg2:DisplayObject, _arg3:int=0, _arg4:int=0):void{
            _arr[_arg1] = {
                m:_arg2,
                x:_arg3,
                y:_arg4
            };
            if (_arg2 != _cursor){
                updateCursor();
            };
        }
        public static function hideMouseCursor(_arg1:int):void{
            _arr[_arg1] = null;
            updateCursor();
        }
        public static function show():void{
            _arr = [];
            if (((_cursor) && ((_cursor.parent == _layder)))){
                _layder.removeChild(_cursor);
            };
            _cursor = null;
            Mouse.show();
        }
        public static function hide():void{
            _arr = [];
            if (((_cursor) && ((_cursor.parent == _layder)))){
                _layder.removeChild(_cursor);
            };
            _cursor = null;
            Mouse.hide();
        }

    }
}//package com.assist 

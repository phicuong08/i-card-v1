//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view {
    import flash.display.*;
    import com.views.*;
    import flash.utils.*;

    public class Shortcut {

        public static var getRelatedView:Function;
        private static var _views:Dictionary = new Dictionary();
        private static var _focusView:IView;

        public static function addTarget(_arg1:DisplayObject, _arg2:Function, ... _args):void{
            var _local4:IView = getRelatedView(_arg1);
            if (null == _local4){
                return;
            };
            if (_views[_local4] == null){
                _views[_local4] = {
                    index:-1,
                    list:[],
                    hotspot:null
                };
            };
            _views[_local4]["list"].push({
                target:_arg1,
                handler:_arg2,
                args:_args
            });
            if (_views[_local4]["index"] == -1){
                moveDown();
            };
        }
        public static function removeTarget(_arg1:DisplayObject):void{
            var _local2:IView = getRelatedView(_arg1);
            if (null == _local2){
                return;
            };
            var _local3:Array = _views[_local2]["list"];
            var _local4:int = _local3.length;
            var _local5:int;
            while (_local5 < _local4) {
                if (_local3[_local5]["target"] == _arg1){
                    _local3.splice(_local5, 1);
                    break;
                };
                _local5++;
            };
        }
        public static function clearAllTarget(_arg1:DisplayObject):void{
            var _local2:IView = getRelatedView(_arg1);
            if (null == _local2){
                return;
            };
            var _local3:Sprite = _views[_local2]["hotspot"];
            if (((_local3) && (_local3.parent))){
                _local3.parent.removeChild(_local3);
            };
            _views[_local2]["list"] = [];
        }
        public static function removeView(_arg1:IView):void{
            if (_views[_arg1] != null){
                delete _views[_arg1];
            };
        }
        public static function moveUp():Boolean{
            return (move(true));
        }
        public static function moveDown():Boolean{
            return (move(false));
        }
        private static function move(_arg1:Boolean):Boolean{
            if (null == _focusView){
                return (false);
            };
            var _local2:Object = _views[_focusView];
            if (null == _local2){
                return (false);
            };
            var _local3:int = _local2["index"];
            var _local4:Array = _local2["list"];
            var _local5:Sprite = _local2["hotspot"];
            if (_local4.length == 0){
                return (false);
            };
            _local3 = (_local3 + (_arg1) ? -1 : 1);
            if (_local3 <= -1){
                _local3 = (_local4.length - 1);
            };
            if (_local3 >= _local4.length){
                _local3 = 0;
            };
            _local2["index"] = _local3;
            var _local6:DisplayObject = _local4[_local3]["target"];
            var _local7:Function = _local4[_local3]["handler"];
            if (null == _local5){
                _local5 = (_local2["hotspot"] = new Sprite());
                _local5.mouseEnabled = false;
            };
            _local5.graphics.clear();
            _local5.graphics.beginFill(0xCCCCCC, 0.2);
            _local5.graphics.drawRect(0, 0, _local6.width, _local6.height);
            _local5.x = _local6.x;
            _local5.y = _local6.y;
            _local6.parent.addChild(_local5);
            return (true);
        }
        public static function execute():Boolean{
            if (null == _focusView){
                return (false);
            };
            var _local1:Object = _views[_focusView];
            if (null == _local1){
                return (false);
            };
            var _local2:int = _local1["index"];
            var _local3:Array = _local1["list"];
            if (undefined == _local3[_local2]){
                return (false);
            };
            var _local4:Function = _local3[_local2]["handler"];
            var _local5:Array = _local3[_local2]["args"];
            if ((_local4 is Function)){
                _local4.apply(null, _local5);
                return (true);
            };
            return (false);
        }
        public static function set focusView(_arg1:IView):void{
            _focusView = _arg1;
        }

    }
}//package com.assist.view 

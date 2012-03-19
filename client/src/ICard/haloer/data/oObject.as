//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.haloer.data {

    public class oObject {

        public static function list(_arg1:Array, _arg2:Object, _arg3:Array):void{
            if (((!(_arg1)) || (!(_arg3)))){
                throw (new Error("list方法的第一个和第三个参数不能为null或undefined！"));
            };
            var _local4:int = _arg3.length;
            var _local5:int;
            while (_local5 < _local4) {
                _arg2[_arg3[_local5]] = _arg1[_local5];
                _local5++;
            };
        }
        public static function getKeys(_arg1:Object):Array{
            var _local3:Object;
            var _local2:Array = [];
            for (_local3 in _arg1) {
                _local2.push(_local3);
            };
            return (_local2);
        }
        public static function getValues(_arg1:Object):Array{
            var _local3:Object;
            var _local2:Array = [];
            for (_local3 in _arg1) {
                _local2.push(_arg1[_local3]);
            };
            return (_local2);
        }

    }
}//package com.haloer.data 

//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.haloer.data {

    public function Dumper(_arg1:Object):String{
        return (Circle(_arg1));
    }
}//package com.haloer.data 

var indent:int = 4;
const Circle:Function = function (_arg1:Object, _arg2:int=1):String{
        var _local4:Object;
        var _local5:int;
        var _local6:int;
        var _local7:String;
        var _local8:Array;
        var _local9:String;
        if (_arg1 === null){
            return ("null");
        };
        var _local3:String = "";
//        if ((_arg1 is String)){
//            _local3 = (("\"" + Escape((_arg1 as String))) + "\"");
//        } else {
//            if ((_arg1 is Number)){
//                _local3 = (_arg1 + "");
//            } else {
//                if ((_arg1 is Boolean)){
//                    _local3 = (_arg1 + "");
//                } else {
//                    if ((_arg1 is Array)){
//                        _local3 = "[";
//                        _local5 = 0;
//                        _local6 = _arg1.length;
//                        while (_local5 < _local6) {
//                            _local4 = _arg1[_local5];
//                            _local3 = (_local3 + (((((("\n" + Space((_arg2 * indent))) + "/* [") + _local5) + "] */ ") + Circle(_local4, (_arg2 + 1))) + ","));
//                            _local5++;
//                        };
//                        _local3 = (_local3.substr(0, (_local3.length - ((_local3.length > 1)) ? 1 : 0)) + "\n");
//                        _local3 = (_local3 + (Space(((_arg2 - 1) * indent)) + "]"));
//                    } else {
//                        if ((_arg1 is Function)){
//                            _local3 = "new Function()";
//                        } else {
//                            if (typeof(_arg1) == "object"){
//                                _local7 = _arg1.constructor.toString();
//                                _local8 = /^\[class\s{1}(.+?)\]$/i.exec(_local7);
//                                if (_local8[1] == "Object"){
//                                    _local3 = "{\n";
//                                    for (_local9 in _arg1) {
//                                        _local4 = _arg1[_local9];
//                                        _local3 = (_local3 + (((((Space((_arg2 * indent)) + "\"") + Escape(_local9)) + "\" : ") + Circle(_local4, (_arg2 + 1))) + ",\n"));
//                                    };
//                                    _local3 = (_local3.substr(0, (_local3.length - ((_local3.length > 2)) ? 2 : 0)) + "\n");
//                                    _local3 = (_local3 + (Space(((_arg2 - 1) * indent)) + "}"));
//                                } else {
//                                    return ((("new " + _local8[1]) + "()"));
//                                };
//                            } else {
//                                _local3 = (("\"" + _arg1) + "\"");
//                            };
//                        };
//                    };
//                };
//            };
//        };
        return (_local3);
    };
const Space:Function = function (_arg1:int):String{
        var _local2:String = "";
        var _local3:int;
        while (_local3 < _arg1) {
            _local2 = (_local2 + " ");
            _local3++;
        };
        return (_local2);
    };
const Escape:Function = function (_arg1:String):String{
        _arg1 = _arg1.replace(/\\/g, "\\\\");
        _arg1 = _arg1.replace(/"/g, "\\\"");
        _arg1 = _arg1.replace(/\n/, "\\n");
        _arg1 = _arg1.replace(/\r/, "\\r");
        return (_arg1);
    };

//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist {

    public function timeFormat(_arg1:int, _arg2:Boolean=false):String{
        var _local4:int;
        if (_arg1 <= 0){
            return ("00:00");
        };
        var _local3:int = (_arg1 / 60);
        _arg1 = (_arg1 % 60);
        if (_arg2){
            _local4 = (_local3 / 60);
            _local3 = (_local3 % 60);
            return (((((((_local4)>9) ? _local4 : ("0" + _local4) + ":") + ((_local3)>9) ? _local3 : ("0" + _local3)) + ":") + ((_arg1)>9) ? _arg1 : ("0" + _arg1)));
        };
        return (((((_local3)>9) ? _local3 : ("0" + _local3) + ":") + ((_arg1)>9) ? _arg1 : ("0" + _arg1)));
    }
}//package com.assist 

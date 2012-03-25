//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import spark.filters.*;

    public class SelectCardFilter extends GlowFilter {

        public function SelectCardFilter(_arg1:uint=0xFFF000, _arg2:Number=0.5, _arg3:Number=200, _arg4:Number=200, _arg5:Number=4, _arg6:int=1, _arg7:Boolean=true, _arg8:Boolean=false){
            super(_arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7, _arg8);
        }
        public static function createSelectFilters(_arg1:Boolean, _arg2:UIComponent):void{
            var _local4:SelectCardFilter;
            var _local5:int;
            var _local3:Array = _arg2.filters;
            if (_arg1){
                _local4 = new (SelectCardFilter)();
                _local3.push(_local4);
            } else {
                _local5 = 0;
                while (_local5 < _local3.length) {
                    if ((_local3[_local5] is SelectCardFilter)){
                        _local3.splice(_local5, 1);
                        break;
                    };
                    _local5++;
                };
            };
            _arg2.filters = _local3;
        }

    }
}//package combat_element 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;
    import com.assist.server.*;

    public class ConsumeAlertSettingData extends Base {

        private var _aryPlayerConsumeAlertSetInfo:Array;
        private var _objPlayerConsumeAlertSet:Object;

        public function ConsumeAlertSettingData(){
            this._aryPlayerConsumeAlertSetInfo = [];
            this._objPlayerConsumeAlertSet = {};
            super();
        }
        public function get playerConsumeAlertSetInfo():Array{
            return (this._aryPlayerConsumeAlertSetInfo);
        }
        public function get playerConsumeAlertSet():Object{
            return (this._objPlayerConsumeAlertSet);
        }
        public function player_consume_alert_set_info(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this._aryPlayerConsumeAlertSetInfo = [];
            for each (_local2 in _arg1[0]) {
                _local3 = {};
                oObject.list(_local2, _local3, ["id", "state"]);
                _local3["text"] = ConsumeAlertSetType.getDescription(_local3["id"]);
                _local3["vip"] = ConsumeAlertSetType.getVIP(_local3["id"]);
                this._aryPlayerConsumeAlertSetInfo.push(_local3);
            };
        }
        public function player_consume_alert_set(_arg1:Array):void{
            this._objPlayerConsumeAlertSet = {};
            oObject.list(_arg1, this._objPlayerConsumeAlertSet, ["result"]);
        }

    }
}//package com.datas 

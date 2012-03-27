//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.view.*;
    import com.lang.client.com.controllers.*;

    public class RedEnvelopesController extends Base {

        public var showTime:String = "";
        private var _endTime:Number;

        public function get getEnvelopsList():Array{
            var _local9:Object;
            var _local10:int;
            var _local11:int;
            var _local1:Array = _data.redEnvelopes.getEnvelopsInfo;
            var _local2:Array = [];
            var _local3:int = _local1.length;
            var _local4:Number = (this._endTime * 1000);
            var _local5:Number = (_ctrl.player.serverTime * 1000);
            var _local6:int = ((_local4 - _local5) / 1000);
            var _local7:int = (_local6 / 86400);
            this.showTime = "";
            if (_local6 > 0){
                if (_local7 >= 1){
                    this.showTime = Lang.sprintf(RedEnvelopesControllerLang.DiffDay, _local7);
                } else {
                    this.showTime = (RedEnvelopesControllerLang.Diff + TimeChange.mainTime(_local6, ":"));
                };
            } else {
                this.showTime = RedEnvelopesControllerLang.CanGet;
            };
            var _local8:int;
            while (_local8 < _local3) {
                _local9 = {};
                _local10 = Math.floor((_local1[_local8][0] / 10));
                _local9.coin = ((_local10 == 0)) ? 1 : _local10;
                _local11 = Math.floor((_local1[_local8][1] / 10));
                _local9.ingot = ((_local11 == 0)) ? 1 : _local11;
                _local9.time = _local1[_local8][2];
                _local9.mainTime = _local5;
                _local9.showTime = this.showTime;
                _local2.push(_local9);
                _local8++;
            };
            return (_local2);
        }
        public function get GetEnvelope():Object{
            var _local1:Array = _data.redEnvelopes.GetEnvelope;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.redList = _local1[1];
            return (_local2);
        }
        public function get GetDate():Number{
            this._endTime = _data.redEnvelopes.getDate[0];
            return (this._endTime);
        }

    }
}//package com.controllers 

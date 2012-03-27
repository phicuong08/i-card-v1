//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.data.mission.*;

    public class GetPeachData extends Base {

        private var _buyMonkeys:Array;
        private var _peachInfo:Array;
        private var _playerInfo:Array;
        public var warResult:int;
        public var warExp:int;
        public var warData:WarData;
        public var warAura:int;

        public function get buyMonkeys():Array{
            return (this._buyMonkeys);
        }
        public function get peachInfo():Array{
            return (this._peachInfo);
        }
        public function get playerInfo():Array{
            return (this._playerInfo);
        }
        public function get_peach(_arg1:Array):void{
            this.warResult = _arg1[0];
            this.warExp = _arg1[1];
            this.warData = new WarData();
            this.warData.format([0, 0, 0, [_arg1[2][0]]]);
            this.warAura = _arg1[3];
        }
        public function buy_monkeys(_arg1:Array):void{
            this._buyMonkeys = _arg1;
        }
        public function peach_info(_arg1:Array):void{
            this._peachInfo = _arg1;
        }
        public function player_info(_arg1:Array):void{
            this._playerInfo = _arg1;
        }

    }
}//package com.datas 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.view.*;
    import com.assist.data.mission.*;
    import com.haloer.data.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class DuJieData extends Base {

        public var result:int = 0;
        public var dujieState:int = 0;
        public var pointState:int = 0;
        public var dujieName:String = "";
        public var pointTip:String = "";
        public var dujieTip:String = "";
        public var playerRoleId:int = 0;
        public var playerRoleLv:int = 0;
        public var warData:WarData;
        public var addHealth:int;
        public var roleId:int;
        public var spiritStateId:int;
        public var spiritStateLevel:int;
        public var awardAura:int;

        public function dujie_info(_arg1:Array):void{
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["player_role_id", "now_state", "now_state_level", "next_state", "next_state_level", "need_player_role_level", "need_state_point", "player_role_state_point", "player_state_point", "function_open"]);
            this.playerRoleId = _local2.player_role_id;
            this.playerRoleLv = 70;
            this.dujieTip = "";
            this.pointTip = "";
            this.dujieName = "";
            this.dujieState = 0;
            this.pointState = 0;
            if (_local2.function_open == 0){
                return;
            };
            var _local3:int = (_local2.need_state_point - _local2.player_role_state_point);
            var _local4:String = (DuJieType.getRequireHealth(_local2.next_state, _local2.next_state_level) + "");
            _local4 = HtmlText.green(_local4);
            var _local5:String = (DuJieType.getSpiritName(_local2.next_state) + DuJieType.getSpiritLevelInfo(_local2.next_state_level));
            _local5 = HtmlText.format(_local5, DuJieType.getSpiritColor(_local2.next_state));
            this.dujieTip = Lang.sprintf(DuJieDataLang.StartDuJie, _local5, _local4);
            this.dujieTip = HtmlText.white(this.dujieTip);
            this.pointTip = Lang.sprintf(DuJieDataLang.UsePoint, HtmlText.yellow((_local3 + "")), _local5, _local4, HtmlText.yellow(_local2.player_state_point));
            this.pointTip = HtmlText.white(this.pointTip);
            if (_local2.now_state == 0){
                this.dujieState = 1;
            } else {
                if (_local2.next_state == 0){
                    this.dujieName = (DuJieType.getSpiritName(_local2.now_state) + DuJieType.getSpiritLevelInfo(_local2.now_state_level));
                    this.dujieName = HtmlText.format(this.dujieName, DuJieType.getSpiritColor(_local2.now_state));
                } else {
                    this.dujieName = (DuJieType.getSpiritName(_local2.now_state) + DuJieType.getSpiritLevelInfo(_local2.now_state_level));
                    this.dujieName = HtmlText.format(this.dujieName, DuJieType.getSpiritColor(_local2.now_state));
                    this.playerRoleLv = DuJieType.getRequireRoleLevel(_local2.next_state, _local2.next_state_level);
                    if (_local2.player_role_state_point >= _local2.need_state_point){
                        this.dujieState = 1;
                    } else {
                        if (int(_local2.player_state_point) < _local3){
                            this.pointState = 2;
                        } else {
                            this.pointState = 1;
                        };
                    };
                };
            };
        }
        public function add_player_role_state_point(_arg1:Array):void{
            this.playerRoleId = _arg1[0];
            this.result = _arg1[1];
        }
        private function htmlFormat(_arg1:String, _arg2:int):String{
            return ((((("<font color='#" + _arg2.toString(16)) + "'>") + _arg1) + "</font>"));
        }
        public function role_list(_arg1:Array):void{
        }
        public function go_dujie(_arg1:Array):void{
            this.playerRoleId = _arg1[0];
            this.result = _arg1[1];
            var _local2:Array = [].concat(_arg1[2][0]);
            this.warData = new WarData();
            this.warData.format([0, 0, 0, [_local2]]);
            this.addHealth = _arg1[3];
            this.roleId = _arg1[4];
            this.spiritStateId = _arg1[5];
            this.spiritStateLevel = _arg1[6];
            this.awardAura = _arg1[7];
        }

    }
}//package com.datas 

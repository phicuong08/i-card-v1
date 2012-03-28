//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.protocols.*;
    import com.assist.server.*;

    public class RollCakeController extends Base {

        public var reollIngot:int = 0;

        public function get getState():Object{
            var _local1:Array = _data.rollCake.getState;
            var _local2:Object = this.renderRollData2(_local1);
            return (_local2);
        }
        public function get rollData():Object{
            var _local1:Array = _data.rollCake.rollData;
            var _local2:Object = this.renderRollData2(_local1);
            return (_local2);
        }
        public function get addCount():Object{
            var _local1:Array = _data.rollCake.addCount;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.count = _local1[1];
            return (_local2);
        }
        public function get getCount():Object{
            var _local1:Array = _data.rollCake.getCount;
            var _local2:Object = {};
            _local2.count = _local1[0];
            _local2.freeRobeNum = _local1[1];
            _local2.robeMaxNum = _local1[2];
            return (_local2);
        }
        public function get rerollData():Object{
            var _local1:Array = _data.rollCake.rerollData;
            var _local2:Object = this.renderRollData(_local1);
            return (_local2);
        }
        private function renderRollData(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.msg = _arg1[0];
            _local2.type = _arg1[1];
            _local2.typeName = RollCakeType.getRollCakeNickName(_local2.type);
            _local2.awardSkill = RollCakeType.getRollCakeSkill(_local2.type);
            _local2.statePoint = RollCakeType.getRollCakeStatePoint(_local2.type);
            _local2.canFree = _arg1[2];
            _local2.rerollIngot = _arg1[3];
            if (_local2.msg == Mod_RollCake_Base.SUCCESS){
                this.reollIngot = _local2.rerollIngot;
            };
            _local2.numList = [];
            _local2.numList.push({
                id:1,
                num:_arg1[4]
            });
            _local2.numList.push({
                id:2,
                num:_arg1[5]
            });
            _local2.numList.push({
                id:3,
                num:_arg1[6]
            });
            _local2.numList.push({
                id:4,
                num:_arg1[7]
            });
            _local2.numList.push({
                id:5,
                num:_arg1[8]
            });
            _local2.numList.push({
                id:6,
                num:_arg1[9]
            });
            return (_local2);
        }
        private function renderRollData2(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.msg = _arg1[0];
            _local2.type = _arg1[1];
            _local2.typeName = RollCakeType.getRollCakeNickName(_local2.type);
            _local2.awardSkill = RollCakeType.getRollCakeSkill(_local2.type);
            _local2.statePoint = RollCakeType.getRollCakeStatePoint(_local2.type);
            _local2.rerollIngot = _arg1[2];
            if ((((_local2.msg == Mod_RollCake_Base.SUCCESS)) || ((_local2.msg == Mod_RollCake_Base.HAVE_RECORD)))){
                this.reollIngot = _local2.rerollIngot;
            };
            _local2.numList = [];
            _local2.numList.push({
                id:1,
                num:_arg1[3]
            });
            _local2.numList.push({
                id:2,
                num:_arg1[4]
            });
            _local2.numList.push({
                id:3,
                num:_arg1[5]
            });
            _local2.numList.push({
                id:4,
                num:_arg1[6]
            });
            _local2.numList.push({
                id:5,
                num:_arg1[7]
            });
            _local2.numList.push({
                id:6,
                num:_arg1[8]
            });
            return (_local2);
        }
        public function get getAward():Object{
            var _local1:Array = _data.rollCake.getAward;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }

    }
}//package com.controllers 

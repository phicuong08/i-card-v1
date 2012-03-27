//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;
    import com.assist.server.*;

    public class ResearchData extends Base {

        private var _aryResearchList:Array;
        private var _aryResearchUpgrade:Array;
        private var _aryClearCdTimeShow:Array;
        private var _aryClearCdTime:Array;
        private var _aryResearchAddList:Array;

        public function ResearchData(){
            this._aryResearchAddList = [];
            super();
        }
        public function get getResearchList():Array{
            var _local2:Object;
            var _local3:Array;
            var _local1:Array = [];
            for each (_local3 in this._aryResearchList[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["order_key", "research_id", "level", "last_level", "player_level", "type", "skill", "cd_time"]);
                _local2["name"] = ResearchType.getName(_local2["research_id"]);
                _local2["content"] = ResearchType.getContent(_local2["research_id"]);
                _local1.push(_local2);
            };
            _local1.sortOn(["type", "order_key"], Array.NUMERIC);
            return (_local1);
        }
        public function get getCdTime():int{
            var _local1:int = this._aryResearchList[3];
            return (_local1);
        }
        public function get getMySkill():int{
            var _local1:int = this._aryResearchList[1];
            return (_local1);
        }
        public function get getResearchUpgrade():Object{
            var _local1:Object = {};
            oObject.list(this._aryResearchUpgrade, _local1, ["result", "type_id", "research_id", "level", "last_level", "player_level", "cd_time", "skill", "myskill", "ingot", "curr_time"]);
            _local1["type"] = _local1["type_id"];
            _local1["name"] = ResearchType.getName(_local1["research_id"]);
            _local1["content"] = ResearchType.getContent(_local1["research_id"]);
            return (_local1);
        }
        public function get getClearCdTimeShow():Object{
            var _local1:Object = {
                cd_time:this._aryClearCdTimeShow[0],
                ingot:this._aryClearCdTimeShow[1],
                myingot:this._aryClearCdTimeShow[2]
            };
            return (_local1);
        }
        public function get getClearCdTime():Object{
            var _local1:Object = {
                result:this._aryClearCdTime[0],
                myingot:this._aryClearCdTime[1]
            };
            return (_local1);
        }
        public function get researchAddList():Array{
            return (this._aryResearchAddList);
        }
        public function research_list(_arg1:Array):void{
            this._aryResearchList = _arg1;
        }
        public function research_upgrade(_arg1:Array):void{
            this._aryResearchUpgrade = _arg1;
        }
        public function clear_cd_time_show(_arg1:Array):void{
            this._aryClearCdTimeShow = _arg1;
        }
        public function clear_cd_time(_arg1:Array):void{
            this._aryClearCdTime = _arg1;
        }
        public function research_add_list(_arg1:Array):void{
            var _local2:Object;
            var _local3:Array;
            this._aryResearchAddList = [];
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["research_id", "order_key", "addition_type", "add_value"]);
                _local2["name"] = ResearchType.getName(_local2["research_id"]);
                this._aryResearchAddList.push(_local2);
            };
            this._aryResearchAddList.sortOn("order_key", Array.NUMERIC);
        }

    }
}//package com.datas 

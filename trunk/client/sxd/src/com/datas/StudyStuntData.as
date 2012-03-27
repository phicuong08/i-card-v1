//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import flash.utils.*;
    import com.haloer.display.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class StudyStuntData extends Base {

        private var _aryStuntPointInfo:Array;
        private var _aryStuntInfo:Array;
        private var _objPlayerInfo:Object;
        private var _objPlayerStudyStunt:Object;
        private var _mainRoleStuntIds:Array;
        private var _objPlayerCanStudyStunt:Object;
        private var _objLoadImage:Object;
        private var _intLoadTotal:int = 0;
        private var _intLoadComplete:int = 0;

        public function StudyStuntData(){
            this._aryStuntPointInfo = [];
            this._aryStuntInfo = [];
            this._objPlayerInfo = {};
            this._objPlayerStudyStunt = {};
            this._objPlayerCanStudyStunt = {};
            this._objLoadImage = {};
            super();
        }
        public function get stuntPointInfo():Array{
            return (this._aryStuntPointInfo);
        }
        public function get stuntInfo():Array{
            return (this._aryStuntInfo);
        }
        public function get playerInfo():Object{
            return (this._objPlayerInfo);
        }
        public function get playerStudyStunt():Object{
            return (this._objPlayerStudyStunt);
        }
        public function get mainRoleStuntIds():Array{
            return (this._mainRoleStuntIds);
        }
        public function get playerCanStudyStunt():Object{
            return (this._objPlayerCanStudyStunt);
        }
        private function setStuntPointInfo(_arg1:Object):void{
            _arg1["health_additional"] = StudyStuntType.getHealthAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["attack_additional"] = StudyStuntType.getAttackAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["stength_additional"] = StudyStuntType.getStengthAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["agile_additional"] = StudyStuntType.getAgileAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["intellect_additional"] = StudyStuntType.getIntellectAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["hit_additional"] = StudyStuntType.getHitAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["critical_additional"] = StudyStuntType.getCriticalAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["dodge_additional"] = StudyStuntType.getDodgeAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["block_additional"] = StudyStuntType.getBlockAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["break_critical_additional"] = StudyStuntType.getBreakCriticalAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["kill_additional"] = StudyStuntType.getKillAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["break_block_additional"] = StudyStuntType.getBreakBlockAdditional(_arg1["stunt_id"], _arg1["stunt_level"]);
            _arg1["need_aura"] = StudyStuntType.getNeedAura(_arg1["stunt_id"], _arg1["stunt_level"]);
            var _local2:String = "";
            if (_arg1["health_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Health + _arg1["health_additional"]) + "\r"));
            };
            if (_arg1["attack_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Attack + _arg1["attack_additional"]) + "\r"));
            };
            if (_arg1["stength_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Stength + _arg1["stength_additional"]) + "\r"));
            };
            if (_arg1["agile_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Agile + _arg1["agile_additional"]) + "\r"));
            };
            if (_arg1["intellect_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Intellect + _arg1["intellect_additional"]) + "\r"));
            };
            if (_arg1["hit_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Hit + _arg1["hit_additional"]) + "%\r"));
            };
            if (_arg1["critical_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Critical + _arg1["critical_additional"]) + "%\r"));
            };
            if (_arg1["dodge_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Dodge + _arg1["dodge_additional"]) + "%\r"));
            };
            if (_arg1["block_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Block + _arg1["block_additional"]) + "%\r"));
            };
            if (_arg1["break_critical_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.BreakCritical + _arg1["break_critical_additional"]) + "%\r"));
            };
            if (_arg1["kill_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.Kill + _arg1["kill_additional"]) + "%\r"));
            };
            if (_arg1["break_block_additional"] > 0){
                _local2 = (_local2 + ((StudyStuntDataLang.BreakBlock + _arg1["break_block_additional"]) + "%\r"));
            };
            _arg1["tip"] = _local2;
        }
        private function loadImage():void{
            var _local1:String;
            var _local2:Image;
            this._intLoadTotal = 0;
            this._intLoadComplete = 0;
            for each (_local1 in this._objLoadImage) {
                this._intLoadTotal++;
                _local2 = new Image(_local1);
                _local2.onComplete = this.onLoadImageComplete;
            };
            this._objLoadImage = {};
        }
        private function onLoadImageComplete():void{
            this._intLoadComplete++;
        }
        public function get isLoadComplete():Boolean{
            var _local1:Boolean;
            if (this._intLoadTotal < 5){
                _local1 = (this._intLoadComplete == this._intLoadTotal);
            } else {
                _local1 = ((this._intLoadComplete + 2) >= this._intLoadTotal);
            };
            return (_local1);
        }
        private function getStuntPointData(_arg1:int, _arg2:Array):Array{
            var _local4:Object;
            var _local3:Array = [];
            for each (_local4 in _arg2) {
                if (_local4["stunt_id"] == _arg1){
                    _local3.push(_local4);
                };
            };
            return (_local3);
        }
        public function player_stunt_info(_arg1:Array):void{
            var delay:* = null;
            var i:* = 0;
            var intNeedAura:* = 0;
            var aryCurrentStuntPoint:* = null;
            var k:* = 0;
            var objAura:* = null;
            var result:* = _arg1;
            delay = function ():void{
                var _local1:Image;
                if (!Image.isInCache((URI.studyStuntIconUrl + "show.swf"))){
                    _local1 = new Image((URI.studyStuntIconUrl + "show.swf"));
                };
                if (!Image.isInCache((URI.studyStuntIconUrl + "hide.swf"))){
                    _local1 = new Image((URI.studyStuntIconUrl + "hide.swf"));
                };
            };
            this._objPlayerInfo = {};
            this._aryStuntPointInfo = [];
            this._aryStuntInfo = [];
            oObject.list(result, this._objPlayerInfo, ["stunt_id", "stunt_level", "aura", "stunt_state"]);
            if (this._objPlayerInfo["stunt_level"] == 9){
                this._objPlayerInfo["stunt_id"] = (this._objPlayerInfo["stunt_id"] + 1);
                this._objPlayerInfo["stunt_level"] = 0;
            };
            if (!Image.isInCache(((URI.studyStuntIconUrl + this._objPlayerInfo["stunt_id"]) + "_small.swf"))){
                this._objLoadImage[(this._objPlayerInfo["stunt_id"] + "_small.swf")] = ((URI.studyStuntIconUrl + this._objPlayerInfo["stunt_id"]) + "_small.swf");
            };
            var objStunt:* = {};
            var j:* = 1;
            while (j <= this._objPlayerInfo["stunt_id"]) {
                objStunt = {};
                objStunt["stunt_id"] = j;
                objStunt["stunt_name"] = StudyStuntType.getName(j);
                objStunt["stunt_elemente"] = StudyStuntType.getElement(j);
                objStunt["stunt_level"] = StudyStuntType.getLevel(j);
                objStunt["stunt_sign"] = StudyStuntType.getSign(j);
                objStunt["stunt_description"] = StudyStuntType.getDescription(j);
                this._aryStuntInfo.push(objStunt);
                if (j == this._objPlayerInfo["stunt_id"]){
                    this._objPlayerInfo["player_level"] = objStunt["stunt_level"];
                    this._objPlayerInfo["player_elemente"] = objStunt["stunt_elemente"];
                };
                if (!Image.isInCache(((URI.studyStuntIconUrl + objStunt["stunt_id"]) + "_big.swf"))){
                    this._objLoadImage[(objStunt["stunt_id"] + "_big.swf")] = ((URI.studyStuntIconUrl + objStunt["stunt_id"]) + "_big.swf");
                };
                j = (j + 1);
            };
            var objPoint:* = {};
            var h:* = 1;
            while (h <= this._objPlayerInfo["stunt_id"]) {
                i = 1;
                while (i <= 9) {
                    objPoint = {};
                    objPoint["stunt_id"] = h;
                    objPoint["stunt_level"] = i;
                    this.setStuntPointInfo(objPoint);
                    this._aryStuntPointInfo.push(objPoint);
                    i = (i + 1);
                };
                h = (h + 1);
            };
            if (this._objPlayerInfo["player_level"] <= this._data.player.level){
                intNeedAura = 0;
                aryCurrentStuntPoint = this.getStuntPointData(this._objPlayerInfo["stunt_id"], this._aryStuntPointInfo);
                k = this._objPlayerInfo["stunt_level"];
                while (k < aryCurrentStuntPoint.length) {
                    objAura = (aryCurrentStuntPoint[k] as Object);
                    intNeedAura = (intNeedAura + objAura["need_aura"]);
                    if (this._objPlayerInfo["aura"] > objAura["need_aura"]){
                        if (!Image.isInCache((URI.studyStuntIconUrl + "light.swf"))){
                            this._objLoadImage["light.swf"] = (URI.studyStuntIconUrl + "light.swf");
                        };
                    };
                    k = (k + 1);
                };
                if (this._objPlayerInfo["aura"] > intNeedAura){
                    setTimeout(delay, 6000);
                };
            };
            this.loadImage();
        }
        public function player_study_stunt(_arg1:Array):void{
            this._objPlayerStudyStunt = {};
            oObject.list(_arg1, this._objPlayerStudyStunt, ["result", "stunt_state", "left_aura"]);
        }
        public function player_use_role_stunt_id(_arg1:Array):void{
            this._mainRoleStuntIds = [];
            var _local2:int;
            while (_local2 < _arg1[0].length) {
                this._mainRoleStuntIds.push({
                    playerId:_arg1[0][_local2][0],
                    stuntId:_arg1[0][_local2][1]
                });
                _local2++;
            };
        }
        public function player_can_study_stunt(_arg1:Array):void{
            this._objPlayerCanStudyStunt = {};
            oObject.list(_arg1, this._objPlayerCanStudyStunt, ["stunt_id", "stunt_level"]);
        }

    }
}//package com.datas 

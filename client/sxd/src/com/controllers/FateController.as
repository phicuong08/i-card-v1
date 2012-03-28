//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.controllers.*;

    public class FateController extends  com.controllers.Base {

        public var ownData:FateData;
        public var FateScrapNumber:int = 0;
        private var _mainPlayerList:Array;
        public var _addFateNpcId:int = 0;
        private var _mergeData:Array;
        private var _mergeAllInBag:Array;
        private var colorObj:Object;

        public function FateController(){
            this.colorObj = {
                1:0x999999,
                2:2272312,
                3:44783,
                4:0xFF00FF,
                5:0xFFF100,
                6:0xFF0000,
                7:0xFFF100
            };
            super();
        }
        private static function sortFateNpc(_arg1:Array):void{
            var _local4:int;
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:int = 1;
            while (_local3 < _local2) {
                _local4 = 0;
                while (_local4 < (_local2 - 1)) {
                    if (_arg1[_local4].fateNpcId > _arg1[(_local4 + 1)].fateNpcId){
                        _local5 = _arg1[_local4];
                        _arg1[_local4] = _arg1[(_local4 + 1)];
                        _arg1[(_local4 + 1)] = _local5;
                    };
                    _local4++;
                };
                _local3++;
            };
        }

        public function get fateNpc():Object{
            var _local1:Array = this.ownData.fateNpc;
            var _local2:Object = {};
            _local2.freeAppointTimes = _local1[0];
            var _local3:Array = this.renderFateNpc(_local1[1]);
            sortFateNpc(_local3);
            _local2.fateNpcList = _local3;
            return (_local2);
        }
        private function renderFateNpc(_arg1:Array):Array{
            var _local7:Object;
            var _local2:Array = [];
            var _local3:int;
            var _local4:int;
            var _local5:int = _arg1.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = {};
                _local7.fateNpcId = _arg1[_local6][0];
                _local7.status = _arg1[_local6][1];
                _local7.url = URI.getRoleIconUrl(("Npc" + _local7.fateNpcId));
                _local7.canBuyTimer = _arg1[_local6][2];
                _local7.buyPrice = _arg1[_local6][3];
                if (_local7.status == 1){
                    if (_local3 <= _local7.fateNpcId){
                        _local3 = _local7.fateNpcId;
                        if (_local2.length > 0){
                            _local2[_local4].isShowChat = false;
                        };
                        _local4 = _local6;
                        _local7.isShowChat = true;
                    };
                };
                if (_local7.fateNpcId == 4){
                    _local7.isBuy = true;
                } else {
                    _local7.isBuy = false;
                };
                _local7.isVip5 = VIPType.check(VIPType.Level5);
                _local7.npcName = FateType.getNPCName(_local7.fateNpcId);
                _local7.coins = FateType.getNPCFee(_local7.fateNpcId);
                _local2.push(_local7);
                _local6++;
            };
            return (_local2);
        }
        public function get tempFate():Array{
            var _local1:Array = this.ownData.tempFate;
            return (this.renderTempFate(_local1[0]));
        }
        private function renderTempFate(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.tempFateId = _arg1[_local4][0];
                _local5.fateId = _arg1[_local4][1];
                _local5.quality = FateType.getFateQuality(_local5.fateId);
                if (_local5.quality <= 0){
                    _local5.fateLevel = 0;
                } else {
                    _local5.fateLevel = 1;
                };
                this.renderFateDate(_local5);
                _local2.push(_local5);
                _local4++;
            };
            _local2.sortOn("tempFateId");
            return (_local2);
        }
        public function get pickupFate():Object{
            var _local1:Array = this.ownData.pickupFate;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.gridList = _local1[1];
            return (_local2);
        }
        public function get saleTempFate():Object{
            var _local1:Array = this.ownData.saleTempFate;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get bagList():Array{
            var _local1:Array = this.ownData.bagList;
            var _local2:Array = this.renderBagList(_local1[0], _local1[1]);
            this.FateScrapNumber = _local1[2];
            return (_local2);
        }
        private function renderBagList(_arg1:Array, _arg2:int):Array{
            var _local8:Object;
            var _local9:int;
            var _local10:int;
            var _local3:Array = [];
            var _local4:int;
            this.sortPosition(_arg1);
            var _local5:int;
            var _local6:int = _arg1.length;
            var _local7:int;
            while (_local7 < 20) {
                _local8 = {};
                _local8.roleId = 0;
                _local8.playerName = "";
                _local8.playerRoleId = 0;
                _local8.playerColor = 0xFFFFFF;
                _local8.playerLevel = 0;
                _local8.buyGrid = 0;
                _local9 = (_local7 + 1);
                if ((((_local6 > _local4)) && ((_local9 == _arg1[_local4][5])))){
                    _local8.playerFateId = _arg1[_local4][0];
                    _local8.fateId = _arg1[_local4][1];
                    _local8.fateLevel = _arg1[_local4][2];
                    _local8.fateExp = _arg1[_local4][3];
                    _local8.upDataExp = _arg1[_local4][4];
                    _local8.grid = _arg1[_local4][5];
                    _local8.lockOn = true;
                    _local8.isEmpty = false;
                    this.renderFateDate(_local8);
                    _local4++;
                } else {
                    _local8.playerFateId = 0;
                    _local8.fateId = 0;
                    _local8.fateLevel = 0;
                    _local8.fateExp = 0;
                    _local8.upDataExp = 0;
                    _local8.isEmpty = true;
                    if (_local7 < _arg2){
                        _local8.grid = _local9;
                        _local8.lockOn = true;
                    } else {
                        _local8.grid = _local9;
                        _local8.lockOn = false;
                        _local10 = (_local7 - 4);
                        if (_local7 >= 5){
                            _local5 = (_local5 + (10 * _local10));
                        };
                        _local8.price = _local5;
                    };
                };
                _local3.push(_local8);
                _local7++;
            };
            return (_local3);
        }
        public function get buyBagGrid():Object{
            var _local1:Array = this.ownData.buyBagGrid;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get roleFateData():Object{
            var _local1:Array = this.ownData.roleFateList;
            var _local2:Object = {};
            _local2.fateList = this.renderRoleFateList(_local1[0], _local1[2]);
            _local2.fatePower = _local1[1];
            _local2.canWearNumber = _local1[2];
            return (_local2);
        }
        private function renderRoleFateList(_arg1:Array, _arg2:int):Array{
            var _local7:Object;
            var _local8:int;
            var _local3:Array = [];
            this.sortPosition(_arg1);
            var _local4:int = _arg1.length;
            var _local5:int;
            var _local6:int;
            while (_local6 < 8) {
                _local7 = {};
                _local7.grid = 0;
                _local8 = (_local6 + 1);
                if ((((_local4 > _local5)) && ((_local8 == _arg1[_local5][5])))){
                    _local7.playerFateId = _arg1[_local5][0];
                    _local7.fateId = _arg1[_local5][1];
                    _local7.fateLevel = _arg1[_local5][2];
                    _local7.fateExp = _arg1[_local5][3];
                    _local7.upDataExp = _arg1[_local5][4];
                    _local7.position = _arg1[_local5][5];
                    _local7.lockOn = true;
                    this.renderFateDate(_local7);
                    _local7.isEmpty = false;
                    _local5++;
                } else {
                    _local7.playerFateId = 0;
                    _local7.grid = 0;
                    _local7.fateId = 0;
                    _local7.fateLevel = 0;
                    _local7.fateExp = 0;
                    _local7.upDataExp = 0;
                    _local7.isEmpty = true;
                    if (_local6 < _arg2){
                        _local7.position = _local8;
                        _local7.lockOn = true;
                    } else {
                        _local7.position = 0;
                        _local7.lockOn = false;
                    };
                };
                _local3.push(_local7);
                _local6++;
            };
            return (_local3);
        }
        private function sortPosition(_arg1:Array):void{
            var _local4:int;
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:int = 1;
            while (_local3 < _local2) {
                _local4 = 0;
                while (_local4 < (_local2 - 1)) {
                    if (_arg1[_local4][5] > _arg1[(_local4 + 1)][5]){
                        _local5 = _arg1[_local4];
                        _arg1[_local4] = _arg1[(_local4 + 1)];
                        _arg1[(_local4 + 1)] = _local5;
                    };
                    _local4++;
                };
                _local3++;
            };
        }
        public function get wearOn():Object{
            var _local1:Array = this.ownData.wearOn;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            if (_local1[1] != 0){
                _local2.fateId = _local1[1];
                this.renderFateDate(_local2);
            };
            return (_local2);
        }
        public function get discardFate():Object{
            var _local1:Array = this.ownData.discardFate;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get appointFateNpc():Object{
            var _local1:Array = this.ownData.appointFateNpc;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.fateId = _local1[1];
            _local2.fateNpcId = _local1[2];
            _local2.tempFateId = _local1[3];
            _local2.npcName = "";
            _local2.info = "";
            _local2.quality = FateType.getFateQuality(_local2.fateId);
            if (_local2.quality <= 0){
                _local2.fateLevel = 0;
            } else {
                _local2.fateLevel = 1;
            };
            if (_local2.msg == Mod_Fate_Base.SUCCESS){
                if (_local2.fateId != 0){
                    this.renderFateDate(_local2);
                    _local2.type = "success";
                    if (_local2.fateNpcId != 0){
                        _local2.npcName = FateType.getNPCName(_local2.fateNpcId);
                        _local2.mainInfo = ((((((((((((("<font color=\"#33ff00\">" + FateControllerLang.Get) + "“ </font>") + "<font color=\"#") + _local2.color.toString(16)) + "\">") + _local2.fateName) + "</font>") + "<font color=\"#33ff00\"> ”，") + FateControllerLang.Encounter) + "</font>") + "<font color=\"#33ff00\">") + _local2.npcName) + "</font>");
                    } else {
                        _local2.fateNpcId = 1;
                        _local2.mainInfo = (((((((("<font color=\"#33ff00\">" + FateControllerLang.Get) + "“</font>") + "<font color=\"#") + _local2.color.toString(16)) + "\">") + _local2.fateName) + "</font>") + "<font color=\"#33ff00\"> ”</font>");
                    };
                    this._addFateNpcId = _local2.fateNpcId;
                } else {
                    _local2.type = "fail";
                    _local2.info = FateControllerLang.NoGetFate;
                };
            };
            return (_local2);
        }
        public function get wearOffFate():Object{
            var _local1:Array = this.ownData.wearOffFate;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get changeFateGrid():Object{
            var _local1:Array = this.ownData.changeFateGrid;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get changePosition():Object{
            var _local1:Array = this.ownData.changePosition;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get getFatePower():Object{
            var _local1:Array = this.ownData.getFatePower;
            var _local2:Object = {};
            _local2.fate_power = _local1[0];
            return (_local2);
        }
        public function get merge():Object{
            var _local1:Array = this.ownData.merge;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            if (_local1[1] != 0){
                _local2.fateId = _local1[1];
                this.renderFateDate(_local2);
            };
            return (_local2);
        }
        public function get mergeData():Object{
            var _local1:Array = this.ownData.mergeData;
            var _local2:Object = {};
            _local2.newLevel = _local1[0];
            return (_local2);
        }
        public function get mergeAllInBag():Array{
            return (this._mergeAllInBag);
        }
        public function get ExchangeFate():Object{
            var _local1:Array = this.ownData.ExchangeFate;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        private function bagData(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.roleId = 0;
            _local2.playerName = "";
            _local2.playerRoleId = 0;
            _local2.playerColor = 0xFFFFFF;
            _local2.playerLevel = 0;
            _local2.playerFateId = _arg1[0];
            _local2.fateId = _arg1[1];
            _local2.fateLevel = _arg1[2];
            _local2.fateExp = _arg1[3];
            _local2.upDataExp = _arg1[4];
            _local2.grid = _arg1[5];
            _local2.lockOn = true;
            this.renderFateDate(_local2);
            return (_local2);
        }
        private function renderFateDate(_arg1:Object):void{
            _arg1.quality = FateType.getFateQuality(_arg1.fateId);
            _arg1.fateName = FateType.getFateName(_arg1.fateId);
            _arg1.color = this.colorRender(_arg1.quality);
            _arg1.info = FateType.getFateDescription(_arg1.fateId);
            _arg1.sell = FateType.getSalePriceByFateId(_arg1.fateId);
            _arg1.addValue = FateType.getFateAddonValue(_arg1.fateId, _arg1.fateLevel);
            _arg1.maxLevel = FateType.getMaxFateLevel(_arg1.fateId);
            _arg1.baseExp = FateType.getExperienceByQualityId(_arg1.quality);
            _arg1.warType = FateType.getWarAttributeType(_arg1.fateId);
            if ((((((((((((((_arg1.warType == FateType.Hit)) || ((_arg1.warType == FateType.Block)))) || ((_arg1.warType == FateType.Dodge)))) || ((_arg1.warType == FateType.Critical)))) || ((_arg1.warType == FateType.BreakBlock)))) || ((_arg1.warType == FateType.BreakCritical)))) || ((_arg1.warType == FateType.Kill)))){
                _arg1.addValue = (_arg1.addValue + "%");
            };
            _arg1.fateLevelInfo = "";
            if ((((_arg1.fateLevel >= _arg1.maxLevel)) && (!((_arg1.quality == 0))))){
                _arg1.fateLevelInfo = FateControllerLang.MaxLevel;
            };
            if (_arg1.quality == 1){
                _arg1.sign = "ZaWu";
            } else {
                if (_arg1.quality == 6){
                    _arg1.sign = FateType.getFateSign(_arg1.fateId);
                    _arg1.quality = 0;
                    _arg1.maxLevel = 10;
                } else {
                    _arg1.sign = FateType.getFateSign(_arg1.fateId);
                };
            };
            _arg1.url = ((URI.fateUrl + _arg1.sign) + ".swf");
        }
        public function get buyFateNpc():Object{
            var _local1:Array = _data.fate.buyFateNpc;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        private function colorRender(_arg1:uint):uint{
            var _local2:uint = this.colorObj[_arg1];
            return (_local2);
        }

    }
}//package com.controllers 

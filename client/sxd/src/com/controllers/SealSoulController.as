//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.*;
    import com.assist.server.*;

    public class SealSoulController extends Base {

        private var _tenAttributeList:Array;
        private var _tenAttributeData:Object;

        public function get soulInfoList():Array{
            var _local1:Array = _data.sealSoul.SoulInfoList;
            var _local2:Array = [];
            _local2 = this.renderSoul(_local1, true);
            return (_local2);
        }
        public function get itemInfo():Object{
            var _local1:Array = _data.sealSoul.itemInfo;
            var _local2:Object = {};
            _local2.playerItemId = _local1[0];
            _local2.itemId = _local1[1];
            _local2.itemLv = _local1[2];
            _local2.itemName = ItemType.getName(_local2.itemId);
            _local2.itemColor = ItemType.getItemColor(_local2.itemId);
            _local2.itemLvName = ItemType.getItemUpgrade(_local2.itemLv);
            _local2.jobList = ItemType.getEquipJob(_local2.itemId);
            _local2.jobSign = RoleType.getJobSign(_local2.jobList[0]);
            if (_local2.playerItemId != 0){
                _local2.soulSealList = this.renderSoul(_local1[3]);
            } else {
                _local2.soulSealList = [];
            };
            return (_local2);
        }
        public function get equipPlayerSoul():Object{
            var _local1:Array = _data.sealSoul.equipPlayerSoul;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get removePlayerSoul():Object{
            var _local1:Array = _data.sealSoul.removePlayerSoul;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get swapSoul():Object{
            var _local1:Array = _data.sealSoul.swapSoul;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get moveSoul():Object{
            var _local1:Array = _data.sealSoul.moveSoul;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get openSoulKey():Object{
            var _local1:Array = _data.sealSoul.openSoulKey;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get soulAtributeReset():Object{
            var _local1:Array = _data.sealSoul.soulAtributeReset;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get getTowerKey():int{
            var _local1:Array = _data.sealSoul.getTowerKey;
            var _local2:int = _local1[0];
            return (_local2);
        }
        public function get sellPlayerSoul():Object{
            var _local1:Array = _data.sealSoul.sellPlayerSoul;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        private function renderSoul(_arg1:Array, _arg2:Boolean=false):Array{
            var _local6:Object;
            var _local3:Array = [];
            var _local4:int = _arg1.length;
            var _local5:int;
            while (_local5 < _local4) {
                if (_arg1[_local5][0] != 0){
                    _local6 = {};
                    _local6.playerSoulId = _arg1[_local5][0];
                    _local6.soulId = _arg1[_local5][1];
                    _local6.soulName = SoulType.getSoulName(_local6.soulId);
                    _local6.quality = SoulType.getSoulQualityId(_local6.soulId);
                    _local6.color = SoulType.getQualityColor(_local6.quality);
                    _local6.sign = _local6.soulId;
                    _local6.url = URI.getSoulsIconUrl(_local6.soulId);
                    _local6.soulTypeId = SoulType.getSoulSubTypeId(_local6.soulId);
                    _local6.soulType = SoulType.getSubTypeNameByAllTypeId(_local6.soulTypeId);
                    _local6.jobId = SoulType.getSoulTypeIdByAllTypeId(_local6.soulTypeId);
                    _local6.jobName = SoulType.getJobNameToTypeId(_local6.jobId);
                    _local6.isEmpty = false;
                    _local6.salePrice = SoulType.getSoulSalePrice(_local6.soulId);
                    _local6.locationInfo = "";
                    _local6.locationList = [];
                    _local6.openKey = _arg1[_local5][9];
                    _local6.pickJob = (_local6.l1 = SoulType.getWarAttributeTypeId(_arg1[_local5][2]));
                    if (_local6.openKey >= 1){
                        _local6.locationList.push(this.renderLocationList(_local6.l1, _local6.quality, _arg1[_local5][3]));
                    };
                    _local6.l2 = SoulType.getWarAttributeTypeId(_arg1[_local5][4]);
                    if (_local6.openKey >= 2){
                        _local6.locationList.push(this.renderLocationList(_local6.l2, _local6.quality, _arg1[_local5][5]));
                    };
                    _local6.l3 = SoulType.getWarAttributeTypeId(_arg1[_local5][6]);
                    if (_local6.openKey >= 3){
                        _local6.locationList.push(this.renderLocationList(_local6.l3, _local6.quality, _arg1[_local5][7]));
                    };
                    _local6.packLocation = _arg1[_local5][8];
                    _local6.lockState = _arg1[_local5][10];
                    _local6.unlockTime = _arg1[_local5][11];
                    _local6.diffTime = _ctrl.player.diffServerTime;
                    _local6.lock1 = _arg1[_local5][12];
                    _local6.lock2 = _arg1[_local5][13];
                    _local6.lock3 = _arg1[_local5][14];
                    _local3.push(_local6);
                };
                _local5++;
            };
            return (_local3);
        }
        public function get tenTimesReset():Object{
            var _local1:Array = _data.sealSoul.tenTimesReset;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.attributeList = [];
            this._tenAttributeData = {};
            this._tenAttributeList = [];
            var _local3:Array = _local1[1];
            var _local4:int = _local3.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local2.attributeList.push(this.renderAttribute(_local3[_local5]));
                _local5++;
            };
            this.attributeLock(_local2.attributeList);
            this.renderBaseAttribute();
            return (_local2);
        }
        private function attributeLock(_arg1:Array):void{
            var _local4:int;
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:int = 1;
            while (_local3 < _local2) {
                _local4 = 0;
                while (_local4 < (_local2 - 1)) {
                    if (_arg1[_local4].attributeId > _arg1[(_local4 + 1)].attributeId){
                        _local5 = _arg1[_local4];
                        _arg1[_local4] = _arg1[(_local4 + 1)];
                        _arg1[(_local4 + 1)] = _local5;
                    };
                    _local4++;
                };
                _local3++;
            };
        }
        public function renderAttribute(_arg1:Array):Object{
            var _local2:Object = {};
            _local2.soulId = _arg1[0];
            _local2.attributeId = _arg1[1];
            _local2.quality = SoulType.getSoulQualityId(_local2.soulId);
            _local2.locationData = {};
            _local2.l1isGood = false;
            _local2.l2isGood = false;
            _local2.l3isGood = false;
            _local2.l1Value = _arg1[3];
            _local2.l2Value = _arg1[5];
            _local2.l3Value = _arg1[7];
            _local2.l1 = SoulType.getWarAttributeTypeId(_arg1[2]);
            if (_local2.l1 > 0){
                if (this._tenAttributeData[_local2.l1] == null){
                    this._tenAttributeData[_local2.l1] = [];
                    this._tenAttributeList.push(_local2.l1);
                };
                _local2.locationData[_local2.l1] = this.renderLocationList(_local2.l1, _local2.quality, _local2.l1Value);
                this._tenAttributeData[_local2.l1].push({
                    value:_local2.l1Value,
                    data:_local2,
                    id:"L1",
                    color:_local2.locationData[_local2.l1].color
                });
            };
            _local2.l2 = SoulType.getWarAttributeTypeId(_arg1[4]);
            if (_local2.l2 > 0){
                if (this._tenAttributeData[_local2.l2] == null){
                    this._tenAttributeData[_local2.l2] = [];
                    this._tenAttributeList.push(_local2.l2);
                };
                _local2.locationData[_local2.l2] = this.renderLocationList(_local2.l2, _local2.quality, _local2.l2Value);
                this._tenAttributeData[_local2.l2].push({
                    value:_local2.l2Value,
                    data:_local2,
                    id:"L2",
                    color:_local2.locationData[_local2.l2].color
                });
            };
            _local2.l3 = SoulType.getWarAttributeTypeId(_arg1[6]);
            if (_local2.l3 > 0){
                if (this._tenAttributeData[_local2.l3] == null){
                    this._tenAttributeData[_local2.l3] = [];
                    this._tenAttributeList.push(_local2.l3);
                };
                _local2.locationData[_local2.l3] = this.renderLocationList(_local2.l3, _local2.quality, _local2.l3Value);
                this._tenAttributeData[_local2.l3].push({
                    value:_local2.l3Value,
                    data:_local2,
                    id:"L3",
                    color:_local2.locationData[_local2.l3].color
                });
            };
            return (_local2);
        }
        private function renderBaseAttribute():void{
            var _local3:int;
            var _local4:Array;
            var _local5:Object;
            var _local1:int = this._tenAttributeList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._tenAttributeList[_local2];
                _local4 = this._tenAttributeData[_local3];
                this.sortLock(_local4);
                _local5 = _local4[0];
                if (_local5.color != 2272312){
                    if (_local5.id == "L1"){
                        _local5.data.l1isGood = true;
                    };
                    if (_local5.id == "L2"){
                        _local5.data.l2isGood = true;
                    };
                    if (_local5.id == "L3"){
                        _local5.data.l3isGood = true;
                    };
                };
                _local2++;
            };
        }
        private function sortLock(_arg1:Array):void{
            var _local4:int;
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:int = 1;
            while (_local3 < _local2) {
                _local4 = 0;
                while (_local4 < (_local2 - 1)) {
                    if (_arg1[_local4].value < _arg1[(_local4 + 1)].value){
                        _local5 = _arg1[_local4];
                        _arg1[_local4] = _arg1[(_local4 + 1)];
                        _arg1[(_local4 + 1)] = _local5;
                    };
                    _local4++;
                };
                _local3++;
            };
        }
        public function get playerSoulValue():Object{
            var _local1:Array = _data.sealSoul.playerSoulValue;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get getResetCount():int{
            var _local1:Array = _data.sealSoul.getResetCount;
            var _local2:int = _local1[0];
            return (_local2);
        }
        public function get getStoneCount():int{
            var _local1:Array = _data.sealSoul.getStoneCount;
            var _local2:int = _local1[0];
            return (_local2);
        }
        public function get getLockData():Object{
            var _local1:Array = _data.sealSoul.LockData;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get getUnLockData():Object{
            var _local1:Array = _data.sealSoul.WillToUnlock;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        public function get notifyGet():Object{
            return (_data.sealSoul.notifyGet);
        }
        public function get getDayStone():Object{
            return (_data.sealSoul.getDayStone);
        }
        public function get dayStoneCount():Object{
            return (_data.sealSoul.dayStoneCount);
        }
        public function get swapSealSoul():Object{
            return (_data.sealSoul.swapSealSoul);
        }
        public function get saveLock():Object{
            var _local1:Array = _data.sealSoul.SaveLock;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }
        private function getIdForData(_arg1:int):Object{
            var _local2:Object = {};
            _local2.soulName = SoulType.getSoulName(_local2.soulId);
            _local2.quality = SoulType.getSoulQualityId(_local2.soulId);
            _local2.color = SoulType.getQualityColor(_local2.quality);
            _local2.url = URI.getSoulsIconUrl(_local2.soulId);
            return (_local2);
        }
        public function renderLocationList(_arg1:int, _arg2:int, _arg3:Number):Object{
            var _local4:Number = (_arg3 / 1000);
            var _local5:String = SoulType.warAttributeIdToName(_arg1);
            var _local6:String = SoulType.warAttributeIdToInfo(_arg1);
            var _local7:Object = SoulType.getDataColor(_arg1, _arg2, _local4);
            var _local8:uint = _local7.color;
            var _local9:int = _local7.colorQuelity;
            var _local10:String = SoulType.warValueChange(_arg1, _local4);
            var _local11:String = SoulType.getDataRange(_arg1, _arg2, _local4);
            return ({
                lid:_arg1,
                name:_local5,
                color:_local8,
                colorQuelity:_local9,
                valueInfo:_local10,
                range:_local11,
                oldValue:_arg3,
                info:_local6
            });
        }

    }
}//package com.controllers 

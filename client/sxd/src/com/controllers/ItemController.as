//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.view.info.*;

    public class ItemController extends Base {

        public function get gridsRole():Array{
            return (_data.item.gridsRole);
        }
        public function get gridsRoleOther():Array{
            return (_data.item.gridsRoleOther);
        }
        public function get gridsPack():Array{
            return (_data.item.gridsPack);
        }
        public function set gridsPackAuto(_arg1:Array):void{
            _data.item.gridsPackAuto = _arg1;
        }
        public function set gridsWarehouseAuto(_arg1:Array):void{
            _data.item.gridsWarehouseAuto = _arg1;
        }
        public function pushPack(_arg1:int):void{
            _data.item.pushPack(_arg1);
        }
        public function pushWareHouse(_arg1:int):void{
            _data.item.pushWareHouse(_arg1);
        }
        public function pushRole(_arg1:int):void{
            _data.item.pushRole(_arg1);
        }
        public function get ingot_pack():int{
            return (_data.item.ingot_pack);
        }
        public function get gridsWarehouse():Array{
            return (_data.item.gridsWarehouse);
        }
        public function get ingot_warehouse():int{
            return (_data.item.ingot_warehouse);
        }
        public function get gridsShop():Array{
            return (_data.item.gridsShop);
        }
        public function get gridsRecyle():Array{
            return (_data.item.gridsRecyle);
        }
        public function get shopNPCId():int{
            return (_data.item.shopNPCId);
        }
        public function get shopType():int{
            return (_data.item.shopType);
        }
        public function get recastList():Array{
            return (_data.item.recastList);
        }
        public function get cangoldList():Array{
            return (_data.item.cangoldList);
        }
        public function get elixirCount():int{
            return (_data.item.elixirCount);
        }
        public function get elixirValue():int{
            return (_data.item.elixirValue);
        }
        public function get reelOutItemId():int{
            return (_data.item.reelOutItemId);
        }
        public function get reelData():Array{
            return (_data.item.reelData);
        }
        public function get playerRoleId():int{
            return (_data.item.playerRoleId);
        }
        public function get danyaoList():Array{
            return (_data.item.danyaoList);
        }
        public function get result():int{
            return (_data.item.result);
        }
        public function get hasReelList():Array{
            return (_data.item.hasReelList);
        }
        public function get hasGoldList():Array{
            return (_data.item.hasGoldList);
        }
        public function get giftUseMsg():String{
            return (_data.item.giftUseMsg);
        }
        public function get getSoul():Object{
            return (_data.item.getSoul);
        }
        public function get getTheItemNum():Object{
            return (_data.item.getTheItemNum);
        }
        public function get getGoldOil():Object{
            return (_data.item.getGoldOil);
        }
        public function autoGrids(_arg1:Array, _arg2:int):Array{
            var _local4:ItemInfo;
            var _local5:int;
            var _local6:int;
            var _local7:Array;
            var _local8:Array;
            var _local9:Array;
            var _local10:int;
            var _local11:Array;
            var _local12:Object;
            var _local3:Array = [];
            for each (_local4 in _arg1) {
                if (_local4.itemId == 0){
                } else {
                    _local3[_local4.itemId] = ((_local3[_local4.itemId]) || ([]));
                    _local3[_local4.itemId].push(_local4);
                };
            };
            _local7 = [];
            _local8 = [];
            _local10 = _local3.length;
            while (0 < _local10) {
                _local9 = _local3.pop();
                _local10--;
                if (_local9 == null){
                } else {
                    _local4 = _local9[0];
                    _local6 = _local4.basic.max;
                    _local5 = 0;
                    if (_local6 <= 1){
                        for each (_local4 in _local9) {
                            _local11 = [_local4.playerItemId, _local4.itemId, 0, _local4.upgradeLevel, _local4.price, _local4.num, _local4.useing, _local4.goldId];
                            _local7.push({
                                arr:_local11,
                                typeId:_local4.basic.type_id,
                                quality:_local4.basic.quality,
                                itemid:_local4.itemId
                            });
                        };
                    } else {
                        for each (_local4 in _local9) {
                            _local5 = (_local5 + _local4.num);
                        };
                        for each (_local4 in _local9) {
                            _local11 = [_local4.playerItemId, _local4.itemId, 0, _local4.upgradeLevel, _local4.price, _local4.num, _local4.useing, _local4.goldId];
                            if (_local5 > 0){
                                if (_local5 >= _local6){
                                    _local11[5] = _local6;
                                    _local7.push({
                                        arr:_local11,
                                        typeId:_local4.basic.type_id,
                                        quality:_local4.basic.quality,
                                        itemid:_local4.itemId
                                    });
                                } else {
                                    _local11[5] = _local5;
                                    _local7.push({
                                        arr:_local11,
                                        typeId:_local4.basic.type_id,
                                        quality:_local4.basic.quality,
                                        itemid:_local4.itemId
                                    });
                                };
                                _local5 = (_local5 - _local6);
                            } else {
                                _local8.push([_local4.playerItemId, 0, 0, 0, 0, 0, 0, 0]);
                            };
                        };
                    };
                };
            };
            _local7.sortOn(["typeId", "quality", "itemid"], [Array.NUMERIC, Array.NUMERIC, Array.NUMERIC]);
            _local3 = [];
            for each (_local12 in _local7) {
                _local9 = _local12.arr;
                _local9[2] = _arg2;
                _arg2++;
                _local3.push(_local9);
            };
            return ([_local3, _local8]);
        }

    }
}//package com.controllers 

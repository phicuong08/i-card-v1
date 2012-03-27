//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import flash.utils.*;
    import com.assist.view.pack.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;

    public class LuckyShopData extends Base {

        private var _aryLuckyShopItemList:Array;
        private var _aryLuckyShopRecordList:Array;
        private var _aryBuyLuckyShopItem:Array;
        private var _aryRefreshLuckyShop:Array;
        private var _timeId:int = 0;
        private var _reqList:Array;
        public var isItemDataReturn:Boolean = true;

        public function LuckyShopData(){
            this._aryLuckyShopItemList = [];
            this._aryLuckyShopRecordList = [];
            this._aryBuyLuckyShopItem = [];
            this._aryRefreshLuckyShop = [];
            this._reqList = [];
            super();
        }
        public function getLuckyShopItemList():Object{
            var _local1:Array = this.getItemList(this._aryLuckyShopItemList[0]);
            var _local2:Object = {
                item_list:_local1,
                refresh_hour:this._aryLuckyShopItemList[1],
                refresh_seconds:this._aryLuckyShopItemList[2],
                refresh_ingot:this._aryLuckyShopItemList[3]
            };
            return (_local2);
        }
        public function getLuckyShopRecordList():Array{
            var _local1:Object;
            var _local3:Array;
            var _local2:Array = [];
            for each (_local3 in this._aryLuckyShopRecordList[0]) {
                _local1 = {};
                oObject.list(_local3, _local1, ["player_id", "player_name", "item_id", "timestamp"]);
                _local1["player_name"] = this._data.player.removeNickNameSuffix(_local1["player_name"]);
                _local1["color"] = ItemType.getItemColor(_local1["item_id"]);
                _local1["name"] = ItemType.getName(_local1["item_id"]);
                if (ItemType.getTypeId(_local1["item_id"]) == ItemType.ZaWu){
                    _local1["number"] = ItemType.getMaxRepeatNum(ItemType.ZaWu);
                } else {
                    _local1["number"] = null;
                };
                _local2.push(_local1);
            };
            return (_local2);
        }
        public function buyLuckyShopItem():Object{
            var _local1:Object = {result:this._aryBuyLuckyShopItem[0]};
            return (_local1);
        }
        public function refreshLuckyShop():Object{
            var _local1:Object = {
                result:this._aryRefreshLuckyShop[0],
                item_list:this.getItemList(this._aryRefreshLuckyShop[1])
            };
            return (_local1);
        }
        private function getItemList(_arg1:Array):Array{
            var _local2:Object;
            var _local4:Array;
            var _local5:ItemBasically;
            var _local3:Array = [];
            for each (_local4 in _arg1) {
                _local2 = {};
                oObject.list(_local4, _local2, ["item_id", "can_buy"]);
                _local5 = ItemBasically.empty;
                _local5 = ItemBasically.getBasic(_local2["item_id"]);
                _local2["coin"] = _local5.price;
                _local2["color"] = ItemType.getItemColor(_local2["item_id"]);
                _local2["name"] = ItemType.getName(_local2["item_id"]);
                _local2["url"] = _local5.getImgUrl(0);
                if (ItemType.getTypeId(_local2["item_id"]) == ItemType.ZaWu){
                    _local2["number"] = ItemType.getMaxRepeatNum(ItemType.ZaWu);
                    _local2["coin"] = (_local2["coin"] * _local2["number"]);
                } else {
                    _local2["number"] = null;
                };
                if (ItemType.getTypeId(_local2["item_id"]) == ItemType.BianShen){
                    _local2["sort"] = (_local2["item_id"] + (_local2["coin"] * 1000));
                } else {
                    _local2["sort"] = (_local2["item_id"] + _local2["coin"]);
                };
                _local3.push(_local2);
            };
            _local3.sortOn(["sort"], Array.NUMERIC);
            return (_local3);
        }
        private function getItemInfo(_arg1:int):void{
            this.isItemDataReturn = false;
            this._reqList[_arg1] = [_arg1];
            if (this._timeId == 0){
                this._timeId = setTimeout(this.get_item_basical_infos, 20);
            };
        }
        private function get_item_basical_infos():void{
            var _local2:Array;
            this._timeId = 0;
            var _local1:Array = [];
            for each (_local2 in this._reqList) {
                _local1.push(_local2);
            };
            _data.call(Mod_Item_Base.get_item_basical_infos, this.getItemBasicalInfosCallBack, [_local1]);
        }
        private function getItemBasicalInfosCallBack():void{
            this.isItemDataReturn = true;
        }
        public function lucky_shop_item_list(_arg1:Array):void{
            var _local2:Array;
            this._aryLuckyShopItemList = _arg1;
            for each (_local2 in this._aryLuckyShopItemList[0]) {
                this.getItemInfo(_local2[0]);
            };
        }
        public function lucky_shop_record_list(_arg1:Array):void{
            var _local2:Array;
            this._aryLuckyShopRecordList = _arg1;
            for each (_local2 in this._aryLuckyShopRecordList[0]) {
                this.getItemInfo(_local2[2]);
            };
        }
        public function buy_lucky_shop_item(_arg1:Array):void{
            this._aryBuyLuckyShopItem = _arg1;
        }
        public function refresh_lucky_shop(_arg1:Array):void{
            var _local2:Array;
            this._aryRefreshLuckyShop = _arg1;
            for each (_local2 in this._aryRefreshLuckyShop[1]) {
                this.getItemInfo(_local2[0]);
            };
        }

    }
}//package com.datas 

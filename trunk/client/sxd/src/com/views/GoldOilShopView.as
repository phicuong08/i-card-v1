//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class GoldOilShopView extends Base implements IView {

        private var _goldOilShop:IGoldOilShop;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._goldOilShop.clear();
        }
        public function updateStatePoint():void{
            if (this.inStage){
                this._goldOilShop.renderMyStatePoint(this._ctrl.player.statePoint, this._ctrl.zodiac.zodiacInfo["now_zodiac_level"]);
            };
        }
        private function loadData():void{
            this.zodiac_info(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("GoldOilShop", this.render, GoldOilShopViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._goldOilShop.content);
            _view.center(sign, this._goldOilShop.content);
        }
        private function render():void{
            if (this._goldOilShop == null){
                this._goldOilShop = (_view.getAssetsObject("GoldOilShop", "GoldOilShop") as IGoldOilShop);
            };
            this.init();
            this.getGoldOilList();
            this.showUI();
        }
        private function init():void{
            this._goldOilShop.tip = this._view.tip.iTip;
            this._goldOilShop.drag = this._view.drag.iDrag;
            this._goldOilShop.onClose = this.close;
            this._goldOilShop.onConvert = this.get_soul;
            this._goldOilShop.init();
        }
        private function getGoldOilList():void{
            var _local3:int;
            var _local4:Object;
            var _local1:Array = GoldOilType.getAllOilItemIds();
            var _local2:Array = [];
            for each (_local3 in _local1) {
                _local4 = {};
                _local4["zodiac_level"] = GoldOilType.getOilLevel(_local3);
                if (_local4["zodiac_level"] > (this._ctrl.zodiac.zodiacInfo["heaven"] - 1)){
                } else {
                    _local4["gold_oil_id"] = _local3;
                    _local4["url"] = ((URI.goodsIconUrl + _local3) + ".png");
                    _local4["gold_oil_name"] = ItemType.getName(_local3);
                    _local4["gold_oil_level"] = GoldOilType.getItemLevel(_local3);
                    _local4["zodiac_level"] = GoldOilType.getOilLevel(_local3);
                    _local4["gold_oil_state_point"] = GoldOilType.getExchangeStatePoint(_local3);
                    _local4["description"] = ItemType.getDescription(_local4["gold_oil_id"]);
                    _local2.push(_local4);
                };
            };
            this._goldOilShop.renderGoldOilShop(_local2);
            this._goldOilShop.renderMyStatePoint(this._ctrl.player.statePoint, this._ctrl.zodiac.zodiacInfo["heaven"]);
        }
        private function zodiac_info(_arg1:Function):void{
            _data.call(Mod_Zodiac_Base.zodiac_info, _arg1, []);
        }
        private function get_soul(_arg1:int):void{
            _data.call(Mod_Item_Base.get_gold_oil, this.getGoldOilCallBack, [_arg1]);
        }
        private function getGoldOilCallBack():void{
            var _local1:Object = this._ctrl.item.getGoldOil;
            if (_local1["result"] == Mod_Item_Base.SUCCESS){
                this._view.showTip(this.message(_local1["result"]), null, TipType.Success);
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Item_Base.SUCCESS:
                    _local2 = GoldOilShopViewLang.Success;
                    break;
                case Mod_Item_Base.NOT_ENOUGH_STATE_POINT:
                    _local2 = GoldOilShopViewLang.NotEnoughStatePoint;
                    break;
                case Mod_Item_Base.NOT_GRID:
                    _local2 = GoldOilShopViewLang.NotGrid;
                    break;
                case Mod_Item_Base.NOT_ENOUGH_DAY_COUNT:
                    _local2 = GoldOilShopViewLang.NotEnoughDayCount;
                    break;
                default:
                    _local2 = (GoldOilShopViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.interfaces.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;

    public class SealStoneShopView extends Base implements IView {

        private var _sealStoneShop:ISealShop;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._sealStoneShop.clear();
        }
        private function loadData():void{
            var callBack:* = null;
            callBack = function ():void{
                get_tower_info(loadDataCallBack);
            };
            this.get_stone_count(callBack);
        }
        private function loadDataCallBack():void{
            loadAssets("SealStoneShop", this.render, SealStoneShopViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._sealStoneShop.content);
            _view.center(sign, this._sealStoneShop.content);
        }
        private function render():void{
            if (this._sealStoneShop == null){
                this._sealStoneShop = (_view.getAssetsObject("SealStoneShop", "SealStoneShop") as ISealShop);
            };
            this.init();
            this.getTowerInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._sealStoneShop.tip = this._view.tip.iTip;
            this._sealStoneShop.drag = this._view.drag.iDrag;
            this._sealStoneShop.onClose = this.close;
            this._sealStoneShop.onConvert = this.swap_seal_soul;
            this._sealStoneShop.init();
        }
        private function getStoneInfo(_arg1:Object):void{
            _arg1["soul_name"] = SoulType.getSoulName(_arg1["soul_id"]);
            _arg1["color"] = HtmlText.Purple;
            _arg1["type_id"] = SoulType.getSoulTypeIdByAllTypeId(SoulType.getSoulSubTypeId(_arg1["soul_id"]));
            _arg1["type_name"] = SoulType.getTypeName(_arg1["type_id"]);
            _arg1["url"] = URI.getSoulsIconUrl(_arg1["soul_id"]);
        }
        private function get_stone_count(_arg1:Function):void{
            _data.call(Mod_SealSoul_Base.get_stone_count, _arg1, []);
        }
        private function get_tower_info(_arg1:Function):void{
            _data.call(Mod_Tower_Base.get_tower_info, _arg1, []);
        }
        private function getTowerInfoCallBack():void{
            var _local4:Object;
            var _local5:Object;
            var _local1:Object = this._ctrl.tower.towerInfo;
            var _local2:Array = [];
            var _local3:int = 1;
            while (_local3 <= _local1["layer"]) {
                _local4 = {};
                switch ((_local3 - 1)){
                    case 1:
                        _local4["soul_id"] = 2;
                        _local4["stone_num"] = 20;
                        break;
                    case 2:
                        _local4["soul_id"] = 5;
                        _local4["stone_num"] = 40;
                        break;
                    case 3:
                        _local4["soul_id"] = 8;
                        _local4["stone_num"] = 60;
                        break;
                    case 4:
                        _local4["soul_id"] = 47;
                        _local4["stone_num"] = 80;
                        break;
                    case 5:
                        _local4["soul_id"] = 62;
                        _local4["stone_num"] = 100;
                        break;
                    default:
                        _local4["soul_id"] = 0;
                };
                if (_local4["soul_id"] != 0){
                    this.getStoneInfo(_local4);
                    _local2.push(_local4);
                };
                _local3++;
            };
            if ((((_local1["layer"] == 6)) && ((_local1["sequenceMax_"] == 25)))){
                _local5 = {};
                _local5["soul_id"] = 77;
                _local5["stone_num"] = 120;
                this.getStoneInfo(_local5);
                _local2.push(_local5);
            };
            this._sealStoneShop.renderSealShop(_local2);
            this._sealStoneShop.renderJadeInfo(this._ctrl.sealSoul.getStoneCount);
        }
        private function swap_seal_soul(_arg1:int):void{
            _data.call(Mod_SealSoul_Base.swap_seal_soul, this.getSoulCallBack, [_arg1]);
        }
        private function getSoulCallBack():void{
            var callBack:* = null;
            callBack = function ():void{
                get_tower_info(getTowerInfoCallBack);
                _view.sealSoul.refreshSoul();
            };
            var obj:* = this._ctrl.sealSoul.swapSealSoul;
            if (obj["state"] == 1){
                this._view.showTip(this.message(obj["state"]), null, TipType.Success);
                this.get_stone_count(callBack);
            } else {
                this._view.showTip(this.message(obj["state"]));
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case 0:
                    _local2 = SealStoneShopViewLang.Fail;
                    break;
                case 1:
                    _local2 = SealStoneShopViewLang.Success;
                    break;
                case 2:
                    _local2 = SealStoneShopViewLang.NoStone;
                    break;
                case 3:
                    _local2 = SealStoneShopViewLang.NoLayer;
                    break;
                case 4:
                    _local2 = SealStoneShopViewLang.NotGrid;
                    break;
                default:
                    _local2 = (SealStoneShopViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

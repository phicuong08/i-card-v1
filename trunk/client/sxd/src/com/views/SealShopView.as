//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class SealShopView extends Base implements IView {

        private static const intJadeId:int = 1197;

        private var _sealShop:ISealShop;
        public var npcId:int;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._sealShop.clear();
        }
        private function loadData():void{
            this.get_the_item_num(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("SealShop", this.render, SealShopViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._sealShop.content);
            _view.center(sign, this._sealShop.content);
        }
        private function render():void{
            if (this._sealShop == null){
                this._sealShop = (_view.getAssetsObject("SealShop", "SealShop") as ISealShop);
            };
            this.init();
            this.getSealList();
            this.getTheItemNumCallBack();
            this.showUI();
        }
        private function init():void{
            this._sealShop.tip = this._view.tip.iTip;
            this._sealShop.drag = this._view.drag.iDrag;
            this._sealShop.onClose = this.close;
            this._sealShop.onConvert = this.get_soul;
            this._sealShop.init();
        }
        private function getSealList():void{
            var _local3:int;
            var _local4:Object;
            var _local1:Array = TownNPCType.getNPCSoulIdList(this.npcId);
            var _local2:Array = [];
            for each (_local3 in _local1) {
                _local4 = {};
                _local4["soul_id"] = _local3;
                _local4["soul_name"] = SoulType.getSoulName(_local4["soul_id"]);
                _local4["color"] = HtmlText.Yellow;
                _local4["jade_num"] = SoulType.getItemNumBySoulId(_local4["soul_id"]);
                _local4["type_id"] = SoulType.getSoulTypeIdByAllTypeId(SoulType.getSoulSubTypeId(_local4["soul_id"]));
                _local4["type_name"] = SoulType.getTypeName(_local4["type_id"]);
                _local4["url"] = URI.getSoulsIconUrl(_local4["soul_id"]);
                _local2.push(_local4);
            };
            _local2.sortOn(["type_id", "soul_id"], Array.NUMERIC);
            this._sealShop.renderSealShop(_local2);
        }
        private function getTheItemNum():void{
            this.get_the_item_num(this.getTheItemNumCallBack);
        }
        private function get_the_item_num(_arg1:Function):void{
            _data.call(Mod_Item_Base.get_the_item_num, _arg1, [intJadeId]);
        }
        private function getTheItemNumCallBack():void{
            var _local1:Object = this._ctrl.item.getTheItemNum;
            this._sealShop.renderJadeInfo(_local1["total_num"]);
        }
        private function get_soul(_arg1:int):void{
            _data.call(Mod_Item_Base.get_soul, this.getSoulCallBack, [this.npcId, _arg1]);
        }
        private function getSoulCallBack():void{
            var _local1:Object = this._ctrl.item.getSoul;
            if (_local1["result"] == Mod_Item_Base.SUCCESS){
                this._view.showTip(this.message(_local1["result"]), null, TipType.Success);
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
            this.getTheItemNum();
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Item_Base.SUCCESS:
                    _local2 = SealShopViewLang.Success;
                    break;
                case Mod_Item_Base.NOT_ENOUGH_ITEM:
                    _local2 = SealShopViewLang.NotEnoughItem;
                    break;
                case Mod_Item_Base.NOT_GRID:
                    _local2 = SealShopViewLang.NotGrid;
                    break;
                case Mod_Item_Base.TOWN_NPC_ERROR:
                    _local2 = SealShopViewLang.TownNpcError;
                    break;
                default:
                    _local2 = (SealShopViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

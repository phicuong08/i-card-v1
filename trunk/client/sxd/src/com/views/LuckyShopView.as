//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class LuckyShopView extends Base implements IView {

        private var _luckyShop:ILuckyShop;
        private var _intCdTime:int;
        private var _blnInBuyLuckyShopItem:Boolean = false;
        private var _dialog:IAlert = null;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._luckyShop.clear();
            this._dialog.hide();
            this._intCdTime = 0;
            this._view.removeFromTimerProcessList(this.sign);
            this._data.cancelPatch(Mod_Notify_Base.update_lucky_shop_item);
            Helper.gc();
        }
        private function showUI():void{
            _popup.addView(this, this._luckyShop.content);
            _view.center(sign, this._luckyShop.content);
        }
        private function render():void{
            if (this._luckyShop == null){
                this._luckyShop = (_view.getAssetsObject("LuckyShop", "LuckyShop") as ILuckyShop);
            };
            this.init();
            this._luckyShop.render();
            this.update_lucky_shop_item();
            this.lucky_shop_record_list();
            this.luckyShopItemListCallBack();
            this.showUI();
        }
        private function init():void{
            this._luckyShop.tip = this._view.tip.iTip;
            this._luckyShop.drag = this._view.drag.iDrag;
            this._dialog = this._view.alert.iAlert;
            this._luckyShop.onCloseBtn = this.close;
            this._luckyShop.onRefreshBtn = this.refreshLuckyShop;
            this._luckyShop.onBuyBtn = this.buy_lucky_shop_item;
            this._luckyShop.onTextLink = this._view.toolbar.onTextLink;
        }
        private function timer():void{
            if (this._intCdTime > 0){
                this._intCdTime--;
                this._luckyShop.updateCdTime(this._intCdTime);
            };
        }
        private function refreshLuckyShop():void{
            var callBack:* = null;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    refresh_lucky_shop();
                } else {
                    _luckyShop.renderRefreshFail();
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.RefreshLuckyShop, true);
                };
            };
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.RefreshLuckyShop)){
                this._dialog.yesLabel = LuckyShopViewLang.DialogYes;
                this._dialog.cancelLabel = LuckyShopViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(LuckyShopViewLang.RefreshLuskShop, HtmlText.yellow((50 + LuckyShopViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this.refresh_lucky_shop();
            };
        }
        private function loadData():void{
            var _local1:int = this._ctrl.player.mapId;
            var _local2:int = TownType.getTownNPCIdByFunc(_local1, NPCType.LuckyShopNPC);
            _data.call(Mod_Item_Base.lucky_shop_item_list, this.loadDataCallBack, [_local2], false);
        }
        private function loadDataCallBack():void{
            loadAssets("LuckyShop", this.render, LuckyShopViewLang.LoadInfo);
        }
        private function lucky_shop_item_list():void{
            var _local1:int = this._ctrl.player.mapId;
            var _local2:int = TownType.getTownNPCIdByFunc(_local1, NPCType.LuckyShopNPC);
            _data.call(Mod_Item_Base.lucky_shop_item_list, this.luckyShopItemListCallBack, [_local2]);
        }
        private function luckyShopItemListCallBack():void{
            if (!this._ctrl.luckyShop.isItemDataReturn){
                setTimeout(this.luckyShopItemListCallBack, 20);
                return;
            };
            var _local1:Object = _ctrl.luckyShop.getLuckyShopItemList();
            this._luckyShop.renderItemList(_local1["item_list"]);
            this._luckyShop.renderRefreshInfo(_local1);
            this._intCdTime = _local1["refresh_seconds"];
            _view.addToTimerProcessList(sign, this.timer);
        }
        private function lucky_shop_record_list():void{
            _data.call(Mod_Item_Base.lucky_shop_record_list, this.luckyShopRecordListCallBack, []);
        }
        private function luckyShopRecordListCallBack():void{
            var _local1:Array = this._ctrl.luckyShop.getLuckyShopRecordList();
            this._luckyShop.renderLuckyRecordList(_local1);
        }
        private function buy_lucky_shop_item():void{
            if (this._blnInBuyLuckyShopItem){
                return;
            };
            this._blnInBuyLuckyShopItem = true;
            var _local1:int = this._ctrl.player.mapId;
            var _local2:int = TownType.getTownNPCIdByFunc(_local1, NPCType.LuckyShopNPC);
            _data.call(Mod_Item_Base.buy_lucky_shop_item, this.buyLuckyShopItemCallBack, [_local2, this._luckyShop.itemID]);
        }
        private function buyLuckyShopItemCallBack():void{
            var _local1:Object = this._ctrl.luckyShop.buyLuckyShopItem();
            if (_local1["result"] == Mod_Item_Base.ACTION_SUCCESS){
                _view.showTip(LuckyShopViewLang.BuySuccess, null, TipType.Success);
                this._luckyShop.renderBuyLuckyShopItem();
                this.lucky_shop_record_list();
                _view.toolbar.playGoodsEffect(((URI.goodsIconUrl + this._luckyShop.itemID) + ".png"));
            } else {
                _view.showTip(this.message(_local1["result"]));
            };
            this._blnInBuyLuckyShopItem = false;
        }
        private function refresh_lucky_shop():void{
            if (!_view.ingotEnough(50)){
                this._luckyShop.renderRefreshFail();
            } else {
                _data.call(Mod_Item_Base.refresh_lucky_shop, this.refreshLuckyShopCallBack, []);
            };
        }
        private function refreshLuckyShopCallBack():void{
            if (!this._ctrl.luckyShop.isItemDataReturn){
                setTimeout(this.refreshLuckyShopCallBack, 20);
                return;
            };
            var _local1:Object = _ctrl.luckyShop.refreshLuckyShop();
            if (_local1["result"] == Mod_Item_Base.ACTION_SUCCESS){
                this._luckyShop.renderItemList(_local1["item_list"]);
            } else {
                this._luckyShop.renderRefreshFail();
                _view.showTip(this.message(_local1["result"]));
            };
        }
        private function update_lucky_shop_item():void{
            this._data.patch(Mod_Notify_Base.update_lucky_shop_item, this.updateLuckyShopItemCallBack);
        }
        private function updateLuckyShopItemCallBack():void{
            this.lucky_shop_item_list();
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Item_Base.ACTION_SUCCESS:
                    _local2 = LuckyShopViewLang.ActionSuccess;
                    break;
                case Mod_Item_Base.NPC_ITEM_NO_EXIST:
                    _local2 = LuckyShopViewLang.NpcItemNoExist;
                    break;
                case Mod_Item_Base.UN_AVALIABLE_GRID:
                    _local2 = LuckyShopViewLang.UnAvaliableGrid;
                    break;
                case Mod_Item_Base.INSUFFICIENT_COIN:
                    _local2 = LuckyShopViewLang.InsufficientCoin;
                    break;
                case Mod_Item_Base.ITEM_LIST_REFRESHED:
                    _local2 = LuckyShopViewLang.ItemListRefreshed;
                    break;
                case Mod_Item_Base.INSUFFICIENT_INGOT:
                    _local2 = LuckyShopViewLang.InsufficientIngot;
                    break;
                case Mod_Item_Base.ACTION_FAILED:
                    _local2 = LuckyShopViewLang.ActionFailed;
                    break;
                default:
                    _local2 = (LuckyShopViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

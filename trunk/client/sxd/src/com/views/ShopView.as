//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.item.*;
    import com.assist.view.pack.*;
    import com.assist.view.sound.*;
    import com.controllers.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;

    public class ShopView extends com.views.Base implements IView {

        private static const TabBuySell:int = 1;
        private static const TabRecycling:int = 2;

        public var shopNpcId:int = 0;
        private var _target:IShopUI;
        private var _boxlist:Array;
        private var _buyMsg:String = "";
        private var _clickBox:BoxGrid;

        public function ShopView(){
            this._boxlist = [];
            super();
        }
        public function show():void{
            if (inStage){
                return;
            };
            this.shop_npc_items();
        }
        public function close():void{
            _popup.closeView(this);
            _view.pack.changeShop(false);
        }
        public function clear():void{
        }
        private function get item():ItemController{
            return (_ctrl.item);
        }
        private function loadComplete():void{
            var _local1:BoxGrid;
            var _local2:int;
            var _local3:Array;
            if (this._target == null){
                this._target = (_view.getAssetsObject("Shop", "ShopPanel") as IShopUI);
                this._target.onClose = this.close;
                this._target.onTabCilck = this.tabClick;
                this._target.onPageCilck = this.updatePageList;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _local3 = this._target.boxList;
                _local2 = 0;
                while (_local2 < 15) {
                    _local1 = new BoxGrid(_local2, BoxGrid.typeShop, _local3[_local2]);
                    _local1.onClick = this.boxClick;
                    _local1.onDoubleClick = this.boxDoubleClick;
                    _local1.onDrag = this.boxDrag;
                    _local1.onDragView = this.boxDragView;
                    this._boxlist[_local1.id] = _local1;
                    _local2++;
                };
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            this.shopNpcId = this.item.shopNPCId;
            this._target.tab = TabBuySell;
            this.tabClick();
        }
        public function changeTab(_arg1:int):void{
            if (this._target.tab != _arg1){
                this._target.tab = _arg1;
                this.tabClick();
            };
        }
        private function tabClick(_arg1:int=0):void{
            if (this._target.tab == TabBuySell){
                _view.pack.changeShop(true);
                this.updatePageList(1);
            } else {
                _view.pack.changeRecycle(true);
                this.get_npc_recycle_item_list();
            };
        }
        private function boxDrag(_arg1:BoxGrid, _arg2:BoxGrid):void{
            if (_arg2.isPackBox == false){
                return;
            };
            if (this._target.tab == TabBuySell){
                this.player_buy_npc_item(this.shopNpcId, _arg1.item, _arg2.id);
            } else {
                if (this._target.tab == TabRecycling){
                    this.player_buy_back_item(_arg1.item, _arg2.id);
                };
            };
        }
        private function boxDragView(_arg1:BoxGrid, _arg2:Object):void{
            if (_arg2 === _view.pack.target){
                if (this._target.tab == TabBuySell){
                    this.player_buy_npc_item(this.shopNpcId, _arg1.item, 0);
                } else {
                    if (this._target.tab == TabRecycling){
                        this.player_buy_back_item(_arg1.item, 0);
                    };
                };
            };
        }
        private function boxDoubleClick(_arg1:BoxGrid):void{
            if (this._target.tab == TabBuySell){
                this.player_buy_npc_item(this.shopNpcId, _arg1.item, 0);
            } else {
                if (this._target.tab == TabRecycling){
                    this.player_buy_back_item(_arg1.item, 0);
                };
            };
        }
        private function boxClick(_arg1:BoxGrid):void{
            if (_arg1.itemId == 0){
                return;
            };
            if (this._target.tab == TabBuySell){
                this.showClickTip(_arg1, [ShopViewLang.Buy]);
            } else {
                if (this._target.tab == TabRecycling){
                    this.showClickTip(_arg1, [ShopViewLang.Repurchase]);
                };
            };
        }
        private function showClickTip(_arg1:BoxGrid, _arg2:Array):void{
            if (_arg2.length == 0){
                return;
            };
            this._clickBox = _arg1;
            this._clickBox.lockLight = true;
            var _local3:ClickTipList = new ClickTipList(_arg2, _arg2, this.onTextClick);
            _local3.onRemoveStage = this.tipRemoveStageHandler;
            _view.tip.iTip.clickToOpen(_local3);
        }
        private function onTextClick(_arg1:String):void{
            if (_arg1 == ShopViewLang.Buy){
                this.player_buy_npc_item(this.shopNpcId, this._clickBox.item, 0);
            } else {
                if (_arg1 == ShopViewLang.Repurchase){
                    this.player_buy_back_item(this._clickBox.item, 0);
                };
            };
        }
        private function tipRemoveStageHandler():void{
            this._clickBox.lockLight = false;
        }
        private function updatePageList(_arg1:int):void{
            var _local2:Array;
            var _local5:BoxGrid;
            var _local3:int = ((_arg1 - 1) * 15);
            if (this._target.tab == TabBuySell){
                _local2 = this.item.gridsShop;
            } else {
                if (this._target.tab == TabRecycling){
                    _local2 = this.item.gridsRecyle;
                };
            };
            var _local4:int = _local2.length;
            if (_local4 == 0){
                _local4 = 1;
            };
            if (_local4 >= 135){
                _local4 = 135;
            };
            this._target.initPage(Math.ceil((_local4 / 15)), _arg1);
            for each (_local5 in this._boxlist) {
                _local5.item = _local2[_local3];
                _local3++;
            };
        }
        public function updateRecycleGrids():void{
            if (this._target.tab == TabRecycling){
                this.updatePageList(1);
            };
        }
        private function shop_npc_items():void{
            _data.call(Mod_Item_Base.get_npc_item_list, this.shop_npc_items_back, [this.shopNpcId], false);
        }
        private function shop_npc_items_back():void{
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                loadAssets("Shop", this.loadComplete, ShopViewLang.LaodingShopTip, true);
            } else {
                if (this.item.result == Mod_Item_Base.INSUFFICIENT_INGOT){
                    this.close();
                    _view.showTip(ShopViewLang.IngotLack);
                } else {
                    this.close();
                };
            };
        }
        private function player_buy_npc_item(_arg1:int, _arg2:ItemInfo, _arg3:int):void{
            if (this.item.shopType == NPCType.CardBuyNPC){
                this._buyMsg = Lang.sprintf(ShopViewLang.BuyTipYuPai, _arg2.name, (_arg2.basic.card_name + _arg2.basic.card_num));
            } else {
                if (_arg2.basic.ingot > 0){
                    if (false == _view.ingotEnough(_arg2.basic.ingot)){
                        return;
                    };
                    this._buyMsg = Lang.sprintf(ShopViewLang.BuyTipIngot, _arg2.name, _arg2.basic.ingot);
                } else {
                    if (false == _view.coinEnough(_arg2.totalprice)){
                        return;
                    };
                    this._buyMsg = Lang.sprintf(ShopViewLang.BuyTipCoin, _arg2.name, _arg2.totalprice);
                };
            };
            _data.call(Mod_Item_Base.player_buy_npc_item, this.player_buy_npc_item_back, [_arg1, _arg2.itemId, _arg3]);
        }
        private function player_buy_npc_item_back():void{
            switch (this.item.result){
                case Mod_Item_Base.ACTION_SUCCESS:
                    _view.chat.addSystemMessage(this._buyMsg);
                    _view.pack.updateGrids();
                    SoundEffect.play(SoundEffect.SellItem);
                    break;
                case Mod_Item_Base.INSUFFICIENT_COIN:
                    _view.showTip(ShopViewLang.CoinLack);
                    break;
                case Mod_Item_Base.INSUFFICIENT_CARD:
                    _view.showTip(ShopViewLang.YuPaiLack);
                    break;
                case Mod_Item_Base.UN_AVALIABLE_GRID:
                    _view.showTip(ShopViewLang.PageFull);
                    break;
                case Mod_Item_Base.INSUFFICIENT_INGOT:
                    _view.showTip(ShopViewLang.IngotLack);
                    break;
                default:
                    _view.showTip(ShopViewLang.BuyError);
            };
        }
        private function get_npc_recycle_item_list():void{
            _data.call(Mod_Item_Base.get_npc_recycle_item_list, this.get_npc_recycle_item_list_back, [], false);
        }
        private function get_npc_recycle_item_list_back():void{
            if (this._target.tab != TabRecycling){
                return;
            };
            var _local1:Array = this.item.gridsRecyle;
            this.updatePageList(1);
        }
        private function player_buy_back_item(_arg1:ItemInfo, _arg2:int):void{
            if (false == _view.coinEnough(_arg1.totalprice)){
                return;
            };
            this._buyMsg = Lang.sprintf(ShopViewLang.BuyTipCoin, _arg1.name, _arg1.totalprice);
            _data.call(Mod_Item_Base.player_buy_back_item, this.player_buy_back_item_back, [_arg1.playerItemId, _arg2]);
        }
        private function player_buy_back_item_back():void{
            switch (this.item.result){
                case Mod_Item_Base.ACTION_SUCCESS:
                    _view.chat.addSystemMessage(this._buyMsg);
                    this.updatePageList(1);
                    _view.pack.updateGrids();
                    SoundEffect.play(SoundEffect.SellItem);
                    break;
                case Mod_Item_Base.INSUFFICIENT_COIN:
                    _view.showTip(ShopViewLang.CoinLack);
                    break;
                case Mod_Item_Base.UN_AVALIABLE_GRID:
                    _view.showTip(ShopViewLang.PageFull);
                    break;
            };
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.display.*;
    import com.assist.view.*;
    import com.controllers.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.view.pack.*;
    import com.assist.view.interfaces.item.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.toolbar.*;

    public class PackView extends com.views.Base implements IView {

        private var _target:IPack;
        private var _boxlist:Array;
        private var _clickBox:BoxGrid;
        private var _addmsg:String;
        private var _updateList:Array;
        private var useItemId:int = 0;
        private var _useBox:BoxGrid;

        public function PackView(){
            this._boxlist = [];
            this._updateList = [];
            super();
        }
        public static function getClickTip(_arg1:int, _arg2:ItemInfo):Array{
            var _local3:int;
            var _local4:Array = [];
            var _local5:Boolean = ((BoxGrid.isOpenShop) || (BoxGrid.isOpenRecycle));
            var _local6:String = PackViewLang.Sell;
            switch (_arg2.basic.type_id){
                case ItemType.TouKui:
                case ItemType.WuQi:
                case ItemType.HunQi:
                case ItemType.YiFu:
                case ItemType.HuFu:
                case ItemType.XieZi:
                    _local4 = [PackViewLang.Equip, PackViewLang.Show, PackViewLang.Delete];
                    if (_local5){
                        _local4.splice(1, 0, _local6);
                    };
                    break;
                case ItemType.ZuoJi:
                case ItemType.HongYao:
                case ItemType.BianShen:
                case ItemType.skill:
                    _local4 = [PackViewLang.Useing, PackViewLang.Delete];
                    if (_local5){
                        _local4.splice(1, 0, _local6);
                    };
                    break;
                case ItemType.WuLiDan:
                case ItemType.JueJiDan:
                case ItemType.FaShuDan:
                    _local4 = [PackViewLang.Eat, PackViewLang.Show, PackViewLang.Delete];
                    break;
                case ItemType.LianDanJuanZhou:
                case ItemType.LianQiJuanZhou:
                    _local4 = [PackViewLang.Open, PackViewLang.Fusion, PackViewLang.Show, PackViewLang.Delete];
                    if (_local5){
                        _local4.splice(1, 0, _local6);
                    };
                    break;
                case ItemType.ZaWu:
                    _local4 = [PackViewLang.Delete];
                    if (_local5){
                        _local4.splice(0, 0, _local6);
                    };
                    break;
                case ItemType.ChengZhangLiBao:
                case ItemType.SuperLiBao:
                case ItemType.HuoDongLiBao:
                    _local4 = [PackViewLang.Open];
                    break;
                case ItemType.YuPai:
                    _local4 = [PackViewLang.Delete];
                    break;
            };
            return (_local4);
        }

        public function show():void{
            if (this.inStage){
                return;
            };
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.get_player_pack_item_list();
        }
        public function close():void{
            _popup.closeView(this);
            if (_view.shop.inStage){
                _view.shop.close();
            };
            if (_view.warehouse.inStage){
                _view.warehouse.close();
            };
        }
        public function clear():void{
        }
        public function get content():Sprite{
            return (this._target.content);
        }
        private function get item():ItemController{
            return (_ctrl.item);
        }
        private function get player():PlayerController{
            return (_ctrl.player);
        }
        public function get target():IPack{
            return (this._target);
        }
        override public function get inStage():Boolean{
            return (((this._target) && (!((this._target.content.stage == null)))));
        }
        private function loadComplete():void{
            var _local1:BoxGrid;
            var _local2:int;
            var _local3:Array;
            if (this._target == null){
                this._target = (_view.getAssetsObject("Pack", "Pack") as IPack);
                this._target.onClose = this.close;
                this._target.onBtn1 = this.btn1Click;
                this._target.onBtn2 = this.player_classify_pack;
                this._target.onBtn3 = this.btn3Click;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _local3 = this._target.boxList;
                _local2 = 0;
                while (_local2 < 36) {
                    _local1 = new BoxGrid((BoxGrid.idPack + _local2), BoxGrid.typePack, _local3[_local2]);
                    _local1.onDoubleClick = this.boxDoubleClick;
                    _local1.onClick = this.boxClick;
                    _local1.onDrag = this.boxDrag;
                    _local1.onDown = this.boxDown;
                    _local1.onUp = this.boxUp;
                    _local1.onRemove = this.boxRemove;
                    _local1.onDragView = this.boxDragView;
                    this._boxlist[_local1.id] = _local1;
                    _local2++;
                };
            };
            if (this.inStage == false){
                _popup.addView(this, this._target.content);
            };
            _local3 = this.item.gridsPack;
            for each (_local1 in this._boxlist) {
                _local1.item = (_local3[_local1.id] as ItemInfo);
            };
            this._target.updateBoxCount(36);
            this._target.Btn1.visible = (this._target.Btn3.visible = FunctionType.isOpened(FunctionType.Warehouse));
        }
        private function btn1Click():void{
            if (_view.shop.inStage == true){
                _view.shop.close();
            } else {
                _view.shop.shopNpcId = 0;
                _view.shop.show();
            };
        }
        private function btn3Click():void{
            if (_view.warehouse.inStage == true){
                _view.warehouse.close();
            } else {
                _view.warehouse.npcId = 0;
                _view.warehouse.show();
            };
        }
        private function boxDrag(_arg1:BoxGrid, _arg2:BoxGrid):void{
            if (_arg2.isPackBox){
                this.change_pack_item_grid(_arg1, _arg2);
            } else {
                if (_arg2.isRoleBox){
                    this.equip_player_role_item(_arg1, _arg2);
                } else {
                    if (_arg2.isShopBox){
                        this.player_sell_item(_arg1);
                    } else {
                        if (_arg2.isWareHouseBox){
                            this.pack_grid_moveto_warehouse(_arg1, _arg2);
                        };
                    };
                };
            };
        }
        private function boxDragView(_arg1:BoxGrid, _arg2:*):void{
            if ((((_arg2 is IPack)) && (!((_arg2 == this._target))))){
                this.pack_grid_moveto_warehouse(_arg1, null);
            } else {
                if ((_arg2 is IRoleMsg)){
                    this.equip_player_role_item(_arg1, null);
                } else {
                    if ((_arg2 is IShopUI)){
                        this.player_sell_item(_arg1);
                    };
                };
            };
        }
        private function boxDown(_arg1:BoxGrid):void{
            if (_arg1.item.basic.isEquip){
                _view.roleMsg.equipLock(_arg1.itemId);
            };
        }
        private function boxUp(_arg1:BoxGrid):void{
            _view.roleMsg.releaseLock();
        }
        private function boxClick(_arg1:BoxGrid):void{
            var _local2:Array;
            if (_arg1.isLock){
                this.openBox(_arg1);
            } else {
                if (_arg1.itemId != 0){
                    _local2 = getClickTip(_arg1.boxType, _arg1.item);
                    this.showClickTip(_arg1, _local2);
                };
            };
        }
        private function openBox(_arg1:BoxGrid):void{
            var openToGrid:* = 0;
            var openIngot:* = 0;
            var list:* = null;
            var box:* = _arg1;
            var i:* = box.id;
            openToGrid = box.id;
            openIngot = 0;
            var ingot:* = this.item.ingot_pack;
            list = [];
            while (i > 0) {
                box = this._boxlist[i];
                if (box.isLock){
                    list.push(box);
                    box.lockLight = true;
                    openIngot = (openIngot + ingot);
                    ingot = (ingot + 2);
                } else {
                    break;
                };
                i = (i - 1);
            };
            _view.alert.showYesNoMsg(Lang.sprintf(PackViewLang.AskOpenBox, HtmlText.yellow((openIngot + PackViewLang.Ingot)), list.length), PackViewLang.Yes, PackViewLang.No, function (_arg1:uint):void{
                if ((((_arg1 == AlertButtonType.Yes)) && (_view.ingotEnough(openIngot)))){
                    add_pack_grid(openToGrid);
                };
                for each (box in list) {
                    box.lockLight = false;
                };
            });
        }
        private function boxRemove(_arg1:BoxGrid):void{
            var box1:* = _arg1;
            if (box1.item.basic.isQuest){
                _view.showTip(PackViewLang.DeleteErrorTask);
            } else {
                if (box1.item.useing){
                    _view.showTip(PackViewLang.DeleteErrorUseing);
                } else {
                    if (box1.item.basic.isPackage){
                        _view.showTip(PackViewLang.DeleteErrorPage);
                    } else {
                        box1.addFilters();
                        _view.alert.showYesNoMsg(PackViewLang.AskDelete, PackViewLang.Yes, PackViewLang.No, function (_arg1:uint):void{
                            box1.removeFilters();
                            if (_arg1 == AlertButtonType.Yes){
                                drop_pack_grid_item(box1);
                            };
                        });
                    };
                };
            };
        }
        private function boxDoubleClick(_arg1:BoxGrid):void{
            var _local2:ItemBasically = _arg1.item.basic;
            if (_view.shop.inStage){
                this.player_sell_item(_arg1);
            } else {
                if (_view.warehouse.inStage){
                    this.pack_grid_moveto_warehouse(_arg1, null);
                } else {
                    if (_local2.isEquip == false){
                        this.useingItem(_arg1);
                    } else {
                        if (_local2.isEquip == true){
                            this.equip_player_role_item(_arg1, null);
                        };
                    };
                };
            };
        }
        private function useingItem(_arg1:BoxGrid):void{
            var _local2:ItemBasically = _arg1.item.basic;
            if (_local2.isDanYao){
                this.get_player_role_elixir_data(_arg1);
            } else {
                if (_local2.isJuanZhou){
                    _view.refine.initdata(_arg1.itemId, _arg1.playerItemId, 0, 0);
                    _view.refine.show();
                } else {
                    if (_local2.isGoldOil){
                        _view.armsGold.goldId = _arg1.itemId;
                        _view.armsGold.playerItemId = _arg1.playerItemId;
                        _view.armsGold.show();
                    } else {
                        if (_local2.isChangeAttack){
                            _view.armsRecast.playerItemId = _arg1.playerItemId;
                            _view.armsRecast.show();
                        } else {
                            this.player_use_grid_item(_arg1);
                        };
                    };
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
            if (_arg1 == PackViewLang.Sell){
                this.player_sell_item(this._clickBox);
            } else {
                if ((((_arg1 == PackViewLang.Open)) || ((_arg1 == PackViewLang.Useing)))){
                    this.useingItem(this._clickBox);
                } else {
                    if (_arg1 == PackViewLang.Fusion){
                        _view.refine.initdata(this._clickBox.item.itemId, this._clickBox.item.playerItemId, 0, 0);
                        _view.refine.autoMerge();
                    } else {
                        if (_arg1 == PackViewLang.Equip){
                            this.equip_player_role_item(this._clickBox, null);
                        } else {
                            if (_arg1 == PackViewLang.Delete){
                                this.boxRemove(this._clickBox);
                            } else {
                                if (_arg1 == PackViewLang.Eat){
                                    this.get_player_role_elixir_data(this._clickBox);
                                } else {
                                    if (_arg1 == PackViewLang.Show){
                                        _view.chat.showMsg([ChatMsgType.Item, this._clickBox.itemId, this._clickBox.item.upgradeLevel, this._clickBox.playerItemId, this._clickBox.item.goldId, _ctrl.player.nickname]);
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }
        private function tipRemoveStageHandler():void{
            this._clickBox.lockLight = false;
        }
        public function updateGrids():void{
            var _local2:BoxGrid;
            if (this.inStage == false){
                return;
            };
            var _local1:Array = this.item.gridsPack;
            for each (_local2 in this._boxlist) {
                _local2.item = (_local1[_local2.id] as ItemInfo);
            };
            this._target.updateBoxCount(36);
        }
        public function resetPack():void{
            if (this.inStage == false){
                return;
            };
            this.get_player_pack_item_list();
        }
        public function updateGridsTips(_arg1:Array=null):void{
            var _local3:BoxGrid;
            if (this.inStage == false){
                return;
            };
            _arg1 = ((_arg1) || ([]));
            var _local2:int = _arg1.length;
            for each (_local3 in this._boxlist) {
                if (_local3.itemId == 0){
                } else {
                    if ((((_local2 == 0)) || (!((_arg1.indexOf(_local3.itemType) == -1))))){
                        _local3.updateTips();
                    };
                };
            };
        }
        public function changeShop(_arg1:Boolean):void{
            BoxGrid.isOpenRecycle = (BoxGrid.isOpenRole = (BoxGrid.isOpenWareHouse = false));
            BoxGrid.isOpenShop = _arg1;
            this.updateGridsTips();
            this.autoOpen(_arg1);
        }
        public function changeWareHouse(_arg1:Boolean):void{
            BoxGrid.isOpenRecycle = (BoxGrid.isOpenRole = (BoxGrid.isOpenShop = false));
            BoxGrid.isOpenWareHouse = _arg1;
            this.updateGridsTips();
            this.autoOpen(_arg1);
        }
        public function changeRole(_arg1:Boolean):void{
            BoxGrid.isOpenRecycle = (BoxGrid.isOpenShop = (BoxGrid.isOpenWareHouse = false));
            BoxGrid.isOpenRole = _arg1;
            this.updateGridsTips([1, 2, 3, 4, 5, 6]);
        }
        public function changeRecycle(_arg1:Boolean):void{
            BoxGrid.isOpenRole = (BoxGrid.isOpenShop = (BoxGrid.isOpenWareHouse = false));
            BoxGrid.isOpenRecycle = _arg1;
        }
        private function autoOpen(_arg1:Boolean):void{
            if (((_arg1) && ((this.inStage == false)))){
                this.show();
            };
        }
        private function addtoolbarMsg(_arg1:String):void{
            _view.chat.addSystemMessage(_arg1);
        }
        private function hideBox(_arg1:BoxGrid):void{
            if (((_arg1) && (!((_arg1.itemId == 0))))){
                this.item.pushPack(_arg1.id);
                _arg1.hideItem();
            };
        }
        public function getBestEQ(_arg1:int, _arg2:int, _arg3:int):ItemInfo{
            var _local4:ItemInfo;
            var _local5:ItemInfo;
            var _local6:Array = this.item.gridsPack;
            for each (_local5 in _local6) {
                if (((((((((_local5) && (!((_local5.itemId == 0))))) && ((_local5.typeId == _arg1)))) && ((_local5.basic.require <= _arg2)))) && ((_local5.basic.jobArr[_arg3] == 1)))){
                    _local4 = ((_local4) || (_local5));
                    if (_local5.addSum > _local4.addSum){
                        _local4 = _local5;
                    };
                };
            };
            if (_local4 != null){
                return (_local4.clone());
            };
            return (null);
        }
        public function autoEQAtPlayerItemId(_arg1:int, _arg2:int):void{
            var _local3:BoxGrid;
            var _local4:ItemInfo;
            for each (_local3 in this._boxlist) {
                if (_local3.playerItemId == _arg1){
                    this.equip_player_role_item(_local3, null);
                    return;
                };
            };
            for each (_local4 in this.item.gridsPack) {
                if (_local4.playerItemId == _arg1){
                    _data.call(Mod_Item_Base.equip_player_role_item, this.equip_player_role_item_back, [_local4.gridId, _arg2, 0]);
                    return;
                };
            };
            _view.showTip(PackViewLang.CanNoFindEQ);
        }
        private function get_player_pack_item_list():void{
            _data.call(Mod_Item_Base.get_player_pack_item_list, this.get_player_pack_item_list_back, [], false);
        }
        private function get_player_pack_item_list_back():void{
            loadAssets("Pack", null, PackViewLang.LaodingPageTip, false, false, this.loadComplete);
        }
        private function change_pack_item_grid(_arg1:BoxGrid, _arg2:BoxGrid):void{
            _data.call(Mod_Item_Base.change_pack_item_grid, this.change_pack_item_grid_back, [_arg1.id, _arg2.id]);
        }
        private function change_pack_item_grid_back():void{
            this.updateGrids();
        }
        private function drop_pack_grid_item(_arg1:BoxGrid):void{
            _data.call(Mod_Item_Base.drop_pack_grid_item, this.drop_pack_grid_item_back, [_arg1.id]);
            this.hideBox(_arg1);
        }
        private function drop_pack_grid_item_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.HAVE_SOUL){
                _view.showTip(PackViewLang.DeleteErrorSoul);
            };
        }
        private function equip_player_role_item(_arg1:BoxGrid, _arg2:BoxGrid):void{
            if (_arg1.item.basic.isEquip == false){
                return;
            };
            _data.call(Mod_Item_Base.equip_player_role_item, this.equip_player_role_item_back, [_arg1.id, _view.roleMsg.playerRoleId, ((_arg2)==null) ? 0 : _arg2.id]);
            this._updateList.push(_arg1.itemType);
            _view.roleMsg.show();
            this.hideBox(_arg1);
        }
        private function equip_player_role_item_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.roleMsg.updateEquipList();
                SoundEffect.play(SoundEffect.Equip);
            } else {
                if (this.item.result == Mod_Item_Base.NO_SUITE_ROLE_LEVEL){
                    _view.showTip(PackViewLang.EquipErrorLV);
                } else {
                    if (this.item.result == Mod_Item_Base.NO_SUITE_ROLE_JOB){
                        _view.showTip(PackViewLang.EquipErrorJob);
                    };
                };
            };
            this.updateGridsTips(this._updateList);
            this._updateList = [];
        }
        private function player_sell_item(_arg1:BoxGrid):void{
            if (_arg1.item.basic.isQuest){
                _view.showTip(PackViewLang.SellErrorTask);
            } else {
                if (_arg1.item.useing){
                    _view.showTip(PackViewLang.SellErrorUseing);
                } else {
                    if (_arg1.item.basic.isBrand){
                        _view.showTip(PackViewLang.SellErrorYuPai);
                    } else {
                        if (_arg1.item.basic.isPackage){
                            _view.showTip(PackViewLang.SellErrorPage);
                        } else {
                            if ((((_arg1.item.basic.ingot > 0)) || ((_arg1.item.basic.price == 0)))){
                                _view.showTip(PackViewLang.SellError);
                            } else {
                                _data.call(Mod_Item_Base.player_sell_item, this.player_sell_item_back, [_arg1.id]);
                                this._addmsg = Lang.sprintf(PackViewLang.SellTip, _arg1.itemName, _arg1.item.totalprice);
                                this.hideBox(_arg1);
                            };
                        };
                    };
                };
            };
        }
        private function player_sell_item_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                this.addtoolbarMsg(this._addmsg);
                _view.shop.updateRecycleGrids();
                _view.shop.changeTab(2);
                SoundEffect.play(SoundEffect.SellItem);
            } else {
                if (this.item.result == Mod_Item_Base.HAVE_SOUL){
                    _view.showTip(PackViewLang.SellErrorSoul);
                } else {
                    _view.showTip(PackViewLang.SellError);
                };
            };
        }
        private function player_classify_pack():void{
            var _local1:Array = this.item.autoGrids(this.item.gridsPack, BoxGrid.idPack);
            this.item.gridsPackAuto = _local1[0];
            _data.call(Mod_Item_Base.classify_pack, this.player_classify_pack_back, [_local1[0].concat(_local1[1])]);
        }
        private function player_classify_pack_back():void{
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                this.updateGrids();
            } else {
                _view.showTip(PackViewLang.FinishingFails);
            };
        }
        private function player_use_grid_item(_arg1:BoxGrid):void{
            this.useItemId = _arg1.itemId;
            _data.call(Mod_Item_Base.player_use_grid_item, this.player_use_grid_item_back, [_arg1.id]);
        }
        private function player_use_grid_item_back():void{
            this.updateGrids();
            switch (this.item.result){
                case Mod_Item_Base.ACTION_SUCCESS:
                    if (this.useItemId == 1152){
                        _view.showTip(PackViewLang.Skill6000, null, TipType.Success);
                    } else {
                        if (this.useItemId == 1153){
                            _view.showTip(PackViewLang.Skill25000, null, TipType.Success);
                        } else {
                            if (this.useItemId == this._ctrl.player.giftItemId){
                                this._ctrl.player.giftItemId = 0;
                            };
                        };
                    };
                    break;
                case Mod_Item_Base.NOT_ENOUGH_GRID:
                    _view.showTip(PackViewLang.PageBoxLack);
                    break;
                case Mod_Item_Base.NOT_ENOUGH_LEVEL:
                    _view.showTip(PackViewLang.LvLack);
                    break;
                case Mod_Item_Base.JOB_NOT_MATCH:
                    _view.showTip(PackViewLang.JobNotMatch);
                    break;
                case Mod_Item_Base.IN_CAMP_WAR:
                    _view.showTip(PackViewLang.InCampWar);
                    break;
                case Mod_Item_Base.IN_FACTION_WAR:
                    _view.showTip(PackViewLang.InFactionWar);
                    break;
                case Mod_Item_Base.NOT_ENOUGH_FATE_GRID:
                    _view.showTip(PackViewLang.PageFateFull);
                    break;
                case Mod_Item_Base.NOT_ENOUGH_SOUL_GRID:
                    _view.showTip(PackViewLang.PageSoulFull);
                    break;
            };
        }
        private function get_player_role_elixir_data(_arg1:BoxGrid):void{
            this._useBox = _arg1;
            _data.call(Mod_Item_Base.get_player_role_elixir_data, this.get_player_role_elixir_data_back, [_view.roleMsg.playerRoleId, _arg1.itemId]);
        }
        private function get_player_role_elixir_data_back():void{
            var n1:* = null;
            var n2:* = null;
            var name:* = _view.roleMsg.roleName;
            var str:* = "";
            var count:* = this.item.elixirCount;
            var add:* = this.item.elixirValue;
            if (name == ""){
                name = this.player.nickname;
            };
            if (add <= 0){
                str = HtmlText.format(name, 16764006, 13);
                str = HtmlText.format(Lang.sprintf(PackViewLang.ImmortalityTip, str), 41193, 13);
                _view.showTip(str);
            } else {
                n1 = this._useBox.itemName;
                n2 = n1.substr((n1.length - 3), 2);
                str = Lang.sprintf(PackViewLang.ImmortalityEatTip, HtmlText.yellow(name), HtmlText.yellow((count + "")), HtmlText.yellow(n1), (n2 + HtmlText.yellow(("+" + add))));
                str = HtmlText.white(str);
                _view.alert.showYesNoMsg(str, PackViewLang.Eat, PackViewLang.UnEat, function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        player_use_grid_elixir(_useBox);
                    };
                });
            };
        }
        private function player_use_grid_elixir(_arg1:BoxGrid):void{
            _data.call(Mod_Item_Base.player_use_grid_elixir, this.player_use_grid_elixir_back, [_arg1.id, _view.roleMsg.playerRoleId]);
        }
        private function player_use_grid_elixir_back():void{
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.showTip(PackViewLang.ImmortalitySuccess, "", TipType.Success);
                _view.roleMsg.updateSimpe();
                _view.roleMsg.show();
            };
            this.updateGrids();
        }
        private function add_pack_grid(_arg1:int):void{
            _data.call(Mod_Item_Base.add_pack_grid, this.add_pack_grid_back, [_arg1]);
        }
        private function add_pack_grid_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.showTip(PackViewLang.OpenSuccess, "", TipType.Success);
            } else {
                if (this.item.result == Mod_Item_Base.INSUFFICIENT_INGOT){
                    _view.showTip(PackViewLang.IngotLack);
                };
            };
        }
        private function pack_grid_moveto_warehouse(_arg1:BoxGrid, _arg2:BoxGrid):void{
            if (_arg1.item.useing){
                _view.showTip(PackViewLang.MoveToWarehouseError);
            } else {
                _data.call(Mod_Item_Base.move_pack_grid_item_to_warehouse, this.pack_grid_moveto_warehouse_back, [_arg1.id, ((_arg2)==null) ? 0 : _arg2.id]);
                this.hideBox(_arg1);
            };
        }
        private function pack_grid_moveto_warehouse_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.warehouse.updateGrids();
            } else {
                if (this.item.result == Mod_Item_Base.WAREHOUSE_FULL){
                    _view.showTip(PackViewLang.WarehouseFull);
                } else {
                    if (this.item.result == Mod_Item_Base.PACK_FULL){
                        _view.showTip(PackViewLang.PageFull);
                    };
                };
            };
        }

    }
}//package com.views 

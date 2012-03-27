//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.item.*;
    import com.assist.view.pack.*;
    import com.controllers.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;

    public class WarehouseView extends com.views.Base implements IView {

        public var npcId:int = 0;
        private var _target:IPack;
        private var _boxlist:Array;

        public function WarehouseView(){
            this._boxlist = [];
            super();
        }
        public function show():void{
            if (this.inStage){
                return;
            };
            this.get_player_warehouse_grids(this.npcId);
        }
        public function close():void{
            _popup.closeView(this);
            _view.pack.changeWareHouse(false);
        }
        public function clear():void{
        }
        private function get item():ItemController{
            return (_ctrl.item);
        }
        override public function get inStage():Boolean{
            return (((this._target) && (!((this._target.content.stage == null)))));
        }
        private function loadComplete():void{
            var _local1:BoxGrid;
            var _local2:int;
            var _local3:Array;
            if (this._target == null){
                this._target = (_view.getAssetsObject("Pack", "Warehouse") as IPack);
                this._target.onClose = this.close;
                this._target.onBtn3 = this.openBox;
                this._target.onBtn2 = this.player_classify_warehouse;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _local3 = this._target.boxList;
                _local2 = 0;
                while (_local2 < 54) {
                    _local1 = new BoxGrid((BoxGrid.idWareHouse + _local2), BoxGrid.typeWareHouse, _local3[_local2]);
                    _local1.onClick = this.boxClick;
                    _local1.onDoubleClick = this.boxDoubleClick;
                    _local1.onDrag = this.boxDrag;
                    _local1.onDragView = this.boxDragView;
                    _local1.onRemove = this.boxRemove;
                    this._boxlist[_local1.id] = _local1;
                    _local2++;
                };
            };
            if (this.inStage == false){
                _popup.addView(this, this._target.content);
            };
            _view.pack.changeWareHouse(true);
            _local3 = this.item.gridsWarehouse;
            for each (_local1 in this._boxlist) {
                _local1.item = (_local3[_local1.id] as ItemInfo);
            };
            this._target.updateBoxCount(54);
        }
        private function openBox(_arg1:BoxGrid=null):void{
            var openToGrid:* = 0;
            var openIngot:* = 0;
            var list:* = null;
            var ingot:* = 0;
            var box:BoxGrid = _arg1;
            var i:* = (BoxGrid.idWareHouse + 18);
            var max:* = (BoxGrid.idWareHouse + 54);
            openToGrid = 0;
            openIngot = 0;
            list = [];
            if (box == null){
                while (i < max) {
                    box = this._boxlist[i];
                    if (box.isLock){
                        openIngot = this.item.ingot_warehouse;
                        openToGrid = box.id;
                        box.lockLight = true;
                        list.push(box);
                        break;
                    };
                    i = (i + 1);
                };
            } else {
                ingot = this.item.ingot_warehouse;
                openIngot = 0;
                openToGrid = box.id;
                i = box.id;
                while (i > 0) {
                    box = this._boxlist[i];
                    if (box.isLock){
                        list.push(box);
                        box.lockLight = true;
                        openIngot = (openIngot + ingot);
                        if (ingot == 1){
                            ingot = 2;
                        } else {
                            ingot = (ingot + 2);
                        };
                    } else {
                        break;
                    };
                    i = (i - 1);
                };
            };
            _view.alert.showYesNoMsg(Lang.sprintf(WarehouseViewLang.AskOpenBox, HtmlText.yellow((openIngot + WarehouseViewLang.Ingot)), list.length), WarehouseViewLang.Yes, WarehouseViewLang.No, function (_arg1:uint):void{
                if ((((_arg1 == AlertButtonType.Yes)) && (_view.ingotEnough(openIngot)))){
                    add_warehouse_grid(openToGrid);
                };
                for each (box in list) {
                    box.lockLight = false;
                };
            });
        }
        private function boxDrag(_arg1:BoxGrid, _arg2:BoxGrid):void{
            if (_arg2.isPackBox){
                this.move_warehouse_grid_item_to_pack(_arg1, _arg2);
            } else {
                if (_arg2.isWareHouseBox){
                    this.change_warehouse_item_grid(_arg1, _arg2);
                };
            };
        }
        private function boxDragView(_arg1:BoxGrid, _arg2:Object):void{
            if (_arg2 === _view.pack.target){
                this.move_warehouse_grid_item_to_pack(_arg1, null);
            };
        }
        private function boxRemove(_arg1:BoxGrid):void{
            var box1:* = _arg1;
            if (box1.item.basic.isQuest){
                _view.showTip(WarehouseViewLang.DeleteErrorTask);
            } else {
                if (box1.item.basic.isPackage){
                    _view.showTip(WarehouseViewLang.DeleteErrorPage);
                } else {
                    box1.addFilters();
                    _view.alert.showYesNoMsg(WarehouseViewLang.AskDelete, WarehouseViewLang.Yes, WarehouseViewLang.No, function (_arg1:uint):void{
                        box1.removeFilters();
                        if (_arg1 == AlertButtonType.Yes){
                            drop_warehouse_grid_item(box1);
                        };
                    });
                };
            };
        }
        private function boxClick(_arg1:BoxGrid):void{
            if (_arg1.isLock){
                this.openBox(_arg1);
            };
        }
        private function boxDoubleClick(_arg1:BoxGrid):void{
            this.move_warehouse_grid_item_to_pack(_arg1, null);
            if (_view.pack.inStage == false){
                _view.pack.show();
            };
        }
        public function updateGrids():void{
            var _local2:BoxGrid;
            if (this.inStage == false){
                return;
            };
            var _local1:Array = this.item.gridsWarehouse;
            for each (_local2 in this._boxlist) {
                _local2.item = (_local1[_local2.id] as ItemInfo);
            };
            this._target.updateBoxCount(54);
        }
        private function hideBox(_arg1:BoxGrid):void{
            if (((_arg1) && (!((_arg1.itemId == 0))))){
                this.item.pushWareHouse(_arg1.id);
                _arg1.hideItem();
            };
        }
        private function get_player_warehouse_grids(_arg1:int):void{
            _data.call(Mod_Item_Base.get_player_warehouse_grids, this.get_player_warehouse_grids_back, [_arg1], false);
        }
        private function get_player_warehouse_grids_back():void{
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                loadAssets("Pack", this.loadComplete, WarehouseViewLang.LaodingWareHouseTip);
            } else {
                if (this.item.result == Mod_Item_Base.INSUFFICIENT_INGOT){
                    this.close();
                    _view.showTip(WarehouseViewLang.IngotLack);
                } else {
                    this.close();
                };
            };
        }
        private function add_warehouse_grid(_arg1:int):void{
            _data.call(Mod_Item_Base.add_warehouse_grid, this.add_warehouse_grid_back, [_arg1]);
        }
        private function add_warehouse_grid_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.showTip(WarehouseViewLang.OpenSuccess, "", TipType.Success);
            } else {
                if (this.item.result == Mod_Item_Base.INSUFFICIENT_INGOT){
                    _view.showTip(WarehouseViewLang.IngotLack);
                };
            };
        }
        private function player_classify_warehouse():void{
            var _local1:Array = this.item.autoGrids(this.item.gridsWarehouse, BoxGrid.idWareHouse);
            this.item.gridsWarehouseAuto = _local1[0];
            _data.call(Mod_Item_Base.classify_warehouse, this.classify_warehouse_back, [_local1[0].concat(_local1[1])]);
        }
        private function classify_warehouse_back():void{
            var _local1:Array;
            var _local2:BoxGrid;
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _local1 = this.item.gridsWarehouse;
                for each (_local2 in this._boxlist) {
                    _local2.item = (_local1[_local2.id] as ItemInfo);
                };
                this._target.updateBoxCount(54);
            } else {
                _view.showTip(WarehouseViewLang.FinishingFails);
            };
        }
        private function drop_warehouse_grid_item(_arg1:BoxGrid):void{
            _data.call(Mod_Item_Base.drop_warehouse_grid_item, this.drop_warehouse_grid_item_back, [_arg1.id]);
            this.hideBox(_arg1);
        }
        private function drop_warehouse_grid_item_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.HAVE_SOUL){
                _view.showTip(WarehouseViewLang.DeleteErrorSoul);
            };
        }
        private function move_warehouse_grid_item_to_pack(_arg1:BoxGrid, _arg2:BoxGrid):void{
            _data.call(Mod_Item_Base.move_warehouse_grid_item_to_pack, this.move_warehouse_grid_item_to_pack_back, [_arg1.id, ((_arg2 == null)) ? 0 : _arg2.id]);
            this.hideBox(_arg1);
        }
        private function move_warehouse_grid_item_to_pack_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.pack.updateGrids();
            } else {
                if (this.item.result == Mod_Item_Base.PACK_FULL){
                    _view.showTip(WarehouseViewLang.PageFull);
                } else {
                    if (this.item.result == Mod_Item_Base.WAREHOUSE_FULL){
                        _view.showTip(WarehouseViewLang.WarehouseFull);
                    };
                };
            };
        }
        private function change_warehouse_item_grid(_arg1:BoxGrid, _arg2:BoxGrid):void{
            _data.call(Mod_Item_Base.change_warehouse_item_grid, this.change_warehouse_item_grid_back, [_arg1.id, ((_arg2 == null)) ? 0 : _arg2.id]);
            this.hideBox(_arg1);
        }
        private function change_warehouse_item_grid_back():void{
            this.updateGrids();
        }

    }
}//package com.views 

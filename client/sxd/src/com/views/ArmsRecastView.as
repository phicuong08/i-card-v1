//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.view.pack.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public final class ArmsRecastView extends Base implements IView {

        public var playerItemId:int = 0;
        private var _target:IArmsRecast;
        private var _select1:Object;
        private var _select2:Object;
        private var _tipSuccess:String = "";
        private var _toItem:ItemInfo;

        public function ArmsRecastView(){
            this._select1 = {};
            this._select2 = {};
            super();
        }
        public function show():void{
            if (_ctrl.player.packNum == 0){
                _view.showTip(ArmsRecastViewLang.PageFull);
                return;
            };
            this.can_change_list();
        }
        private function loadComplete():void{
            var _local2:Array;
            var _local3:int;
            var _local4:ItemInfo;
            var _local5:ItemBasically;
            var _local6:Object;
            if (this._target == null){
                this._target = (_view.getAssetsObject("ArmsRecast", "ArmsRecastMC") as IArmsRecast);
                this._target.onClose = this.close;
                this._target.onOk = this.onOK;
                this._target.onSelect1 = this.onSelect1;
                this._target.onSelect2 = this.onSelect2;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._select1 = (this._select2 = {
                label:ArmsRecastViewLang.Select2,
                tip1:"",
                tip2:"",
                url:"",
                id:0,
                itemId:0
            });
            var _local1:Array = [];
            for each (_local2 in _ctrl.item.recastList) {
                _local3 = _local2.pop();
                _local4 = new ItemInfo();
                _local4.parsePack(_local2);
                _local5 = _local4.basic;
                _local6 = {};
                if ((((_local3 > 0)) && ((_local3 < 7)))){
                    _local6.label = (_local4.name + ArmsRecastViewLang.Main);
                    _local6.qualityRole = (100 - _local5.quality);
                } else {
                    if (_local3 > 6){
                        _local6.label = (((_local4.name + "(") + RoleType.getRoleName(_local3)) + ")");
                        _local6.qualityRole = (100 - _local5.quality);
                    } else {
                        _local6.label = _local4.name;
                        _local6.qualityRole = 10000;
                    };
                };
                _local6.item = _local4;
                _local6.label = htmlFormat(_local6.label, 12, _local4.color);
                _local6.tip1 = htmlFormat(_local4.name, 12, _local4.color, true);
                _local6.tip2 = htmlFormat(((ItemType.getItemUpgrade(_local4.upgradeLevel) + "\n") + _local5.jobs), 12, _local4.color);
                _local6.url = _local5.getImgUrl(_local4.goldId);
                _local6.upgrade = (1000 - _local4.upgradeLevel);
                _local6.require = (1000 - _local5.require);
                _local6.quality = (1000 - _local5.quality);
                _local6.roleid = uint(_local3);
                _local1.push(_local6);
            };
            _local1.sortOn(["qualityRole", "roleid", "quality", "require", "upgrade"], [Array.NUMERIC, Array.NUMERIC, Array.NUMERIC, Array.NUMERIC, Array.NUMERIC]);
            this._target.initdropList1(_local1, this._select1);
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function onOK():void{
            var _local1:ItemInfo = (this._select1.item as ItemInfo);
            var _local2:ItemInfo = (this._select2.item as ItemInfo);
            if ((((_local1 == null)) || ((_local2 == null)))){
                _view.showTip(ArmsRecastViewLang.Select1);
            } else {
                this._target.runAction();
                this._toItem = _local2;
                this._tipSuccess = Lang.sprintf(ArmsRecastViewLang.ChangeOK, this._select1.tip1, this._select2.tip1);
                setTimeout(this.change_attack_item, 1600, _local1.playerItemId, this.playerItemId, _local2.itemId);
            };
        }
        private function onSelect1(_arg1:Object):void{
            if ((_arg1.item is ItemInfo) == false){
                return;
            };
            var _local2:ItemInfo = _arg1.item;
            _view.tip.iTip.addTarget(this._target.box1, _local2.getTipsSprite1("", ""));
            this._select1 = _arg1;
            this.change_attack_info(_local2.playerItemId);
        }
        private function onSelect2(_arg1:Object):void{
            if ((_arg1.item is ItemInfo) == false){
                return;
            };
            var _local2:ItemInfo = _arg1.item;
            _view.tip.iTip.addTarget(this._target.box2, _local2.getTipsSprite1("", ""));
            this._select2 = _arg1;
        }
        private function can_change_list():void{
            _data.call(Mod_Item_Base.can_change_list, this.can_change_list_back, []);
        }
        private function can_change_list_back():void{
            if (0 == _ctrl.item.recastList.length){
                _view.showTip(ArmsRecastViewLang.NotEQ);
                return;
            };
            loadAssets("ArmsRecast", null, ArmsRecastViewLang.Loading, false, false, this.loadComplete);
        }
        private function change_attack_info(_arg1:int):void{
            _data.call(Mod_Item_Base.change_attack_info, this.change_attack_info_back, [_arg1]);
        }
        private function change_attack_info_back():void{
            var _local2:Object;
            var _local3:Array;
            var _local4:ItemInfo;
            var _local5:ItemInfo;
            var _local6:ItemBasically;
            var _local1:Array = [];
            for each (_local3 in _ctrl.item.recastList) {
                _local2 = {};
                _local1.push(_local2);
                _local4 = this._select1.item;
                _local5 = new ItemInfo();
                _local5.parseSee(_local3[0], _local3[1], _local4.goldId);
                _local5.playerItemId = _local4.playerItemId;
                _local6 = _local5.basic;
                _local2.item = _local5;
                _local2.label = ((_local5.name + " ") + ItemType.getItemUpgrade(_local3[1]));
                _local2.label = htmlFormat(_local2.label, 12, _local5.color);
                _local2.tip1 = htmlFormat(_local5.name, 12, _local5.color, true);
                _local2.tip2 = htmlFormat(((ItemType.getItemUpgrade(_local3[1]) + "\n") + _local6.jobs), 12, _local5.color);
                _local2.url = _local6.getImgUrl(_local5.goldId);
            };
            this._select2 = {
                label:ArmsRecastViewLang.Select1,
                tip1:"",
                tip2:"",
                url:""
            };
            if (_local1.length == 1){
                this._select2 = _local1[0];
            };
            this._target.initdropList2(_local1, this._select2);
        }
        private function change_attack_item(_arg1:int, _arg2:int, _arg3:int):void{
            if (inStage == false){
                return;
            };
            _data.call(Mod_Item_Base.change_attack_item, this.change_attack_item_back, [_arg1, _arg2, _arg3]);
        }
        private function change_attack_item_back():void{
            if (_ctrl.item.result == Mod_Item_Base.SUCCESS){
                _view.alert.confirm(this._tipSuccess);
                _view.toolbar.playGoodsEffect(this._toItem.iconUrl);
                this.close();
            } else {
                _view.showTip(ArmsRecastViewLang.Error);
            };
        }

    }
}//package com.views 

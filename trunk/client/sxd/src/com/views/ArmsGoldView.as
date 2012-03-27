//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.pack.*;
    import com.haloer.data.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.utils.*;

    public class ArmsGoldView extends Base implements IView {

        public var playerItemId:int = 0;
        public var goldId:int = 0;
        public var selectPlayerItemId:int = 0;
        private var _canList:Array;
        private var _target:IArmsGold;
        private var _selectObj:Object;
        private var _effectTime:int = 0;

        public function ArmsGoldView(){
            this._canList = [];
            super();
        }
        public function show():void{
            if (getTimer() < this._effectTime){
                return;
            };
            this.can_use_gold_info();
        }
        public function close():void{
            this.selectPlayerItemId = 0;
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            var _local2:Object;
            if (this._target == null){
                this._target = (_view.getAssetsObject("ArmsGold", "MCGoldArmsClass") as IArmsGold);
                this._target.onClose = this.close;
                this._target.onOk = this.onOK;
                this._target.onSelect = this.onSelect;
                this._target.onTip = this.onTip;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _view.tip.iTip.addTarget(this._target.btnHelp, ArmsGoldViewLang.HelpTip);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            var _local1:Object = this._canList[0];
            if (this.selectPlayerItemId != 0){
                for each (_local2 in this._canList) {
                    if (_local2.player_item_id == this.selectPlayerItemId){
                        _local1 = _local2;
                        break;
                    };
                };
            };
            this._target.initDropList(this._canList, _local1);
        }
        private function onOK():void{
            this.use_gold_oil();
        }
        private function onSelect(_arg1:Object):void{
            this._selectObj = _arg1;
            var _local2:ItemInfo = new ItemInfo();
            _local2.parseSee(_arg1.item_id, _arg1.player_item_lv, GoldOilType.getPrevOilItemId(this.goldId));
            _local2.playerItemId = _arg1.player_item_id;
            _view.tip.iTip.addTarget(this._target.mcBox, _local2.getTipsSprite1("", ""));
        }
        private function onTip(_arg1:DisplayObject, _arg2:Object):void{
            if ((((_arg2 == null)) || ((_arg2 == "")))){
                _view.tip.iTip.removeTarget(_arg1);
            } else {
                _view.tip.iTip.addTarget(_arg1, _arg2);
            };
        }
        private function can_use_gold_info():void{
            _data.call(Mod_Item_Base.can_use_gold_info, this.can_use_gold_info_back, [this.goldId]);
        }
        private function can_use_gold_info_back():void{
            var _local3:Array;
            var _local4:Object;
            var _local5:ItemBasically;
            var _local6:int;
            var _local7:int;
            var _local8:Array;
            var _local9:String;
            var _local10:String;
            this._canList = [];
            var _local1:int = GoldOilType.getPrevOilItemId(this.goldId);
            var _local2:String = Lang.sprintf(ArmsGoldViewLang.GoldUseCoin, int((GoldOilType.getUseCoin(this.goldId) / 10000)));
            for each (_local3 in _ctrl.item.cangoldList) {
                _local4 = {};
                oObject.list(_local3, _local4, ["player_item_id", "item_id", "player_item_lv", "item_attack_up", "item_defense_up", "item_stunt_attack_up", "item_stunt_defense_up", "item_magic_attack_up", "item_magic_defense_up", "item_health_up", "to_item_attack_up", "to_item_defense_up", "to_item_stunt_attack_up", "to_item_stunt_defense_up", "to_item_magic_attack_up", "to_item_magic_defense_up", "to_item_health_up", "role_id"]);
                _local5 = ItemBasically.getBasic(_local4.item_id);
                _local6 = _local5.getItemColor(_local1);
                _local7 = _local4.player_item_lv;
                _local4.iconUrl1 = _local5.getImgUrl(_local1);
                _local4.iconUrl2 = _local5.getImgUrl(this.goldId);
                _local4.msg = _local2;
                _local4.name1 = HtmlText.format(_local5.getItemName(_local1), _local6);
                _local4.name2 = HtmlText.format(_local5.getItemName(this.goldId), 0xFFF200);
                _local4.label = _local4.name1;
                if ((((_local4.role_id > 0)) && ((_local4.role_id < 7)))){
                    _local4.label = (_local4.label + HtmlText.format(ArmsGoldViewLang.Main, _local6));
                } else {
                    if (_local4.role_id >= 7){
                        _local4.label = (_local4.label + HtmlText.format((("(" + RoleType.getRoleName(_local4.role_id)) + ")"), _local6));
                    };
                };
                _local4.lv1 = HtmlText.format(ItemType.getItemUpgrade(_local7), _local6);
                _local4.lv2 = HtmlText.format(ItemType.getItemUpgrade(_local7), 0xFFF200);
                _local8 = ["", "", "", "", "", "", "", "", "", "", "", ""];
                _local9 = "";
                _local10 = "";
                if (_local4.item_health_up > 0){
                    _local9 = (ArmsGoldViewLang.HealthEach + (_local5.getHealthValue(2, _local1) - _local5.getHealthValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.HealthEach + (_local5.getHealthValue(2, this.goldId) - _local5.getHealthValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.Health, ("+" + _local4.item_health_up), ("+" + _local4.to_item_health_up));
                };
                if (_local4.item_magic_defense_up > 0){
                    _local9 = (ArmsGoldViewLang.MDefenseEach + (_local5.getMDefenseValue(2, _local1) - _local5.getMDefenseValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.MDefenseEach + (_local5.getMDefenseValue(2, this.goldId) - _local5.getMDefenseValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.MDefense, ("+" + _local4.item_magic_defense_up), ("+" + _local4.to_item_magic_defense_up));
                };
                if (_local4.item_magic_attack_up > 0){
                    _local9 = (ArmsGoldViewLang.MAttackEach + (_local5.getMAttackValue(2, _local1) - _local5.getMAttackValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.MAttackEach + (_local5.getMAttackValue(2, this.goldId) - _local5.getMAttackValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.MAttack, ("+" + _local4.item_magic_attack_up), ("+" + _local4.to_item_magic_attack_up));
                };
                if (_local4.item_stunt_defense_up > 0){
                    _local9 = (ArmsGoldViewLang.SDefenseEach + (_local5.getSDefenseValue(2, _local1) - _local5.getSDefenseValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.SDefenseEach + (_local5.getSDefenseValue(2, this.goldId) - _local5.getSDefenseValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.SDefense, ("+" + _local4.item_stunt_defense_up), ("+" + _local4.to_item_stunt_defense_up));
                };
                if (_local4.item_stunt_attack_up > 0){
                    _local9 = (ArmsGoldViewLang.SAttackEach + (_local5.getSAttackValue(2, _local1) - _local5.getSAttackValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.SAttackEach + (_local5.getSAttackValue(2, this.goldId) - _local5.getSAttackValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.SAttack, ("+" + _local4.item_stunt_attack_up), ("+" + _local4.to_item_stunt_attack_up));
                };
                if (_local4.item_defense_up > 0){
                    _local9 = (ArmsGoldViewLang.PDefenseEach + (_local5.getPDefenseValue(2, _local1) - _local5.getPDefenseValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.PDefenseEach + (_local5.getPDefenseValue(2, this.goldId) - _local5.getPDefenseValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.PDefense, ("+" + _local4.item_defense_up), ("+" + _local4.to_item_defense_up));
                };
                if (_local4.item_attack_up > 0){
                    _local9 = (ArmsGoldViewLang.PAttackEach + (_local5.getPAttackValue(2, _local1) - _local5.getPAttackValue(1, _local1)));
                    _local10 = (ArmsGoldViewLang.PAttackEach + (_local5.getPAttackValue(2, this.goldId) - _local5.getPAttackValue(1, this.goldId)));
                    _local8.push(_local10, _local9, ArmsGoldViewLang.PAttack, ("+" + _local4.item_attack_up), ("+" + _local4.to_item_attack_up));
                };
                _local4.add2 = HtmlText.format(_local8.pop(), 0xFFF200);
                _local4.add1 = HtmlText.format(_local8.pop(), _local6);
                _local4.addName1 = _local8.pop();
                _local4.tip1 = _local8.pop();
                _local4.tip2 = _local8.pop();
                _local4.add4 = HtmlText.format(_local8.pop(), 0xFFF200);
                _local4.add3 = HtmlText.format(_local8.pop(), _local6);
                _local4.addName2 = _local8.pop();
                _local4.tip3 = _local8.pop();
                _local4.tip4 = _local8.pop();
                _local4.quality = (1000 - _local5.quality);
                _local4.require = (1000 - _local5.require);
                _local4.upgrade = (1000 - _local4.player_item_lv);
                _local4.roleid = ((_local4.role_id)<=0) ? 10000 : _local4.role_id;
                this._canList.push(_local4);
            };
            if (this._canList.length == 0){
                switch (this.goldId){
                    case 1203:
                        _view.showTip(ArmsGoldViewLang.Need90);
                        break;
                    case 1204:
                        _view.showTip(ArmsGoldViewLang.Need100);
                        break;
                    case 1205:
                        _view.showTip(ArmsGoldViewLang.Need110);
                        break;
                    case 1206:
                        _view.showTip(ArmsGoldViewLang.Need120);
                        break;
                    case 1207:
                        _view.showTip(ArmsGoldViewLang.Need130);
                        break;
                };
                return;
            };
            this._canList.sortOn(["roleid", "quality", "require", "upgrade"], [Array.NUMERIC, Array.NUMERIC, Array.NUMERIC, Array.NUMERIC]);
            loadAssets("ArmsGold", null, ArmsGoldViewLang.Loading, false, false, this.loadComplete);
        }
        public function use_gold_oil():void{
            if (_view.coinEnough(GoldOilType.getUseCoin(this.goldId)) == false){
                return;
            };
            _data.call(Mod_Item_Base.use_gold_oil, this.use_gold_oil_back, [this._selectObj.player_item_id, this.playerItemId], true);
        }
        public function use_gold_oil_back():void{
            switch (_ctrl.item.result){
                case Mod_Item_Base.SUCCESS:
                    this._target.playEffect();
                    _view.pack.updateGrids();
                    _view.roleMsg.updateEquipList();
                    setTimeout(_view.showTip, 800, ArmsGoldViewLang.Success, null, TipType.Success);
                    setTimeout(this.close, 2700);
                    this._effectTime = (getTimer() + 2700);
                    break;
                case Mod_Item_Base.NOT_ENOUGH_STATE_POINT:
                    _view.showTip(ArmsGoldViewLang.NOT_ENOUGH_STATE_POINT);
                    break;
                case Mod_Item_Base.UN_AVALIABLE_GRID:
                    _view.showTip(ArmsGoldViewLang.UN_AVALIABLE_GRID);
                    break;
                case Mod_Item_Base.NOT_ENOUGH_ITEM:
                    _view.showTip(ArmsGoldViewLang.NOT_ENOUGH_ITEM);
                    break;
                case Mod_Item_Base.NOT_ENOUGH_COIN:
                    _view.showTip(ArmsGoldViewLang.NOT_ENOUGH_COIN);
                    break;
                default:
                    _view.showTip(ArmsGoldViewLang.Error);
            };
        }

    }
}//package com.views 

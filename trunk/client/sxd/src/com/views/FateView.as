//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FateView extends Base implements IView {

        private var _showRoleId:int = 0;
        private var _bagList:Array;
        private var _bagEmptyData:Object;
        private var _roleFateList:Array;
        private var _roleEmptyData:Object;
        private var _fate:IFate;
        private var _fateData:Object;
        private var _isUser:Boolean = false;
        private var _changeData:Object;
        private var _mainFateData:Object;
        private var _minFateData:Object;
        private var _fateInfo:String;

        public function FateView(){
            this._bagEmptyData = {
                buyGrid:0,
                fateExp:0,
                fateId:0,
                grid:0,
                isEmpty:true,
                lockOn:true,
                PlayerColor:0xFFFFFF,
                playerFateId:0,
                playerLevel:0,
                PlayerName:"",
                playerRoleId:0,
                roleId:0,
                upDataExp:0
            };
            this._roleEmptyData = {
                fateExp:0,
                fateId:0,
                fateLevel:0,
                grid:0,
                isEmpty:true,
                lockOn:true,
                playerFateId:0,
                position:1,
                upDataExp:0
            };
            super();
        }
        private function get_bag_list():void{
            _data.call(Mod_Fate_Base.get_bag_list, this.getBagListCallBack, []);
        }
        private function get_role_fate_list():void{
            _data.call(Mod_Fate_Base.get_role_fate_list, this.roleFateListCallBack, [this._showRoleId]);
        }
        private function wear_on(_arg1:int, _arg2:int, _arg3:int):void{
            _data.call(Mod_Fate_Base.wear_on, this.wearOnCallBack, [_arg1, _arg2, _arg3]);
        }
        private function wear_off_fate(_arg1:int, _arg2:int):void{
            _data.call(Mod_Fate_Base.wear_off_fate, this.wearOffFateCallBack, [_arg1, _arg2]);
        }
        private function change_position(_arg1:int, _arg2:int):void{
            _data.call(Mod_Fate_Base.change_position, this.changePositionCallBack, [_arg1, _arg2]);
        }
        private function change_fate_grid(_arg1:int, _arg2:int):void{
            _data.call(Mod_Fate_Base.change_fate_grid, this.changeFateCallBack, [_arg1, _arg2]);
        }
        private function discard_fate(_arg1:int):void{
            _data.call(Mod_Fate_Base.discard_fate, new Function(), [_arg1]);
            this.get_bag_list();
            this.get_role_fate_list();
        }
        private function buy_bag_grid():void{
            _data.call(Mod_Fate_Base.buy_bag_grid, this.buyBagGridCallBack, [this._fateData.grid]);
        }
        private function get_role_list():void{
            _data.call(Mod_Role_Base.get_simple_role_list, this.getRoleListCallBack, [this._ctrl.player.playerId], false);
        }
        private function merge(_arg1:int, _arg2:int, _arg3:int):void{
            _data.call(Mod_Fate_Base.merge, this.mergeCallBack, [_arg1, _arg2, _arg3]);
        }
        public function get_player_role_fate_power():void{
            _data.call(Mod_Fate_Base.get_player_role_fate_power, this.fatePowerCallBack, [this._showRoleId]);
        }
        public function get_merge_data(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            _data.call(Mod_Fate_Base.get_merge_data, this.mergeDataCallBack, [_arg1, _arg2, _arg3, _arg4]);
        }
        public function merge_all_in_bag():void{
            _data.call(Mod_Fate_Base.merge_all_in_bag, new Function(), []);
            this.get_bag_list();
        }
        public function exchange_fate(_arg1:int):void{
            _data.call(Mod_Fate_Base.exchange_fate, this.exchangeFateCallBack, [_arg1]);
        }
        private function getRoleListCallBack():void{
            var _local1:Array = _ctrl.upgrade.getSimpleRoleList();
            if (inStage){
                this.extractionRole(_local1);
            } else {
                this.renderShow();
            };
        }
        private function extractionRole(_arg1:Array):void{
            var _local6:Object;
            var _local2:int = _arg1.length;
            var _local3:int;
            var _local4:int;
            var _local5:int;
            while (_local5 < _local2) {
                _local6 = _arg1[_local5];
                if (_local6.old_name == _ctrl.player.nickname){
                    _local3 = _local6.roleId;
                    _local4 = _local6.id;
                };
                if (this._showRoleId == _local6.id){
                    this._fate.getPlayerList(_arg1, this._showRoleId);
                    return;
                };
                _local5++;
            };
            this._showRoleId = _local4;
            this._fate.getPlayerList(_arg1, this._showRoleId);
        }
        public function set showRoleId(_arg1:int):void{
            this._showRoleId = _arg1;
        }
        private function getBagListCallBack():void{
            if (this.inStage == false){
                return;
            };
            var _local1:Array = this._ctrl.fate.bagList;
            this._fate.getFateGridList = _local1;
            this._fate.FragmentNum(_ctrl.fate.FateScrapNumber);
            this._bagList = _local1;
        }
        private function roleFateListCallBack():void{
            var _local1:Object = this._ctrl.fate.roleFateData;
            if (inStage == false){
                return;
            };
            this._fate.fatePower = _local1.fatePower;
            this._fate.getPlayerFate = _local1.fateList;
            this._roleFateList = _local1.fateList;
            _view.roleMsg.updateFate();
            _view.guide.trackFateWear(2, this._fate.content);
        }
        private function wearOnCallBack():void{
            var _local1:Object = this._ctrl.fate.wearOn;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_bag_list();
                this.get_role_fate_list();
            } else {
                this.renderMsg(_local1);
            };
            _view.guide.trackFateWear(3, this._fate.content);
        }
        private function wearOffFateCallBack():void{
            var _local1:Object = this._ctrl.fate.wearOffFate;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_role_fate_list();
                this.get_bag_list();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function buyBagGridCallBack():void{
            var _local1:Object = this._ctrl.fate.buyBagGrid;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_bag_list();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function changePositionCallBack():void{
            var _local1:Object = this._ctrl.fate.changePosition;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_role_fate_list();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function changeFateCallBack():void{
            var _local1:Object = this._ctrl.fate.changeFateGrid;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_bag_list();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function fatePowerCallBack():void{
            var _local1:Object = this._ctrl.fate.getFatePower;
            this._fate.fatePower = _local1.fatePower;
        }
        private function mergeCallBack():void{
            var _local1:Object = this._ctrl.fate.merge;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_bag_list();
                this.get_role_fate_list();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function mergeDataCallBack():void{
            var _local1:Object = this._ctrl.fate.mergeData;
            if (this._mainFateData.fateLevel < _local1.newLevel){
                this._fateInfo = (this._fateInfo + (("<font color=\"#ffffff\">" + Lang.sprintf(FateViewLang.UpLevelNum, _local1.newLevel)) + "</font>"));
            };
            _view.alert.showYesNoMsg(this._fateInfo, FateViewLang.Sure, FateViewLang.Cancel, this.onFusionHandler);
        }
        private function exchangeFateCallBack():void{
            var _local2:String;
            var _local3:int;
            var _local1:Object = this._ctrl.fate.ExchangeFate;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                _local2 = FateType.getFateName(this._changeData.fateId);
                _local3 = FateType.getFateQuality(this._changeData.fateId);
                _view.showTip((HtmlText.white(FateViewLang.ExchangeSuccess) + HtmlText.format((("【" + _local2) + "】"), this._changeData.color)), "", TipType.Success);
                this.get_bag_list();
                this.get_role_fate_list();
            } else {
                this.renderMsg(_local1);
            };
            this._isUser = false;
        }
        private function renderMsg(_arg1:Object):void{
            switch (_arg1.msg){
                case Mod_Fate_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(FateViewLang.NotEnoughIngot);
                    break;
                case Mod_Fate_Base.BAG_FULL:
                    _view.showTip(FateViewLang.BagFull);
                    break;
                case Mod_Fate_Base.MAX_BAG_NUMBER:
                    _view.showTip(FateViewLang.MaxBagNumber);
                    return;
                case Mod_Fate_Base.MAX_LEVEL:
                    _view.showTip(FateViewLang.MaxLevel);
                    break;
                case Mod_Fate_Base.INVALID_POSITION:
                    break;
                case Mod_Fate_Base.INVALID_GRID:
                    break;
                case Mod_Fate_Base.HAVE_SAME_TYPE_FATE:
                    _view.showTip(FateViewLang.HaveSameTypeFate, (((((FateViewLang.SameFateInfo + " <font color=\"#") + _arg1.color.toString(16)) + "\">") + _arg1.fateName) + "</font>"), TipType.Question);
                    break;
                case Mod_Fate_Base.HAVE_WEAR_ON:
                    _view.showTip(FateViewLang.HaveWearOn);
                    break;
                case Mod_Fate_Base.FATE_CAN_EXCHANGE:
                    _view.showTip(FateViewLang.FateCanExchange);
                    break;
                case Mod_Fate_Base.NOT_ENOUGH_LEVEL:
                    _view.showTip(FateViewLang.NotEnoughLevel);
                    break;
                case Mod_Fate_Base.NOT_ENOUGH_COUNT:
                    _view.showTip(FateViewLang.NotEnoughCount);
                    break;
            };
            this.get_bag_list();
            this.get_role_fate_list();
        }
        private function renderShow():void{
            loadAssets("Fate", this.render, FateViewLang.LoadAssets);
        }
        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.get_role_list();
        }
        public function render():void{
            this._fate = (_view.getAssetsObject("Fate", "Fate") as IFate);
            _popup.addView(this, this._fate.content);
            _view.center(sign, this._fate.content);
            this._fate.tip = _view.tip.iTip;
            this._fate.drag = _view.drag.iDrag;
            this.renderLodge();
        }
        private function renderLodge():void{
            this._fate.loadImage = _view.toolbar.getLoadEffectCircle;
            this.getRoleListCallBack();
            this.get_bag_list();
            this.get_role_fate_list();
            this._fate.isVip5 = VIPType.check(VIPType.Level5);
            this._fate.onSendType = function (_arg1:Object, _arg2:Boolean=false):void{
                if (_arg1.hitMc == null){
                    return;
                };
                if ((((_arg1.hitMc.isEmpty == false)) && (_arg2))){
                    _view.showTip(FateViewLang.NoEmptyBack);
                    return;
                };
                _fateData = _arg1;
                fusion(_arg1);
            };
            this._fate.onBuyFateGrid = function (_arg1:Object):void{
                if (_view.vipEnabled == false){
                    return;
                };
                if (_ctrl.player.ingot < _arg1.price){
                    _view.showTip(FateViewLang.NotEnoughIngot);
                    _fate.hideShive();
                    return;
                };
                _fateData = _arg1;
                _view.alert.showYesNoMsg((FateViewLang.BuyBackNeed + HtmlText.yellow((_arg1.price + FateViewLang.Ingot))), FateViewLang.Sure, FateViewLang.Cancel, onBuyFateGridHandler);
            };
            this._fate.onClose = function ():void{
                close();
                _view.guide.trackFateWear(4, _view.lodge.lodgePlayer);
            };
            this._fate.onCheckPlayer = function (_arg1:Object):void{
                _showRoleId = _arg1.id;
                get_role_fate_list();
            };
            this._fate.onMergeAll = function ():void{
                _view.alert.showYesNoMsg(FateViewLang.AutoMergeAl, FateViewLang.Sure, FateViewLang.Cancel, onMergeAllHandler);
            };
            this._fate.onOpenLodge = function ():void{
                if (_view.lodge.inStage){
                    close();
                } else {
                    _view.lodge.switchSelf();
                };
            };
            this._fate.onExchange = function (_arg1:Object):void{
                _changeData = _arg1;
                exchange_fate(_arg1.fateId);
                _isUser = true;
            };
            this.reposition();
            this._fate.isShowExchange = (_ctrl.player.level >= 60);
        }
        public function onBuyFateGridHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this._fate.hideShive();
                    this.buy_bag_grid();
                    break;
                case AlertButtonType.No:
                    this._fate.hideShive();
                    break;
            };
        }
        public function onMergeAllHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.merge_all_in_bag();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        private function fusion(_arg1:Object):void{
            var _local2:int;
            var _local3:int;
            var _local4:int;
            var _local5:String;
            var _local6:String;
            var _local7:int;
            if (_arg1.mainMc == null){
                return;
            };
            if (_arg1.type == "delete"){
                _view.alert.showYesNoMsg(FateViewLang.Fusion, FateViewLang.Sure, FateViewLang.Cancel, this.onFusionHandler);
                return;
            };
            if (((!((_arg1.mainMc.playerFateId == 0))) && (!((_arg1.hitMc.playerFateId == 0))))){
                if ((((_arg1.mainMc.fateLevel >= _arg1.mainMc.maxLevel)) || ((_arg1.hitMc.fateLevel >= _arg1.hitMc.maxLevel)))){
                    if ((((_arg1.mainMc.fateLevel >= _arg1.mainMc.maxLevel)) && ((_arg1.hitMc.quality <= _arg1.mainMc.quality)))){
                        _view.showTip(FateViewLang.MergeMaxLevel);
                        this._fate.upPlayerLive();
                        return;
                    };
                    if ((((_arg1.hitMc.fateLevel >= _arg1.hitMc.maxLevel)) && ((_arg1.mainMc.quality <= _arg1.hitMc.quality)))){
                        _view.showTip(FateViewLang.MergeMaxLevel);
                        this._fate.upPlayerLive();
                        return;
                    };
                };
                _local2 = (_arg1.mainMc.baseExp + _arg1.mainMc.fateExp);
                _local3 = (_arg1.hitMc.baseExp + _arg1.hitMc.fateExp);
                _local4 = 0;
                _local5 = ((((((((((((((("[<font color=\"#" + _arg1.mainMc.color.toString(16)) + "\">") + _arg1.mainMc.fateName) + "</font>]") + " ") + FateViewLang.InMerge) + " ") + "[<font color=\"#") + _arg1.hitMc.color.toString(16)) + "\">") + _arg1.hitMc.fateName) + "</font>]") + "<font color=\"#ffffff\">\n") + Lang.sprintf(FateViewLang.GetExp, _local3)) + "</font>");
                _local6 = ((((((((((((((("[<font color=\"#" + _arg1.hitMc.color.toString(16)) + "\">") + _arg1.hitMc.fateName) + "</font>]") + " ") + FateViewLang.InMerge) + " ") + "[<font color=\"#") + _arg1.mainMc.color.toString(16)) + "\">") + _arg1.mainMc.fateName) + "</font>]") + "<font color=\"#ffffff\">\n") + Lang.sprintf(FateViewLang.GetExp, _local2)) + "</font>");
                this._fateInfo = _local5;
                this._mainFateData = _arg1.mainMc;
                this._minFateData = _arg1.hitMc;
                if (_arg1.mainMc.fateLevel < _arg1.hitMc.fateLevel){
                    this._mainFateData = _arg1.hitMc;
                    this._minFateData = _arg1.mainMc;
                    this._fateInfo = _local6;
                };
                if (_arg1.mainMc.quality < _arg1.hitMc.quality){
                    this._mainFateData = _arg1.hitMc;
                    this._minFateData = _arg1.mainMc;
                    this._fateInfo = _local6;
                };
                if (_arg1.mainMc.quality > _arg1.hitMc.quality){
                    this._mainFateData = _arg1.mainMc;
                    this._minFateData = _arg1.hitMc;
                    this._fateInfo = _local5;
                };
                _local7 = ((this._mainFateData.fateExp + this._minFateData.baseExp) + this._minFateData.fateExp);
                this.get_merge_data(this._mainFateData.quality, this._mainFateData.fateLevel, this._mainFateData.fateExp, _local7);
            } else {
                this.sendType(_arg1);
            };
        }
        public function onFusionHandler(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.sendType(this._fateData);
                    break;
                case AlertButtonType.No:
                    this._fate.upPlayerLive();
                    break;
            };
        }
        private function sendType(_arg1:Object):void{
            if (_arg1.hitMc.playerFateId == null){
                this.get_bag_list();
                this.get_role_fate_list();
                this._fate.upPlayerLive();
                return;
            };
            switch (_arg1.type){
                case "PlayerChange":
                    if (_arg1.hitMc.playerFateId > 0){
                        this.loaderPlayer(1, _arg1);
                        this.merge(_arg1.mainMc.playerFateId, _arg1.hitMc.playerFateId, Mod_Fate_Base.ON_ROLE);
                    } else {
                        this.loaderPlayer(2, _arg1);
                        this.change_position(_arg1.mainMc.playerFateId, _arg1.hitMc.position);
                    };
                    break;
                case "FateChange":
                    if (_arg1.hitMc.playerFateId > 0){
                        this.loaderFate(1, _arg1);
                        this.merge(_arg1.mainMc.playerFateId, _arg1.hitMc.playerFateId, Mod_Fate_Base.IN_BAG);
                    } else {
                        this.loaderFate(2, _arg1);
                        this.change_fate_grid(_arg1.mainMc.playerFateId, _arg1.hitMc.grid);
                    };
                    break;
                case "SwearOn":
                    if (_arg1.hitMc.playerFateId > 0){
                        this.loaderSwearOn(1, _arg1);
                        this.merge(_arg1.mainMc.playerFateId, _arg1.hitMc.playerFateId, Mod_Fate_Base.BAG_TO_ROLE);
                    } else {
                        this.loaderSwearOn(2, _arg1);
                        this.wear_on(this._showRoleId, _arg1.mainMc.playerFateId, _arg1.hitMc.position);
                    };
                    break;
                case "WearOffFate":
                    if (_arg1.hitMc.playerFateId > 0){
                        this.loaderWearOffFate(1, _arg1);
                        this.merge(_arg1.mainMc.playerFateId, _arg1.hitMc.playerFateId, Mod_Fate_Base.ROLE_TO_BAG);
                    } else {
                        this.loaderWearOffFate(2, _arg1);
                        this.wear_off_fate(_arg1.mainMc.playerFateId, _arg1.hitMc.grid);
                    };
                    break;
                case "delete":
                    this.discard_fate(_arg1.mainMc.playerFateId);
                    break;
            };
            this._fate.upPlayerLive();
        }
        private function loaderFate(_arg1:int, _arg2:Object):void{
            var _local3:int = this._bagList.length;
            var _local4:int = _arg2.mainMc.grid;
            var _local5:int = _arg2.hitMc.grid;
            var _local6:Object = {};
            if (_arg1 == 1){
                if (this._minFateData.grid == _local5){
                    _arg2.mainMc.grid = _local5;
                    this._bagList[(_local5 - 1)] = _arg2.mainMc;
                };
            } else {
                _arg2.mainMc.grid = _local5;
                this._bagList[(_local5 - 1)] = _arg2.mainMc;
            };
            this._bagEmptyData.grid = _local4;
            this._bagList[(_local4 - 1)] = this._bagEmptyData;
            this._fate.getFateGridList = this._bagList;
        }
        private function loaderPlayer(_arg1:int, _arg2:Object):void{
            var _local3:int = this._bagList.length;
            var _local4:int = _arg2.mainMc.position;
            var _local5:int = _arg2.hitMc.position;
            var _local6:Object = {};
            if (_arg1 == 1){
                if (this._minFateData.position == _local5){
                    _arg2.mainMc.position = _local5;
                    this._roleFateList[(_local5 - 1)] = _arg2.mainMc;
                };
            } else {
                _arg2.mainMc.position = _local5;
                this._roleFateList[(_local5 - 1)] = _arg2.mainMc;
            };
            this._roleEmptyData.position = _local4;
            this._roleFateList[(_local4 - 1)] = this._roleEmptyData;
            this._fate.getPlayerFate = this._roleFateList;
        }
        private function loaderSwearOn(_arg1:int, _arg2:Object):void{
            var _local3:int = this._bagList.length;
            var _local4:int = _arg2.mainMc.grid;
            var _local5:int = _arg2.hitMc.position;
            var _local6:Object = {};
            if (_arg1 == 1){
                if (this._minFateData.position == _local5){
                    _arg2.mainMc.position = _local5;
                    this._roleFateList[(_local5 - 1)] = _arg2.mainMc;
                };
            } else {
                _arg2.mainMc.position = _local5;
                this._roleFateList[(_local5 - 1)] = _arg2.mainMc;
            };
            this._bagEmptyData.grid = _local4;
            this._bagList[(_local4 - 1)] = this._bagEmptyData;
            this._fate.getPlayerFate = this._roleFateList;
            this._fate.getFateGridList = this._bagList;
        }
        private function loaderWearOffFate(_arg1:int, _arg2:Object):void{
            var _local3:int = this._bagList.length;
            var _local4:int = _arg2.mainMc.position;
            var _local5:int = _arg2.hitMc.grid;
            var _local6:Object = {};
            if (_arg1 == 1){
                if (this._minFateData.grid == _local5){
                    _arg2.mainMc.grid = _local5;
                    this._bagList[(_local5 - 1)] = _arg2.mainMc;
                };
            } else {
                _arg2.mainMc.grid = _local5;
                this._bagList[(_local5 - 1)] = _arg2.mainMc;
            };
            this._roleEmptyData.position = _local4;
            this._roleFateList[(_local4 - 1)] = this._roleEmptyData;
            this._fate.getPlayerFate = this._roleFateList;
            this._fate.getFateGridList = this._bagList;
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            var _local2:Point = Structure.stageOffset;
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._fate.reposition(_local2);
            };
        }
        public function refreshFate():void{
            if (this.inStage == false){
                return;
            };
            this.get_bag_list();
            this.get_role_fate_list();
        }
        public function clear():void{
            if (this._fate == null){
                return;
            };
            this._fate.close();
            Helper.gc();
            this._fate = null;
            this._fateData = null;
        }
        public function close():void{
            this._isUser = false;
            this.clear();
            _popup.closeView(this);
        }

    }
}//package com.views 

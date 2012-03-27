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

    public class FarmView extends Base implements IView {

        private var _farm:IFarm;
        private var _dialog:IAlert = null;
        private var _intNextRemainingIngot:int;
        private var _intNextFieldLevelUpIngot:int;
        private var _intRefreshIngot:int;
        private var _blnInHarvest:Boolean = false;
        private var _blnInTurbo:Boolean = false;
        private var _blnInRefreshHerbsSeed:Boolean = false;
        private var _blnInGetTopHerbsSeed:Boolean = false;
        private var _blnInPlantHerbs:Boolean = false;
        private var _blnInClearFarmlandCd:Boolean = false;
        private var _blnInReclamation:Boolean = false;
        private var _blnInUpFarmlandLevel:Boolean = false;
        private var _blnInIngotForFarmland:Boolean = false;
        private var _blnInBuyCoinTreeCount:Boolean = false;
        private var _intCoinTreeCd:int;

        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            RoleType.loadJobLevelData(new Function());
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._view.removeFromTimerProcessList(this.sign);
            this._data.cancelPatch(Mod_Farm_Base.coin_tree_count_notify);
            this._dialog.hide();
            this._farm.clear();
            Helper.gc();
        }
        public function getFarmState():void{
            this.get_simple_farmlandinfo();
        }
        public function getFarmlandinfoList():void{
            if (this.inStage){
                this.get_farmlandinfo_list();
            };
        }
        private function loadData():void{
            this._data.call(Mod_Farm_Base.get_farmlandinfo_list, this.loadDataCallBack, [], false);
        }
        private function loadDataCallBack():void{
            if (!this._ctrl.farm.getIsImgComplete){
                setTimeout(this.loadDataCallBack, 20);
                return;
            };
            var callBack:* = function ():void{
                render();
                getFarmlandinfoListCallBack();
                showUI();
            };
            loadAssets("Farm", callBack, FarmViewLang.LoadInfo);
        }
        private function render():void{
            if (this._farm == null){
                this._farm = (_view.getAssetsObject("Farm", "Farm") as IFarm);
            };
            this.init();
            this._farm.render();
            if (FunctionType.isOpened(FunctionType.CoinTree)){
                this.buy_coin_tree_count_info();
                this.coin_tree_count_notify();
            };
        }
        private function showUI():void{
            _popup.addView(this, this._farm.content);
            _view.center(sign, this._farm.content);
        }
        private function init():void{
            this._blnInRefreshHerbsSeed = false;
            this._blnInHarvest = false;
            this._blnInPlantHerbs = false;
            this._blnInTurbo = false;
            this._blnInClearFarmlandCd = false;
            this._blnInReclamation = false;
            this._blnInUpFarmlandLevel = false;
            this._blnInIngotForFarmland = false;
            this._blnInBuyCoinTreeCount = false;
            this._intCoinTreeCd = -1;
            this._blnInGetTopHerbsSeed = false;
            this._farm.cropIconUrl = URI.farmIconUrl;
            this._dialog = this._view.alert.iAlert;
            this._farm.tip = this._view.tip.iTip;
            this._farm.drag = this._view.drag.iDrag;
            this._farm.myIngot = this._ctrl.player.ingot;
            this._farm.myLevel = this._ctrl.player.level;
            this._farm.onCloseBtn = this.close;
            this._farm.onCanPlantCrop = this.get_herbs_seed;
            this._farm.onFullStar = this.get_top_herbs_seed;
            this._farm.onOpenField = this.reclamation;
            this._farm.onPlantCrop = this.check_role_state;
            this._farm.onFarmData = this.get_farmlandinfo_list;
            this._farm.onPlantRole = this.get_player_roleinfo_list;
            this._farm.onRefreshCrop = this.refresh_herbs_seed;
            this._farm.onHarvest = this.harvest;
            this._farm.onBuyCoinTreeBtn = this.buyCoinTreeCount;
            this._farm.onFieldCdBtn = this.clearFarmlandCD;
            this._farm.onIngotForFarmland = this.ingot_for_farmland;
            this._farm.onFieldLevelUp = this.upFarmlandLevel;
            this._farm.onBatPlant = this.batPlantDialog;
            this._farm.onShowTip = this.showTip;
            this._farm.onIsChristmas = this.isChristmas;
            this._farm.onIsTreePlantingDay = this.isTreePlantingDay;
        }
        private function updateCdTime():void{
            this._farm.updateFieldCd();
            if (this._intCoinTreeCd >= 0){
                this._farm.updateCoinTreeCd(this._intCoinTreeCd);
                this._intCoinTreeCd--;
            };
        }
        private function clearFarmlandCD(_arg1:int, _arg2:int):void{
            var callBack:* = null;
            var intFieldID:* = _arg1;
            var intFieldTime:* = _arg2;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    clear_farmland_cd(intFieldID);
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.FarmClearFarmlandCD, true);
                };
            };
            var intIngot:* = (Math.ceil((intFieldTime / (15 * 60))) * 5);
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.FarmClearFarmlandCD)){
                this._dialog.yesLabel = FarmViewLang.DialogYes;
                this._dialog.cancelLabel = FarmViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(FarmViewLang.ClearCd, HtmlText.yellow((intIngot + FarmViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this.clear_farmland_cd(intFieldID);
            };
        }
        private function showTip(_arg1:String):void{
            this._view.showTip(_arg1);
        }
        private function buyCoinTreeCount():void{
            var obj:* = null;
            if (this._blnInBuyCoinTreeCount){
                return;
            };
            this._blnInBuyCoinTreeCount = true;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.BuyCoinTreeCount)){
                var callBack:* = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        buy_coin_tree_count();
                    } else {
                        _blnInBuyCoinTreeCount = false;
                    };
                    if (_dialog.checked){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.BuyCoinTreeCount, true);
                    };
                };
                this._dialog.yesLabel = FarmViewLang.DialogYes;
                this._dialog.noLabel = FarmViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                obj = this._ctrl.farm.buyCoinTreeCountInfo;
                this._dialog.show(Lang.sprintf(FarmViewLang.BuyCoinTree, HtmlText.yellow((obj["ingot"] + FarmViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.No), callBack);
            } else {
                this.buy_coin_tree_count();
            };
        }
        private function upFarmlandLevel(_arg1:int):void{
            var callBack:* = null;
            var obj:* = null;
            var strMessage:* = null;
            var intFieldId:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    up_farmland_level(intFieldId);
                } else {
                    _blnInUpFarmlandLevel = false;
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.FarmFieldLevelUp, true);
                };
            };
            if (this._blnInUpFarmlandLevel){
                return;
            };
            if (!_view.ingotEnough(this._intNextFieldLevelUpIngot)){
                return;
            };
            this._blnInUpFarmlandLevel = true;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.FarmFieldLevelUp)){
                obj = this._ctrl.farm.ingotForFarmland;
                strMessage = "";
                if (obj["field_level"] == 2){
                    strMessage = Lang.sprintf(FarmViewLang.LevelUpRed, HtmlText.yellow((obj["ingot"] + FarmViewLang.Ingot)), HtmlText.yellow(obj["field_sort"]), HtmlText.yellow("6"), HtmlText.yellow("20%"));
                } else {
                    strMessage = Lang.sprintf(FarmViewLang.LevelUpBlack, HtmlText.yellow((obj["ingot"] + FarmViewLang.Ingot)), HtmlText.yellow(obj["field_sort"]), HtmlText.yellow("4"), HtmlText.yellow("40%"));
                };
                this._dialog.yesLabel = FarmViewLang.DialogYes;
                this._dialog.noLabel = FarmViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                this._dialog.show(strMessage, (AlertButtonType.Yes | AlertButtonType.No), callBack);
            } else {
                this.up_farmland_level(intFieldId);
            };
        }
        private function batPlantDialog(_arg1:Array, _arg2:int, _arg3:int, _arg4:String, _arg5:int):void{
            var callBack:* = null;
            var strDialog:* = null;
            var aryFieldId:* = _arg1;
            var intPlayRoleId:* = _arg2;
            var intType:* = _arg3;
            var strHerbsName:* = _arg4;
            var intBatIngot:* = _arg5;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    batPlant(aryFieldId, intPlayRoleId, intType);
                } else {
                    _blnInPlantHerbs = false;
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.FarmBatPlant, true);
                };
            };
            if (this._blnInPlantHerbs){
                return;
            };
            if (aryFieldId.length <= 0){
                return;
            };
            if (!_view.ingotEnough(intBatIngot)){
                return;
            };
            this._blnInPlantHerbs = true;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.FarmBatPlant)){
                this._dialog.yesLabel = FarmViewLang.DialogYes;
                this._dialog.cancelLabel = FarmViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                strDialog = Lang.sprintf(FarmViewLang.BatPlant, HtmlText.yellow((intBatIngot + FarmViewLang.Ingot)), HtmlText.yellow(strHerbsName));
                this._dialog.show(strDialog, (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this.batPlant(aryFieldId, intPlayRoleId, intType);
            };
        }
        private function isChristmas():Boolean{
            var _local1:Date = new Date((this._ctrl.player.serverTime * 1000));
            var _local2:Boolean = (((_local1.month == 11)) && ((((_local1.date >= 23)) && ((_local1.date <= 25)))));
            return (_local2);
        }
        private function isTreePlantingDay():Boolean{
            var _local1:Date = new Date((this._ctrl.player.serverTime * 1000));
            var _local2:Boolean = (((((_local1.fullYear == 2012)) && ((_local1.month == 2)))) && ((((_local1.date >= 10)) && ((_local1.date <= 12)))));
            return (_local2);
        }
        private function get_herbs_seed(_arg1:int):void{
            this._data.call(Mod_Farm_Base.get_herbs_seed, this.getHerbsSeedCallBack, [_arg1]);
        }
        private function getHerbsSeedCallBack():void{
            var _local1:Object = this._ctrl.farm.getSingleHerbsSeed;
            var _local2:Array = this._ctrl.farm.getGroupHerbsSeed;
            this._intRefreshIngot = _local1["refresh_ingot"];
            this._farm.renderCanPlantCrop(_local1, _local2);
        }
        private function get_top_herbs_seed(_arg1:int):void{
            var callBack:* = null;
            var intType:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    _data.call(Mod_Farm_Base.get_top_herbs_seed, getTopHerbsSeedCallBack, [intType]);
                } else {
                    _blnInGetTopHerbsSeed = false;
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.FarmGetTopHerbsSeed, true);
                };
            };
            if (this._blnInGetTopHerbsSeed){
                return;
            };
            if (!_view.ingotEnough(100)){
                return;
            };
            this._blnInGetTopHerbsSeed = true;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.FarmGetTopHerbsSeed)){
                this._dialog.yesLabel = FarmViewLang.DialogYes;
                this._dialog.cancelLabel = FarmViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(FarmViewLang.GetTopSeed, HtmlText.yellow(("100" + FarmViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this._data.call(Mod_Farm_Base.get_top_herbs_seed, this.getTopHerbsSeedCallBack, [intType]);
            };
        }
        private function getTopHerbsSeedCallBack():void{
            var _local1:Object = this._ctrl.farm.getTopHerbsSeed;
            if (_local1["result"] == Mod_Farm_Base.SUCCESS){
                this._farm.renderFullStar(_local1);
            } else {
                _view.showTip(this.message(_local1.result));
            };
            this._blnInGetTopHerbsSeed = false;
        }
        private function reclamation():void{
            var callBack:* = null;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    _data.call(Mod_Farm_Base.reclamation, reclamationCallBack, []);
                } else {
                    _blnInReclamation = false;
                };
            };
            if (this._blnInReclamation){
                return;
            };
            if (!_view.vipEnabled){
                return;
            };
            if (!_view.ingotEnough(this._intNextRemainingIngot)){
                return;
            };
            this._blnInReclamation = true;
            var intMyIngot:* = this._ctrl.player.ingot;
            this._dialog.yesLabel = FarmViewLang.DialogYes;
            this._dialog.noLabel = FarmViewLang.DialogNo;
            if (intMyIngot < this._intNextRemainingIngot){
                this._dialog.yesEnabled = false;
                this._dialog.show(FarmViewLang.EnoughtIngot, (AlertButtonType.Yes | AlertButtonType.No), callBack);
                this._dialog.yesEnabled = true;
            } else {
                this._dialog.show(Lang.sprintf(FarmViewLang.Reclamation, HtmlText.yellow((this._intNextRemainingIngot + FarmViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.No), callBack);
            };
        }
        private function reclamationCallBack():void{
            var _local1:Object = this._ctrl.farm.openFarmland;
            if (_local1["result"] == Mod_Farm_Base.SUCCESS){
                this._intNextFieldLevelUpIngot = _local1["remaining_ingot"];
                this.get_farmlandinfo_list(true);
            } else {
                this._blnInReclamation = false;
                _view.showTip(this.message(_local1.result));
            };
        }
        private function check_role_state(_arg1:int, _arg2:int, _arg3:int):void{
            var callBack:* = null;
            var intFieldId:* = _arg1;
            var intRoleId:* = _arg2;
            var intType:* = _arg3;
            callBack = function ():void{
                checkRoleStateCallBack(intFieldId, intRoleId, intType);
            };
            if (this._blnInPlantHerbs){
                return;
            };
            this._blnInPlantHerbs = true;
            if (intType == Mod_Farm_Base.EXP_HERBS){
                this._data.call(Mod_Farm_Base.check_role_state, callBack, [this._farm.roleID, intType]);
            } else {
                this.plant_herbs(intFieldId, intRoleId, intType);
            };
        }
        private function checkRoleStateCallBack(_arg1:int, _arg2:int, _arg3:int):void{
            var _local4:Object = this._ctrl.farm.checkRoleState;
            if (_local4["result"] == Mod_Farm_Base.PASS){
                this.plant_herbs(_arg1, _arg2, _arg3);
            } else {
                _view.showTip(this.message(_local4.result));
                this._blnInPlantHerbs = false;
            };
        }
        private function plant_herbs(_arg1:int, _arg2:int, _arg3:int):void{
            var _local4:Array = [_arg1, _arg2, _arg3];
            this._data.call(Mod_Farm_Base.plant_herbs, this.plantHerbsCallBack, _local4);
        }
        private function plantHerbsCallBack():void{
            var _local1:Object = this._ctrl.farm.plantHerbs;
            if (_local1["result"] == Mod_Farm_Base.SUCCESS){
                this._farm.renderPlantCrop([_local1]);
                this.get_simple_farmlandinfo();
                if (FunctionType.isOpened(FunctionType.CoinTree)){
                    this.buy_coin_tree_count_info();
                };
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
            this._blnInPlantHerbs = false;
        }
        private function get_farmlandinfo_list(_arg1:Boolean=false):void{
            this._data.call(Mod_Farm_Base.get_farmlandinfo_list, this.getFarmlandinfoListCallBack, [], _arg1);
        }
        private function getFarmlandinfoListCallBack():void{
            var _local1:Array = this._ctrl.farm.getFarmlandinfoList;
            this._farm.myIngot = this._ctrl.player.ingot;
            this._farm.renderFarmData(_local1);
            this._view.addToTimerProcessList(this.sign, this.updateCdTime);
            if (this._blnInReclamation){
                this._blnInReclamation = false;
            };
            if (this._blnInUpFarmlandLevel){
                this._blnInUpFarmlandLevel = false;
            };
        }
        private function get_player_roleinfo_list():void{
            this._data.call(Mod_Farm_Base.get_player_roleinfo_list, this.getPlayerRoleinfoListCallBack, []);
        }
        private function getPlayerRoleinfoListCallBack():void{
            var _local1:Array = this._ctrl.farm.getPlayerRoleInfoList;
            this._farm.renderPlantRole(_local1);
            if (_local1.length <= 0){
                this._view.showTip(FarmViewLang.EnoughtRole, FarmViewLang.NeedMoreRole);
            };
        }
        private function refresh_herbs_seed(_arg1:int):void{
            var callBack:* = null;
            var intType:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    _data.call(Mod_Farm_Base.refresh_herbs_seed, refreshHerbsSeedCallBack, [intType]);
                } else {
                    _blnInRefreshHerbsSeed = false;
                };
                if (_dialog.checked){
                    _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.FarmRefreshHerbsSeed, true);
                };
            };
            if (this._blnInRefreshHerbsSeed){
                return;
            };
            if (!_view.vipEnabled){
                return;
            };
            if (!_view.ingotEnough(this._intRefreshIngot)){
                return;
            };
            this._blnInRefreshHerbsSeed = true;
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.FarmRefreshHerbsSeed)){
                this._dialog.yesLabel = FarmViewLang.DialogYes;
                this._dialog.cancelLabel = FarmViewLang.DialogNo;
                this._dialog.hasCheckbox = true;
                this._dialog.show(Lang.sprintf(FarmViewLang.RefreshSeed, HtmlText.yellow((this._intRefreshIngot + FarmViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callBack);
            } else {
                this._data.call(Mod_Farm_Base.refresh_herbs_seed, this.refreshHerbsSeedCallBack, [intType]);
            };
        }
        private function refreshHerbsSeedCallBack():void{
            var _local1:Object = this._ctrl.farm.refreshHerbsSeed;
            this._intRefreshIngot = _local1["refresh_ingot"];
            if (_local1["result"] == Mod_Farm_Base.SUCCESS){
                this._farm.renderRefreshCrop(_local1);
            } else {
                _view.showTip(this.message(_local1.result));
            };
            this._blnInRefreshHerbsSeed = false;
        }
        private function harvest(_arg1:int, _arg2:int):void{
            var callBack:* = null;
            var intfarmlandId:* = _arg1;
            var intHerbsId:* = _arg2;
            callBack = function ():void{
                harvestCallBack(intfarmlandId, intHerbsId);
            };
            if (this._blnInHarvest){
                return;
            };
            this._blnInHarvest = true;
            this._data.call(Mod_Farm_Base.harvest, callBack, [intfarmlandId]);
        }
        private function harvestCallBack(_arg1:int, _arg2:int):void{
            var _local4:String;
            var _local5:Object;
            var _local3:Object = this._ctrl.farm.harvestHerbs;
            if (_local3["result"] != Mod_Farm_Base.SUCCESS){
                _view.showTip(this.message(_local3["result"]));
                return;
            };
            _local3["farmland_id"] = _arg1;
            _local3["herbs_id"] = _arg2;
            _local3["herbs_star_level"] = HerbsType.getStarLevel(_arg2);
            if (_local3["herbs_type"] == Mod_Farm_Base.EXP_HERBS){
                if (_local3["level"] > 0){
                    _local4 = Lang.sprintf(FarmViewLang.LevelUp, _local3["role_name"], _local3["level"]);
                } else {
                    _local4 = Lang.sprintf(FarmViewLang.GetExp, _local3["role_name"], _local3["experience"]);
                };
            } else {
                _local4 = Lang.sprintf(FarmViewLang.GetCoin, _local3["coin"]);
                if (((this.isChristmas()) || (this.isTreePlantingDay()))){
                    _local5 = {
                        1:100,
                        2:150,
                        3:200,
                        4:250,
                        5:300
                    };
                    _local4 = (_local4 + ("\r" + Lang.sprintf(FarmViewLang.GetFame, _local5[_local3["herbs_star_level"]])));
                };
            };
            this._farm.renderHarvest(_local3, HtmlText.green(_local4));
            this.get_simple_farmlandinfo();
            this._blnInHarvest = false;
        }
        private function clear_farmland_cd(_arg1:int):void{
            var callBack:* = null;
            var intFieldID:* = _arg1;
            callBack = function ():void{
                clearFarmlandCdCallBack(intFieldID);
            };
            if (this._blnInClearFarmlandCd){
                return;
            };
            this._blnInClearFarmlandCd = true;
            this._data.call(Mod_Farm_Base.clear_farmland_cd, callBack, [intFieldID]);
        }
        private function clearFarmlandCdCallBack(_arg1:int):void{
            var _local2:Object = this._ctrl.farm.clearFarmlandCd;
            if (_local2["result"] == Mod_Farm_Base.SUCCESS){
                this._farm.renderClearFarmlandCd(_arg1);
            } else {
                _view.showTip(this.message(_local2["result"]));
            };
            this._blnInClearFarmlandCd = false;
        }
        private function get_simple_farmlandinfo():void{
            this._data.call(Mod_Farm_Base.get_simple_farmlandinfo, this.getSimpleFarmlandinfoCallBack, []);
        }
        public function getSimpleFarmlandinfoCallBack():void{
            var _local1:Object = _ctrl.farm.getSimpleFarmlandinfo;
            _view.toolbar.setFarmLink(_local1["plant_count"], _local1["farmland_count"]);
            _view.toolbar.setFunctionLinkPoint();
            _view.activities.addActivity(FunctionType.Farm);
        }
        private function buy_coin_tree_count_info():void{
            this._data.call(Mod_Farm_Base.buy_coin_tree_count_info, this.buyCoinTreeCountInfoCallBack, []);
        }
        private function buyCoinTreeCountInfoCallBack():void{
            var _local1:Object = this._ctrl.farm.buyCoinTreeCountInfo;
            if (_local1["coin_tree_count"] < 8){
                this._intCoinTreeCd = _local1["recorve_cd"];
            } else {
                this._intCoinTreeCd = 0;
            };
            this._farm.renderCoinTreeCountInfo(_local1);
            this._blnInBuyCoinTreeCount = false;
        }
        private function buy_coin_tree_count():void{
            this._data.call(Mod_Farm_Base.buy_coin_tree_count, this.buyCoinTreeCountCallBack, []);
        }
        private function buyCoinTreeCountCallBack():void{
            var _local1:Object = this._ctrl.farm.buyCoinTreeCount;
            if (_local1["result"] == Mod_Farm_Base.SUCCESS){
                if (FunctionType.isOpened(FunctionType.CoinTree)){
                    this.buy_coin_tree_count_info();
                };
            } else {
                _view.showTip(this.message(_local1["result"]));
                this._blnInBuyCoinTreeCount = false;
            };
        }
        private function coin_tree_count_notify():void{
            this._data.patch(Mod_Farm_Base.coin_tree_count_notify, this.coinTreeCountNotifyCallBack);
        }
        private function coinTreeCountNotifyCallBack():void{
            var _local1:int = this._ctrl.farm.coinTreeCountNotify["coin_tree_counts"];
            this._farm.updateCoinTreeCount(_local1);
            if (_local1 >= 8){
                this._intCoinTreeCd = 0;
            } else {
                this.buy_coin_tree_count_info();
            };
        }
        private function ingot_for_farmland(_arg1:int, _arg2:int):void{
            var delay:* = null;
            var callBack:* = null;
            var intFieldLevel:* = _arg1;
            var intFieldSort:* = _arg2;
            delay = function ():void{
                ingot_for_farmland(intFieldLevel, intFieldSort);
            };
            callBack = function ():void{
                ingotForFarmlandCallBack(intFieldLevel, intFieldSort);
            };
            if (this._blnInIngotForFarmland){
                setTimeout(delay, 100);
                return;
            };
            this._blnInIngotForFarmland = true;
            this._data.call(Mod_Farm_Base.ingot_for_farmland, callBack, [intFieldLevel]);
        }
        private function ingotForFarmlandCallBack(_arg1:int, _arg2:int):void{
            var _local3:Object = this._ctrl.farm.ingotForFarmland;
            if (_arg1 == 1){
                this._intNextRemainingIngot = _local3["ingot"];
            } else {
                this._intNextFieldLevelUpIngot = _local3["ingot"];
            };
            _local3["field_level"] = _arg1;
            _local3["field_sort"] = _arg2;
            this._farm.renderIngotForFarmland(_local3);
            this._blnInIngotForFarmland = false;
        }
        private function up_farmland_level(_arg1:int):void{
            var callBack:* = null;
            var intFieldId:* = _arg1;
            callBack = function ():void{
                upFarmlandLevelCallBack(intFieldId);
            };
            this._data.call(Mod_Farm_Base.up_farmland_level, callBack, [intFieldId]);
        }
        private function upFarmlandLevelCallBack(_arg1:int):void{
            var _local2:Object = this._ctrl.farm.upFarmlandLevel;
            if (_local2["result"] == Mod_Farm_Base.SUCCESS){
                this._farm.renderFieldLevelUp(_arg1);
                this.get_farmlandinfo_list(true);
            } else {
                this._blnInUpFarmlandLevel = false;
                _view.showTip(this.message(_local2["result"]));
            };
        }
        private function batPlant(_arg1:Array, _arg2:int, _arg3:int):void{
            var intIndex:* = 0;
            var getHerbsInfoCallBack:* = null;
            var plant:* = null;
            var plantCallBack:* = null;
            var aryFieldId:* = _arg1;
            var intPlayRoleId:* = _arg2;
            var intType:* = _arg3;
            var getHerbsInfo:* = function ():void{
                _data.call(Mod_Farm_Base.get_herbs_seed, getHerbsInfoCallBack, [intType]);
            };
            getHerbsInfoCallBack = function ():void{
                var _local1:Object = _ctrl.farm.getSingleHerbsSeed;
                if (_local1["herbs_star_level"] < 5){
                    _data.call(Mod_Farm_Base.get_top_herbs_seed, plant, [intType]);
                } else {
                    plant();
                };
            };
            plant = function ():void{
                _data.call(Mod_Farm_Base.plant_herbs, plantCallBack, [aryFieldId[intIndex], intPlayRoleId, intType]);
            };
            plantCallBack = function ():void{
                var _local1:Object = _ctrl.farm.plantHerbs;
                if (_local1["result"] == Mod_Farm_Base.SUCCESS){
                    renderPlantCrop(_local1);
                    if (intIndex < (aryFieldId.length - 1)){
                        intIndex++;
                        getHerbsInfo();
                    } else {
                        get_simple_farmlandinfo();
                        if (FunctionType.isOpened(FunctionType.CoinTree)){
                            buy_coin_tree_count_info();
                        };
                        _blnInPlantHerbs = false;
                    };
                } else {
                    _view.showTip(message(_local1["result"]));
                    _blnInPlantHerbs = false;
                };
            };
            var renderPlantCrop:* = function (_arg1:Object):void{
                var delay:* = null;
                var obj:* = _arg1;
                delay = function ():void{
                    renderPlantCrop(obj);
                };
                if (_farm.isInPlanting){
                    setTimeout(delay, 50);
                } else {
                    if (inStage){
                        _farm.renderPlantCrop([obj]);
                    };
                };
            };
            intIndex = 0;
            getHerbsInfo();
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Farm_Base.PLANT:
                    _local2 = FarmViewLang.Plant;
                    break;
                case Mod_Farm_Base.NO_PLANT:
                    _local2 = FarmViewLang.NoPlant;
                    break;
                case Mod_Farm_Base.SUCCESS:
                    _local2 = FarmViewLang.Success;
                    break;
                case Mod_Farm_Base.NOT_ENOUGH_INGOT:
                case Mod_Farm_Base.NO_INGOT:
                    _local2 = FarmViewLang.NotEnoughIngot;
                    break;
                case Mod_Farm_Base.REACH_MAX_LAND_COUNT:
                    _local2 = FarmViewLang.ReachMaxLandCount;
                    break;
                case Mod_Farm_Base.NOT_PLAYER_ROLE:
                    _local2 = FarmViewLang.NotPlayerRole;
                    break;
                case Mod_Farm_Base.IS_MAIN_ROLE:
                    _local2 = FarmViewLang.IsMainRole;
                    break;
                case Mod_Farm_Base.ROLE_LEVEL:
                    _local2 = FarmViewLang.RoleLevel;
                    break;
                case Mod_Farm_Base.NO_ENOUGHT_COIN_TREE_COUNT:
                    _local2 = FarmViewLang.NoEnoughtCoinTreeCount;
                    break;
                case Mod_Farm_Base.NO_VIP:
                    _local2 = FarmViewLang.NoVip;
                    break;
                case Mod_Farm_Base.IS_PLANT:
                    _local2 = FarmViewLang.IsPlant;
                    break;
                case Mod_Farm_Base.CAN_NOT_UP:
                    _local2 = FarmViewLang.CanNotUp;
                    break;
                default:
                    _local2 = (FarmViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

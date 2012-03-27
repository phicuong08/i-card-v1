//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.view.map.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.utils.*;

    public class TowerView extends Base implements IView {

        private var _target:ITower;
        private var _info:TowerInfo;
        private var _body:IFrameSprite;
        private var _noticeTips:Array;
        private var _warTime:int = 0;
        private var lastHideId:int = 0;

        public function TowerView(){
            _inStageTipTitle = TowerViewLang.TowerOpening;
            _inStageTipContent = "";
            super();
        }
        public function show():void{
            if (inStage){
                return;
            };
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            this.get_tower_info();
        }
        public function close():void{
            if (_view.towerWar.opened == true){
                return;
            };
            _popup.closeView(this);
            _data.cancelPatch(Mod_Tower_Base.notify_auto_challenge_report);
            this.stop_auto_challenge();
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._body = MapStatic.mapInstance.frame;
                this._body.content.mouseChildren = false;
                this._body.content.mouseEnabled = false;
                this._body.content.scaleX = 0.5;
                this._body.content.scaleY = 0.5;
                this._info = _ctrl.tower.towerInfo;
                this._info.roleDisplay = this._body;
                this._target = (_view.getAssetsObject("Tower", "MCTower") as ITower);
                this._target.onClose = this.close;
                this._target.onWar = this.onWar;
                this._target.onAuto = this.onAuto;
                this._target.onReset = this.onReset;
                this._target.onStop = this.onStop;
                this._target.onTip = this.onTip;
                this._target.onGoToNext = this.onGoToNext;
                this._target.onTownClick = this.onShowSoulShop;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
                _view.center(sign, this._target.content);
            };
            this._info.sign = (_ctrl.player.playerInfo.sign + _ctrl.player.playerInfo.signSuffix);
            this._target.initData(this._info);
            _data.patch(Mod_Tower_Base.notify_auto_challenge_report, this.notify_auto_challenge_report_back);
        }
        private function onGoToNext():void{
            if ((((this._info.layer == 6)) && ((this._info.sequenceWar == 26)))){
                this._view.activities.removeActivity(FunctionType.Tower);
                return;
            };
            this.get_tower_info2();
        }
        private function onShowSoulShop():void{
            this._view.sealStoneShop.switchSelf();
        }
        private function onWar(_arg1:int=0):void{
            var idx:int = _arg1;
            if (((!((this._info.layderTip == ""))) && (!((idx == 0))))){
                _view.showTip(this._info.layderTip);
            };
            if (((!((this._info.layderTip == ""))) && (!((idx == 0))))){
                return;
            };
            if (getTimer() < this._warTime){
                return;
            };
            this._warTime = (getTimer() + 1000);
            if (this._info.bagNum == 0){
                _view.alert.confirm(TowerViewLang.SoulPageFull);
                return;
            };
            if (this._info.inAuto == true){
                _view.showTip(TowerViewLang.Autoing);
                return;
            };
            _view.toolbar.checkWarCdTime(function (_arg1:Boolean):void{
                if (_arg1 == false){
                    start_challenge(idx);
                };
            });
        }
        private function onAuto():void{
            this.start_auto_challenge();
        }
        private function onReset():void{
            if ((((this._info.sequenceWar == 1)) || ((this._info.resetNum == 0)))){
                _view.showTip(this._info.resetTip);
            } else {
                if (this._info.resetIngot == 0){
                    this.reset_layer();
                } else {
                    this.checkBoxSelect(ConsumeAlertSetType.TowerViewReset, Lang.sprintf(TowerViewLang.AskReset, HtmlText.yellow((this._info.resetIngot + TowerViewLang.Ingot))), this.reset_layer);
                };
            };
        }
        private function onStop():void{
            this.stop_auto_challenge();
            this._target.updateInfo(0);
        }
        private function onTip(_arg1:DisplayObject, _arg2:Object=null):void{
            if ((((_arg2 == "")) || ((_arg2 == null)))){
                _view.tip.iTip.removeTarget(_arg1);
            } else {
                _view.tip.iTip.addTarget(_arg1, _arg2);
            };
        }
        private function onWarClose(_arg1:Boolean):void{
            if (_ctrl.tower.isPass){
                if (this._info.bagNum == 0){
                    _view.alert.confirm(TowerViewLang.SoulPageFull);
                };
                this._target.updateInfo(2);
            };
            _popup.addView(this, this._target.content);
            this.updateNotice(this._noticeTips);
        }
        private function checkBoxSelect(_arg1:int, _arg2:String, _arg3:Function):void{
            var cookie:* = _arg1;
            var msg:* = _arg2;
            var callback:* = _arg3;
            var checked:* = _view.consumeAlertSetting.isAlert(cookie);
            if (checked){
                callback();
            } else {
                _view.alert.iAlert.hasCheckbox = true;
                _view.alert.showYesNoMsg(msg, TowerViewLang.Yes, TowerViewLang.No, function (_arg1:int):void{
                    if (_arg1 == AlertButtonType.Yes){
                        callback();
                        if (_view.alert.iAlert.checked == true){
                            _view.consumeAlertSetting.saveSetting(cookie, true);
                        };
                    };
                });
            };
        }
        public function updateBagNum(_arg1:int):void{
            if (((inStage) && (!((this._target == null))))){
                this._info.bagNum = _arg1;
                this._target.updateInfo();
            };
        }
        public function updateNotice(_arg1:Array):void{
            var _local2:String;
            this._noticeTips = _arg1;
            if (((_arg1) && ((_view.towerWar.opened == false)))){
                for each (_local2 in _arg1) {
                    this._view.worldNotice.showMessage(_local2);
                };
                this._noticeTips = null;
            };
        }
        private function get_tower_info():void{
            _data.call(Mod_Tower_Base.get_tower_info, this.get_tower_info_back, []);
        }
        private function get_tower_info_back():void{
            loadAssets("Tower", null, TowerViewLang.TowerLoading, false, false, this.loadComplete);
        }
        private function get_tower_info2():void{
            _data.call(Mod_Tower_Base.get_tower_info, this.get_tower_info_back2, []);
        }
        private function get_tower_info_back2():void{
            this._target.updateInfo(1);
        }
        public function get_tower_info3():void{
            _data.call(Mod_Tower_Base.get_tower_info, this.get_tower_info_back3, []);
        }
        private function get_tower_info_back3():void{
            this._info = _ctrl.tower.towerInfo;
            if ((((this._info.layer == 6)) && ((this._info.sequenceWar == 26)))){
                this._view.activities.removeActivity(FunctionType.Tower);
            };
        }
        private function start_challenge(_arg1:int):void{
            _view.towerWar.opened = true;
            this._info.warIdx = _arg1;
            _data.call(Mod_Tower_Base.start_challenge, this.start_challenge_back, [_arg1, this._target.autoSellL, this._target.autoSellZ]);
        }
        private function start_challenge_back():void{
            if (_ctrl.tower.result == Mod_Tower_Base.SUCCESS){
                _view.towerWar.warData = _ctrl.tower.warData;
                _view.towerWar.background = new BitmapData(1, 1, true, 0);
                _view.towerWar.onClose = this.onWarClose;
                _view.towerWar.autoSellL = this._target.autoSellL;
                _view.towerWar.autoSellZ = this._target.autoSellZ;
                _view.towerWar.show();
            } else {
                if (_ctrl.tower.result == Mod_Tower_Base.INVALID_LAYER){
                    _view.towerWar.opened = false;
                    _view.showTip(TowerViewLang.InvalidLayder);
                };
            };
        }
        private function reset_layer():void{
            _data.call(Mod_Tower_Base.reset_layer, this.reset_layer_back, []);
        }
        private function reset_layer_back():void{
            switch (_ctrl.tower.result){
                case Mod_Tower_Base.SUCCESS:
                    this._target.updateInfo(1);
                    if (((!((this._info.hideId == 0))) && (!((this._info.hideId == this.lastHideId))))){
                        _view.alert.confirm(Lang.sprintf(TowerViewLang.OpenHideTip, this._info.hideTowerName));
                    };
                    this.lastHideId = this._info.hideId;
                    break;
                case Mod_Tower_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(TowerViewLang.IngotLack);
                    break;
                case Mod_Tower_Base.FULL_TIMES:
                    _view.showTip(TowerViewLang.NotResetCount);
                    break;
                case Mod_Tower_Base.INVALID_LAYER:
                    _view.showTip(TowerViewLang.InvalidLayder);
                    break;
            };
        }
        private function start_auto_challenge():void{
            this._info.autoSellL = this._target.autoSellL;
            this._info.autoSellZ = this._target.autoSellZ;
            _data.call(Mod_Tower_Base.start_auto_challenge, this.start_auto_challenge_back, [this._target.autoSellL, this._target.autoSellZ]);
        }
        private function start_auto_challenge_back():void{
            if (_ctrl.tower.result == Mod_Tower_Base.SUCCESS){
                this.quickly_auto_challenge();
            } else {
                if (_ctrl.tower.result == Mod_Tower_Base.INVALID_LAYER){
                    _view.showTip(TowerViewLang.InvalidLayder);
                };
            };
        }
        private function stop_auto_challenge():void{
            _data.call(Mod_Tower_Base.stop_auto_challenge, null, []);
            this._info.inAuto = false;
            this._info.awardAutoTip2 = TowerViewLang.StopAutoWar;
        }
        private function quickly_auto_challenge():void{
            this._info.autoSellL = this._target.autoSellL;
            this._info.autoSellZ = this._target.autoSellZ;
            _data.call(Mod_Tower_Base.quickly_auto_challenge, null, [this._target.autoSellL, this._target.autoSellZ]);
        }
        private function notify_auto_challenge_report_back():void{
            if (_ctrl.tower.result == Mod_Tower_Base.SUCCESS){
            } else {
                if (_ctrl.tower.result == Mod_Tower_Base.NOT_ENOUGH_INGOT){
                    _view.showTip(TowerViewLang.IngotLack);
                } else {
                    if (_ctrl.tower.result == Mod_Tower_Base.FULL_BAG){
                        _view.alert.showYesNoMsg(TowerViewLang.AskOpenSoul, TowerViewLang.Open, TowerViewLang.No, function (_arg1:int):void{
                            if (_arg1 == AlertButtonType.Yes){
                                _view.sealSoul.show();
                            };
                        });
                    };
                };
            };
            this._target.updateInfo(0);
        }

    }
}//package com.views 

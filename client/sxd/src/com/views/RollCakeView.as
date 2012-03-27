//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import flash.media.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class RollCakeView extends Base implements IView {

        private var _rollCake:IRollCake;
        private var _autoList:Array;
        private var _rollNum:int = 0;
        private var _count:int = 0;
        private var _isEnd:Boolean = false;
        private var _reollIngot:int = 0;
        private var _userIngotNum:int = 0;
        private var _userIngot:int = 0;
        private var _isCanFree:Boolean = false;
        private var _isPlaySound:Boolean = false;
        private var _isAutoReroll:Boolean = false;
        private var _noMoneyNum:int = 0;
        private var _rerollIngot:int = 0;
        public var endTownId:int = 0;

        public function RollCakeView(){
            this._autoList = [];
            super();
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            _inStageTipTitle = RollCakeViewLang.inStageTipTitle;
            _inStageTipContent = "";
            RollCakeType.loadData(this.loadRender);
        }
        private function loadRender():void{
            this.get_state();
        }
        public function roll():void{
            _data.call(Mod_RollCake_Base.roll, this.rollCallback, []);
        }
        public function get_count():void{
            if (FunctionType.isOpened(FunctionType.RollCake) == false){
                return;
            };
            _data.call(Mod_RollCake_Base.get_count, this.getCountCallback, []);
        }
        public function reroll(_arg1:int):void{
            this._rollCake.allszAgain();
            _data.call(Mod_RollCake_Base.reroll, this.rerollCallback, []);
        }
        public function get_award():void{
            _data.call(Mod_RollCake_Base.get_award, this.getAwardCallback, []);
        }
        public function get_state():void{
            _data.call(Mod_RollCake_Base.get_state, this.getStateCallback, []);
        }
        public function show_road():void{
            _data.call(Mod_RollCake_Base.get_state, this.showRoadCallback, []);
        }
        public function loadRollCakeData():void{
            RollCakeType.loadData(this.show_road);
        }
        private function getStateCallback():void{
            var _local1:Object;
            if (inStage){
                _local1 = _ctrl.rollCake.getState;
                if (_local1.msg == Mod_RollCake_Base.HAVE_RECORD){
                    this._rollCake.getMainSzData(_local1, true);
                };
            } else {
                loadAssets("RollCake", this.render, RollCakeViewLang.LoadAssets);
            };
        }
        private function showRoadCallback():void{
            var _local5:Object;
            var _local1:Object = _ctrl.rollCake.getState;
            var _local2:Array = _local1.numList;
            var _local3:int = _local2.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _local2[_local4];
                if (_local5.num == 0){
                    return;
                };
                _local4++;
            };
            this.addRollCakeActivity();
        }
        private function rollCallback():void{
            var _local1:Object = _ctrl.rollCake.rollData;
            if (_local1.msg == Mod_RollCake_Base.SUCCESS){
                this.get_count();
                if (this.inStage){
                    this._rollCake.getMainSzData(_local1, false);
                };
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function addCountCallback():void{
        }
        private function getCountCallback():void{
            var _local1:Object = _ctrl.rollCake.getCount;
            this._count = _local1.count;
            if (this.inStage){
                this._rollCake.getCountNum = _local1.count;
                this._rollCake.getFreeRobeNum = _local1.freeRobeNum;
                this._rollCake.getRobeMaxNum = _local1.robeMaxNum;
            } else {
                if (_local1.count <= 0){
                    this.loadRollCakeData();
                } else {
                    this.addRollCakeActivity();
                };
            };
        }
        private function addRollCakeActivity():void{
            this._view.activities.addActivity(FunctionType.RollCake);
        }
        private function removeRollCakeActivity():void{
            this._view.activities.removeActivity(FunctionType.RollCake);
        }
        private function rerollCallback():void{
            var _local1:Object = _ctrl.rollCake.rerollData;
            if (_local1.msg == Mod_RollCake_Base.SUCCESS){
                if (this.inStage){
                    this._rollNum++;
                    if (((((((this._isAutoReroll) && ((this._rollNum <= 9)))) && ((_ctrl.player.ingot >= _ctrl.rollCake.reollIngot)))) && ((this.isALLJi(_local1.numList) == false)))){
                        this._isCanFree = (_local1.canFree > 0);
                        if ((((this._isCanFree == false)) && ((this._rollNum <= 9)))){
                            this._userIngot = (this._userIngot + _ctrl.rollCake.reollIngot);
                        };
                        this._isPlaySound = false;
                        this.reroll(0);
                    } else {
                        this._rollNum = 0;
                        if (this._isAutoReroll){
                            this._rerollIngot = (this._rerollIngot + this._userIngot);
                            this._rollCake.sureTip = Lang.sprintf(RollCakeViewLang.AllRedirection, this._rerollIngot);
                        };
                    };
                    this._rollCake.getMainSzData(_local1, false);
                    this.get_count();
                };
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function isALLJi(_arg1:Array):Boolean{
            var _local4:Object;
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _arg1[_local3];
                if (_local4.num != 4){
                    return (false);
                };
                _local3++;
            };
            return (true);
        }
        private function getAwardCallback():void{
            var _local1:Object = _ctrl.rollCake.getAward;
            if (_local1.msg == Mod_RollCake_Base.SUCCESS){
                this._isEnd = (this._count <= 0);
                setTimeout(this.upPlayerDataCallBack, 1000);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function upPlayerDataCallBack():void{
            if (this.inStage == false){
                return;
            };
            this._rollCake.getSkill = _ctrl.player.skill;
            this._rollCake.getStatePoing = _ctrl.player.statePoint;
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_RollCake_Base.FAILURE:
                    _view.showTip(RollCakeViewLang.Fail);
                    break;
                case Mod_RollCake_Base.NO_RECORD:
                    _view.showTip(RollCakeViewLang.NoRecoRd);
                    break;
                case Mod_RollCake_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(RollCakeViewLang.InsufficientIngot);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function render():void{
            this._rollCake = (_view.getAssetsObject("RollCake", "RollCake") as IRollCake);
            _popup.addView(this, this._rollCake.content);
            this._rollCake.tip = _view.tip.iTip;
            this._rollCake.drag = _view.drag.iDrag;
            this._rollCake.getSkill = _ctrl.player.skill;
            this._rollCake.getStatePoing = _ctrl.player.statePoint;
            this._rollCake.isVip4 = VIPType.check(VIPType.Level0);
            this._rollCake.isVip10 = VIPType.check(VIPType.Level10);
            this.getStateCallback();
            this._rollCake.isFirst = !(_view.getCookie("rollCakeFirst"));
            _view.setCookie("rollCakeFirst", true);
            this._rollCake.onGetRoll = function ():void{
                _isPlaySound = true;
                roll();
            };
            this._rollCake.onRobelRedirection = function (_arg1:int, _arg2:Boolean, _arg3:int):void{
                var callback:* = null;
                var szId:* = _arg1;
                var bool:* = _arg2;
                var rerollIngot:* = _arg3;
                _isPlaySound = true;
                _userIngot = 0;
                _rerollIngot = ((bool == true)) ? 0 : rerollIngot;
                _isCanFree = bool;
                if ((((_ctrl.player.ingot < rerollIngot)) && ((bool == false)))){
                    _view.showTip(RollCakeViewLang.InsufficientIngot);
                    return;
                };
                if (((!(_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.RobelRedirection))) && ((bool == false)))){
                    dialog.yesLabel = RollCakeViewLang.Sure;
                    dialog.cancelLabel = RollCakeViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            reroll(szId);
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.RobelRedirection, true);
                        };
                    };
                    dialog.show(Lang.sprintf(RollCakeViewLang.RobelRedirection, HtmlText.yellow((_ctrl.rollCake.reollIngot + RollCakeViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    reroll(szId);
                };
            };
            this._rollCake.onUserRobel = function ():void{
            };
            this._rollCake.onSound = function (_arg1:Sound):void{
                if (_isPlaySound == true){
                    SoundManage.playGameSound(_arg1);
                };
            };
            this._rollCake.onSureAward = function ():void{
                get_award();
            };
            this._rollCake.onClose = function ():void{
                _isPlaySound = true;
                close();
            };
            this._rollCake.onTip = function (_arg1:String):void{
                switch (_arg1){
                    case "noCountNum":
                        _view.showTip(RollCakeViewLang.NoCountNum);
                        break;
                    case "noRobeNum":
                        _view.showTip(RollCakeViewLang.NoRobeNum);
                        break;
                    case "userRobelRedirection":
                        _view.showTip(RollCakeViewLang.UserRobelRedirection);
                        break;
                };
            };
            this._rollCake.onShowMouse = function (_arg1:Boolean):void{
                if (_arg1){
                    MouseCursor.hide();
                } else {
                    MouseCursor.show();
                };
            };
            this._rollCake.onAuto = function (_arg1:Boolean):void{
                _isAutoReroll = _arg1;
            };
            this._rollCake.init();
            this._rollCake.isAuto = this._isAutoReroll;
            this.get_count();
            this.reposition();
            _view.closeEvent();
        }
        public function reposition(_arg1:Boolean=true):void{
            var _local2:Point;
            if (inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                _local2 = Structure.stageOffset;
                this._rollCake.reposition(_local2);
            };
        }
        public function close():void{
            if (this._isEnd){
                this.removeRollCakeActivity();
            };
            this._rollNum = 0;
            _view.openEvent();
            MouseCursor.show();
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._rollCake.clear();
        }

    }
}//package com.views 

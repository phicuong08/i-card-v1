//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import flash.media.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FactionRollCakeView extends Base implements IView {

        private var _factionRollCake:IFactionRollCake;
        private var _autoList:Array;
        private var _isIntoJiHuiSuo:Boolean = false;
        private var _isAutoReroll:Boolean = false;
        private var _noMoneyNum:int = 0;
        private var _rerollIngot:int = 0;
        public var endTownId:int = 0;

        public function FactionRollCakeView(){
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
            this.faction_roll_cake_info();
        }
        public function faction_roll_cake_remain_times():void{
            _data.call(Mod_Faction_Base.faction_roll_cake_remain_times, this.rollCakeRemainTimes, []);
        }
        public function faction_roll_cake_info():void{
            _data.call(Mod_Faction_Base.faction_roll_cake_info, this.rollCakeInfoCallback, []);
        }
        public function roll_cake():void{
            _data.call(Mod_Faction_Base.roll_cake, this.rollCakeCallback, []);
        }
        private function rollCakeRemainTimes():void{
            var _local1:Object = _ctrl.faction.rollCakeReamain;
            var _local2:Object = {};
            if (_local1.remainTimes > 0){
                _local2.btnInfo = FactionRollCakeViewLang.JoinRollCake;
            } else {
                _local2.btnInfo = FactionRollCakeViewLang.CheckNum;
            };
            _local2.explain = Lang.sprintf(FactionRollCakeViewLang.RemainTimes, _local1.remainTimes);
            _local2.sign = ActivityType.FactionRollCake;
            _local2.isStart = 1;
            _local2.btnType = 1;
            _view.factionWindow.getActivityState(_local2);
        }
        private function rollCakeInfoCallback():void{
            var _local1:Object;
            if (inStage){
                _local1 = _ctrl.faction.rollCakeInfo;
                this._factionRollCake.getFactionRollCakeInfo = _local1;
            } else {
                loadAssets("FactionRollCake", this.render, FactionRollCakeViewLang.LoadAssets);
            };
        }
        private function rollCakeCallback():void{
            var _local1:Object = _ctrl.faction.RollCake;
            if (_local1.msg == Mod_Faction_Base.SUCCESS){
                this.faction_roll_cake_info();
                this._factionRollCake.getMainSzData(_local1, false);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_Faction_Base.NO_ENOUGH_TIMES:
                    _view.showTip(FactionRollCakeViewLang.NoEnoughTimes);
                    break;
                case Mod_Faction_Base.AWARDING_ROLL_CAKE:
                    _view.showTip(FactionRollCakeViewLang.AwardingRollCake);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function showRollCake():void{
            if (!FunctionType.isOpened(FunctionType.Faction)){
                return;
            };
            if (!_view.townMap.inStage){
                return;
            };
            var _local1:String = TownType.getSign(_ctrl.player.mapId);
            if (_local1 == TownType.JiHuiSuo){
                _view.townMap.getBuildTarget(3).visible = (ActivityType.FactionLevel >= 5);
                if (_view.factionWindow.inStage){
                    _view.factionWindow.close();
                };
                if (this._isIntoJiHuiSuo){
                    this.show();
                };
            };
            this._isIntoJiHuiSuo = false;
        }
        public function gotoJiHueiSuo():void{
            this._isIntoJiHuiSuo = true;
            var _local1:String = TownType.getSign(_ctrl.player.mapId);
            if (_local1 != TownType.JiHuiSuo){
                _view.townMap.gotoTownAtId(TownType.getId(TownType.JiHuiSuo));
            };
            if (_view.factionWindow.inStage){
                _view.factionWindow.close();
            };
        }
        private function render():void{
            this._factionRollCake = (_view.getAssetsObject("FactionRollCake", "FactionRollCake") as IFactionRollCake);
            _popup.addView(this, this._factionRollCake.content);
            this._factionRollCake.tip = _view.tip.iTip;
            this._factionRollCake.drag = _view.drag.iDrag;
            this._factionRollCake.onGetRoll = function ():void{
                roll_cake();
            };
            this._factionRollCake.onSound = function (_arg1:Sound):void{
                SoundManage.playGameSound(_arg1);
            };
            this._factionRollCake.onClose = function ():void{
                close();
            };
            this._factionRollCake.onTip = function (_arg1:String):void{
                switch (_arg1){
                    case "noCountNum":
                        _view.showTip(RollCakeViewLang.NoCountNum);
                        break;
                };
            };
            this._factionRollCake.onShowMouse = function (_arg1:Boolean):void{
                if (_arg1){
                    MouseCursor.hide();
                } else {
                    MouseCursor.show();
                };
            };
            this._factionRollCake.init();
            this.rollCakeInfoCallback();
            this.faction_roll_cake_remain_times();
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
                this._factionRollCake.reposition(_local2);
            };
        }
        public function close():void{
            _view.openEvent();
            MouseCursor.show();
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._factionRollCake.clear();
        }

    }
}//package com.views 

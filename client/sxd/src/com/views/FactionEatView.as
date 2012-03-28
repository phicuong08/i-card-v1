//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.interfaces.*;
    import com.haloer.data.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;

    public class FactionEatView extends Base {

        private var _txtUpTip:TextField;
        private var _txtDownTip:TextField;
        private var _txtLine:Sprite;
        private var _mcTip:MovieClip;
        private var _textFormat:TextFormat;
        private var _objCallEatInfo:Object;
        private var _objCallEatDetailedInfo:Object;

        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function get tip():ITip{
            return (this._view.tip.iTip);
        }
        public function callEat():void{
            var callBack:* = null;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    call_eat();
                };
            };
            this.dialog.yesLabel = FactionEatViewLang.DialogYes;
            this.dialog.noLabel = FactionEatViewLang.DialogNo;
            this.dialog.show(Lang.sprintf(FactionEatViewLang.CallEat, HtmlText.yellow(("900" + FactionEatViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.No), callBack);
        }
        public function gotoEat():void{
            if (this._view.missionPractice.inStageWithTip){
                return;
            };
            if (this._view.heroPractice.inStageWithTip){
                return;
            };
            if (TownType.getSign(this._ctrl.player.mapId) == TownType.JiHuiSuo){
                if (this._view.factionWindow.inStage){
                    this._view.factionWindow.close();
                };
                return;
            };
            _view.townMap.gotoTownAtId(TownType.getId(TownType.JiHuiSuo));
        }
        public function joinEat():void{
            if (this._ctrl.faction.isCanJoinActivity["result"] != Mod_Faction_Base.YES){
                return;
            };
            if ((((this._objCallEatDetailedInfo["is_join"] == Mod_Faction_Base.YES)) || ((this._objCallEatDetailedInfo["rem_time"] <= 0)))){
                this._view.showTip(this.message(Mod_Faction_Base.IS_EAT));
                return;
            };
            this._view.progressBar.showProgressBar(FactionEatViewLang.Eating, 6, this.join_eat);
        }
        public function checkFactionEat():void{
            var callBack:* = null;
            callBack = function ():void{
                _data.call(Mod_Faction_Base.is_can_join_activity, call_eat_detailed_info, []);
            };
            if (!FunctionType.isOpened(FunctionType.Faction)){
                return;
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionEat) > ActivityType.FactionLevel){
                return;
            };
            if (!this._view.townMap.inStage){
                return;
            };
            if (TownType.getSign(_ctrl.player.mapId) != TownType.JiHuiSuo){
                return;
            };
            setTimeout(callBack, 1000);
        }
        public function factionEatClickCallBack():void{
            var callBack:* = null;
            callBack = function ():void{
                if (_ctrl.faction.callEatInfo["rem_time"] <= 0){
                    _view.showTip(message(Mod_Faction_Base.TIME_UP));
                } else {
                    gotoEat();
                };
            };
            if (!FunctionType.isOpened(FunctionType.Faction)){
                return;
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionEat) > ActivityType.FactionLevel){
                return;
            };
            if (!this._view.townMap.inStage){
                return;
            };
            this._data.call(Mod_Faction_Base.call_eat_info, callBack, []);
        }
        public function closeEat():void{
            if (!FunctionType.isOpened(FunctionType.Faction)){
                return;
            };
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionEat) > ActivityType.FactionLevel){
                return;
            };
            if (TownType.getSign(this._ctrl.player.mapId) != TownType.JiHuiSuo){
                this._view.removeFromTimerProcessList(this.sign);
            };
        }
        private function timer():void{
            if (this._objCallEatDetailedInfo != null){
                if (this._objCallEatDetailedInfo["rem_time"] <= 0){
                    this._view.removeFromTimerProcessList(this.sign);
                    if (this._view.townMap.getBuildTarget(2) != null){
                        this._view.townMap.getBuildTarget(2).visible = false;
                        this._view.townMap.setBuildGetVisible(2, false);
                    };
                } else {
                    var _local1:Object = this._objCallEatDetailedInfo;
                    var _local2:String = "rem_time";
                    var _local3:Object = (_local1[_local2] - 1);
                    _local1[_local2] = _local3;
                    this.setTipString(this._objCallEatDetailedInfo);
                };
            };
            if (this._objCallEatInfo != null){
                if (this._objCallEatInfo["rem_time"] <= 0){
                    if (this._objCallEatDetailedInfo == null){
                        this._view.removeFromTimerProcessList(this.sign);
                    };
                } else {
                    _local1 = this._objCallEatInfo;
                    _local2 = "rem_time";
                    _local3 = (_local1[_local2] - 1);
                    _local1[_local2] = _local3;
                    this.updateFactionEatActivity(this._objCallEatInfo);
                };
            };
        }
        private function setTipString(_arg1:Object):void{
            if (this._ctrl.faction.isCanJoinActivity["result"] == Mod_Faction_Base.YES){
                this._txtUpTip.htmlText = ((((((HtmlText.format(FactionEatViewLang.FactionEat, HtmlText.Yellow, 16, null, true) + "\r") + FactionEatViewLang.Caller) + _arg1["nick_name"]) + "\r") + FactionEatViewLang.RemainingTime1) + DateTime.formatFromSecond(_arg1["rem_time"]));
                if (_arg1["is_join"] == Mod_Faction_Base.NO){
                    this._txtDownTip.htmlText = Lang.sprintf(FactionEatViewLang.EatGetInfo, HtmlText.yellow(("20" + FactionEatViewLang.Power)), HtmlText.yellow(("50" + FactionEatViewLang.Fame)));
                } else {
                    this._txtDownTip.htmlText = FactionEatViewLang.JoinFinish;
                };
                if (!this._mcTip.contains(this._txtLine)){
                    this._mcTip.addChild(this._txtLine);
                };
                if (!this._mcTip.contains(this._txtDownTip)){
                    this._mcTip.addChild(this._txtDownTip);
                };
            } else {
                this._txtUpTip.htmlText = FactionEatViewLang.NewMember;
                this._txtDownTip.htmlText = "";
                if (this._mcTip.contains(this._txtLine)){
                    this._mcTip.removeChild(this._txtLine);
                };
                if (this._mcTip.contains(this._txtDownTip)){
                    this._mcTip.removeChild(this._txtDownTip);
                };
            };
            this._txtUpTip.setTextFormat(this._textFormat);
            this._txtDownTip.setTextFormat(this._textFormat);
        }
        private function updateFactionEatActivity(_arg1:Object):void{
            var _local4:int;
            var _local5:int;
            var _local2:String = "";
            var _local3:String = "";
            var _local6:String = "";
            var _local7:Boolean;
            var _local8:int;
            if (_arg1["rem_time"] > 0){
                _local2 = (FactionEatViewLang.RemainingTime2 + DateTime.formatFromSecond(_arg1["rem_time"]));
                if (_arg1["is_join"] == Mod_Faction_Base.YES){
                    _local3 = FactionEatViewLang.Joined;
                    _local4 = 0;
                    _local5 = 0;
                    _local8 = 0;
                } else {
                    _local3 = FactionEatViewLang.Join;
                    _local4 = 1;
                    _local5 = 1;
                    _local8 = 1;
                };
            } else {
                _local2 = Lang.sprintf(FactionEatViewLang.CallTimes, _arg1["rem_count"]);
                if (_arg1["rem_count"] <= 0){
                    _local5 = 2;
                } else {
                    _local3 = FactionEatViewLang.Call;
                    _local4 = 2;
                    _local5 = 1;
                    _local6 = HtmlText.orange(FactionEatViewLang.CallEatIngot);
                    _local8 = 2;
                };
            };
            var _local9:Object = this._ctrl.faction.isCanJoinActivity;
            if (_local9["result"] == Mod_Faction_Base.YES){
                _local7 = false;
            } else {
                _local7 = true;
                _local6 = FactionEatViewLang.NewMember;
            };
            var _local10:Object = {
                sign:ActivityType.FactionEat,
                isStart:_local5,
                isShowTimer:false,
                explain:_local2,
                btnInfo:_local3,
                isShowBtnEffic:false,
                btnType:_local4,
                btnTipInfo:_local6,
                isFilter:_local7,
                state:_local8
            };
            this._view.factionWindow.getActivityState(_local10);
        }
        private function call_eat():void{
            this._data.call(Mod_Faction_Base.call_eat, this.callEatCallBack, []);
        }
        private function callEatCallBack():void{
            var callBack:* = null;
            callBack = function (_arg1:uint):void{
                gotoEat();
            };
            var obj:* = this._ctrl.faction.callEat;
            if (obj["result"] == Mod_Faction_Base.SUCCESS){
                this._view.activities.showWinEffect();
                this.call_eat_info();
                this.dialog.yesLabel = FactionEatViewLang.DialogYes;
                this.dialog.show(Lang.sprintf(FactionEatViewLang.CallEatInfo, HtmlText.yellow(("1000" + FactionEatViewLang.Fame))), AlertButtonType.Yes, callBack);
            } else {
                this._view.showTip(this.message(obj["result"]));
            };
        }
        private function join_eat():void{
            this._data.call(Mod_Faction_Base.join_eat, this.joinEatCallBack, []);
        }
        private function joinEatCallBack():void{
            var _local1:Object = this._ctrl.faction.joinEat;
            if (_local1["result"] == Mod_Faction_Base.SUCCESS){
                this.dialog.yesLabel = FactionEatViewLang.DialogYes;
                this.dialog.show(Lang.sprintf(FactionEatViewLang.JoinEatInfo, HtmlText.yellow(((("20" + FactionEatViewLang.Power) + "、50") + FactionEatViewLang.Fame))), AlertButtonType.Yes, null);
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
        }
        public function call_eat_info():void{
            if (ActivityType.getOpenLevelToSign(ActivityType.FactionEat) > ActivityType.FactionLevel){
                return;
            };
            this._data.call(Mod_Faction_Base.call_eat_info, this.callEatInfoCallBack, []);
        }
        private function callEatInfoCallBack():void{
            this._objCallEatInfo = this._ctrl.faction.callEatInfo;
            this.updateFactionEatActivity(this._objCallEatInfo);
            if (this._objCallEatInfo["rem_time"] > 0){
                this._view.addToTimerProcessList(this.sign, this.timer);
            };
        }
        private function call_eat_detailed_info():void{
            this._data.call(Mod_Faction_Base.call_eat_detailed_info, this.callEatDetailedInfoCallBack, []);
        }
        public function callEatDetailedInfoCallBack():void{
            this._objCallEatDetailedInfo = this._ctrl.faction.callEatDetailedInfo;
            if (this._objCallEatDetailedInfo["player_id"] == 0){
                return;
            };
            var _local1:int = TownType.getTownNPCIdByFunc(_ctrl.player.mapId, NPCType.FactionGodNPC);
            if (_local1 != 0){
                this._view.townMap.getBuildTarget(2).visible = true;
                this._view.townMap.setBuildGetVisible(2, (this._objCallEatDetailedInfo["is_join"] == Mod_Faction_Base.NO));
            };
            if (this._mcTip == null){
                this._txtUpTip = new TextField();
                this._txtUpTip.autoSize = TextFieldAutoSize.LEFT;
                this._txtUpTip.textColor = HtmlText.White;
                this._txtDownTip = new TextField();
                this._txtDownTip.autoSize = TextFieldAutoSize.LEFT;
                this._txtDownTip.textColor = HtmlText.White;
                this._txtDownTip.y = 73;
                this._textFormat = new TextFormat();
                this._textFormat.leading = 6;
                this._txtLine = new Sprite();
                this._txtLine.graphics.lineStyle(1, 0x3D3D3D, 1);
                this._txtLine.graphics.moveTo(2, 69);
                this._txtLine.graphics.lineTo(160, 69);
                this._mcTip = new MovieClip();
                this._mcTip.addChild(this._txtUpTip);
                this._mcTip.addChild(this._txtLine);
                this._mcTip.addChild(this._txtDownTip);
            };
            if (this._view.factionWindow.inStage){
                this.call_eat_info();
            };
            if (this._view.townMap.getBuildTarget(2) != null){
                this.tip.addTarget(this._view.townMap.getBuildTarget(2), this._mcTip);
            };
            this._view.addToTimerProcessList(this.sign, this.timer);
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Faction_Base.SUCCESS:
                    _local2 = FactionEatViewLang.Success;
                    break;
                case Mod_Faction_Base.INSUFFICIENT_INGOT:
                    _local2 = FactionEatViewLang.InsufficientIngot;
                    break;
                case Mod_Faction_Base.TODAY_IS_CALL:
                    _local2 = FactionEatViewLang.TodayIsCall;
                    break;
                case Mod_Faction_Base.IS_CALL:
                    _local2 = FactionEatViewLang.IsCall;
                    break;
                case Mod_Faction_Base.IS_EAT:
                    _local2 = FactionEatViewLang.IsEat;
                    break;
                case Mod_Faction_Base.TIME_UP:
                    _local2 = FactionEatViewLang.TimeUp;
                    break;
                case Mod_Faction_Base.NO_BANQUET:
                    _local2 = FactionEatViewLang.NoBanquet;
                    break;
                default:
                    _local2 = (FactionEatViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

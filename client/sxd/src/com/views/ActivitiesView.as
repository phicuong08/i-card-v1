//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.haloer.data.*;
    import com.haloer.net.*;
    import com.lang.client.com.views.*;
    import com.lang.client.com.views.activities.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import flash.text.*;
    import flash.utils.*;

    public class ActivitiesView extends Base implements IView {

        private var _activities:IActivities;
        private var _buttonEffect:Class;
        private var _buttonEffectCircle:Class;
        private var _runeNum:Number = 0;
        private var _giftMsg:String = "";
        private var _giftType:String = "";
        private var _activityVisible:Boolean = true;
        private var _addActivityList:Array;
        private var _addActivityEffaceList:Array;
        private var _activityFunctionList:Array;
        private var _removeActivityFunctionList:Array;
        private var _isOpen:Boolean = false;
        private var _isStartMultiMission:Boolean = false;
        private var _multiList:Array;
        private var _isRemainMission:Boolean = false;
        private var _isPlayMultiMission:Boolean = false;
        private var _multiMissionStartTimer:String = "";
        private var _multiMissionTimerList:Array;
        private var _lastMissionData:Object;
        private var _isMissionEnd:Boolean = false;
        private var _multiDownTimer:int = 0;
        private var _multiTimerList:Array;
        private var _lostTimerHoust:String = "";
        private var _multiTimer:int = 0;
        private var _winEffect:MovieClip;
        private var _winEffectLoading:Boolean = false;
        private var _objCampWarRobotStatus:Object;
        private var _objHeroesWarRobotStatus:Object;

        public function ActivitiesView(){
            this._addActivityList = [];
            this._addActivityEffaceList = [];
            this._activityFunctionList = [];
            this._multiMissionTimerList = [];
            this._objCampWarRobotStatus = {};
            this._objHeroesWarRobotStatus = {};
            super();
        }
        override public function get inStage():Boolean{
            return (!(!(this._activities)));
        }
        public function get buttonEffect():Class{
            return (this._buttonEffect);
        }
        public function buttonEffectObj():Sprite{
            return (new this._buttonEffect());
        }
        public function get buttonEffectCircle():Class{
            return (this._buttonEffectCircle);
        }
        public function show():void{
            this.activityVisible = true;
            var _local1:Array = [_view.getAssetsUrl("Activities"), (URI.addonsUrl + "button_effect.swf"), (URI.addonsUrl + "button_effect_circle.swf")];
            File.loadList(_local1, this.render);
        }
        private function render(_arg1:Array):void{
            var list:* = _arg1;
            this._activities = ((list[0] as File).getClassObject("Activities") as IActivities);
            this._buttonEffect = ((list[1] as File).getClassByName("ButtonEffect") as Class);
            this._buttonEffectCircle = ((list[2] as File).getClassByName("ButtonEffectCircle") as Class);
            _view.toolbar.content.addChild(this._activities.content);
            this._activities.diffTime = _ctrl.player.diffServerTime;
            this._activities.buttonEffect = this._buttonEffectCircle;
            this._activities.tip = _view.tip.iTip;
            this._activities.activityVisible = this._activityVisible;
            this._activities.onActivityStart = function (_arg1:Object):void{
                var _local2:Point = _arg1.mc.parent.localToGlobal(new Point(_arg1.mc.x, _arg1.mc.y));
                _arg1.point = _local2;
                onStartActivity(_arg1);
            };
            this._activities.onActivityTimerClick = this.onActivityTimerClick;
            this._activities.onMinute = this.minuteHandler;
            this._activities.functionOpenPlayEnd = function (_arg1:Object):void{
            };
            this.renderActivity();
            this.renderEffaceActivity();
            this._activities.activityRuneNum = this._runeNum;
            this.reposition(false);
        }
        public function set activityRuneNum(_arg1:Number):void{
            if (this._activities){
                this._activities.activityRuneNum = _arg1;
            } else {
                this._runeNum = _arg1;
            };
        }
        public function onStartActivity(_arg1:Object):void{
            var _local2:String = _arg1.type;
            switch (_local2){
                case TownType.MultiMission:
                    if (this.isStartMultiMission){
                        _data.cancelPatch(Mod_MultipleMission_Base.notify);
                        _view.multiMission.switchSelf();
                    } else {
                        _view.showTip(ActivitiesViewLang.MultiMissionNoOpen);
                    };
                    break;
                case FunctionType.DailyQuest:
                    _view.dailyQuest.switchSelf();
                    break;
                case FunctionType.WorshipMars:
                    _view.worshipMars.switchSelf();
                    break;
                case FunctionType.SealSoul:
                    _view.sealStone.getDayStone();
                    break;
                case FunctionType.Zodiac:
                    _view.zodiac.switchSelf();
                    break;
                case FunctionType.SuperSport:
                    _view.screen.stopPlayerRun();
                    if (FunctionType.isOpened(FunctionType.SuperSport)){
                        _view.superSport.show();
                    };
                    break;
                case TownType.PreventIndulge:
                    if (URI.preventUrl){
                        _view.preventIndulge.openPreventUrl(0);
                    } else {
                        _view.preventIndulge.switchSelf();
                    };
                    break;
                case TownType.OnlineGift:
                    this.player_get_online_gift();
                    break;
                case TownType.CampSalary:
                    this.getPlayerCampSalary();
                    break;
                case TownType.All:
                    _view.activityWindow.switchSelf();
                    break;
                case FunctionType.Rune:
                    _view.rune.switchSelf();
                    break;
                case ActivityType.FactionWarGift:
                    _view.factionTrophy.show();
                    break;
                case FunctionType.TakeBible:
                    if (FunctionType.isOpened(FunctionType.TakeBible)){
                        _view.takeBibleRoad.switchSelf();
                    } else {
                        _view.showTip(ActivitiesViewLang.TakeBibleRoadNoOpen);
                    };
                    break;
                case ActivityType.FactionAll:
                    _view.factionWindow.switchSelf();
                    break;
                case FunctionType.Tower:
                    _view.tower.switchSelf();
                    break;
                case FunctionType.RollCake:
                    _view.rollCake.switchSelf();
                    break;
                case FunctionType.GetPeach:
                    _view.getPeach.switchSelf();
                    break;
                case ActivityType.RedEnvelopes:
                    _view.redEnvelopes.switchSelf();
                    break;
                case FunctionType.StudyStunt:
                    _view.studyStunt.switchSelf();
                    break;
                case ActivityType.ServerWar:
                    switch (_ctrl.serverWar.info.serverState){
                        case Mod_ServerWar_Base.SERVER_WAR_PREPARE:
                        case Mod_ServerWar_Base.SERVER_WAR_APPLY:
                        case Mod_ServerWar_Base.SERVER_WAR_APPLY_COMPLETE:
                            _view.serverWarSignUp.switchSelf();
                            break;
                        case Mod_ServerWar_Base.SERVER_WAR_TIANBANG:
                        case Mod_ServerWar_Base.SERVER_WAR_DIBANG:
                            _view.serverWarRecord.switchSelf();
                            break;
                        default:
                            _view.serverWarCup.show();
                    };
                    break;
                case FunctionType.PetAnimal:
                    _view.pet.show();
                    break;
                case FunctionType.Farm:
                    _view.farm.switchSelf();
                    break;
                case ActivityType.ActivityAward:
                case ActivityType.ActivityFunction:
                    this._view.activitiesShow.openFunctionPanel(_arg1.point, _local2);
                    this._view.activitiesShow.show();
                    break;
                case FunctionType.HeroMission:
                    this._view.heroMission.switchSelf();
                    break;
                case ActivityType.GameHelper:
                    this._view.gameHelper.switchSelf();
                    break;
                default:
                    if (_local2.indexOf(ActivityType.GiftStr) == 0){
                        this.removeActivity(_local2);
                        this.getSuperGift(_local2);
                    };
            };
        }
        private function minuteHandler(_arg1:String, _arg2:Number):void{
            switch (_arg1){
                case FunctionType.TakeBible:
                    break;
            };
        }
        private function getSuperGift(_arg1:String):void{
            var _local2:Object = _ctrl.notify.giftList[_arg1];
            this._giftMsg = _local2.message;
            this._giftType = _arg1;
            _data.call(Mod_Item_Base.player_get_super_gift, this.player_get_super_gift_back, [_local2.player_gift_id]);
        }
        private function player_get_super_gift_back():void{
            _data.call(Mod_Notify_Base.update_player_super_gift, null, []);
            if (_ctrl.item.result == Mod_Item_Base.PACK_FULL){
                _view.showTip(ActivitiesViewLang.PackFull);
            } else {
                this.showWinEffect();
                _view.pack.updateGrids();
                if (this._giftType == ActivityType.Gift1){
                    _view.alert.confirm(this._giftMsg, function (_arg1:int):void{
                        _view.vip.sendIngotReceiveShowVip();
                    });
                } else {
                    _view.alert.confirm(this._giftMsg, null);
                };
            };
        }
        private function onActivityTimerClick(_arg1:String):void{
            if (TownType.OnlineGift == _arg1){
                this.player_get_online_gift();
            };
        }
        public function showActivityTitle(_arg1:String, _arg2:String="", _arg3:int=0):void{
            var _local4:Object = {
                timer:_arg3,
                showBtn:true,
                startTimerColor:0xFFFFFF,
                endTimerColor:0xFFFFFF,
                endTimerStr:_arg2,
                sendType:_arg1
            };
            this.activityTimer(_arg1, _local4);
        }
        public function reposition(_arg1:Boolean=true):void{
            if (this.inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._activities.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }
        public function addActivity(_arg1:String):void{
            var _local2:Boolean = this.functionBoxCheck(_arg1);
            if (_local2){
                return;
            };
            this.pushActivity(_arg1);
        }
        public function playOpenFunctionMc():void{
            if (((this._activities) && (this._isOpen))){
                this._activities.autoActivityClick(ActivityType.ActivityFunction);
                this._isOpen = false;
                return;
            };
            if ((((((FunctionType.isOpened(FunctionType.Achievement) == false)) || ((this._removeActivityFunctionList == null)))) || ((this._removeActivityFunctionList.length <= 0)))){
                return;
            };
            this._removeActivityFunctionList = [FunctionType.Farm, FunctionType.SuperSport, FunctionType.DailyQuest];
            this._activities.playOpenFunctionMc(this._removeActivityFunctionList);
            this._removeActivityFunctionList = [];
        }
        private function functionBoxCheck(_arg1:String):Boolean{
            var _local6:int;
            var _local7:int;
            var _local8:String;
            var _local9:Boolean;
            var _local10:int;
            var _local11:String;
            var _local2:Boolean;
            var _local3:Boolean = ActivityType.checkIsActivityBoxForSign(_arg1);
            var _local4:Object = ActivityType.getActivityDataForSign(_arg1);
            var _local5:Object = FunctionType.isOpened(FunctionType.FunctionHall);
            if (_local3){
                if (_local4.type == ActivityType.ActivityFunction){
                    return (false);
                };
                this._view.activitiesShow.addActivity(_arg1, true);
                _local2 = true;
            };
            return (_local2);
        }
        private function pushActivity(_arg1:String):void{
            var _local2:Object;
            if (this.inStage){
                this._activities.addActivity(_arg1);
            } else {
                _local2 = {};
                _local2.action = "add";
                _local2.type = _arg1;
                this._addActivityList.push(_local2);
            };
        }
        public function removeActivity(_arg1:String):void{
            var _local2:Boolean = ActivityType.checkIsActivityBoxForSign(_arg1);
            var _local3:Object = ActivityType.getActivityDataForSign(_arg1);
            var _local4:String = _local3.type;
            var _local5:Object = FunctionType.isOpened(FunctionType.FunctionHall);
            if (((((_local5) && ((_local2 == true)))) || ((_local4 == ActivityType.ActivityAward)))){
                this._view.activitiesShow.addActivity(_arg1, false);
                return;
            };
            this.splitActivity(_arg1);
        }
        private function splitActivity(_arg1:String):void{
            var _local2:Object;
            if (this._activities != null){
                this._activities.removeActivity(_arg1);
            } else {
                _local2 = {};
                _local2.action = "remove";
                _local2.type = _arg1;
                this._addActivityList.push(_local2);
            };
        }
        public function activityTimer(_arg1:String, _arg2:Object):void{
            var _local3:Object;
            if (this.inStage){
                this._activities.activityTimer(_arg1, _arg2);
            } else {
                _local3 = {};
                _local3.action = "time";
                _local3.type = _arg1;
                _local3.data = _arg2;
                this._addActivityEffaceList.push(_local3);
            };
        }
        public function hideActivityTimer(_arg1:String, _arg2:String):void{
            var _local3:Object;
            if (this.inStage){
                this._activities.hideActivityTimer(_arg1, _arg2);
            } else {
                _local3 = {};
                _local3.action = "hidTime";
                _local3.type = _arg1;
                _local3.name = _arg2;
                this._addActivityEffaceList.push(_local3);
            };
        }
        public function activityTip(_arg1:String, _arg2:String):void{
            var _local3:Object;
            if (this.inStage){
                this._activities.activityTip(_arg1, _arg2);
            } else {
                _local3 = {};
                _local3.action = "tip";
                _local3.type = _arg1;
                _local3.info = _arg2;
                this._addActivityEffaceList.push(_local3);
            };
        }
        public function visibleBtnEffect(_arg1:String, _arg2:String, _arg3:Boolean):void{
            var _local4:Object;
            if (this.inStage == false){
                _local4 = {};
                _local4.action = "visibleBtnEffect";
                _local4.type = _arg1;
                _local4.sign = _arg2;
                _local4.bool = _arg3;
                this._addActivityEffaceList.push(_local4);
                return;
            };
            this._activities.visibleBtnEffect(_arg1, _arg2, _arg3);
        }
        private function renderActivity():void{
            var _local3:Object;
            var _local1:int = this._addActivityList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._addActivityList[_local2];
                switch (_local3.action){
                    case "add":
                        this._activities.addActivity(_local3.type);
                        break;
                    case "remove":
                        this._activities.removeActivity(_local3.type);
                        break;
                };
                _local2++;
            };
        }
        private function renderEffaceActivity():void{
            var _local3:Object;
            var _local1:int = this._addActivityEffaceList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._addActivityEffaceList[_local2];
                switch (_local3.action){
                    case "time":
                        this._activities.activityTimer(_local3.type, _local3.data);
                        break;
                    case "hidTime":
                        this._activities.hideActivityTimer(_local3.type, _local3.name);
                        break;
                    case "tip":
                        this._activities.activityTip(_local3.type, _local3.info);
                        break;
                    case "visibleBtnEffect":
                        this._activities.visibleBtnEffect(_local3.type, _local3.sign, _local3.bool);
                        break;
                };
                _local2++;
            };
        }
        public function set activityVisible(_arg1:Boolean):void{
            if (this.inStage){
                this._activities.activityVisible = _arg1;
            };
            this._activityVisible = _arg1;
        }
        public function getActivityPoint(_arg1:String):Point{
            var _local2:Point = new Point(0, 0);
            if (this.inStage){
                _local2 = this._activities.getActivityPoint(_arg1);
                _local2 = this._activities.content.localToGlobal(new Point(_local2.x, _local2.y));
            };
            return (_local2);
        }
        public function isLoaderActivitie(_arg1:String):Boolean{
            if (this.inStage == false){
                return (false);
            };
            return (this._activities.isLoaderActivitie(_arg1));
        }
        public function clear():void{
        }
        public function close():void{
        }
        public function activityInfo():void{
            this.preventIndulge();
            this.serverInit();
            this._view.toolbar.update_player_super_gift_back();
        }
        public function openActivity(_arg1:String):void{
            switch (_arg1){
                case TownType.MultiMission:
                    this.multiMissionActivity();
                    break;
                case FunctionType.DailyQuest:
                    this._view.dailyQuest.finish_all_day_quest();
                    break;
                case TownType.Sport:
                    this.addActivity(_arg1);
                    break;
                case TownType.PreventIndulge:
                    this.addActivity(_arg1);
                    break;
                case TownType.OnlineGift:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.CampWar:
                    this.heroesWarActivity();
                    break;
                case TownType.SendIngot:
                    this.addActivity(_arg1);
                    break;
                case TownType.CampSalary:
                    this.addActivity(_arg1);
                    break;
                case TownType.All:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.Rune:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.SuperSport:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.TakeBible:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.RollCake:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.GetPeach:
                    this.addActivity(_arg1);
                    break;
                case ActivityType.RedEnvelopes:
                    this.addActivity(_arg1);
                    break;
                case ActivityType.FactionAll:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.WorshipMars:
                    this._view.worshipMars.getRemainIncenseTimes();
                    break;
                case FunctionType.Zodiac:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.PetAnimal:
                    this.addActivity(_arg1);
                    break;
                case FunctionType.StudyStunt:
                    this.addActivity(_arg1);
                    break;
            };
        }
        public function get isStartMultiMission():Boolean{
            return (this._isStartMultiMission);
        }
        public function multiMissionActivity():void{
            _data.patch(Mod_MultipleMission_Base.notify, this.notifyCallBack);
            this.refreshMissionStatus();
            _data.call(Mod_MultipleMission_Base.get_multiple_mission_status, this.getStatusCallback, []);
        }
        public function refreshMissionStatus():void{
            _data.call(Mod_MultipleMission_Base.check_is_can_challenge, this.isCanChallengeCallback, []);
        }
        public function stopMultiMission():void{
            _view.multiMission.close();
            this.endMultiMission();
            _data.patch(Mod_MultipleMission_Base.notify, this.notifyCallBack);
            _view.alert.confirm(multiMissionLang.MissionClose);
        }
        private function isCanChallengeCallback():void{
            var _local1:Object = _ctrl.multiMission.checkIsCanChallenge;
            this._isRemainMission = !((_local1.isCanChallenge == 0));
        }
        private function notifyCallBack():void{
            var _local1:Object = _ctrl.multiMission.notify;
            if (_local1[Mod_MultipleMission_Base.START_MULTIPLE_MISSION]){
                _view.worldNotice.showMessage(multiMissionLang.MissionStart);
                this.startMultiMission();
                _ctrl.multiMission.removeNotify(Mod_MultipleMission_Base.START_MULTIPLE_MISSION);
            };
            if (_local1[Mod_MultipleMission_Base.STOP_MULTIPLE_MISSION]){
                this.endMultiMission();
                _ctrl.multiMission.removeNotify(Mod_MultipleMission_Base.STOP_MULTIPLE_MISSION);
            };
            if (_local1[Mod_MultipleMission_Base.HAVE_WAR_RESULT]){
                _ctrl.multiMission.removeNotify(Mod_MultipleMission_Base.HAVE_WAR_RESULT);
                _view.toolbar.renderMultMissionLink("");
                _view.multiMission.isAutoStart = false;
                _view.multiMission.isMinimum = false;
                _view.multiWar.show();
            };
        }
        private function getStatusCallback():void{
            var _local1:Object = _ctrl.multiMission.status;
            this._multiList = _local1.timer;
            _view.addToTimerProcessList(sign, this.multiMissionRadio);
            this._isStartMultiMission = this.multiMissionTimer(_local1.timer);
            if ((((_local1.status == 0)) || ((this._isStartMultiMission == false)))){
                this.endMultiMission();
            } else {
                this.startMultiMission();
            };
        }
        private function multiMissionRadio():void{
            var _local4:int;
            var _local5:String;
            var _local1:int = _view.ctrl.player.serverTime;
            var _local2:int = this._multiList.length;
            var _local3:int;
            while (_local3 < _local2) {
                if ((((((_local1 >= (this._multiList[_local3].startTime - 600))) && ((this._multiList[_local3].startTime > _local1)))) && ((this._isPlayMultiMission == false)))){
                    _local4 = ((this._multiList[_local3].startTime - _local1) / 60);
                    if (_local4 <= 0){
                        _view.worldNotice.showMessage(multiMissionLang.RightOff);
                        _local5 = ((((("<font color=\"#fff200\">[" + multiMissionLang.Tg) + "]</font>") + "<font color=\"#fff200\">") + multiMissionLang.RightOff) + "</font>");
                    } else {
                        _view.worldNotice.showMessage(Lang.sprintf(multiMissionLang.NextTimeStart, _local4));
                        _local5 = ((((("<font color=\"#fff200\">[" + multiMissionLang.Tg) + "]</font>") + "<font color=\"#fff200\">") + Lang.sprintf(multiMissionLang.NextTimeStart, _local4)) + "</font>");
                    };
                    this._isPlayMultiMission = true;
                    return;
                };
                _local3++;
            };
            this.multiMissionTimer(this._multiTimerList);
        }
        private function startMultiMission():void{
            this._isStartMultiMission = true;
            this.multiMisstionTimerList(this._multiList);
            if (this._lastMissionData){
                this.multiMissionStartTimer(this._lastMissionData);
            };
        }
        private function multiMissionStartTimer(_arg1:Object):void{
            _view.multiMission.systemTimerInfo = "";
            this._multiMissionStartTimer = _arg1.timerStr;
            var _local2:int;
            if (this._isStartMultiMission){
                _local2 = 1;
            } else {
                if (this._isMissionEnd){
                    _local2 = 2;
                } else {
                    _local2 = 0;
                };
            };
            this.activityShowMultiMission(_local2, _arg1);
        }
        private function activityShowMultiMission(_arg1:int, _arg2:Object):void{
            var _local3:Object = {
                sign:FunctionType.MultiMission,
                isStart:_arg1,
                level:"",
                isShowTimer:this._isRemainMission,
                isTimerChange:true,
                startTime:_arg2.startTime,
                endTime:_arg2.endTime
            };
            _view.activityWindow.getActivityState(_local3, (_local3.isStart == 1));
        }
        private function endMultiMission():void{
            this._isPlayMultiMission = false;
            this._isStartMultiMission = false;
            this.multiMisstionTimerList(this._multiList);
            if (this._lastMissionData){
                this.multiMissionStartTimer(this._lastMissionData);
            };
        }
        public function refreshMultiMission():void{
            if (this._lastMissionData){
                this.multiMissionStartTimer(this._lastMissionData);
            };
        }
        private function multiMisstionTimerList(_arg1:Array):void{
            var _local6:Object;
            var _local7:String;
            var _local8:Object;
            var _local9:Object;
            if (_arg1 == null){
                return;
            };
            this._multiTimerList = _arg1;
            this._lastMissionData = {};
            var _local2:int = _arg1.length;
            var _local3:int = _view.ctrl.player.serverTime;
            var _local4:Boolean;
            var _local5:int;
            while (_local5 < _local2) {
                _local6 = _arg1[_local5];
                _local7 = "";
                _local8 = TimeChange.timeFormat(_local6);
                _local9 = {};
                _local9.startTime = _local6.startTime;
                _local9.endTime = _local6.endTime;
                _local9.timer = _local8.time;
                this._multiMissionTimerList.push(_local9);
                if ((((_local6.endTime > _local3)) && ((_local4 == false)))){
                    this._lastMissionData = _local9;
                    this._isMissionEnd = false;
                    _local4 = true;
                };
                _local5++;
            };
            if ((((_local4 == false)) && ((this._multiMissionTimerList.length > 0)))){
                this._lastMissionData = this._multiMissionTimerList[0];
                this._isMissionEnd = true;
            };
        }
        private function multiMissionTimer(_arg1:Array):Boolean{
            var _local5:Object;
            var _local2:int = _arg1.length;
            var _local3:int = _ctrl.player.serverTime;
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = _arg1[_local4];
                if ((((_local5.startTime < _local3)) && ((_local3 < _local5.endTime)))){
                    this._multiDownTimer = (_local5.endTime - _local3);
                    return (true);
                };
                _local4++;
            };
            return (false);
        }
        public function onlineGiftActivity():void{
            var _local1:int;
            if (_ctrl.player.isGetOnlineGift == 0){
                this.openActivity(TownType.OnlineGift);
                _local1 = _ctrl.player.onlineGiftTime;
                this.showActivityTitle(TownType.OnlineGift, onlineGiftLang.ImmeGet, _local1);
                this.get_player_current_online_gift();
            } else {
                if (_ctrl.player.isGetOnlineGift == 1){
                    this.openActivity(TownType.OnlineGift);
                    this.showActivityTitle(TownType.OnlineGift, onlineGiftLang.ImmeGet, 0);
                    this.get_player_current_online_gift();
                } else {
                    if (_ctrl.player.isGetOnlineGift == -1){
                        this.removeActivity(TownType.OnlineGift);
                    };
                };
            };
        }
        private function player_get_online_gift():void{
            this._data.call(Mod_Player_Base.player_get_online_gift, this.getOnlineGiftCallBack, []);
        }
        private function getOnlineGiftCallBack():void{
            var _local2:String;
            var _local3:Object;
            var _local4:int;
            var _local1:Object = this._ctrl.player.onlineGift;
            switch (_local1["result"]){
                case Mod_Player_Base.ACTION_FAILED:
                    this._view.showTip(onlineGiftLang.NotToTime, onlineGiftLang.WaitGet);
                    break;
                case Mod_Player_Base.PACK_FULL:
                    this._view.showTip("", onlineGiftLang.NoBagGrid);
                    break;
                case Mod_Player_Base.ACTION_SUCCESS:
                    _local2 = "";
                    for each (_local3 in _local1["online_gift_list"]) {
                        if (_local2 != ""){
                            _local2 = (_local2 + HtmlText.white(onlineGiftLang.Comma));
                        };
                        _local2 = (_local2 + this.itemMessage(_local3));
                    };
                    if (_local1["next_time_stamp"] != 0){
                        _local4 = _local1["next_time_stamp"];
                        _local2 = (_local2 + HtmlText.white(Lang.sprintf(onlineGiftLang.Next, HtmlText.yellow(DateTime.formatFromSecond1(_local4)))));
                        this.showActivityTitle(TownType.OnlineGift, onlineGiftLang.ImmeGet, _local4);
                    } else {
                        this.removeActivity(TownType.OnlineGift);
                    };
                    _local2 = (HtmlText.white(onlineGiftLang.Get) + _local2);
                    _view.alert.confirm(_local2);
                    _view.chat.addSystemMessage(_local2);
                    this.showWinEffect();
                    this.get_player_current_online_gift();
                    break;
            };
        }
        private function get_player_current_online_gift():void{
            this._data.call(Mod_Player_Base.get_player_current_online_gift, this.getPlayerCurrentOnlineGiftCallBack, []);
        }
        private function getPlayerCurrentOnlineGiftCallBack():void{
            var _local2:String;
            var _local3:Object;
            var _local1:Object = this._ctrl.player.nextOnlineGift;
            if (_local1["time_stamp"] != 0){
                _local2 = htmlFormat((onlineGiftLang.NextGet + "\r"), 14, 0xFFFFFF, true);
                for each (_local3 in _local1["online_gift_list"]) {
                    _local2 = (_local2 + this.tipMessage(_local3));
                };
                this.activityTip(TownType.OnlineGift, _local2);
            };
        }
        private function tipMessage(_arg1:Object):String{
            var _local3:String;
            var _local4:Object;
            var _local5:uint;
            var _local2:int = _arg1["type"];
            switch (_local2){
                case 0:
                    _local3 = onlineGiftLang.Coin;
                    break;
                case 1:
                    _local3 = onlineGiftLang.Ingot;
                    break;
                case 2:
                    _local3 = onlineGiftLang.Power1;
                    break;
                case 3:
                    _local3 = onlineGiftLang.Skill;
                    break;
                case 4:
                    _local3 = onlineGiftLang.Exp;
                    break;
                case 5:
                    _local4 = _arg1["item_info"];
                    if (ItemType.isEquip(_local4["type_id"])){
                        _local5 = _local4["color"];
                        _local3 = (HtmlText.white(onlineGiftLang.Equip) + htmlFormat((_local4["name"] + "\r"), 12, _local5));
                    } else {
                        _local3 = HtmlText.white((Lang.sprintf(onlineGiftLang.Item, (_local4["name"] + _arg1["value"])) + "\r"));
                    };
                    break;
            };
            if (_local2 != 5){
                _local3 = htmlFormat((((_local3 + " ") + _arg1["value"]) + "\r"), 12, 0xFFFFFF);
            };
            return (_local3);
        }
        private function itemMessage(_arg1:Object):String{
            var _local3:Object;
            var _local2:String = "";
            switch (_arg1["type"]){
                case 0:
                    _local2 = HtmlText.yellow((_arg1["value"] + onlineGiftLang.Coin));
                    break;
                case 1:
                    _local2 = HtmlText.yellow((_arg1["value"] + onlineGiftLang.Ingot));
                    break;
                case 2:
                    _local2 = HtmlText.yellow((_arg1["value"] + onlineGiftLang.Power2));
                    break;
                case 3:
                    _local2 = HtmlText.yellow((_arg1["value"] + onlineGiftLang.Skill));
                    break;
                case 4:
                    _local2 = HtmlText.yellow((_arg1["value"] + onlineGiftLang.Exp));
                    break;
                case 5:
                    _local3 = _arg1["item_info"];
                    if (ItemType.isEquip(_local3["type_id"])){
                        _local2 = htmlFormat(_local3["name"], 12, _local3["color"]);
                        _view.toolbar.playGoodsEffect(_local3["id"]);
                    } else {
                        _local2 = HtmlText.yellow(((_arg1["value"] + onlineGiftLang.Quantifier) + _local3["name"]));
                    };
                    break;
            };
            return (_local2);
        }
        public function showWinEffect():void{
            var file:* = null;
            var show:* = function (_arg1:File):void{
                var handler:* = null;
                var file:* = _arg1;
                if (file != null){
                    _winEffect = (file.getClassObject("WinEffect") as MovieClip);
                    _winEffect.mouseChildren = false;
                    _winEffect.mouseEnabled = false;
                    handler = function (_arg1:Event):void{
                        if (_winEffect.parent){
                            _winEffect.parent.removeChild(_winEffect);
                        };
                    };
                    _winEffect.addEventListener("finish", handler);
                };
                _view.stage.addChild(_winEffect);
                _winEffect.x = (_view.stage.stageWidth / 2);
                _winEffect.y = (_view.stage.stageHeight / 2);
                _winEffect.gotoAndPlay(1);
            };
            if ((((this._winEffect == null)) && ((this._winEffectLoading == false)))){
                this._winEffectLoading = true;
                file = new File();
                file.onComplete = function ():void{
                    show(this);
                };
                file.load((URI.addonsUrl + "win_effect.swf"));
            } else {
                if (this._winEffect){
                    show(null);
                };
            };
        }
        private function campWarActivity():void{
            this.get_robot_status();
            this._data.call(Mod_CampWar_Base.get_camp_open_time, this.getCampOpenTimeCallBack, []);
        }
        private function getCampOpenTimeCallBack():void{
            var _local1:int = _ctrl.campWar.getIsOpenCampWar();
            var _local2:Object = _ctrl.campWar.getCurrentCampOpenTime();
            if (_local1 == 1){
                _view.campWar.getBuff();
            };
            this.activityShowCampWar(_local1, _local2["start_time"], _local2["end_time"]);
        }
        public function activityShowCampWar(_arg1:int, _arg2:int, _arg3:int):void{
            _view.activityWindow.deleteActivity(ActivityType.HeroesWar);
            var _local4:Boolean = (this._objCampWarRobotStatus["result"] == Mod_CampWar_Base.ON);
            var _local5:int = this._objCampWarRobotStatus["last_award_coin"];
            var _local6:int = this._objCampWarRobotStatus["last_award_fame"];
            var _local7:String = Lang.sprintf(campWarLang.OfflineJoin, HtmlText.yellow(campWarLang.Ingot));
            if (((!((_local5 == 0))) || (!((_local6 == 0))))){
                _local7 = (_local7 + ("\r" + Lang.sprintf(campWarLang.ReplaceGet, HtmlText.yellow((_local5 + campWarLang.Coin)), HtmlText.yellow((_local6 + campWarLang.Fame)))));
            };
            var _local8:Object = {
                sign:FunctionType.CampWar,
                isStart:_arg1,
                level:"",
                isTimerChange:true,
                isShowTimer:true,
                startTime:(_arg2 + _ctrl.player.serverTime),
                endTime:(_arg3 + _ctrl.player.serverTime),
                isShowCheckBtn:((((VIPType.check(VIPType.Level5)) && (FunctionType.isOpened(FunctionType.Robot)))) && (!((_arg1 == 1)))),
                isCheck:_local4,
                checkFile:campWarLang.ReplaceDoll,
                btnInfo:((((_arg1 == 1)) && (_local4))) ? HtmlText.yellow(campWarLang.InJoining) : campWarLang.Join,
                btnType:1,
                checkTipInfo:_local7
            };
            _view.activityWindow.getActivityState(_local8, (((_arg1 == 1)) && (!(_local4))));
        }
        public function refreshCampWarState():void{
            if (FunctionType.isOpened(FunctionType.CampWar)){
                this.get_robot_status();
                setTimeout(_view.campWar.get_camp_open_time, 500);
            };
        }
        public function get_robot_status():void{
            this._data.call(Mod_CampWar_Base.get_robot_status, this.getRobotStatusCallBack, []);
        }
        private function getRobotStatusCallBack():void{
            this._objCampWarRobotStatus = this._ctrl.campWar.getRobotStatus();
            this.getCampOpenTimeCallBack();
        }
        private function heroesWarActivity():void{
            this.get_robot_status_heroes();
            this._data.call(Mod_HeroesWar_Base.get_heroes_open_time, this.getHeroesOpenTimeCallBack, []);
        }
        private function getHeroesOpenTimeCallBack():void{
            var _local1:int = _ctrl.heroesWar.getIsOpenHeroesWar();
            var _local2:Object = _ctrl.heroesWar.getCurrentHeroesOpenTime();
            if (_local1 == 1){
                _view.heroesWar.getBuff();
            };
            this.activityShowHeroesWar(_local1, _local2["start_time"], _local2["end_time"]);
        }
        public function activityShowHeroesWar(_arg1:int, _arg2:int, _arg3:int):void{
            _view.activityWindow.deleteActivity(FunctionType.CampWar);
            var _local4:Boolean = (this._objHeroesWarRobotStatus["result"] == Mod_HeroesWar_Base.ON);
            var _local5:int = this._objHeroesWarRobotStatus["last_award_coin"];
            var _local6:int = this._objHeroesWarRobotStatus["last_award_fame"];
            var _local7:String = Lang.sprintf(heroesWarLang.OfflineJoin, HtmlText.yellow(heroesWarLang.Ingot));
            if (((!((_local5 == 0))) || (!((_local6 == 0))))){
                _local7 = (_local7 + ("\r" + Lang.sprintf(heroesWarLang.ReplaceGet, HtmlText.yellow((_local5 + heroesWarLang.Coin)), HtmlText.yellow((_local6 + heroesWarLang.Fame)))));
            };
            var _local8:Object = {
                sign:ActivityType.HeroesWar,
                isStart:_arg1,
                level:"",
                isTimerChange:true,
                isShowTimer:true,
                startTime:(_arg2 + _ctrl.player.serverTime),
                endTime:(_arg3 + _ctrl.player.serverTime),
                isShowCheckBtn:((((VIPType.check(VIPType.Level5)) && (FunctionType.isOpened(FunctionType.Robot)))) && (!((_arg1 == 1)))),
                isCheck:_local4,
                checkFile:heroesWarLang.ReplaceDoll,
                btnInfo:((((_arg1 == 1)) && (_local4))) ? HtmlText.yellow(heroesWarLang.InJoining) : heroesWarLang.Join,
                btnType:1,
                checkTipInfo:_local7
            };
            _view.activityWindow.getActivityState(_local8, (((_arg1 == 1)) && (!(_local4))));
        }
        public function refreshHeroesWarState():void{
            if (FunctionType.isOpened(FunctionType.CampWar)){
                this.get_robot_status_heroes();
                setTimeout(_view.heroesWar.get_heroes_open_time, 500);
            };
        }
        public function get_robot_status_heroes():void{
            this._data.call(Mod_HeroesWar_Base.get_robot_status, this.getRobotStatusHeroesCallBack, []);
        }
        private function getRobotStatusHeroesCallBack():void{
            this._objHeroesWarRobotStatus = this._ctrl.heroesWar.getRobotStatus();
            this.getHeroesOpenTimeCallBack();
        }
        public function preventIndulge():void{
            var cookie:* = new Cookie("PreventIndulge");
            var intLastTime:* = (cookie.getCookie("MustExit") as int);
            if ((((intLastTime > 0)) && (((this._ctrl.player.serverTime - intLastTime) < 18000)))){
                var callBack:* = function ():void{
                    var _local1:Sprite = new Sprite();
                    _local1.graphics.beginFill(0);
                    _local1.graphics.drawRect(0, 0, _view.stage.width, _view.stage.height);
                    _local1.graphics.endFill();
                    var _local2:TextField = new TextField();
                    _local2.autoSize = TextFieldAutoSize.LEFT;
                    _local2.htmlText = HtmlText.format(preventIndulgeLang.MustRest, HtmlText.White, 18, "", true);
                    _local2.x = ((_view.toolbar.width - _local2.width) / 2);
                    _local2.y = (((_view.toolbar.height - _local2.height) / 2) - 25);
                    _local1.addChild(_local2);
                    _popup.addChild(_local1);
                    _view.closeEvent();
                    _view.screen.stopPlayerRun();
                };
                this._view.alert.confirm(preventIndulgeLang.MustExit, callBack);
                return;
            };
            if (URI.nonKid == false){
                this.against_wallows_info();
            };
        }
        private function against_wallows_info():void{
            _data.call(Mod_Player_Base.against_wallows_info, this.againstWallowsInfoCallBack, []);
        }
        private function againstWallowsInfoCallBack():void{
            var callback:* = null;
            if (_ctrl.player.againstWallowsInfo == Mod_Player_Base.AGAINST_WALLOWS){
                callback = function (_arg1:uint):void{
                    _view.closeEvent();
                    _view.preventIndulge.blackScreen = true;
                    _view.preventIndulge.switchSelf();
                };
                _view.alert.confirm(preventIndulgeLang.FiveHours, (URI.preventUrl) ? _view.preventIndulge.openPreventUrl : callback);
            };
            if (_ctrl.player.isMinorAccount == Mod_Player_Base.YES){
                this.patchAgainstWallowsNotify();
                this.openActivity(TownType.PreventIndulge);
            };
        }
        public function patchAgainstWallowsNotify():void{
            this.against_wallows_notify();
        }
        private function against_wallows_notify():void{
            this._data.patch(Mod_Player_Base.against_wallows_notify, this.againstWallowsNotifyCallBack);
        }
        private function againstWallowsNotifyCallBack():void{
            var _local1:Cookie;
            switch (_ctrl.player.againstWallowsNotify){
                case Mod_Player_Base.ONE_WARNING:
                    _view.alert.confirm(preventIndulgeLang.OneHours);
                    setTimeout(_view.alert.hide, 60000);
                    break;
                case Mod_Player_Base.TWO_WARNING:
                    _view.alert.confirm(preventIndulgeLang.TwoHours);
                    setTimeout(_view.alert.hide, 60000);
                    break;
                case Mod_Player_Base.WARNING:
                    _view.alert.confirm(preventIndulgeLang.FiveMinutes);
                    break;
                case Mod_Player_Base.TIMEUP:
                    _view.closeEvent();
                    _view.screen.stopPlayerRun();
                    if (_view.preventIndulge.inStage){
                        this._popup.closeView(_view.preventIndulge);
                    };
                    _view.preventIndulge.blackScreen = true;
                    _view.preventIndulge.switchSelf();
                    _local1 = new Cookie("PreventIndulge");
                    _local1.setCookie("MustExit", this._ctrl.player.serverTime);
                    break;
            };
        }
        public function removePreventIndulge():void{
            this.removeActivity(TownType.PreventIndulge);
        }
        public function preventIndulgeClose():void{
            if (_ctrl.player.againstWallowsNotify == Mod_Player_Base.TIMEUP){
                _view.alert.confirm(preventIndulgeLang.MustExit);
            };
        }
        public function addCampSalaryActivityTip():void{
            var _local1:String = (htmlFormat(campSalaryLang.GetSalary, 14, 0xFFFFFF, true) + htmlFormat((campSalaryLang.Coin + _ctrl.player.campSalaryCoin), 12, 0xFFFFFF));
            _view.activities.activityTip(TownType.CampSalary, _local1);
        }
        private function getPlayerCampSalary():void{
            this.get_player_camp_salary();
        }
        public function get_player_camp_salary():void{
            _data.call(Mod_Player_Base.get_player_camp_salary, this.getPlayerCampSalarycallback, []);
        }
        private function getPlayerCampSalarycallback():void{
            switch (_ctrl.player.campSalaryStatus){
                case Mod_Player_Base.ACTION_SUCCESS:
                    this.showCampSalaryMessage();
                    this.showWinEffect();
                    _view.chat.addSystemMessage(((campSalaryLang.GetCampSalary + _ctrl.player.getPlayerCampSalary) + campSalaryLang.Coin));
                    _view.gameHelper.updateGameAssistant();
                    break;
                case Mod_Player_Base.NOT_JOIN_CAMP:
                    _view.showTip(campSalaryLang.NotJoinCamp);
                    break;
                case Mod_Player_Base.ALREADY_GET:
                    _view.showTip(campSalaryLang.AlreadyGet);
                    break;
                default:
                    _view.showTip((campSalaryLang.Error + _ctrl.player.campSalaryStatus));
            };
        }
        private function showCampSalaryMessage():void{
            var _local1:String = Lang.sprintf(campSalaryLang.GetCampSalaryInfo, HtmlText.yellow((_ctrl.player.level + campSalaryLang.Level)), HtmlText.yellow((_ctrl.player.getPlayerCampSalary + campSalaryLang.Coin)));
            _view.alert.confirm(_local1);
        }
        public function redEnvelopes():void{
            var _local1:Number = (new Date(2012, 0, 9).time / 1000);
            var _local2:Number = this._ctrl.player.serverTime;
            if (this._ctrl.player.serverTime >= _local1){
                this._view.redEnvelopes.getDate();
            };
        }
        public function serverInit():void{
            if (this._ctrl.player.level < 30){
                return;
            };
            this._data.call(Mod_ServerWar_Base.get_race_step, this.get_race_step_back, []);
            this._data.patch(Mod_Notify_Base.update_server_war_step, this.update_server_war_step_back);
            this._data.patch(Mod_Notify_Base.have_new_server_war_report, this.have_new_server_war_report_back);
        }
        private function update_server_war_step_back():void{
            this.serverInit();
            var _local1:String = "";
            var _local2:Boolean = this._ctrl.serverWar.info.isThisService;
            switch (this._ctrl.serverWar.info.serverState){
                case Mod_ServerWar_Base.SERVER_WAR_APPLY_COMPLETE:
                    if (_local2){
                    } else {
                        _local1 = activityInfoLang.WarReadyNotice;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_TIANBANG:
                    if (_local2){
                        _local1 = activityInfoLang.WarTianBanNotice1;
                    } else {
                        _local1 = activityInfoLang.WarTianBanNotice2;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_DIBANG:
                    if (_local2){
                        _local1 = activityInfoLang.WarDiBanNotice1;
                    } else {
                        _local1 = activityInfoLang.WarDiBanNotice2;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_16:
                    if (_local2){
                        _local1 = activityInfoLang.War16Notice1;
                    } else {
                        _local1 = activityInfoLang.War16Notice2;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_8:
                    if (_local2){
                        _local1 = activityInfoLang.War8Notice1;
                    } else {
                        _local1 = activityInfoLang.War8Notice2;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_4:
                    if (_local2){
                        _local1 = activityInfoLang.War4Notice1;
                    } else {
                        _local1 = activityInfoLang.War4Notice2;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_2:
                    if (_local2){
                        _local1 = activityInfoLang.War2Notice1;
                    } else {
                        _local1 = activityInfoLang.War2Notice2;
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_1:
                    if (_local2){
                        _local1 = activityInfoLang.War1Notice1;
                    } else {
                        _local1 = activityInfoLang.War1Notice2;
                    };
                    break;
            };
            if (_local1 != ""){
                this._view.worldNotice.showMessage(htmlFormat(_local1, 22, 0xFFF200, true));
            };
        }
        private function have_new_server_war_report_back():void{
            this.serverInit();
        }
        private function get_race_step_back():void{
            this.removeActivity(ActivityType.ServerWar);
            if (Mod_ServerWar_Base.CLOSE == this._ctrl.serverWar.info.serverState){
                return;
            };
            this.addActivity(ActivityType.ServerWar);
            switch (this._ctrl.serverWar.info.serverState){
                case Mod_ServerWar_Base.SERVER_WAR_APPLY:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.SignUp);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_APPLY_COMPLETE:
                    if (this._ctrl.serverWar.info.isThisService){
                        this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.SignUpStop);
                    } else {
                        this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.Ready);
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_TIANBANG:
                case Mod_ServerWar_Base.SERVER_WAR_DIBANG:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.Knockout);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_DIBANG_COMPLETE:
                case Mod_ServerWar_Base.SERVER_WAR_16:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.War16);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_16_COMPLETE:
                case Mod_ServerWar_Base.SERVER_WAR_8:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.War8);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_8_COMPLETE:
                case Mod_ServerWar_Base.SERVER_WAR_4:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.War4);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_4_COMPLETE:
                case Mod_ServerWar_Base.SERVER_WAR_2:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.War2);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_2_COMPLETE:
                case Mod_ServerWar_Base.SERVER_WAR_1:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.War1);
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_1_COMPLETE:
                    this.showActivityTitle(ActivityType.ServerWar, activityInfoLang.SeeRecord);
                    break;
            };
            this._view.serverWarCup.update();
            this._view.serverWarSignUp.update();
            this._view.serverWarRecord.update();
        }
        public function getWarModeCallBack():void{
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import flash.net.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.toolbar.*;
    import com.assist.view.war.roles.*;
    import com.assist.view.war.*;

    public class WarView extends Base implements IView {

        protected var _cWar:Class;
        protected var _war:IWar;
        protected var _warResources:File;
        protected var _type:String;
        protected var _reportId:int;
        protected var _effect:MovieClip;
        protected var _warIcon:Bitmap;
        protected var _roleBitmapDatas:Object;
        protected var _win:Boolean;
        public var missionId:int;
        public var monsterTeamId:int;
        public var isBoss:Boolean;
        public var isLastMonster:Boolean;
        public var mainRoleSuffix:String;
        public var background:BitmapData;
        public var onAfterAdded:Function;
        public var onClose:Function;
        private var _onWarClose:Function;
        private var _opened:Boolean;
        private var _effectFinish:Boolean = false;
        private var _loaded:Boolean = false;
        protected var _mainRoleStunt:Object;
        protected var _signs:Array;
        protected var _urls:Array;
        protected var _warData:WarData;
        public var onProgress:Function;
        private var _reportArgs:Array;

        public function WarView():void{
            this._roleBitmapDatas = {};
            this._mainRoleStunt = {};
            this._signs = [];
            this._urls = [];
            this._reportArgs = [];
            super();
            this._type = WarType.War;
        }
        public function set onWarClose(_arg1:Function):void{
            var func:* = null;
            var value:* = _arg1;
            if (((!((value == null))) && (!((this._onWarClose == null))))){
                func = this._onWarClose;
                this._onWarClose = function ():void{
                    func();
                    value();
                };
            } else {
                this._onWarClose = value;
            };
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
            this.checkWarCdTime();
        }
        private function checkWarCdTime():void{
            var handler:* = function (_arg1:Boolean):void{
                if ((((true == _arg1)) && ((onClose is Function)))){
                    leaverWar(-1);
                } else {
                    _view.tip.hide();
                    _loaded = false;
                    _effectFinish = false;
                    showEffect();
                    loadData();
                };
            };
            if (WarType.War == this._type){
                _view.toolbar.checkWarCdTime(handler);
            } else {
                handler(false);
            };
        }
        override public function get inStage():Boolean{
            return (((this._war) && (!(!(this._war.content.parent)))));
        }
        public function set opened(_arg1:Boolean):void{
            this._opened = _arg1;
        }
        public function get opened():Boolean{
            return (((((this.inStage) || (_requested))) || (this._opened)));
        }
        protected function showEffect():void{
            _popup.addChild(this._effect);
            this._effect.gotoAndPlay(2);
            this.reposition(false);
        }
        protected function removeEffect():void{
            this._loaded = false;
            this._effectFinish = false;
            if (((this._effect) && (this._effect.parent))){
                _popup.removeChild(this._effect);
            };
        }
        protected function onEffectFinish(_arg1:Event):void{
            this._effectFinish = true;
            if (this._loaded){
                this.render();
            };
        }
        protected function loadData():void{
            _requested = true;
            _data.call(Mod_Mission_Base.fight_monster, this.fightMonsterCallback, [this.monsterTeamId, 0]);
            this.addTimeOut();
        }
        private function fightMonsterCallback():void{
            if (_ctrl.mission.warStatus == Mod_Mission_Base.SUCCESS){
                this._warData = _ctrl.mission.warData;
                this.loadMainRoleResource(function ():void{
                    loadStudyStunt(loadResources1);
                });
            } else {
                this.leaverWar(-1, true);
            };
        }
        protected function addTimeOut():void{
            var limit:* = 0;
            var num:* = 0;
            limit = 15;
            num = 0;
            var handler:* = function ():void{
                if (inStage){
                    removeTimeOut();
                    return;
                };
                if (num >= limit){
                    _view.alert.confirm(WarViewLang.NetStatus, leaverWar);
                    num = 0;
                };
                num = (num + 1);
            };
            _view.addToTimerProcessList(sign, handler);
        }
        protected function removeTimeOut():void{
            _view.removeFromTimerProcessList(sign);
            _view.alert.hide();
        }
        private function leaverWar(_arg1:int, _arg2:Boolean=false):void{
            this.removeTimeOut();
            this.removeEffect();
            this.onCloseHandler(_arg2);
        }
        protected function loadMainRoleResource(_arg1:Function):void{
            var roleSign:* = null;
            var handler:* = _arg1;
            this.mainRoleSuffix = _ctrl.player.playerInfo.signSuffix;
            roleSign = RoleType.getRoleSign(_ctrl.player.mainRoleId);
            if (roleSign == ""){
                handler();
                return;
            };
            roleSign = (roleSign + this.mainRoleSuffix);
            if (this._roleBitmapDatas[roleSign] != null){
                handler();
                return;
            };
            var callback:* = function (_arg1:Array):void{
                var _local2:Class = (_arg1[0] as File).getClassByName("RoleBmd");
                _roleBitmapDatas[roleSign] = new (_local2)();
                _view.hideLoading();
                handler();
            };
            var progress:* = function (_arg1:int, _arg2:int):void{
                _view.showLoading(WarViewLang.MainRole, _arg2);
            };
            File.loadList([((URI.warRolesUrl + roleSign) + ".swf")], callback, progress, null, handler);
        }
        protected function loadStudyStunt(_arg1:Function):void{
            var callback:* = _arg1;
            this._mainRoleStunt = {};
            var handler:* = function ():void{
                var _local2:Array;
                var _local3:Array;
                var _local4:int;
                var _local5:int;
                var _local6:int;
                var _local7:String;
                var _local1:Array = _ctrl.studyStunt.mainRoleStuntIds;
                if (((_local1) && ((_local1.length > 0)))){
                    _local2 = [];
                    _local3 = [];
                    _local4 = 0;
                    while (_local4 < _local1.length) {
                        _local5 = _local1[_local4]["playerId"];
                        _local6 = _local1[_local4]["stuntId"];
                        _local7 = RoleStunt.getStuntSign(_local6);
                        if (_local7 == ""){
                        } else {
                            _signs.push(_local7);
                            _urls.push(((URI.stuntsUrl + _local7) + ".swf"));
                            _local2.push(((URI.stuntsUrl + _local7) + ".swf"));
                            _local3.push(_local7);
                            _mainRoleStunt[_local5] = _local7;
                        };
                        _local4++;
                    };
                    loadStudyStuntResources(_local3, _local2, callback);
                } else {
                    callback();
                };
            };
            var playerIds:* = [[this._warData.attackerId]];
            if (!WarType.hasMonster(this._type)){
                playerIds.push([this._warData.defenderId]);
            };
            _data.call(Mod_StudyStunt_Base.player_use_role_stunt_id, handler, [playerIds]);
        }
        protected function loadStudyStuntResources(_arg1:Array, _arg2:Array, _arg3:Function):void{
            var signs:* = _arg1;
            var urls:* = _arg2;
            var callback:* = _arg3;
            if (urls.length == 0){
                callback();
                return;
            };
            var handler:* = function (_arg1:Array):void{
                var _local2:int;
                while (_local2 < _arg1.length) {
                    _roleBitmapDatas[signs[_local2]] = _arg1[_local2].getClassByName("RoleMC");
                    _local2++;
                };
                callback();
            };
            File.loadList(urls, handler);
        }
        public function getResourcesUrl():Array{
            this._signs = [];
            this._urls = [];
            var _local1:Array = this.getPlayerSigns();
            this.getRoleResources(_local1[0], _local1[1], false);
            this.getMonsterResources();
            this.addonRole(this._signs, this._urls);
            this.addonWarIcon(this._signs, this._urls);
            this._signs.push("War");
            this._urls.push(_view.getAssetsUrl("War"));
            this._signs.push("WarResources");
            this._urls.push(_view.getAssetsUrl("WarResources"));
            return (this._urls);
        }
        private function getPlayerSigns():Array{
            var _local5:String;
            var _local1:Array = [];
            var _local2:Array = RoleType.getRoleSigns(_ctrl.rolemsg.roleIdList);
            var _local3:int = _local2.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = (_local1[_local4] = _local2[_local4]);
                if (RoleType.isMainRole(_local5)){
                    _local1[_local4] = (_local1[_local4] + this.mainRoleSuffix);
                };
                _local4++;
            };
            return ([_local1, _local2]);
        }
        protected function getRoleResources(_arg1:Array, _arg2:Array, _arg3:Boolean):void{
            var _local5:String;
            var _local4:Array = (_arg3) ? RoleStunt.getMonsterStunts(_arg2) : RoleStunt.getRoleStunts(_arg2);
            for each (_local5 in _arg1) {
                _local5 = (_arg3) ? MonsterType.sameResource(_local5) : _local5;
                _local5 = (_local5 + WarType.getMiniSuffix(this._type));
                this._signs.push(_local5);
                this._urls.push(((URI.warRolesUrl + _local5) + ".swf"));
            };
            for each (_local5 in _local4) {
                if (false == RoleAction.isStunt(_local5)){
                } else {
                    this._signs.push(_local5);
                    this._urls.push(((URI.stuntsUrl + _local5) + ".swf"));
                };
            };
        }
        protected function getMonsterResources():void{
            var _local1:Array = [];
            _local1 = _local1.concat(MissionType.getMissionMonsterList(this.missionId));
            this.getRoleResources(_local1, _local1, true);
        }
        public function resourcesLoaded(_arg1:Array):void{
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                this.getExportObject(this._signs[_local3], _arg1[_local3]);
                _local3++;
            };
        }
        protected function loadResources1(_arg1:WarData=null):void{
            this.removeTimeOut();
            this._warData = ((_arg1) || (_ctrl.mission.warData));
            this._loaded = true;
            if (this._effectFinish){
                this.render();
            };
        }
        protected function loadResources():void{
            var _local1:LoadResponder;
            this.removeTimeOut();
            this._warData = _ctrl.mission.warData;
            if (_view.hasResource("War")){
                this.loadRoleResource();
            } else {
                _local1 = new LoadResponder(this.loadRoleResource, this.onProgress);
                _view.loadResources(["War"], _local1);
            };
        }
        protected function loadRoleResource():void{
            var signs:* = null;
            var urls:* = null;
            var list:* = this.extractRoleData();
            signs = list[0];
            urls = list[1];
            var callback:* = function (_arg1:Array):void{
                var files:* = _arg1;
                loadStudyStunt(function ():void{
                    var _local1:int = files.length;
                    var _local2:int;
                    while (_local2 < _local1) {
                        getExportObject(signs[_local2], files[_local2]);
                        _local2++;
                    };
                    _loaded = true;
                    if (_type != WarType.War){
                        showEffect();
                    } else {
                        if (_effectFinish){
                            render();
                        };
                    };
                });
            };
            var error:* = function (_arg1:int):void{
                var index:* = _arg1;
                var message:* = ("[war]: " + urls[index].replace(/^[\s\S]+\//, ""));
                var handler:* = function (_arg1:uint):void{
                    _view.hideLoading();
                };
                _view.alert.confirm(message, handler);
            };
            File.loadList(urls, callback, this.onProgress, null, error);
        }
        protected function extractRoleData():Array{
            var signs:* = null;
            var urls:* = null;
            signs = [];
            urls = [];
            var deal:* = function (_arg1:Object, _arg2:int, _arg3:String, _arg4:Boolean):Array{
                var _local6:String;
                var _local7:int;
                var _local8:String;
                var _local9:String;
                var _local10:String;
                var _local11:String;
                var _local5:Array = [];
                for (_local6 in _arg1) {
                    _local7 = _arg1[_local6]["id"];
                    _local8 = ((_local7)!=_arg2) ? "" : _arg3;
                    _local9 = _arg1[_local6]["sign"];
                    _local10 = (_local9 + _local8);
                    _local11 = (_arg4) ? MonsterType.sameResource(_local10) : _local10;
                    if ((((((_type == WarType.GetPeachWar)) && ((false == _arg4)))) && ((_local7 < 0)))){
                        _local11 = MonsterType.sameResource(_local10);
                        _local9 = _local11;
                        _arg1[_local6]["sign"] = _local11;
                    };
                    _local11 = (_local11 + WarType.getMiniSuffix(_type));
                    if (signs.indexOf(_local11) == -1){
                        signs.push(_local11);
                        urls.push(((URI.warRolesUrl + _local11) + ".swf"));
                    };
                    if (_local5.indexOf(_local9) == -1){
                        _local5.push(_local9);
                    };
                };
                return (_local5);
            };
            var hasMonster:* = WarType.hasMonster(this._type);
            var originSigns1:* = deal(this._warData.attackerSoldiers, this._warData.attackerMainPlayerRoleId, this._warData.attackerMainRoleSuffix, false);
            var originSigns2:* = deal(this._warData.defenderSoldiers, this._warData.defenderMainPlayerRoleId, this._warData.defenderMainRoleSuffix, hasMonster);
            this.extractStuntData(signs, urls, originSigns1, false);
            this.extractStuntData(signs, urls, originSigns2, hasMonster);
            this.addonRole(signs, urls);
            this.addonWarIcon(signs, urls);
            return ([signs, urls]);
        }
        protected function extractStuntData(_arg1:Array, _arg2:Array, _arg3:Array, _arg4:Boolean):void{
            var _local6:String;
            if (WarType.hasStunt(this._type) == false){
                return;
            };
            var _local5:Array = (_arg4) ? RoleStunt.getMonsterStunts(_arg3) : RoleStunt.getRoleStunts(_arg3);
            for each (_local6 in _local5) {
                if (false == RoleAction.isStunt(_local6)){
                } else {
                    _arg1.push(_local6);
                    _arg2.push(((URI.stuntsUrl + _local6) + ".swf"));
                };
            };
        }
        protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push(((((URI.missionUrl + MissionType.getSectionSignByMissionId(this.missionId)) + "/") + "war_icon") + ".png"));
            _arg1.push("Aura");
            _arg2.push((URI.effectsUrl + "aura.swf"));
        }
        protected function addonRole(_arg1:Array, _arg2:Array):void{
            if (this._effect == null){
                _arg1.push("EnterWarEffect");
                _arg2.push((URI.assetsUrl + "enter_war_effect.swf"));
            };
            if (_arg1.indexOf("WarResources") == -1){
                _arg1.push("WarResources");
                _arg2.push(_view.getAssetsUrl("WarResources"));
            };
        }
        private function getExportObject(_arg1:String, _arg2:File):void{
            var _local3:Class;
            var _local4:Class;
            var _local5:String;
            var _local6:Class;
            var _local7:Class;
            switch (_arg1){
                case "EnterWarEffect":
                    _local3 = (_arg2.getClassByName("EnterWarEffect") as Class);
                    this._effect = (new (_local3)() as MovieClip);
                    this._effect.gotoAndStop(1);
                    this._effect.addEventListener("finish", this.onEffectFinish);
                    break;
                case "War":
                    this._cWar = (_arg2.getClassByName("War") as Class);
                    break;
                case "WarResources":
                    this._warResources = _arg2;
                    break;
                case "WarIcon":
                    this._warIcon = _arg2.bitmap;
                    break;
                case "Background":
                    _local4 = _arg2.getClassByName("Bmd");
                    this.background = (new (_local4)() as BitmapData);
                    break;
                case "Aura":
                    this._roleBitmapDatas["Aura"] = _arg2.getClassByName("Aura");
                    break;
                default:
                    _local5 = _arg1.replace(/T\dQ\d$/, "");
                    if ((((RoleAction.isStunt(_local5) == false)) || (RoleAction.isBMD(_local5)))){
                        _local6 = _arg2.getClassByName("RoleBmd");
                        this._roleBitmapDatas[_arg1] = new (_local6)();
                        if (RoleStunt.FeiYuJian == _local5){
                            this._roleBitmapDatas[(_arg1 + "Start")] = _arg2.getClassByName("RoleBmdStart");
                        };
                    } else {
                        _local7 = _arg2.getClassByName("RoleMC");
                        this._roleBitmapDatas[_arg1] = _local7;
                    };
            };
        }
        protected function render():void{
            _view.closeEvent();
            this.removeEffect();
            this.removeTimeOut();
            this.createTarget();
            _popup.addView(this, this._war.content);
            _popup.addMask(false, 1);
            this._war.isAdvancedTester = ((_ctrl.player.isAdvancedTester) || (Config.EnableWarIgnoreButton));
            this._war.warType = this._type;
            this._war.playerId = _ctrl.player.playerId;
            this._war.nickName = _ctrl.player.nickname;
            this._war.roleId = _ctrl.player.mainRoleId;
            this._war.playerRoleId = _ctrl.player.mainPlayerRoleId;
            this._war.mainRoleStunt = this._mainRoleStunt;
            this._war.assetsUrl = URI.assetsUrl;
            this._war.iconsUrl = URI.iconsUrl;
            this._war.goodsIconUrl = URI.goodsIconUrl;
            this._war.reportUrl = this.reportUrl;
            this._war.copyReportEnabled = (URI.isBaidu == false);
            var sUrl:* = (URI.assetsUrl + "war_sport_report.swf");
            this._war.sportReportUrl = ((sUrl + "?v=") + URI.getVersion(sUrl));
            sUrl = (URI.assetsUrl + "war_sport_detail.swf");
            this._war.sportDetailUrl = ((sUrl + "?v=") + URI.getVersion(sUrl));
            this._war.onSportDetail = this.onSportDetail;
            this._war.warIcon = this._warIcon;
            this._war.background = this.background;
            this._war.warResources = this._warResources;
            this._war.roleBitmapDatas = this._roleBitmapDatas;
            this._war.tip = _view.tip.iTip;
            this._war.alert = _view.alert.iAlert;
            this._war.onSendChat = this.onSendChatHandler;
            this._war.onCopy = this.onCopyHandler;
            this._war.onClose = this.onCloseBaseHandler;
            this._war.init();
            this.reposition();
            if (WarType.War == this._type){
                _view.missionFailedTips.close();
            };
            if ((this.onAfterAdded is Function)){
                this.onAfterAdded();
            };
            if ((((_ctrl.mission.warAura > 0)) && (!(this._roleBitmapDatas["Fusion"])))){
                File.loadList([(URI.effectsUrl + "fusion.swf")], function (_arg1:Array):void{
                    _roleBitmapDatas["Fusion"] = (_arg1[0] as File).getClassByName("Fusion");
                });
            };
        }
        protected function createTarget():void{
            this._war = new this._cWar();
            this._war.warData = _ctrl.mission.warData;
            this._war.sportDetailData = {
                worship:_ctrl.mission.worship,
                aura:_ctrl.mission.warAura
            };
            this._war.onWin = this.onWin;
            SoundManage.playBgSound((URI.soundUrl + (this.isBoss) ? "BossWar.mp3" : "War.mp3"));
        }
        protected function onSendChatHandler(_arg1:String, _arg2:String):void{
            var _local4:int;
            var _local3:Array = this.reportArgs;
            if (_local3.length > 0){
                _local3.unshift(ChatMsgType.WarReport, _arg1, ((WarType.War == this._type)) ? MonsterType.getMonsterIdByName(_arg2) : _arg2);
                _local4 = _view.superSport.topRank;
                if (_local4 <= 0){
                    _local4 = 1;
                };
                _local3.push(_local4);
                _view.chat.showMsg(_local3);
            };
        }
        private function onCloseBaseHandler(_arg1:Boolean):void{
            this.opened = false;
            if ((this._onWarClose is Function)){
                this._onWarClose();
            };
            this.onCloseHandler(_arg1);
        }
        protected function onCopyHandler():void{
            _data.call(Mod_WarReport_Base.record_war_report, null, []);
        }
        protected function onCloseHandler(_arg1:Boolean):void{
            this._win = _arg1;
            this.closeWar();
            if ((this.onClose is Function)){
                this.onClose(_arg1);
            };
            if (this.isLastMonster == false){
                _view.triggerDelayed(DelayType.LevelUp, DelayType.Experience, DelayType.HealthUpdateMessage, DelayType.PartnerUpgrade, DelayType.UpdateHealth, DelayType.PassTower);
            } else {
                _view.triggerDelayed(DelayType.MissionAward, DelayType.HealthUpdateMessage, DelayType.UpdateHealth);
            };
            if (_view.hasDelayed(DelayType.QuestTrace)){
                _view.triggerDelayed(DelayType.QuestTrace);
            } else {
                _view.toolbar.loadQuestTrace();
            };
            if ((((WarType.War == this._type)) && ((false == _arg1)))){
                _view.missionFailedTips.missionId = this.missionId;
                _view.missionFailedTips.show();
            };
            if (this._type != WarType.War){
                this.clearRoles();
            };
            _ctrl.mission.zeroWarAura();
        }
        private function onWin():void{
            SoundManage.playBgSound("");
        }
        private function onSportDetail(_arg1:int):void{
            if (_arg1 == _ctrl.player.playerId){
                _view.roleMsg.show();
            } else {
                _view.otherRoleMsg.init(_arg1, "");
                _view.otherRoleMsg.show();
            };
        }
        protected function closeWar():void{
            _popup.closeView(this);
            _popup.removeMask();
            this._win = false;
            _requested = false;
            this.background = null;
            this._war = null;
            Helper.gc();
            _view.openEvent();
        }
        public function clearRoles():void{
            this._war = null;
            this._warIcon = null;
            this._signs = [];
            this._urls = [];
            this._roleBitmapDatas = {};
            Helper.gc();
        }
        public function close():void{
        }
        public function clear():void{
        }
        public function get reportArgs():Array{
            this.reportUrl;
            this.onCopyHandler();
            return (this._reportArgs);
        }
        private function get reportUrl():String{
            var _local2:String;
            var _local3:URLVariables;
            var _local1:String = "";
            if (((this._warData) && ((this._warData.reportId > 0)))){
                _local2 = URI.getVersion((URI.assetsUrl + _local1));
                this._reportArgs = [Config.GameVersion, this._type, this._warData.reportId, this.missionId, _local2];
                _local1 = (("strategy_war/" + Config.GameVersion) + ".swf");
                _local3 = new URLVariables();
                _local3.v = Config.GameVersion;
                _local3.w = this._type;
                _local3.r = this._warData.reportId;
                _local3.m = this.missionId;
                _local3.c = _local2;
                _local1 = ((URI.serverUrl + "war.php?") + _local3.toString());
            } else {
                this._reportArgs = [];
            };
            return (_local1);
        }
        public function formatReportUrl(_arg1:Array):void{
            var _local2:URLVariables = new URLVariables();
            _local2.v = _arg1[0];
            _local2.w = _arg1[1];
            _local2.r = _arg1[2];
            _local2.m = _arg1[3];
            _local2.c = _arg1[4];
            var _local3:String = ((URI.serverUrl + "war.php?") + _local2.toString());
            navigateToURL(new URLRequest(_local3), "_blank");
        }
        public function get missionCompleted():Boolean{
            return (((this.isLastMonster) && (this._win)));
        }
        public function get auraClass():Class{
            return (this._roleBitmapDatas["Aura"]);
        }
        public function get fusionClass():Class{
            return (this._roleBitmapDatas["Fusion"]);
        }
        public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                if (this._effect != null){
                    this._effect.scaleX = (Structure.stageWidth / 500);
                    this._effect.scaleY = (Structure.stageWidth / 300);
                };
                if (this.inStage == false){
                    return;
                };
                this._war.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }

    }
}//package com.views 

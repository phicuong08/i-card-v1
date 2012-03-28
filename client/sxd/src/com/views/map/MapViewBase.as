//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views.map {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.view.sound.*;
    import com.controllers.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    import com.views.*;
    
    import flash.display.*;
    import flash.utils.*;

    public class MapViewBase extends com.views.Base implements IView {

        public static const Town:uint = 0;
        public static const Mission:uint = 1;
        public static const WorldBoss:uint = 2;
        public static const FactionWar:uint = 3;

        protected var _id:int = 0;
        protected var _info:MapInfo;
        protected var _content:Sprite;
        protected var _mapBase:IMap;
        protected var _playerInfo:PlayerInfo;
        protected var _loadTips:Array;
        private var townCache:Object;
        private var missionCache:Object;

        public function MapViewBase(){
            this._content = new Sprite();
            this.townCache = {};
            this.missionCache = {};
            super();
            this._loadTips = [MapViewBaseLang.loadTip1, MapViewBaseLang.loadTip2, MapViewBaseLang.loadTip3];
        }
        public function show():void{
        }
        public function close():void{
        }
        public function get content():Sprite{
            return (this._content);
        }
        protected function get ctrlMap():TownController{
            return (_ctrl.town);
        }
        protected function get ctrlPlayer():PlayerController{
            return (_ctrl.player);
        }
        protected function get ctrlNotify():NotifyController{
            return (_ctrl.notify);
        }
        override public function get inStage():Boolean{
            return (((this._mapBase) && (!((this._mapBase.content.stage == null)))));
        }
        protected function showProgress(_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
            _view.initLoading.loading((_arg2 + ""), _arg3, _arg2, _arg1, _arg4);
        }
        public function clear():void{
            _popup.closeAll();
            _ctrl.town.clearPlayer();
            _view.otherHead.close();
            _view.toolbar.miniMap.content.visible = false;
            SoundManage.playBgSound("");
            _data.cancelPatch(Mod_Town_Base.move_to);
            _data.cancelPatch(Mod_Town_Base.player_follow_role_change);
            _data.cancelPatch(Mod_Player_Base.update_player_data_for_town);
            _data.cancelPatch(Mod_Player_Base.practice_notify);
            _data.cancelPatch(Mod_Town_Base.move_to);
            _data.cancelPatch(Mod_Town_Base.player_follow_role_change);
            _data.cancelPatch(Mod_Player_Base.update_player_data_for_town);
            _data.cancelPatch(Mod_Player_Base.practice_notify);
            _data.cancelPatch(Mod_Notify_Base.change_equip);
            _data.cancelPatch(Mod_Town_Base.enter_town);
            _data.cancelPatch(Mod_Town_Base.leave_town);
            this.closePractice(true);
            this._mapBase.clear();
            if (this._content.parent){
                this._content.parent.removeChild(this._content);
            };
        }
        public function gotoLastMap(_arg1:int=1):void{
            if (_arg1 == AlertButtonType.Yes){
                _view.townMap.gotoTownAtId(((this.ctrlPlayer.jihuisuoId) || (this.ctrlPlayer.townMapId)));
            };
        }
        public function stopPlayerRun():void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.stop();
        }
        public function showTextEffect(_arg1:String, _arg2:uint):void{
            if (((((_view.war.inStage) || (_view.missionPractice.inStage))) || (_view.heroPractice.inStage))){
                return;
            };
            this._mapBase.showTextEffect(_arg1, _arg2);
        }
        public function showLevelUp():void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.showLevelUp();
        }
        public function showQuestOk():void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.showQuestOk();
        }
        public function showQuestAdd():void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.showQuestAdd();
        }
        public function showAchievement():void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.showEffort();
        }
        public function updatePlayerBody():void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.updateBodyUrl(this._playerInfo.id);
        }
        public function playerSay(_arg1:int, _arg2:Object, _arg3:int):void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.playerSay(_arg1, _arg2, _arg3);
        }
        protected function update_player_data_for_town_back():void{
            var _local2:Object;
            var _local3:int;
            var _local4:int;
            var _local5:int;
            var _local6:PlayerInfo;
            if (this.inStage == false){
                return;
            };
            var _local1:Array = this.ctrlPlayer.updatePlayerDataForTownList;
            for each (_local2 in _local1) {
                _local3 = _local2.id;
                _local4 = _local2.type;
                _local5 = _local2.value;
                _local6 = this.ctrlMap.getPlayerInfo(_local3);
                if (_local4 == Mod_Player_Base.PLAYER_TRANSPORT){
                    this._mapBase.updateBodyUrl(_local3);
                } else {
                    if (_local4 == Mod_Player_Base.PLAYER_AVATAR){
                        this._mapBase.updateBodyUrl(_local3);
                    };
                };
            };
        }
        protected function practice_notify_back():void{
            var _local2:PlayerInfo;
            var _local1:Array = this.ctrlPlayer.practiceChangeList;
            this.ctrlPlayer.practiceChangeList = [];
            for each (_local2 in _local1) {
                if (_local2.isMine){
                    this._mapBase.updatePracticePanel();
                } else {
                    this._mapBase.updateBodyUrl(_local2.id);
                };
            };
        }
        protected function get_practice_data():void{
            if (this._playerInfo.practice != Mod_Town_Base.ON_PRACTICE){
                return;
            };
            _data.call(Mod_Player_Base.get_practice_data, this.get_practice_data_back, [], false);
        }
        protected function get_practice_data_back():void{
            var _local2:int;
            this._mapBase.updatePracticePanel();
            var _local1:Boolean = (((this.ctrlPlayer.level >= 40)) && ((this._playerInfo.practiceSpeedNum > 0)));
            this._mapBase.practiceBtnSpeed1.visible = (this._mapBase.practiceBtnSpeed24.visible = _local1);
            if (_local1 == false){
                _view.tip.iTip.removeTarget(this._mapBase.practiceBtnSpeed1);
                _view.tip.iTip.removeTarget(this._mapBase.practiceBtnSpeed24);
            } else {
                _local2 = ((this._playerInfo.practiceTime - getTimer()) / 1000);
                _local2 = ((_local2 + 3595) / 3600);
                _local2 = Math.min(_local2, this._playerInfo.practiceSpeedNum);
                _view.tip.iTip.addTarget(this._mapBase.practiceBtnSpeed1, Lang.sprintf(MapViewBaseLang.SpeedTip, HtmlText.yellow2(("" + 30)), HtmlText.yellow2("1"), HtmlText.green(("" + this._playerInfo.practiceExpOne)), HtmlText.yellow2(("" + this._playerInfo.practiceSpeedNum))));
                _view.tip.iTip.addTarget(this._mapBase.practiceBtnSpeed24, Lang.sprintf(MapViewBaseLang.SpeedTip2, HtmlText.yellow2(("" + (30 * _local2))), HtmlText.yellow2(("" + _local2)), HtmlText.green(("" + (this._playerInfo.practiceExpOne * _local2)))));
            };
        }
        public function startPractice():void{
            if (this.inStage == false){
                return;
            };
            if (((_view.missionPractice.isBatton) || (_view.heroPractice.isBatton))){
                _view.showTip(MapViewBaseLang.PracticeTip1);
            } else {
                if (this._mapBase.inMove == true){
                    _view.showTip(MapViewBaseLang.PracticeTip2);
                } else {
                    this._playerInfo.practice = Mod_Town_Base.ON_PRACTICE;
                    this._playerInfo.practiceExp = 0;
                    this._mapBase.updatePracticePanel();
                    _data.call(Mod_Player_Base.start_practice, null, []);
                    this.get_practice_data();
                };
            };
        }
        public function closePractice(_arg1:Boolean):void{
            if (this._playerInfo.practice == Mod_Town_Base.ON_PRACTICE){
                this._playerInfo.practice = Mod_Town_Base.OFF_PRACTICE;
                this._playerInfo.practiceExp = 0;
                this._mapBase.updatePracticePanel();
                if (_arg1){
                    _data.call(Mod_Player_Base.cancel_practice, null, []);
                };
            };
        }
        protected function onCancelPraceice():void{
            this.closePractice(true);
            _data.call(Mod_Player_Base.sign_finished_practice, null, []);
            this._playerInfo.practice = Mod_Town_Base.OFF_PRACTICE;
            this._playerInfo.practiceExp = 0;
        }
        protected function onPracticeAction(_arg1:int):void{
            _view.friendMessage.additionalHeight = _arg1;
        }
        protected function enterMapComplete():void{
            this.get_practice_data();
            this._mapBase.onCancelPraceice = this.onCancelPraceice;
            this._mapBase.onGoonPraceice = this.startPractice;
            this._mapBase.onPracticeAction = this.onPracticeAction;
            this._mapBase.onPracticeSpeed = this.onPracticeSpeed;
            _data.patch(Mod_Town_Base.leave_town, this.leave_town_back);
            _data.patch(Mod_Town_Base.move_to, this.move_to_back);
            _data.patch(Mod_Town_Base.player_follow_role_change, this.player_follow_role_change_back);
            _data.patch(Mod_Player_Base.update_player_data_for_town, this.update_player_data_for_town_back);
            _data.patch(Mod_Town_Base.enter_town, this.get_players_back);
            _data.patch(Mod_Player_Base.practice_notify, this.practice_notify_back);
            _data.patch(Mod_Notify_Base.change_equip, this.change_equip_back);
            _view.chat.onPassClick = this._mapBase.passClick;
        }
        private function onPracticeSpeed(_arg1:int):void{
            var num:* = _arg1;
            var num_:* = num;
            if (this._playerInfo.practiceSpeedNum == 0){
                _view.showTip(MapViewBaseLang.SpeedOver);
                return;
            };
            var time:* = ((this._playerInfo.practiceTime - getTimer()) / 1000);
            time = ((time + 3595) / 3600);
            num = Math.min(num, time, this._playerInfo.practiceSpeedNum);
            if (num == 0){
                _view.showTip(MapViewBaseLang.SpeedError);
                return;
            };
            var tip:* = Lang.sprintf(MapViewBaseLang.SpeedAsk, HtmlText.yellow2(("" + (num * 30))), HtmlText.yellow2(("" + num)), HtmlText.green(("+" + (num * this._playerInfo.practiceExpOne))));
            if (num_ == 1){
                this.checkBoxSelect2(ConsumeAlertSetType.practiceSpeed1, tip, function ():void{
                    _data.call(Mod_Practice_Base.quickly, quickly_back, []);
                });
            } else {
                this.checkBoxSelect2(ConsumeAlertSetType.practiceSpeed24, tip, function ():void{
                    _data.call(Mod_Practice_Base.quickly_all, quickly_back, []);
                });
            };
        }
        private function quickly_back():void{
            if (_ctrl.practice.result == Mod_Practice_Base.SUCCESS){
                this.get_practice_data();
            } else {
                if (_ctrl.practice.result == Mod_Practice_Base.NOT_ENOUGH_INGOT){
                    _view.showTip(MapViewBaseLang.SpeedIngot);
                } else {
                    if (_ctrl.practice.result == Mod_Practice_Base.NOT_ENOUGH_TIMES){
                        _view.showTip(MapViewBaseLang.SpeedOver);
                    } else {
                        _view.showTip(MapViewBaseLang.SpeedError);
                    };
                };
            };
        }
        public function reposition(_arg1:Boolean=true):void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.reposition();
        }
        protected function checkBoxSelect1(_arg1:String, _arg2:String, _arg3:Function):void{
            var cookie:* = _arg1;
            var msg:* = _arg2;
            var callback:* = _arg3;
            var checked:* = (_view.getCookie(cookie) == 1);
            if (checked){
                callback();
            } else {
                _view.alert.iAlert.hasCheckbox = true;
                _view.alert.showYesNoMsg(msg, MapViewBaseLang.Yes, MapViewBaseLang.No, function (_arg1:int):void{
                    if (_arg1 == AlertButtonType.Yes){
                        callback();
                        if (_view.alert.iAlert.checked == true){
                            _view.setCookie(cookie, 1);
                        };
                    };
                });
            };
        }
        protected function checkBoxSelect2(_arg1:int, _arg2:String, _arg3:Function):void{
            var cookieId:* = _arg1;
            var msg:* = _arg2;
            var callback:* = _arg3;
            if (_view.consumeAlertSetting.isAlert(cookieId)){
                callback();
            } else {
                _view.alert.iAlert.hasCheckbox = true;
                _view.alert.showYesNoMsg(msg, MapViewBaseLang.Yes, MapViewBaseLang.No, function (_arg1:int):void{
                    if (_arg1 == AlertButtonType.Yes){
                        callback();
                        if (_view.alert.iAlert.checked == true){
                            _view.consumeAlertSetting.saveSetting(cookieId, true);
                        };
                    };
                });
            };
        }
        protected function startMove(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            this._view.friendMessage.clear();
        }
        protected function endMove():void{
        }
        public function updatePetLv(_arg1:int):void{
            this._playerInfo.petLv = _arg1;
            this._mapBase.updatePetLv(this._playerInfo.id, _arg1);
        }
        public function updateNpcLoack(_arg1:int):void{
        }
        protected function player_follow_role_change_back():void{
            var _local3:PlayerInfo;
            var _local1:Array = this.ctrlMap.followList;
            var _local2:int;
            for each (_local2 in _local1) {
                _local3 = this.ctrlMap.getPlayerInfo(_local2);
                this._mapBase.showFollow(_local2, _local3.followRoleId);
            };
        }
        public function showFollow(_arg1:int, _arg2:int):void{
            if (this.inStage == false){
                return;
            };
            this._mapBase.showFollow(_arg1, _arg2);
        }
        protected function change_equip_back():void{
            this._mapBase.updateBodyUrl(this.ctrlNotify.eq_PlayerId);
        }
        protected function enter_town():void{
            _data.patch(Mod_Town_Base.enter_town, this.enter_town_back);
            _data.call(Mod_Town_Base.enter_town, null, [this._id]);
            this._playerInfo = this.ctrlPlayer.playerInfo;
        }
        protected function enter_town_back():void{
        }
        protected function move_to(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            _data.call(Mod_Town_Base.move_to, this.move_to_back, [_arg1, _arg2, _arg3, _arg4]);
            this.closePractice(false);
            if ((((_arg1 == _arg3)) && ((_arg2 == _arg4)))){
                this.endMove();
            } else {
                this.startMove(_arg1, _arg2, _arg3, _arg4);
            };
        }
        protected function move_to_back():void{
            var _local3:PlayerInfo;
            var _local1:Array = this.ctrlMap.moveList;
            var _local2:int;
            for each (_local2 in _local1) {
                _local3 = this.ctrlMap.getPlayerInfo(_local2);
                this._mapBase.moveToPlayer(_local3.id, _local3.x, _local3.y);
            };
        }
        protected function get_players():void{
            _data.call(Mod_Town_Base.get_players, this.get_players_back, []);
        }
        protected function get_players_back():void{
            var _local3:PlayerInfo;
            var _local1:Array = this.ctrlMap.entownList;
            var _local2:int;
            for each (_local2 in _local1) {
                _local3 = this.ctrlMap.getPlayerInfo(_local2);
                this._mapBase.addPlayer(_local3);
            };
        }
        protected function leave_town_back():void{
            var _local1:Array = this.ctrlMap.leaveList;
            var _local2:int;
            for each (_local2 in _local1) {
                this._mapBase.removePlayer(_local2);
            };
        }
        public function getTownMapInfo(_arg1:String, _arg2:Function):MapInfo{
            var _local4:String;
            var _local5:String;
            var _local6:String;
            var _local3:MapInfo = (this.townCache[_arg1] as MapInfo);
            if (_local3 == null){
                _local3 = new MapInfo();
                this.townCache[_arg1] = _local3;
                _local4 = "/map.swf";
                _local5 = "/miniJPG.jpg";
                _local6 = "/config.xml";
                _local3.urlMap = this.getVersion(((URI.townUrl + _arg1) + _local4));
                _local3.urlMini = this.getVersion(((URI.townUrl + _arg1) + _local5));
                _local3.urlXML = this.getVersion(((URI.townUrl + _arg1) + _local6));
                _local3.loadXML();
            };
            _local3.onComplete = _arg2;
            return (_local3);
        }
        public function getMissionMapInfo(_arg1:String, _arg2:int, _arg3:Function):MapInfo{
            var _local5:String;
            var _local6:String;
            var _local7:String;
            var _local4:MapInfo = (this.missionCache[((_arg1 + "_") + _arg2)] as MapInfo);
            if (_local4 == null){
                _local4 = new MapInfo();
                this.missionCache[((_arg1 + "_") + _arg2)] = _local4;
                _local5 = ((((URI.missionUrl + _arg1) + "/map_") + _arg2) + ".swf");
                _local6 = ((((URI.missionUrl + _arg1) + "/miniJPG_") + _arg2) + ".jpg");
                _local7 = ((((URI.missionUrl + _arg1) + "/config_") + _arg2) + ".xml");
                _local4.urlMap = this.getVersion(_local5);
                _local4.urlMini = this.getVersion(_local6);
                _local4.urlXML = this.getVersion(_local7);
                _local4.loadXML();
            };
            _local4.onComplete = _arg3;
            return (_local4);
        }
        private function getVersion(_arg1:String):String{
            return (((_arg1 + "?v=") + URI.getVersion(_arg1)));
        }

    }
}//package com.views.map 

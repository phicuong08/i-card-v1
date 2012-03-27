//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.view.*;
    import com.controllers.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.view.pack.*;
    import com.views.map.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.view.map.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class MissionMapView extends MapViewBase {

        public static var dramaList:Array = [];

        private var _award:IMissionGet;
        private var _chest:IMissionChest;
        private var _Map:IMissionMap;
        private var _monsterList:Array;
        private var _dramaList:Array;
        private var _mInfo:MonsterInfo;
        private var _dramaToWar:Boolean = false;
        private var _warAura:int = 0;

        public function MissionMapView(){
            this._monsterList = [];
            this._dramaList = [];
            _inStageTipTitle = MissionMapViewLang.NoOpen;
            _inStageTipContent = "";
            super();
        }
        public function init():void{
            _mapBase = (this._Map = MapStatic.mapInstance.mission);
        }
        override public function clear():void{
            super.clear();
            _view.missionFailedTips.close();
            this.closeAward();
            _view.war.clearRoles();
        }
        protected function get ctrlMission():MissionController{
            return (_ctrl.mission);
        }
        public function gotoMissionAtId(_arg1:int):void{
            if (_view.tower.inStageWithTip){
                return;
            };
            _id = _arg1;
            _playerInfo = ctrlPlayer.playerInfo;
            this.enter_mission(_id);
        }
        private function parseMissionData():void{
            var _local2:Object;
            var _local3:Array;
            var _local4:String;
            var _local5:int;
            var _local6:int;
            var _local7:String;
            var _local8:MonsterInfo;
            var _local9:ItemBasically;
            _view.screen.currentMap = this;
            _id = _ctrl.mission.missionId;
            _view.initLoading.tip = _loadTips[(getTimer() % _loadTips.length)];
            _view.initLoading.show();
            _view.initLoading.loading(MissionMapViewLang.Loading);
            this._dramaList = [[0]];
            if (this.canPlayDrama(_id, MissionType.getVideoId(_id)) == true){
                this._dramaList[0] = [MissionType.getVideoId(_id), MissionType.getVideoFile(_id)];
            };
            if (dramaList.length > 0){
                this._dramaList[0] = [0xFFFFFF, dramaList.pop()];
            };
            var _local1:Object = MissionType.getSences(_id)[0];
            this._monsterList = [];
            for each (_local2 in _local1.monsters) {
                _local8 = new MonsterInfo();
                _local8.x = _local2.position_x;
                _local8.y = _local2.position_y;
                _local8.id = _local2.id;
                _local8.name = _local2.monster_name;
                _local8.sign = MonsterType.sameResource(_local2.monster_sign);
                _local8.sayMsg = MonsterType.words(_local8.sign);
                this._monsterList.push(_local8);
                if (this.canPlayDrama(_id, int(_local2.start_video_id)) == true){
                    this._dramaList[0] = [int(_local2.start_video_id), _local2.start_video_file];
                };
                this._dramaList[_local8.id] = [0];
                if (this.canPlayDrama(_id, int(_local2.end_video_id)) == true){
                    this._dramaList[_local8.id] = [int(_local2.end_video_id), _local2.end_video_file];
                };
            };
            this._monsterList.sortOn("x", Array.NUMERIC);
            this._mInfo = this._monsterList[0];
            _local3 = MissionType.getMissionAwardItems(_id);
            _local4 = "";
            _local5 = 0;
            for each (_local6 in _local3) {
                if (_local5 > 0){
                    if ((_local5 & 1) == 1){
                        _local4 = (_local4 + "、");
                    } else {
                        _local4 = (_local4 + "\n");
                    };
                };
                _local9 = ItemBasically.getBasic(_local6);
                _local4 = (_local4 + HtmlText.format(_local9.getItemName(0), _local9.getItemColor(0)));
                _local5++;
            };
            _local7 = MissionType.getMissionName(_id);
            if (_local5 > 0){
                this._Map.tfName.htmlText = ((("<a href='event:str'>" + _local7) + HtmlText.blue2(((" <u>" + MissionMapViewLang.Fall) + "</u>"))) + "</a>");
                _view.tip.iTip.addTarget(this._Map.tfName, _local4);
            } else {
                this._Map.tfName.htmlText = _local7;
                _view.tip.iTip.removeTarget(this._Map.tfName);
            };
            getMissionMapInfo(MissionType.getSectionSignByMissionId(_id), _local1.map, this.infoComplete);
        }
        private function canPlayDrama(_arg1:int, _arg2:int):Boolean{
            if (_arg2 == 0){
                return (false);
            };
            return ((MissionType.getVideoLock(_arg1, _arg2) > this.ctrlMission.missionLock));
        }
        private function infoComplete(_arg1:MapInfo):void{
            _info = _arg1;
            _data.call(Mod_Role_Base.get_role_id_list, this.loadResources, []);
        }
        private function loadResources():void{
            var res:* = null;
            _view.war.missionId = _id;
            _view.war.mainRoleSuffix = _playerInfo.signSuffix;
            res = _view.war.getResourcesUrl();
            res.push(_info.urlMini);
            var errorHandler:* = function (_arg1:int):void{
                var _local2:String = ((_arg1 == (res.length - 1))) ? "Can not find MiniMap" : ("Can not find:" + res[_arg1].replace(/^[\s\S]+\//, ""));
                _view.alert.confirm(_local2);
            };
            File.loadList(res, this.miniMapLoaded, showProgress, null, errorHandler);
        }
        private function miniMapLoaded(_arg1:Array):void{
            var _local3:Array;
            var _local2:File = _arg1.pop();
            _view.war.resourcesLoaded(_arg1);
            _content.addChild(this._Map.content);
            this._Map.onCancel = _view.townMap.gotoTownAtId;
            this._Map.onGongLue = this.onGongLue;
            this._Map.initMapinfo(_info);
            this._Map.backMini = _local2.loader.content;
            this._Map.onWar = this.onWar;
            this._Map.onMoveTo = this.move_to;
            this._Map.onSound = this.onSound;
            _playerInfo.x = 200;
            _playerInfo.y = 420;
            this._Map.addPlayer(_playerInfo);
            this._Map.addMonsters(this._monsterList);
            File.loadList([_info.urlMap], this.bgLoad);
            SoundManage.playBgSound(_info.urlSound);
            for each (_local3 in this._dramaList) {
                if (_local3[0] != 0){
                    _view.drama.init(_local3[0], _local3[1]);
                };
            };
            _local3 = this._dramaList[0];
            if (_local3[0] != 0){
                _view.drama.play(_local3[0], this.dramaEnd, false);
                _local3[0] = 0;
            };
            this.enterMapComplete();
        }
        private function dramaEnd(_arg1:Boolean):void{
            if (_arg1){
                this.warStart();
            };
        }
        override protected function enterMapComplete():void{
            super.enterMapComplete();
            _view.mapSwitched(MapViewBase.Mission);
            _ctrl.player.isEnterHeroMission = MissionType.isHeroMission(_id);
            this._Map.soundState = SoundManage.mute;
        }
        private function onGongLue():void{
            _view.strategy.missionId = _id;
            _view.strategy.monsterTeamId = this._mInfo.id;
            _view.strategy.background = this._Map.getMapWarBG();
            _view.strategy.show();
        }
        private function onSound(_arg1:Boolean):void{
            if (_arg1 == true){
                this._Map.soundState = (SoundManage.mute = 1);
            } else {
                this._Map.soundState = (SoundManage.mute = 0);
            };
        }
        private function bgLoad(_arg1:Array):void{
            if (inStage == false){
                return;
            };
            this._Map.backSWF = (_arg1[0].loader.content as IMapSWF);
        }
        public function change_equip_main():void{
            if (inStage == false){
                return;
            };
            _mapBase.updateBodyUrl(_playerInfo.id);
        }
        private function onWar():void{
            closePractice(true);
            MouseCursor.show();
            this.warStart(false);
        }
        private function warStart(_arg1:Boolean=true):void{
            SoundManage.playBgSound("");
            _view.war.isBoss = false;
            _view.war.isLastMonster = (this._monsterList.length == 1);
            _view.war.background = this._Map.getMapWarBG();
            _view.war.monsterTeamId = this._mInfo.id;
            _view.war.onClose = this.warClose;
            _view.war.show();
            this._dramaToWar = _arg1;
        }
        private function warClose(_arg1:Boolean):void{
            var _local2:Array;
            if (_arg1){
                this._warAura = _ctrl.mission.warAura;
                _local2 = this._dramaList[this._mInfo.id];
                if (((_local2) && (!((int(_local2[0]) == 0))))){
                    _view.drama.play(_local2[0], this.warToNext, false);
                    _local2[0] = 0;
                } else {
                    this.warToNext();
                };
            } else {
                this._Map.warClose(false);
            };
            SoundManage.playBgSound(_info.urlSound);
        }
        private function warToNext():void{
            this._monsterList.shift();
            this._Map.warClose(true);
            if (this._dramaToWar){
                this._dramaToWar = false;
                this._Map.movePlayer(_playerInfo.id, (this._mInfo.x + 50), this._mInfo.y);
            };
            if (this._monsterList.length == 0){
                _view.missionRank.show();
            } else {
                this._mInfo = this._monsterList[0];
                this.checkShowWarAura();
            };
        }
        private function checkShowWarAura():void{
            if (this._warAura > 200){
                this._Map.showWarSoul(12, _view.war.auraClass, _view.war.fusionClass);
                setTimeout(showTextEffect, 3000, ((MissionMapViewLang.WuHun + " +") + this._warAura), 41193);
            } else {
                if (this._warAura > 0){
                    this._Map.showWarSoul(6, _view.war.auraClass, _view.war.fusionClass);
                    setTimeout(showTextEffect, 2000, ((MissionMapViewLang.WuHun + " +") + this._warAura), 41193);
                };
            };
        }
        public function gotoNearMonster():void{
            this._Map.gotoNearMonster();
        }
        public function showChest():void{
            this.get_award_list();
            if (this._award == null){
                this._award = (_view.getAssetsObject("MissionRank", "MCMissionGet") as IMissionGet);
            };
            this._award.onPickupClose = this.closeAward;
            this._award.onPickup = this.pickup_award;
            if (this._chest == null){
                this._chest = (_view.getAssetsObject("MissionRank", "MCMissionChest") as IMissionChest);
                _view.tip.iTip.addTarget(this._chest.content, MissionMapViewLang.Chest);
            };
            this._chest.content.addEventListener(MouseEvent.MOUSE_DOWN, this.chestClick);
            this.checkShowWarAura();
        }
        private function closeAward():void{
            if (((this._award) && ((this._award.content.parent == _content)))){
                _content.removeChild(this._award.content);
            };
        }
        private function chestClick(_arg1:MouseEvent):void{
            _arg1.stopPropagation();
            _arg1.stopImmediatePropagation();
            this._chest.goto();
            _view.screen.display.addChild(this._award.content);
            _content.addChild(this._award.content);
            this._award.content.x = (_view.stage.mouseX - 50);
            this._award.content.y = 100;
            if (this._award.content.x > 620){
                this._award.content.x = 620;
            };
        }
        override protected function move_to(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            closePractice(false);
            if ((((_arg1 == _arg3)) && ((_arg2 == _arg4)))){
                endMove();
            } else {
                startMove(_arg1, _arg2, _arg3, _arg4);
            };
        }
        private function enter_mission(_arg1:int):void{
            _data.call(Mod_Mission_Base.enter_mission, this.enter_mission_back, [_arg1], false);
        }
        private function enter_mission_back():void{
            if (this.ctrlMission.result != Mod_Mission_Base.SUCCESS){
                _view.showTip(MissionMapViewLang.LackStamina, "", TipType.Question);
            } else {
                if (this.ctrlMission.missionId == _id){
                    MissionType.loadMissionData(_ctrl.mission.missionId, this.parseMissionData);
                };
            };
        }
        private function pickup_award():void{
            this.closeAward();
            _data.call(Mod_Mission_Base.pickup_award, this.pickup_award_back, []);
        }
        private function pickup_award_back():void{
            var _local1:Array;
            var _local2:Array;
            var _local3:int;
            var _local4:Object;
            var _local5:Object;
            if (this.ctrlMission.pickupAward == Mod_Mission_Base.PICKUP_SUCCESS){
                this._Map.removeOtherFlash("chest");
                gotoLastMap();
            } else {
                _view.showTip(MissionMapViewLang.Full);
                _content.addChild(this._award.content);
                _local1 = this.ctrlMission.awardlist;
                _local2 = this._award.boxList;
                _local3 = 0;
                while (_local3 < 3) {
                    _local4 = _local2[_local3];
                    _local5 = _local1[_local3];
                    if ((((_local5 == null)) || ((_local5.tip == null)))){
                        _local4.reset();
                    };
                    _local3++;
                };
            };
        }
        private function get_award_list():void{
            _data.call(Mod_Mission_Base.open_box, this.get_award_list_back, [], false);
        }
        private function get_award_list_back():void{
            var _local4:Object;
            var _local5:Object;
            if (inStage == false){
                return;
            };
            this._Map.addOtherFlash("chest", this._chest.content, this._mInfo.x, this._mInfo.y);
            this._chest.initChest();
            var _local1:Array = this.ctrlMission.awardlist;
            var _local2:Array = this._award.boxList;
            var _local3:int;
            while (_local3 < 3) {
                _local4 = _local2[_local3];
                _local5 = _local1[_local3];
                _local4.reset();
                _view.tip.iTip.removeTarget((_local4 as Sprite));
                if (_local5 != null){
                    _local4.init(_local5.url, _local5.num, _local5.name);
                    if (_local5.tip != null){
                        _view.tip.iTip.addTarget((_local4 as Sprite), _local5.tip);
                    };
                };
                _local3++;
            };
        }

    }
}//package com.views 

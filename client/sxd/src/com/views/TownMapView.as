//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.display.*;
    import com.haloer.net.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.views.map.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.map.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class TownMapView extends MapViewBase {

        private var _Map:ITownMap;
        private var _guideLayder:Sprite;
        private var _showWhatsNew:Boolean = false;
        private var _playShuShanDrama:Boolean = false;

        public function TownMapView(){
            this._guideLayder = new Sprite();
            super();
        }
        public function init():void{
            _mapBase = (this._Map = MapStatic.mapInstance.town);
        }
        public function get guideLayder():Sprite{
            return (this._guideLayder);
        }
        public function get townSign():String{
            return (TownType.getSign(_id));
        }
        public function gotoTownAtId(_arg1:int=0):void{
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            _view.screen.currentMap = this;
            _id = ((((_arg1) || (ctrlPlayer.townMapId))) || (1));
            _view.initLoading.tip = _loadTips[(getTimer() % _loadTips.length)];
            _view.initLoading.show();
            _view.initLoading.loading1(TownMapViewLang.Tip1);
            this.enter_town();
        }
        private function infoComplete(_arg1:MapInfo):void{
            _info = _arg1;
            _view.initLoading.loading1(TownMapViewLang.Tip2);
            File.loadList([_info.urlMini], this.miniMapLoaded);
        }
        private function miniMapLoaded(_arg1:Array):void{
            var _local3:String;
            var _local4:PortalInfo;
            var _local5:BuildInfo;
            var _local6:NPCInfo;
            _content.addChild(this._Map.content);
            _content.addChild(this._guideLayder);
            this._Map.backMini = _arg1[0].loader.content;
            this._Map.onMoveTo = move_to;
            this._Map.onNpcSpeak = this.onNpcSpeak;
            this._Map.onBuildClick = this.onBuildClick;
            this._Map.onPortal = this.onPortal;
            this._Map.onNpcRange = this.onNpcRange;
            this._Map.onMapClick = this.onMapClick;
            this._Map.onUpdateXY = this.onUpdateXY;
            this._Map.initMapinfo(_info);
            var _local2:Object = TownType.getNPCList(_id);
            for (_local3 in _local2) {
                _local2[_local3].sign = _local3;
                _local6 = new NPCInfo(_local2[_local3]);
                if (_local6.type != NPCType.FactionGodNPC){
                    this._Map.addNPC(_local6);
                };
            };
            for each (_local4 in _info.portals) {
                this._Map.addPortal(_local4);
            };
            for each (_local5 in _info.builds) {
                this._Map.addBuild(_local5);
            };
            this._Map.addPlayer(_playerInfo);
            this._Map.updateNpcLoack(_ctrl.player.functionLock);
            SoundManage.playBgSound(_info.urlSound);
            File.loadList([_info.urlMap], this.bgLoadedHandler(_id));
            this.enterMapComplete();
        }
        private function bgLoadedHandler(_arg1:int):Function{
            var townId:* = _arg1;
            return (function (_arg1:Array):void{
                if (inStage == false){
                    return;
                };
                if (townId == _id){
                    _Map.backSWF = (_arg1[0].loader.content as IMapSWF);
                };
            });
        }
        public function quitJiHuiSuo():void{
            if (ctrlPlayer.jihuisuoId != 0){
                this.gotoTownAtId(ctrlPlayer.townMapId);
            };
        }
        override protected function enterMapComplete():void{
            super.enterMapComplete();
            get_players();
            _view.mapSwitched(MapViewBase.Town);
            _view.toolbar.miniMap.mapName = TownType.getName(_id);
            _view.toolbar.soundMute((SoundManage.mute == 0));
            if (ctrlPlayer.isEnterHeroMission){
                ctrlPlayer.isEnterHeroMission = false;
                _view.heroMission.show();
            };
            ItemInfo.playerlv = ctrlPlayer.level;
            if (this._showWhatsNew){
                this._showWhatsNew = false;
                _view.whatsNew.show();
            };
        }
        public function playShuShangDrama():void{
            SoundManage.playBgSound("");
            _view.drama.init(0xFFFFFF, "YuJianFeiXing.xml");
            _view.drama.play(0xFFFFFF, this.dramaEnd, false);
        }
        private function dramaEnd():void{
            _view.drama.dramaClear();
            this.gotoTownAtId(TownType.getId(TownType.ShuShanCheng));
        }
        protected function onMapClick(_arg1:Object, _arg2:int, _arg3:int):void{
            _view.otherHead.info = (_arg1 as PlayerInfo);
            _view.otherHead.show();
            _view.quest.haltWayFinding();
        }
        private function onUpdateXY(_arg1:int, _arg2:int):void{
            this._guideLayder.x = -(_arg1);
            this._guideLayder.y = -(_arg2);
        }
        private function onPortal(_arg1:PortalInfo):void{
            if (_view.tower.inStage){
                return;
            };
            if (_view.serverWarCup.inStage){
                return;
            };
            if (ctrlPlayer.jihuisuoId != 0){
                this.gotoTownAtId(ctrlPlayer.townMapId);
            } else {
                _view.chooseMission.show();
            };
            _view.quest.finishWayFinding();
        }
        public function moveToPortal(_arg1:Boolean=false):void{
            if (inStage == false){
                return;
            };
            this._Map.moveToPortal(_arg1);
        }
        private function onNpcSpeak(_arg1:NPCInfo):void{
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            _view.npcDialog.townNPCId = _arg1.id;
            _view.npcDialog.npcSign = _arg1.sign;
            _view.npcDialog.switchSelf();
        }
        private function onBuildClick(_arg1:BuildInfo):void{
            if (_arg1.id == 1){
                _view.factionBlessing.show();
            } else {
                if (_arg1.id == 2){
                    _view.factionEat.joinEat();
                } else {
                    if (_arg1.id == 3){
                        _view.factionRollCake.switchSelf();
                    };
                };
            };
        }
        public function setBuildGetVisible(_arg1:int, _arg2:Boolean):void{
            this._Map.setBuildGetVisible(_arg1, _arg2);
        }
        public function getBuildTarget(_arg1:int):Sprite{
            return (this._Map.getBuildTarget(_arg1));
        }
        private function onNpcRange(_arg1:NPCInfo):void{
            var _local2:NPCDialogView = _view.npcDialog;
            if ((((_arg1 == null)) || (!((_local2.townNPCId == _arg1.id))))){
                _local2.close();
            };
        }
        public function moveToNPCAtId(_arg1:int):void{
            if (inStage == false){
                return;
            };
            this._Map.moveToNPCAtId(_arg1);
        }
        public function resetNPCHead(_arg1:Object):void{
            var _local2:int;
            if (inStage == false){
                return;
            };
            this._Map.resetNPCHead(_arg1);
            if (_ctrl.quest.masterLock >= QuestType.getLock(60)){
                _local2 = URI.gameVersion;
                if ((((ctrlPlayer.lastPlayVersion < _local2)) && ((this._playShuShanDrama == false)))){
                    this._playShuShanDrama = true;
                    this._showWhatsNew = true;
                    this.playShuShangDrama();
                };
            } else {
                if (this.townSign == TownType.JingCheng){
                    _view.drama.init(0xFFFFFF, "YuJianFeiXing.xml");
                };
            };
        }
        public function set otherCount(_arg1:int):void{
            if (inStage == false){
                return;
            };
            this._Map.otherCount = _arg1;
        }
        public function otherShow():void{
            if (inStage == false){
                return;
            };
            this._Map.otherVisible = true;
        }
        public function otherHide():void{
            if (inStage == false){
                return;
            };
            this._Map.otherVisible = false;
        }
        override protected function enter_town():void{
            super.enter_town();
            var _local1:String = TownType.getSign(_id);
            var _local2:int = ctrlPlayer.level;
            ctrlMap.maxCount = 500;
            if ((((_local1 == TownType.XiaoYuCun)) && ((_local2 < 10)))){
                ctrlMap.maxCount = 70;
            };
        }
        override protected function enter_town_back():void{
            var _local3:PlayerInfo;
            var _local1:Array = ctrlMap.entownList;
            var _local2:int;
            for each (_local2 in _local1) {
                _local3 = ctrlMap.getPlayerInfo(_local2);
                if (_playerInfo.id == _local2){
                    if (ctrlMap.result == Mod_Town_Base.SUCCESS){
                        ctrlPlayer.setNewMapId(_id);
                        getTownMapInfo(TownType.getSign(_id), this.infoComplete);
                    } else {
                        _view.alert.confirm(Lang.sprintf(TownMapViewLang.Tip4, TownType.getName(_id)), this.gotoTownAtId);
                    };
                };
            };
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.display.*;
    import com.haloer.net.*;
    import com.controllers.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.view.info.*;
    import com.haloer.display.*;
    import com.views.map.*;
    import com.assist.view.interfaces.factionWar.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.map.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FactionWarMapView extends MapViewBase {

        private var _Map:IFactionWarMap;
        private var _factionMsg:IFactionMapMsg;
        private var _inWar:Boolean = false;
        private var _zhanbaoList:Array;
        private var _zhanbaoTime:int = 0;
        private var autoOutTime:int = 0xFFFFFF;

        public function FactionWarMapView(){
            this._zhanbaoList = [];
            super();
        }
        public function init():void{
            _mapBase = (this._Map = MapStatic.mapInstance.faction);
        }
        override public function clear():void{
            super.clear();
            _data.cancelPatch(Mod_FactionWar_Base.send_versus_fight_data);
            _data.cancelPatch(Mod_FactionWar_Base.notify_round_over);
            this._zhanbaoList = [];
        }
        private function get ctrlWar():FactionWarMapController{
            return (_ctrl.factionWarMap);
        }
        override public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            super.reposition(_arg1);
            this._factionMsg.reposition(MapStatic.stageW, MapStatic.stageH);
        }
        public function gotoFactionWar():void{
            if (inStage == true){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.getPeach.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            _inStageTipTitle = FactionWarMapViewLang.inFactionWar;
            _inStageTipContent = "";
            _id = this.ctrlWar.warTownId;
            _view.screen.currentMap = this;
            _view.initLoading.tip = _loadTips[(getTimer() % _loadTips.length)];
            _view.initLoading.show();
            _view.initLoading.loading1(FactionWarMapViewLang.LoadingTip);
            this.enter_town();
        }
        private function infoComplete(_arg1:MapInfo):void{
            _info = _arg1;
            var _local2:Array = [_info.urlMini];
            if (this._factionMsg == null){
                _local2.push((URI.assetsUrl + "faction_map_msg.swf"));
            };
            File.loadList(_local2, this.miniMapLoaded);
        }
        private function miniMapLoaded(_arg1:Array):void{
            if (this._factionMsg == null){
                this._factionMsg = ((_arg1[1] as File).getClassObject("MCFactionMapMsg") as IFactionMapMsg);
            };
            _content.addChild(this._Map.content);
            _content.addChild(this._factionMsg.content);
            this._factionMsg.reposition(MapStatic.stageW, MapStatic.stageH);
            this._factionMsg.reset();
            this._factionMsg.onRankOK = this.onCancel;
            this._factionMsg.onCancel = this.onCancel;
            this._factionMsg.onCup = this.onCup;
            var _local2:Array = this.ctrlWar.warMapList;
            this._factionMsg.TFLv1 = _local2[0].lv;
            this._factionMsg.TFName1 = _local2[0].name;
            this._factionMsg.TFNum1 = 0;
            this._factionMsg.TFLv2 = _local2[1].lv;
            this._factionMsg.TFName2 = _local2[1].name;
            this._factionMsg.TFNum2 = 0;
            this._factionMsg.factionCount = this.ctrlWar.roundWarIdx;
            this._factionMsg.addMsgShow(Lang.sprintf(FactionWarMapViewLang.AddFactionWarMap, htmlFormat(_playerInfo.name, 12, _playerInfo.nameColor)));
            this._Map.backMini = (_arg1[0].loader.content as Bitmap);
            this._Map.onMoveTo = move_to;
            this._Map.onWar = this.onWar;
            this._Map.initMapinfo(_info);
            this._Map.initFactionList(_local2);
            this._Map.addPlayer(_playerInfo);
            File.loadList([_info.urlMap], this.bgLoadedHandler);
            this.enterMapComplete();
        }
        private function bgLoadedHandler(_arg1:Array):void{
            if (inStage == false){
                return;
            };
            this._Map.backSWF = (_arg1[0].loader.content as IMapSWF);
        }
        override protected function enterMapComplete():void{
            super.enterMapComplete();
            _view.mapSwitched(MapViewBase.FactionWar);
            _view.addToTimerProcessList((this + ""), this.timerProcess);
            _view.miniFactionWar.startPreload();
            _data.patch(Mod_FactionWar_Base.send_versus_fight_data, this.send_versus_fight_data_back);
            _data.patch(Mod_FactionWar_Base.notify_round_over, this.notify_round_over_back);
            get_players();
            SoundManage.playBgSound((URI.mapUrl + "sound/FactionWarMap2.mp3"));
            this._inWar = false;
            this.updateWarTipMsg();
        }
        private function timerProcess():void{
            var _local2:Object;
            if (inStage == false){
                return;
            };
            var _local1:Array = this.ctrlWar.warStatusList;
            for each (_local2 in _local1) {
                if (_local2.time == 0){
                    _local2.aInfo.warState = 2;
                    _local2.bInfo.warState = 2;
                    this._Map.updatePlayerWarState(_local2.aInfo.id);
                    this._Map.updatePlayerWarState(_local2.bInfo.id);
                } else {
                    this._zhanbaoList.push(_local2);
                };
            };
            if (this._zhanbaoList.length == 0){
                this._zhanbaoTime = getTimer();
            } else {
                if (this._zhanbaoTime == -1){
                    while (this._zhanbaoList.length > 0) {
                        _local2 = this._zhanbaoList.shift();
                        _local2.aInfo.warState = _local2.aSate;
                        _local2.bInfo.warState = _local2.bSate;
                        this._Map.updatePlayerWarState(_local2.aInfo.id);
                        this._Map.updatePlayerWarState(_local2.bInfo.id);
                        this._factionMsg.addMsgShow(_local2.msg);
                    };
                    this.updateWarPlayerNum();
                } else {
                    if ((this._zhanbaoTime + 3000) < getTimer()){
                        this._zhanbaoTime = getTimer();
                        _local2 = this._zhanbaoList.shift();
                        _local2.aInfo.warState = _local2.aSate;
                        _local2.bInfo.warState = _local2.bSate;
                        this._Map.updatePlayerWarState(_local2.aInfo.id);
                        this._Map.updatePlayerWarState(_local2.bInfo.id);
                        this._factionMsg.addMsgShow(_local2.msg);
                        this.updateWarPlayerNum();
                    };
                };
            };
        }
        private function onCancel():void{
            this.autoOutTime = 0xFFFFFF;
            _view.removeFromTimerProcessList("FactionWarMapViewTimeOut");
            gotoLastMap();
        }
        private function onCup():void{
            _view.factionTable.show();
        }
        public function updateWarTipMsg():void{
            var _local1:Image;
            if (inStage == false){
                return;
            };
            if (this.ctrlWar.intoTime > 0){
                this._factionMsg.toWait(this.ctrlWar.intoTime);
            } else {
                this._factionMsg.toWar(this.ctrlWar.warTime);
                this._Map.startFactionWar();
                SoundManage.playBgSound((URI.mapUrl + "sound/FactionWarMap1.mp3"));
                _popup.closeAll();
                _local1 = new Image((MapStatic.FolderEffects + "FactionWarGo.swf"));
                _local1.mouseChildren = false;
                _local1.mouseEnabled = false;
                _content.addChild(_local1);
            };
        }
        private function onWar(_arg1:PlayerInfo):void{
            _data.call(Mod_FactionWar_Base.fight_player, null, [_arg1.id]);
        }
        private function warStart():void{
            this._inWar = true;
            var _local1:WarData = this.ctrlWar.warData;
            var _local2:Array = this.ctrlWar.awardData;
            _view.miniFactionWar.warData = _local1;
            _view.miniFactionWar.onClose = this.warClose;
            _view.miniFactionWar.awardCoin = _local2[0];
            _view.miniFactionWar.awardExp = _local2[1];
            _view.miniFactionWar.awardFame = _local2[2];
            _view.miniFactionWar.show();
        }
        private function warClose(_arg1:Boolean):void{
            if (this.ctrlWar.hasWarData){
                this.warStart();
            } else {
                this._inWar = false;
                this._zhanbaoTime = -1;
            };
        }
        public function get isFactionWarStart():Boolean{
            if (((inStage) && ((this.ctrlWar.intoTime <= 0)))){
                _view.showTip(FactionWarMapViewLang.Inoperable);
                return (true);
            };
            return (false);
        }
        private function updateWarPlayerNum():void{
            var _local1:Array = this.ctrlWar.warMapList;
            var _local2:int = _local1[0].list.length;
            var _local3:int = _local1[1].list.length;
            this._factionMsg.TFNum1 = _local2;
            this._factionMsg.TFNum2 = _local3;
            if (this.ctrlWar.intoTime <= 0){
                if (_local2 > _local3){
                    this._factionMsg.TopIdx = 1;
                } else {
                    if (_local2 < _local3){
                        this._factionMsg.TopIdx = 2;
                    } else {
                        this._factionMsg.TopIdx = 0;
                    };
                };
            };
        }
        public function showWorldNotice(_arg1:String):void{
            if (this._inWar == false){
                this._view.worldNotice.showMessage(_arg1);
            } else {
                setTimeout(this.showWorldNotice, 2000, _arg1);
            };
        }
        override protected function enter_town():void{
            super.enter_town();
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
                        this.get_faction_war_info();
                    } else {
                        _view.alert.confirm(FactionWarMapViewLang.IntoFails, gotoLastMap);
                    };
                };
            };
        }
        override protected function get_players_back():void{
            var _local3:PlayerInfo;
            var _local1:Array = ctrlMap.entownList;
            var _local2:int;
            for each (_local2 in _local1) {
                if (_local2 != _playerInfo.id){
                    _local3 = ctrlMap.getPlayerInfo(_local2);
                    _mapBase.addPlayer(_local3);
                    this._factionMsg.addMsgShow(Lang.sprintf(FactionWarMapViewLang.AddFactionWarMap, htmlFormat(_local3.name, 12, _local3.nameColor)));
                };
            };
            this.updateWarPlayerNum();
        }
        override protected function leave_town_back():void{
            super.leave_town_back();
            this.updateWarPlayerNum();
        }
        private function get_faction_war_info():void{
            _data.call(Mod_FactionWar_Base.get_faction_war_info, this.get_faction_war_info_back, []);
        }
        private function get_faction_war_info_back():void{
            getTownMapInfo(TownType.getSign(_id), this.infoComplete);
        }
        private function send_versus_fight_data_back():void{
            if (this._inWar == false){
                this.warStart();
                closePractice(true);
                this._Map.stop();
                MouseCursor.show();
            };
        }
        private function notify_round_over_back():void{
            if (inStage == false){
                return;
            };
            if (this._inWar == false){
                this._factionMsg.toEnd((_playerInfo.factionId == this.ctrlWar.winId), this.ctrlWar.killRank);
            } else {
                setTimeout(this.notify_round_over_back, 2000);
            };
            if (this.autoOutTime == 0xFFFFFF){
                this.autoOutTime = (getTimer() + 50000);
                _view.addToTimerProcessList("FactionWarMapViewTimeOut", this.FactionWarMapViewTimeOut);
            };
        }
        private function FactionWarMapViewTimeOut():void{
            if (this.autoOutTime < getTimer()){
                this.onCancel();
            };
        }

    }
}//package com.views 

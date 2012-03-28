//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.view.*;
    import com.controllers.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.views.map.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.view.map.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class WorldBossMapView extends MapViewBase {

        private var _updateTimeSign:String = "WorldBossMapView_updateTimeSign";
        private var _warTime:int = 0;
        private var _Map:IWorldBossMap;
        private var _bossUI:IWorldBossMapMsg;
        private var _bossInfo:BossInfo;
        private var _closeTip:Array = null;
        private var guwuType:int = 0;

        public function WorldBossMapView(){
            _inStageTipTitle = WorldBossMapViewLang.WorldBossTip;
            _inStageTipContent = "";
        }
        public function init():void{
            _mapBase = (this._Map = MapStatic.mapInstance.boss);
        }
        override public function clear():void{
            super.clear();
            _data.cancelPatch(Mod_WorldBoss_Base.hurt_world_boss);
            _data.cancelPatch(Mod_WorldBoss_Base.player_death_cd);
            _data.cancelPatch(Mod_WorldBoss_Base.update_world_boss_position);
            _data.cancelPatch(Mod_WorldBoss_Base.player_world_boss_buff);
            _data.cancelPatch(Mod_WorldBoss_Base.fight_world_boss);
            _view.toolbar.updateWorldBossInspireBuffer(0, MonsterType.BossChiYanShou);
            _view.toolbar.updateWorldBossInspireBuffer(0, MonsterType.BossQingTianMu);
            _view.toolbar.updateWorldBossInspireBuffer(0, MonsterType.BossDaoBaTu);
            _view.removeFromTimerProcessList(this._updateTimeSign);
            this._closeTip = null;
        }
        override public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            super.reposition();
            this._bossUI.reposition();
        }
        private function get ctrlBoss():WorldBossMapController{
            return (_ctrl.worldBossMap);
        }
        public function gotoBossTown(_arg1:int):void{
            if (_view.getPeach.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            _id = _arg1;
            this._bossInfo = this.ctrlBoss.getBossObjAtTownId(_arg1);
            this.ctrlBoss.nowBoss = this._bossInfo;
            _view.screen.currentMap = this;
            _view.initLoading.tip = _loadTips[(getTimer() % _loadTips.length)];
            _view.initLoading.show();
            _view.initLoading.loading1(WorldBossMapViewLang.EnterTownTip);
            this.enter_town();
        }
        private function infoComplete(_arg1:MapInfo):void{
            _info = _arg1;
            _data.call(Mod_Role_Base.get_role_id_list, this.loadResources, []);
        }
        private function loadResources():void{
            var res:* = null;
            _view.worldBossWar.worldBossId = this._bossInfo.bossId;
            _view.worldBossWar.mainRoleSuffix = _playerInfo.signSuffix;
            res = _view.worldBossWar.getResourcesUrl();
            var errorHandler:* = function (_arg1:int):void{
                var _local2:String = ((_arg1 == (res.length - 1))) ? "Can not find MiniMap" : ("Can not find:" + res[_arg1].replace(/^[\s\S]+\//, ""));
                _view.alert.confirm(_local2);
            };
            var oneComplete:* = function (_arg1:int):void{
            };
            res.push(_info.urlMini);
            res.push((URI.assetsUrl + "world_boss_msg.swf"));
            res.push((((URI.screenUrl + "stand/") + this._bossInfo.sign) + ".swf"));
            File.loadList(res, this.miniMapLoaded, showProgress, oneComplete, errorHandler);
        }
        private function miniMapLoaded(_arg1:Array):void{
            var _local4:MovieClip;
            _arg1.pop();
            var _local2:File = _arg1.pop();
            var _local3:File = _arg1.pop();
            _view.worldBossWar.resourcesLoaded(_arg1);
            if (this._bossUI == null){
                this._bossUI = (_local2.getClassObject("WorldBossMapUI") as IWorldBossMapMsg);
                this._bossUI.btnCancel.addEventListener(MouseEvent.CLICK, this.onCancel);
                this._bossUI.btnExp.addEventListener(MouseEvent.CLICK, this.onExp);
                this._bossUI.btnIngot.addEventListener(MouseEvent.CLICK, this.onIngot);
                this._bossUI.btnReset.addEventListener(MouseEvent.CLICK, this.onReset);
                this._bossUI.btnAutoJoin.addEventListener(MouseEvent.CLICK, this.onAutoJoin);
                _view.tip.iTip.addTarget(this._bossUI.btnIngot, HtmlText.yellow2(WorldBossMapViewLang.InspireTip));
                _local4 = (_local2.getClassObject("MCFuHuo") as MovieClip);
                _local4.addEventListener(MouseEvent.CLICK, this.onFuHuo);
                this._Map.fuhuoMC = _local4;
            };
            _view.tip.iTip.addTarget(this._bossUI.btnExp, Lang.sprintf(WorldBossMapViewLang.InspireAdd, ctrlPlayer.skill));
            _view.tip.iTip.addTarget(this._bossUI.btnReset, HtmlText.yellow2(Lang.sprintf(WorldBossMapViewLang.ResetTip, (this._bossInfo.resetIngot + WorldBossMapViewLang.Ingot), this._bossInfo.resetCount)));
            this._bossUI.reset();
            this._bossUI.btnIngot.visible = (ctrlPlayer.vipLevel >= 3);
            this._bossUI.btnReset.visible = (ctrlPlayer.vipLevel >= 3);
            this._bossUI.bossName = (("<b>" + Lang.sprintf(WorldBossMapViewLang.Lv, this._bossInfo.name, this._bossInfo.lv)) + "</b>");
            this._bossUI.bossFrame = this._bossInfo.bossId;
            this._bossUI.liftMax = this._bossInfo.lifeMax;
            this._bossUI.lift = this._bossInfo.life;
            this._bossUI.guwuString = ((this._bossInfo.guwu)!=0) ? Lang.sprintf(WorldBossMapViewLang.Inspire, this._bossInfo.guwu) : "";
            this._bossUI.btnAutoJoin.visible = (ctrlPlayer.level >= 50);
            this.autoJoinFrame = 1;
            _content.addChild(this._Map.content);
            _content.addChild(this._bossUI.content);
            this._Map.backMini = _local3.bitmap;
            this._Map.onMoveTo = move_to;
            this._Map.onWar = this.onWar;
            this._Map.initMapinfo(_info);
            this._Map.addMonster(this._bossInfo);
            this._Map.addPlayer(_playerInfo);
            File.loadList([_info.urlMap], this.bgLoad);
            this.enterMapComplete();
        }
        private function bgLoad(_arg1:Array):void{
            if (inStage == false){
                return;
            };
            this._Map.backSWF = (_arg1[0].loader.content as IMapSWF);
        }
        override protected function enterMapComplete():void{
            super.enterMapComplete();
            _view.mapSwitched(MapViewBase.WorldBoss);
            _view.toolbar.updateWorldBossInspireBuffer(this._bossInfo.guwu, this._bossInfo.sign);
            _view.addToTimerProcessList(this._updateTimeSign, this.updateTime);
            this.updateTime();
            SoundManage.playBgSound(_info.urlSound);
            get_players();
            _data.patch(Mod_WorldBoss_Base.hurt_world_boss, this.hurt_world_boss_back);
            _data.patch(Mod_WorldBoss_Base.update_world_boss_position, this.update_world_boss_position_back);
            _data.patch(Mod_WorldBoss_Base.player_death_cd, this.player_death_cd_back);
            _data.patch(Mod_WorldBoss_Base.player_world_boss_buff, this.player_world_boss_buff_back);
            _data.patch(Mod_WorldBoss_Base.fight_world_boss, this.fight_world_boss_back);
        }
        private function onExp(_arg1:Event):void{
            checkBoxSelect1("BossCookie2", WorldBossMapViewLang.SkillToWar, this.strengthen_combat_0);
        }
        private function onIngot(_arg1:Event):void{
            checkBoxSelect2(ConsumeAlertSetType.BossCookie3, Lang.sprintf(WorldBossMapViewLang.SkillToWarAsk, HtmlText.yellow2(("20" + WorldBossMapViewLang.Ingot))), this.strengthen_combat_1);
        }
        private function onReset(_arg1:Event):void{
            if (this._bossInfo.resetCount == 0){
                _view.showTip(WorldBossMapViewLang.ResetOver);
            } else {
                if (this._bossInfo.state == 4){
                    _view.showTip(WorldBossMapViewLang.ChallengeFails);
                } else {
                    checkBoxSelect2(ConsumeAlertSetType.BossCookie4, Lang.sprintf(WorldBossMapViewLang.ResetToWarAsk, HtmlText.yellow2((this._bossInfo.resetIngot + WorldBossMapViewLang.Ingot))), this.super_reborn);
                };
            };
        }
        private function onFuHuo(_arg1:Event):void{
            checkBoxSelect2(ConsumeAlertSetType.BossCookie1, Lang.sprintf(WorldBossMapViewLang.ReviveAsk, HtmlText.yellow2(("2" + WorldBossMapViewLang.Ingot))), this.clear_death_cd);
        }
        private function onCancel(_arg1:Event):void{
            _view.townMap.gotoTownAtId();
        }
        private function onAutoJoin(_arg1:Event):void{
            this.autoJoinFrame = ((this.autoJoinFrame & 1) + 1);
        }
        private function set autoJoinFrame(_arg1:int):void{
            this._bossUI.btnAutoJoin.gotoAndStop(_arg1);
            this._bossUI.mcAutoWar.visible = (_arg1 == 2);
        }
        private function get autoJoinFrame():int{
            return (this._bossUI.btnAutoJoin.currentFrame);
        }
        private function get isAutoWar():Boolean{
            return ((((this._bossUI.btnAutoJoin.visible == true)) && ((this._bossUI.btnAutoJoin.currentFrame == 2))));
        }
        private function get canToWar():Boolean{
            if (_view.worldBossWar.opened == true){
                return (false);
            };
            if (this._bossInfo.state != 1){
                return (false);
            };
            if ((getTimer() - this._warTime) < 4000){
                return (false);
            };
            return (true);
        }
        private function onWar(_arg1:Boolean=true):void{
            if (_playerInfo.warState != 0){
                return;
            };
            if (this.canToWar == false){
                return;
            };
            closePractice(true);
            MouseCursor.show();
            if (_arg1 == true){
                this.fight_world_boss();
            };
        }
        private function onWarClose(_arg1:Boolean):void{
            this._Map.warClose(_arg1);
            SoundManage.playBgSound(_info.urlSound);
            this.reset_death_cd();
        }
        public function updateBossOpen():void{
            if (inStage == false){
                return;
            };
            if (this.ctrlBoss.notifyBoss.bossId != this._bossInfo.bossId){
                return;
            };
            this._data.call(Mod_WorldBoss_Base.get_world_boss_data, null, []);
        }
        public function updateBossOver():void{
            if ((((inStage == false)) || (!((this.ctrlBoss.notifyBoss.bossId == this._bossInfo.bossId))))){
                _view.worldNotice.showMessage(this.ctrlBoss.notifyBoss.worldTips);
            } else {
                this._bossUI.lift = 0;
                this._Map.bossKill();
                this._closeTip = [this.ctrlBoss.notifyBoss.worldTips, WorldBossMapViewLang.BossOver];
            };
        }
        public function updateBossKill():void{
            if ((((inStage == false)) || (!((this.ctrlBoss.notifyBoss.bossId == this._bossInfo.bossId))))){
                _view.worldNotice.showMessage(this.ctrlBoss.notifyBoss.worldTips);
            } else {
                this._bossUI.lift = 0;
                this._Map.bossKill();
                this._closeTip = [this.ctrlBoss.notifyBoss.worldTips, WorldBossMapViewLang.BossKill];
            };
        }
        public function timeFormat(_arg1:int):String{
            if (_arg1 <= 0){
                return ("00:00:00");
            };
            var _local2:int = (_arg1 / 60);
            _arg1 = (_arg1 % 60);
            var _local3:int = (_local2 / 60);
            _local2 = (_local2 % 60);
            if (_local3 > 0){
                return (((((_local3.toString() + ":") + ((_local2)>9) ? _local2.toString() : ("0" + _local2.toString())) + ":") + ((_arg1)>9) ? _arg1.toString() : ("0" + _arg1.toString())));
            };
            return (((((_local2)>9) ? _local2.toString() : ("0" + _local2.toString()) + ":") + ((_arg1)>9) ? _arg1.toString() : ("0" + _arg1.toString())));
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
                        if (_local3.warState > 0){
                            _local3.warState = (getTimer() + (_local3.warState * 1000));
                        };
                        ctrlPlayer.setNewMapId(_id);
                        this.get_world_boss_data();
                    } else {
                        if (ctrlMap.result == Mod_Town_Base.FULL){
                            _view.alert.confirm(WorldBossMapViewLang.PeopleFull, gotoLastMap);
                        } else {
                            if (ctrlMap.result == Mod_Town_Base.NOT_ENOUGH_INGOT){
                                _view.alert.confirm(WorldBossMapViewLang.IngotLack, gotoLastMap);
                            } else {
                                _view.alert.confirm(WorldBossMapViewLang.BossOver, gotoLastMap);
                            };
                        };
                    };
                };
            };
        }
        private function get_world_boss_data():void{
            _data.call(Mod_WorldBoss_Base.get_world_boss_data, this.get_world_boss_data_back, []);
        }
        private function get_world_boss_data_back():void{
            getTownMapInfo(TownType.getSign(_id), this.infoComplete);
        }
        private function updateTime():void{
            var _local1:int;
            this._Map.zhangAiVisible = (this._bossInfo.state == 4);
            this._bossUI.timeString = "";
            this._bossUI.msgString = (WorldBossMapViewLang.PeopleCount + this.playerCount);
            if (this._bossInfo.state == 1){
                _local1 = ((this._bossInfo.time - getTimer()) * 0.001);
                this._bossUI.msgString = ((((WorldBossMapViewLang.PeopleCount + this.playerCount) + " ") + WorldBossMapViewLang.TimeLeft) + this.timeFormat(_local1));
                this.get_defeat_record_list();
                this.player_count();
                if ((((((this.isAutoWar == true)) && ((_playerInfo.warState == 0)))) && ((this.canToWar == true)))){
                    this._Map.movePlayerToBoss();
                };
            } else {
                if (this._bossInfo.state == 4){
                    this.player_count();
                    _local1 = ((this._bossInfo.time - getTimer()) * 0.001);
                    this._bossUI.timeString = ((htmlFormat(WorldBossMapViewLang.About, 16, 0xEEEEEE, true) + "\n") + htmlFormat(this.timeFormat(_local1), 30, 0xEEEEEE, true));
                } else {
                    if (((((this._closeTip) && ((_view.worldBossWar.opened == false)))) && (((getTimer() - this._warTime) > 2000)))){
                        _view.worldNotice.showMessage(this._closeTip[0]);
                        _view.alert.confirm(this._closeTip[1], gotoLastMap);
                        this._closeTip = null;
                    };
                };
            };
        }
        private function player_count():void{
            if (this._bossInfo.bossId == BossInfo.BossDaoBaTu){
                return;
            };
            _data.call(Mod_Town_Base.player_count, null, []);
        }
        private function get playerCount():int{
            if (this._bossInfo.bossId != BossInfo.BossDaoBaTu){
                return (ctrlMap.playercount);
            };
            return (ctrlMap.count);
        }
        public function player_world_boss_buff_back():void{
            _view.toolbar.updateWorldBossInspireBuffer(this._bossInfo.guwu, this._bossInfo.sign);
            this._bossUI.guwuString = ((this._bossInfo.guwu)!=0) ? Lang.sprintf(WorldBossMapViewLang.Inspire, this._bossInfo.guwu) : "";
            _view.tip.iTip.addTarget(this._bossUI.btnReset, HtmlText.yellow2(Lang.sprintf(WorldBossMapViewLang.ResetTip, (this._bossInfo.resetIngot + WorldBossMapViewLang.Ingot), this._bossInfo.resetCount)));
        }
        private function get_defeat_record_list():void{
            _data.call(Mod_WorldBoss_Base.get_defeat_record_list, this.getDefeatRecordList, [this._bossInfo.bossId]);
        }
        private function getDefeatRecordList():void{
            this._bossUI.killRank = this._bossInfo.recordList;
        }
        private function hurt_world_boss_back():void{
            if (this._bossInfo.hurtList.length > 0){
                this._bossUI.addHurtList(this._bossInfo.hurtList);
            };
        }
        private function player_death_cd_back():void{
            var _local2:Object;
            var _local3:PlayerInfo;
            var _local1:Array = this._bossInfo.fuhuoList;
            for each (_local2 in _local1) {
                _local3 = ctrlMap.getPlayerInfo(_local2.id);
                _local3.warState = _local2.time;
                if (((((_local3.isMine) && ((_local3.warState > 0)))) && ((this.isAutoWar == false)))){
                    setTimeout(this._Map.updatePlayerState, 3000, _local3.id);
                } else {
                    this._Map.updatePlayerState(_local3.id);
                };
            };
            this._bossInfo.fuhuoList = [];
        }
        private function clear_death_cd():void{
            _data.call(Mod_WorldBoss_Base.clear_death_cd, this.clear_death_cd_back, []);
        }
        private function clear_death_cd_back():void{
            var _local1:int = this.ctrlBoss.result;
            if (_local1 == Mod_WorldBoss_Base.ACTION_SUCCESS){
                _view.showTip(WorldBossMapViewLang.ResetSuccess, "", TipType.Success);
                _playerInfo.warState = 0;
                this._Map.updatePlayerState(_playerInfo.id);
            } else {
                if (_local1 == Mod_WorldBoss_Base.NOT_ENOUGH_INGOT){
                    _view.showTip(WorldBossMapViewLang.IngotLack);
                } else {
                    _view.showTip(WorldBossMapViewLang.Fails);
                };
            };
        }
        private function reset_death_cd(_arg1:int=0):void{
        }
        private function reset_death_cd_back():void{
        }
        private function update_world_boss_position_back():void{
            this._Map.bossMoveto(this._bossInfo.x, this._bossInfo.y);
        }
        private function super_reborn():void{
            if (this.canToWar == false){
                return;
            };
            this._warTime = getTimer();
            this.autoJoinFrame = 1;
            _data.call(Mod_WorldBoss_Base.super_reborn, this.super_reborn_back, []);
        }
        private function super_reborn_back():void{
            if (this.ctrlBoss.result == Mod_WorldBoss_Base.ACTION_SUCCESS){
                this.onWar(false);
            } else {
                if (this.ctrlBoss.result == Mod_WorldBoss_Base.ACTION_FAILED){
                    _view.showTip(WorldBossMapViewLang.Fails);
                } else {
                    if (this.ctrlBoss.result == Mod_WorldBoss_Base.NOT_BEGIN){
                        _view.showTip(WorldBossMapViewLang.ChallengeFails);
                    } else {
                        if (this.ctrlBoss.result == Mod_WorldBoss_Base.NOT_ENOUGH_INGOT){
                            _view.showTip(WorldBossMapViewLang.IngotLack);
                        } else {
                            if (this.ctrlBoss.result == Mod_WorldBoss_Base.MAX_TIMES){
                                _view.showTip(WorldBossMapViewLang.ResetOver);
                            } else {
                                _view.showTip(WorldBossMapViewLang.BossOver);
                            };
                        };
                    };
                };
            };
        }
        private function strengthen_combat_0():void{
            this.guwuType = 0;
            _data.call(Mod_WorldBoss_Base.strengthen_combat, this.strengthen_combat_back, [0]);
        }
        private function strengthen_combat_1():void{
            this.guwuType = 1;
            _data.call(Mod_WorldBoss_Base.strengthen_combat, this.strengthen_combat_back, [1]);
        }
        private function strengthen_combat_back():void{
            _view.tip.iTip.addTarget(this._bossUI.btnExp, Lang.sprintf(WorldBossMapViewLang.InspireAdd, ctrlPlayer.skill));
            if (this.ctrlBoss.result == Mod_WorldBoss_Base.ACTION_SUCCESS){
                _view.tip.iTip.textTip(((this.guwuType)==0) ? this._bossUI.btnExp : this._bossUI.btnIngot, WorldBossMapViewLang.InspireSuccess, 0xFFF200);
            } else {
                _view.tip.iTip.textTip(((this.guwuType)==0) ? this._bossUI.btnExp : this._bossUI.btnIngot, WorldBossMapViewLang.InspireFails, 0xFF0000);
            };
            if (this.ctrlBoss.result == Mod_WorldBoss_Base.NOT_ENOUGH_INGOT){
                _view.showTip(WorldBossMapViewLang.IngotLack);
            } else {
                if (this.ctrlBoss.result == Mod_WorldBoss_Base.NOT_ENOUGH_SKILL){
                    _view.showTip(WorldBossMapViewLang.SkillLack);
                } else {
                    if (this.ctrlBoss.result == Mod_WorldBoss_Base.COMBAT_LIMIT){
                        _view.showTip(WorldBossMapViewLang.Limit);
                    };
                };
            };
        }
        private function fight_world_boss():void{
            this._warTime = getTimer();
            _data.call(Mod_WorldBoss_Base.fight_world_boss, null, [this._bossInfo.bossId]);
        }
        private function fight_world_boss_back():void{
            switch (_ctrl.worldBossMap.warStatus){
                case Mod_WorldBoss_Base.ACTION_SUCCESS:
                    if (this.isAutoWar){
                        _view.showTip(WorldBossMapViewLang.BossAutoSuccess, null, TipType.Success);
                        this.reset_death_cd(1);
                    } else {
                        _view.worldBossWar.warData = _ctrl.worldBossMap.warData;
                        _view.worldBossWar.background = this._Map.getMapWarBG();
                        _view.worldBossWar.onClose = this.onWarClose;
                        _view.worldBossWar.show();
                    };
                    break;
                case Mod_WorldBoss_Base.NOT_BEGIN:
                    _view.showTip(WorldBossMapViewLang.BossClose);
                    break;
                case Mod_WorldBoss_Base.MISSION_OVER:
                case Mod_WorldBoss_Base.NOT_BEGIN:
                case Mod_WorldBoss_Base.WORLD_BOSS_DEAD:
                    _view.showTip(WorldBossMapViewLang.BossOver);
                    break;
                case Mod_WorldBoss_Base.ACTION_FAILED:
                    _view.showTip(WorldBossMapViewLang.LimitCD);
                    break;
                case Mod_WorldBoss_Base.DEATH_STATUS:
                    _view.showTip(WorldBossMapViewLang.ResetCD);
                    break;
            };
        }

    }
}//package com.views 

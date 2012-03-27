//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.assist.view.*;
    import com.controllers.*;
    import flash.utils.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class QuestView extends com.views.Base implements IView {

        public var ownCtrl:QuestController;
        private var _quest:IQuest;
        private var _wayFindingText:String;
        private var _marked:Boolean = false;
        private var _halted:Boolean = false;

        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            _data.call(Mod_Quest_Base.list_player_quest, this.loadResources, [], false);
        }
        private function list_player_quest():void{
            _data.call(Mod_Quest_Base.list_player_quest, this.listPlayerQuestCallback, []);
        }
        private function can_receive_quest():void{
            _data.call(Mod_Quest_Base.can_receive_quest, this.canReceiveQuestCallback, [_ctrl.player.mapId]);
        }
        private function npc_info_by_questid(_arg1:int):void{
            _data.call(Mod_Quest_Base.npc_info_by_questid, this.npcInfoByQuestidCallback, [_arg1]);
        }
        public function accept_quest(_arg1:int, _arg2:Function=null):void{
            var questId:* = _arg1;
            var callback:Function = _arg2;
            var func:* = function ():void{
                switch (ownCtrl.acceptQuest){
                    case Mod_Quest_Base.SUCCEED:
                        acceptQuestCallback();
                        _view.townMap.showQuestAdd();
                        if ((callback is Function)){
                            callback();
                        };
                        break;
                    case Mod_Quest_Base.FAILED:
                        break;
                    case Mod_Quest_Base.PACKFULL:
                        _view.showTip(QuestViewLang.PackFullTitle, QuestViewLang.PackFullContent, TipType.Question);
                        break;
                };
            };
            _data.call(Mod_Quest_Base.accept_quest, func, [questId]);
        }
        private function giveup_quest(_arg1:int):void{
            _data.call(Mod_Quest_Base.giveup_quest, this.giveUpCallback, [_arg1]);
        }
        public function complete_quest(_arg1:int, _arg2:Function):void{
            _data.call(Mod_Quest_Base.complete_quest, _arg2, [_arg1]);
        }
        public function finish_quest(_arg1:int, _arg2:Function):void{
            _data.call(Mod_Quest_Base.finish_quest, _arg2, [_arg1], false);
        }
        private function loadResources():void{
            loadAssets("Quest", this.render, QuestViewLang.LoadInfo);
        }
        private function listPlayerQuestCallback():void{
            this._quest.renderAccepted(this.ownCtrl.listPlayerQuest);
        }
        private function canReceiveQuestCallback():void{
            this._quest.renderAccepted(this.ownCtrl.canReceiveQuest);
        }
        private function npcInfoByQuestidCallback():void{
            this._quest.renderDetail(this.ownCtrl.npcInfoByQuestId);
            this._quest.acceptBtnVisible = _view.townMap.inStage;
        }
        private function acceptQuestCallback():void{
            _view.toolbar.loadQuestTrace();
        }
        private function giveUpCallback():void{
            this.list_player_quest();
            _view.toolbar.loadQuestTrace();
        }
        private function render():void{
            this._quest = (_view.getAssetsObject("Quest", "Quest") as IQuest);
            this._quest.tip = _view.tip.iTip;
            this._quest.drag = _view.drag.iDrag;
            this._quest.abortVisible = _view.townMap.inStage;
            this._quest.onClose = function ():void{
                close();
            };
            this._quest.onDetail = function (_arg1:uint):void{
                npc_info_by_questid(_arg1);
            };
            this._quest.hasTrace = _view.toolbar.questTraceVisible;
            this._quest.onTrace = function (_arg1:Boolean):void{
                _view.toolbar.questTraceVisible = _arg1;
            };
            this._quest.onAccepted = function ():void{
                list_player_quest();
            };
            this._quest.onAcceptable = function ():void{
                can_receive_quest();
            };
            this._quest.onAccept = function (_arg1:int, _arg2:int, _arg3:int):void{
                moveToNPC(_arg2, _arg3);
            };
            this._quest.onComplete = function (_arg1:uint):void{
            };
            this._quest.onAbort = function (_arg1:uint):void{
                giveup_quest(_arg1);
            };
            this._quest.onWayFinding = function (_arg1:String):void{
                wayFinding(_arg1);
                close();
            };
            this._quest.init();
            this._quest.renderAccepted(this.ownCtrl.listPlayerQuest);
            _popup.addView(this, this._quest.content);
            _view.center(sign, this._quest.content);
        }
        public function wayFinding(_arg1:String):void{
            var _local3:int;
            this._wayFindingText = _arg1;
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.factionWarMap.inStage){
                _view.showTip(QuestViewLang.FactionEnableWarFinding);
                return;
            };
            var _local2:Array = _arg1.split(/\s*,\s*/);
            switch (_local2[0]){
                case "mission":
                    _local3 = _ctrl.mission.missionId;
                    if (_view.townMap.inStage){
                        this.moveToMission(_local2[1], _local2[2]);
                    } else {
                        if (_view.war.missionCompleted){
                            _view.showTip(QuestViewLang.MonsterHitted);
                        } else {
                            _view.missionMap.gotoNearMonster();
                        };
                    };
                    break;
                case "npc":
                    if (_view.missionMap.inStage){
                        this.wayFinding(((("mission," + _ctrl.player.mapId) + ",") + _ctrl.mission.missionId));
                        return;
                    };
                    if (((_view.missionMap.inStage) && ((_local2[3] == QuestType.Completed)))){
                        _view.showTip(QuestViewLang.QuestCompleted);
                    } else {
                        this.moveToNPC(_local2[1], _local2[2]);
                    };
                    break;
            };
        }
        public function markWayFinding():void{
            this._marked = true;
        }
        public function finishWayFinding():void{
            this._marked = false;
            this._halted = false;
        }
        public function haltWayFinding(_arg1:Boolean=false):void{
            var timer:* = null;
            var handler:* = null;
            var force:Boolean = _arg1;
            if (_ctrl.player.townKey > TownType.getLock(TownType.getId(TownType.SuZhou))){
                return;
            };
            if (!force){
                if (this._halted){
                    return;
                };
                if (!this._marked){
                    return;
                };
            };
            this._halted = true;
            this._marked = true;
            timer = new Timer(15000, 1);
            handler = function (_arg1:TimerEvent):void{
                if (_ctrl.player.townKey > TownType.getLock(TownType.getId(TownType.SuZhou))){
                    return;
                };
                if (((_marked) && (!(_view.missionMap.inStage)))){
                    finishWayFinding();
                    _view.guide.showAloneGuide(_view.toolbar.questTraceContent, QuestViewLang.AutoWay, new Point(12, 45));
                };
                timer.stop();
                timer.removeEventListener(TimerEvent.TIMER_COMPLETE, handler);
            };
            timer.addEventListener(TimerEvent.TIMER_COMPLETE, handler);
            timer.start();
        }
        public function moveToNPC(_arg1:int, _arg2:int):void{
            var callback:* = null;
            var townId:* = _arg1;
            var townNPCId:* = _arg2;
            if (_view.townMap.inStage == false){
                _view.showTip(QuestViewLang.MissionEnableWarFinding, null, TipType.Question);
                return;
            };
            if (townId == _ctrl.player.mapId){
                _view.townMap.moveToNPCAtId(townNPCId);
            } else {
                callback = function ():void{
                    if (townId == _ctrl.player.mapId){
                        _view.townMap.moveToNPCAtId(townNPCId);
                    };
                };
                _view.delayExecute(DelayType.WayFinding, callback);
                this.directEnterTown(townId);
            };
        }
        public function moveToNPCByFunc(_arg1:int):void{
            var _local2:int = TownType.getMaxTownId();
            var _local3:int = TownType.getTownNPCIdByFunc(_local2, _arg1);
            this.moveToNPC(_local2, _local3);
        }
        public function gotoNPCByFunc(_arg1:int):void{
            var _local2:int = _ctrl.player.townMapId;
            var _local3:int = TownType.getTownNPCIdByFunc(_local2, _arg1);
            this.moveToNPC(_local2, _local3);
        }
        public function moveToMission(_arg1:int, _arg2:int, _arg3:String=""):void{
            var isHeroMission:* = false;
            var callback:* = null;
            var townId:* = _arg1;
            var missionId:* = _arg2;
            var info:String = _arg3;
            if (info == ""){
                info = _view.chooseMission.mainMissionInfo;
            };
            if (_view.townMap.inStage == false){
                _view.showTip(QuestViewLang.MissionEnableWarFinding, null, TipType.Question);
                return;
            };
            if (_ctrl.player.townKey < TownType.getLock(townId)){
                _view.showTip(QuestViewLang.TownNoOpen, "", TipType.Question);
                return;
            };
            var inSelfTown:* = true;
            isHeroMission = MissionType.isHeroMission(missionId);
            var townSign:* = TownType.getSign(_ctrl.player.mapId);
            if (isHeroMission){
                _view.heroMission.autoMissionId(townId, missionId, info);
                _view.heroMission.switchSelf();
                inSelfTown = false;
                return;
            };
            if (((inSelfTown) && ((((townId == _ctrl.player.mapId)) || (isHeroMission))))){
                if (!_view.chooseMission.inStage){
                    if (isHeroMission){
                        _view.heroMission.autoMissionId(townId, missionId, info);
                    } else {
                        _view.chooseMission.autoMissionId(missionId, info);
                    };
                    _view.townMap.moveToPortal(isHeroMission);
                };
            } else {
                callback = function ():void{
                    if (townId == _ctrl.player.mapId){
                        if (isHeroMission){
                            _view.heroMission.autoMissionId(townId, missionId, info);
                        } else {
                            _view.chooseMission.autoMissionId(missionId, info);
                        };
                        _view.townMap.moveToPortal(isHeroMission);
                    };
                };
                _view.delayExecute(DelayType.MoveToPortal, callback);
                this.directEnterTown(townId);
            };
        }
        private function directEnterTown(_arg1:int):void{
            var _local2:int = _ctrl.player.townMapId;
            if (TownType.isTownById(_ctrl.player.mapId)){
                _view.world.autoEnterTown(_ctrl.player.mapId, _arg1);
            } else {
                if (_local2){
                    _view.world.autoEnterTown(_local2, _arg1);
                } else {
                    _view.townMap.gotoTownAtId(_arg1);
                };
            };
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._quest.clear();
        }

    }
}//package com.views 

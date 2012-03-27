//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import com.haloer.net.*;
    import flash.geom.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.guide.*;
    import com.lang.client.com.views.guide.*;

    public class GuideView extends Base implements IView {

        private var _Guide:Class;
        private var _list:Object;
        private var guides:Object;
        private var _guide:IGuide;

        public function GuideView():void{
            this._list = {};
            this.guides = {};
            super();
            this.initGuideData();
        }
        public function show():void{
            var callback:* = function ():void{
                var _local1:IGuide = (new _Guide() as IGuide);
                _local1.x = 300;
                _local1.y = 400;
                _local1.text = "测试1\n测试2";
                _local1.dir = GuideDir.Right;
                _popup.addChild(_local1.content);
            };
            this.load(callback);
        }
        public function clear():void{
        }
        public function close():void{
        }
        public function load(_arg1:Function):void{
            var file:* = null;
            var callback:* = _arg1;
            if (this._Guide == null){
                file = new File();
                file.onComplete = function ():void{
                    _Guide = file.getClassByName("Guide");
                    callback();
                };
                file.load((URI.assetsUrl + "guide.swf"));
            } else {
                callback();
            };
        }
        public function checkVisible():void{
            var _local2:Object;
            var _local1:Boolean = _view.townMap.inStage;
            for each (_local2 in this._list) {
                if (_local2["guide"]){
                    _local2["guide"].visible = _local1;
                };
            };
        }
        public function open():void{
            var _local1:int;
            var _local2:int;
            var _local3:Object;
            for each (_local3 in this._ctrl.quest.townQuestData) {
                _local1 = _local3["quest_id"];
                _local2 = _local3["state"];
                this.beginner(_local1, _local2);
                this.training(_local1, _local2);
                this.upgrade(_local1, _local2);
                this.partners(_local1, _local2);
                this.partners2(_local1, _local2);
                this.ItemWear(_local1, _local2);
                this.autoWay(_local1, _local2);
                this.fateLodge(_local1, _local2);
            };
            if (this._ctrl.player.level > 1){
                if (this.hasGuide(GuideType.ItemWear)){
                    this.stopItemWearGuides();
                };
            };
            if (this._ctrl.player.level > 5){
                if (this.hasGuide(GuideType.Upgrade)){
                    this.stopUpgradeGuides();
                };
            };
            this.checkVisible();
        }
        public function start(_arg1:int):void{
            if (this._list[_arg1]){
                return;
            };
            if (_view.getCookie((((((URI.ip + "Guide") + "_") + this._ctrl.player.playerId) + "_") + _arg1))){
                return;
            };
            this._list[_arg1] = {
                guide:null,
                index:0
            };
        }
        public function hasGuide(_arg1:int):Boolean{
            return (this._list[_arg1]);
        }
        public function stop(_arg1:int):void{
            this.hideTrack(_arg1);
            if (((this._list[_arg1]) && (this._list[_arg1].guide))){
                this._list[_arg1].guide.clear();
                _view.tip.iTip.removeTarget(this._list[_arg1].guide.content);
            };
            delete this._list[_arg1];
        }
        public function hideTrack(_arg1:int):void{
            if (this._list[_arg1]){
                if (((this._list[_arg1].guide) && (this._list[_arg1].guide.parent))){
                    this._list[_arg1].guide.parent.removeChild(this._list[_arg1].guide);
                };
            };
        }
        public function hasTrack(_arg1:int):Boolean{
            return (!(!(this._list[_arg1])));
        }
        public function isLastTrace(_arg1:int):Boolean{
            if (this.hasTrack(_arg1)){
                return (((this.guides[_arg1].length - 1) == this._list[_arg1].index));
            };
            return (false);
        }
        public function track(_arg1:int, _arg2:int, _arg3:Sprite):void{
            var type:* = _arg1;
            var index:* = _arg2;
            var parent:* = _arg3;
            if (this.hasTrack(type) == false){
                return;
            };
            var callback:* = function ():void{
                var _local4:Point;
                if (hasTrack(type) == false){
                    return;
                };
                var _local1:IGuide = _list[type].guide;
                if (_local1 == null){
                    _local1 = (new _Guide() as IGuide);
                    _list[type].guide = _local1;
                };
                var _local2:int = _list[type].index;
                if (((((_local2 - 1) >= index)) || (((_local2 + 1) < index)))){
                    return;
                };
                _list[type].index = index;
                parent.addChild(_local1.content);
                _view.tip.iTip.addTarget(_local1.content, GuideViewLang.Arrow);
                var _local3:Array = guides[type][(index - 1)];
                _local1.dir = _local3[2];
                _local1.text = _local3[3];
                if ((_local3[4] is Function)){
         //           var _local5 = _local3;
					_local3[4]();
                    _local4 = Structure.stageOffset;
                    _local1.x = (_local3[0] - _local4.x);
                    _local1.y = (_local3[1] - _local4.y);
                } else {
                    _local1.x = _local3[0];
                    _local1.y = _local3[1];
                };
                if ((_local3[5] is Function)){
                    _local1.content.buttonMode = true;
                    _local1.onClick = _local3[5];
                } else {
                    _local1.content.buttonMode = false;
                    _local1.onClick = null;
                };
                checkFateLodgeGuideVisible();
                checkPartnersGuideVisible();
            };
            this.load(callback);
        }
        public function setCookie(_arg1:int):void{
            if (this.hasGuide(_arg1)){
                _view.setCookie((((((URI.ip + "Guide") + "_") + this._ctrl.player.playerId) + "_") + _arg1), true);
            };
        }
        public function setPoint(_arg1:int, _arg2:int, _arg3:int):void{
            if (!this._list[_arg1]){
                return;
            };
            var _local4:IGuide = this._list[_arg1].guide;
            if (_local4 != null){
                _local4.x = _arg2;
                _local4.y = _arg3;
            };
        }
        public function reposition():void{
            var _local1:String;
            var _local2:IGuide;
            var _local3:int;
            var _local4:Array;
            var _local5:Point;
            for (_local1 in this._list) {
                _local2 = this._list[_local1].guide;
                if (_local2 == null){
                } else {
                    _local3 = this._list[_local1].index;
                    if (_local2.content.parent == _view.toolbar.content){
                        _local4 = this.guides[_local1][(_local3 - 1)];
                        if ((_local4[4] is Function)){
                            
							_local4[4]();
                        };
                        _local5 = Structure.stageOffset;
                        _local2.x = (_local4[0] - _local5.x);
                        _local2.y = (_local4[1] - _local5.y);
                    };
                };
            };
        }
        private function initGuideData():void{
            this.initPartners();
            this.initBeginner();
            this.initItemWear();
            this.initUpgrade();
            this.initTraining();
            this.initAutoWay();
            this.initFateLodge();
            this.initFateWear();
        }
        private function initPartners():void{
            this.guides[GuideType.Partners] = [[2045, 245, GuideDir.Right, partnersLang.ClickHere], [175, 110, GuideDir.Right, partnersLang.ClickHere], [110, 142, GuideDir.Right, partnersLang.ClickHere], [680, 11, GuideDir.Right, partnersLang.ClickHere], [221, 288, GuideDir.Right, partnersLang.ClickHere]];
            this.initPartners2();
        }
        public function trackPartners(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.Partners, _arg1, _arg2);
        }
        private function partners(_arg1:int, _arg2:int):void{
            if ((((_arg1 == QuestType.PartnersQuestId)) && ((_arg2 == QuestType.Accepted)))){
                this.start(GuideType.Partners);
                this.trackPartners(1, _view.townMap.guideLayder);
            };
        }
        public function stopPartnersGuides():void{
            var _local1:Object;
            if (FunctionType.isPlayed(FunctionType.Deploy) == false){
                this._view.toolbar.triggerDeploy();
            };
            for each (_local1 in this._ctrl.quest.townQuestData) {
                if ((((_local1["quest_id"] == QuestType.PartnersQuestId)) && ((_local1["state"] == QuestType.Accepted)))){
                    if (FunctionType.isPlayed(FunctionType.Deploy)){
                        this.setCookie(GuideType.Partners);
                        this.stop(GuideType.Partners);
                    };
                    break;
                };
            };
        }
        public function stopPartnersGuide():void{
            var _local1:Object;
            for each (_local1 in this._ctrl.quest.townQuestData) {
                if ((((_local1["quest_id"] == QuestType.PartnersQuestId)) && ((_local1["state"] == QuestType.Accepted)))){
                    this.setCookie(GuideType.Partners);
                    this.stop(GuideType.Partners);
                };
            };
        }
        private function initPartners2():void{
            this.guides[GuideType.Partners2] = [[250, 245, GuideDir.Right, partnersLang.ClickInn], [175, 123, GuideDir.Right, partnersLang.ClickRole], [105, 142, GuideDir.Right, partnersLang.ClickPartners], [685, 11, GuideDir.Right, partnersLang.ClickClose]];
        }
        public function trackPartners2(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.Partners2, _arg1, _arg2);
        }
        private function partners2(_arg1:int, _arg2:int):void{
            if ((((_arg1 == QuestType.PartnersQuestId2)) && ((_arg2 == QuestType.Accepted)))){
                this.start(GuideType.Partners2);
                this.trackPartners2(1, _view.townMap.guideLayder);
            };
        }
        public function setPartnersIndex2(_arg1:int):void{
            if (_arg1 > 1){
                this.guides[GuideType.Partners2][1] = [175, 135, GuideDir.Right, partnersLang.ClickRole];
            } else {
                this.guides[GuideType.Partners2][1] = [175, 110, GuideDir.Right, partnersLang.ClickRole];
            };
        }
        public function stopPartnersGuides2():void{
            this.setCookie(GuideType.Partners2);
            this.stop(GuideType.Partners2);
        }
        public function checkPartnersGuideVisible():void{
            if (this._ctrl.player.mapId != TownType.getId(TownType.SuZhou)){
                this.hideTrack(GuideType.Partners2);
            };
        }
        private function initBeginner():void{
            var firstAction:* = function ():void{
                var _local1:int = _ctrl.player.mapId;
                _view.quest.moveToNPC(_local1, TownType.getTownNPCId(_local1, NPCType.ShuiLing));
            };
            this.guides[GuideType.Beginner] = [[480, 260, GuideDir.Right, beginnerLang.StartQuest, null, firstAction], [175, 110, GuideDir.Right, beginnerLang.Dialog], [175, 110, GuideDir.Right, beginnerLang.Dialog], [655, 230, GuideDir.Right, beginnerLang.CompleteQuest], [175, 110, GuideDir.Right, beginnerLang.Dialog], [175, 110, GuideDir.Right, beginnerLang.AcceptQuest]];
        }
        private function beginner(_arg1:int, _arg2:int):void{
            if ((((_arg1 == QuestType.BeginnerQuestId)) && ((_arg2 == QuestType.Completed)))){
                this.trackBeginner(4, _view.townMap.guideLayder);
            };
            if ((((_arg1 == QuestType.BeginnerQuestId)) && ((_arg2 == QuestType.Acceptable)))){
                if (this.hasGuide(GuideType.Beginner)){
                    this.stopBeginnerGuides();
                };
                this.start(GuideType.Beginner);
                this.trackBeginner(1, _view.townMap.guideLayder);
            };
        }
        public function trackBeginner(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.Beginner, _arg1, _arg2);
        }
        public function stopBeginnerGuides():void{
            this.stop(GuideType.Beginner);
            this.stopItemWearGuides();
        }
        private function initItemWear():void{
            this.guides[GuideType.ItemWear] = [[838, 551, GuideDir.Right, itemWearLang.OpenBag], [0, 0, GuideDir.Right, itemWearLang.WearItem], [276, 13, GuideDir.Right, itemWearLang.ClickClose], [279, 13, GuideDir.Right, itemWearLang.ClickClose]];
        }
        public function trackItemWear(_arg1:int, _arg2:Sprite):void{
        }
        private function ItemWear(_arg1:int, _arg2:int):void{
            var handler:* = null;
            var questId:* = _arg1;
            var questState:* = _arg2;
            if ((((((questId == QuestType.BeginnerItemId)) && ((questState == QuestType.Accepted)))) && ((this._ctrl.player.level < 2)))){
                if (this.hasGuide(GuideType.Beginner)){
                    _view.guide.setCookie(GuideType.Beginner);
                    this.stopBeginnerGuides();
                };
                return;
            };
        }
        public function startItemWearGuide(_arg1:Sprite, _arg2:Array):void{
            var _local3:int;
            var _local4:int;
            var _local5:ItemInfo;
            var _local6:Object;
            var _local7:int;
            var _local8:int;
        }
        public function closePackGuides():void{
        }
        public function closeRoleMsgGuides():void{
        }
        public function stopItemWearGuides():void{
            var _local1:Object;
            this.stop(GuideType.ItemWear);
            for each (_local1 in this._ctrl.quest.townQuestData) {
                if (_local1["quest_id"] == QuestType.BeginnerItemId){
                    if (!this.hasGuide(GuideType.AutoWay)){
                        this.start(GuideType.AutoWay);
                        if (_local1["state"] == QuestType.Accepted){
                            this.trackAutoWay(1, _view.toolbar.questTraceContent);
                        };
                    };
                };
            };
        }
        private function initUpgrade():void{
            this.guides[GuideType.Upgrade] = [[838, 551, GuideDir.Right, upgradeLang.OpenUpgrade], [531, 341, GuideDir.Right, upgradeLang.ClickUpgrade], [680, 13, GuideDir.Right, upgradeLang.ClickClose], [12, 45, GuideDir.Right, upgradeLang.AutoWay]];
        }
        public function trackUpgrade(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.Upgrade, _arg1, _arg2);
        }
        private function upgrade(_arg1:int, _arg2:int):void{
            if ((((_arg1 == QuestType.BeginnerUpgradeId)) && ((_arg2 == QuestType.Completed)))){
                this.stopAutoWayGuides();
                this.stopItemWearGuides();
                this.setCookie(GuideType.AutoWay);
                if (FunctionType.isPlayed(FunctionType.Upgrade)){
                    this._view.guide.startUpgradeGuides();
                };
            };
            if ((((_arg1 == 3)) && ((_arg2 == QuestType.Acceptable)))){
                if (this.hasGuide(GuideType.Upgrade)){
                    this._view.guide.setCookie(GuideType.Upgrade);
                    this._view.guide.stopUpgradeGuides();
                };
            };
            if ((((_arg1 == QuestType.BeginnerUpgradeId)) && ((((_arg2 == QuestType.Acceptable)) || ((_arg2 == QuestType.Accepted)))))){
                if (this.hasGuide(GuideType.AutoWay)){
                    this.setCookie(GuideType.AutoWay);
                    this.stopAutoWayGuides();
                };
                if (this.hasGuide(GuideType.ItemWear)){
                    this.setCookie(GuideType.ItemWear);
                    this.stop(GuideType.ItemWear);
                };
            };
        }
        public function stopUpgradeGuides():void{
            this.stop(GuideType.Upgrade);
        }
        public function startUpgradeGuides():void{
            var questId:* = 0;
            var handler:* = null;
            for each (questId in _ctrl.quest.completedQuest) {
                if (questId == QuestType.BeginnerUpgradeId){
                    this.stopAutoWayGuides();
                    this.stopItemWearGuides();
                    this.start(GuideType.Upgrade);
                    handler = function ():void{
                        var _local1:Point = _view.toolbar.getFunctionPoint(FunctionType.Upgrade);
                        guides[GuideType.Upgrade][0][0] = (_local1.x - 10);
                        guides[GuideType.Upgrade][0][1] = (_local1.y - 16);
                    };
                    this.guides[GuideType.Upgrade][0] = [0, 0, GuideDir.Right, upgradeLang.OpenUpgrade, handler];
                    handler();
                    this.trackUpgrade(1, this._view.toolbar.content);
                    break;
                };
            };
        }
        private function initTraining():void{
            this.guides[GuideType.Training] = [[675, 551, GuideDir.Right, trainingLang.OpenRole], [100, 386, GuideDir.Right, trainingLang.OpenTraining], [170, 303, GuideDir.Right, trainingLang.ClickTraining], [130, 303, GuideDir.Right, trainingLang.ClickSave]];
        }
        public function trackTraining(_arg1:int, _arg2:Sprite, _arg3:int=0, _arg4:int=0):void{
            if (_arg1 == 2){
                this.guides[GuideType.Training][1][0] = _arg3;
                this.guides[GuideType.Training][1][1] = _arg4;
            };
            this.track(GuideType.Training, _arg1, _arg2);
        }
        private function training(_arg1:int, _arg2:int):void{
            if ((((((_arg1 == QuestType.BeginnerTrainingId)) && ((_arg2 == QuestType.Completed)))) && (FunctionType.isPlayed(FunctionType.Training)))){
                this.startTrainingGuides();
            };
        }
        public function startTrainingGuides():void{
            var questId:* = 0;
            var handler:* = null;
            for each (questId in _ctrl.quest.completedQuest) {
                if (questId == QuestType.BeginnerTrainingId){
                    this.start(GuideType.Training);
                    handler = function ():void{
                        var _local1:Point = _view.toolbar.getFunctionPoint(FunctionType.Body);
                        guides[GuideType.Training][0][0] = (_local1.x - 10);
                        guides[GuideType.Training][0][1] = (_local1.y - 16);
                    };
                    this.guides[GuideType.Training][0] = [0, 0, GuideDir.Right, trainingLang.OpenRole, handler];
                    handler();
                    this.trackTraining(1, this._view.toolbar.content);
                    break;
                };
            };
        }
        public function stopTrainingGuides():void{
            this.stop(GuideType.Training);
        }
        private function initAutoWay():void{
            this.guides[GuideType.AutoWay] = [[25, 62, GuideDir.Right, autoWayLang.autoWay], [12, 45, GuideDir.Right, autoWayLang.autoWay]];
        }
        private function autoWay(_arg1:int, _arg2:int):void{
            if (_arg1 == QuestType.BeginnerAutoWayId){
                if ((((_arg2 == QuestType.Acceptable)) && (this.hasGuide(GuideType.AutoWay)))){
                    this.stopAutoWayGuides();
                };
                if ((((_arg2 == QuestType.Accepted)) && (!(this.hasGuide(GuideType.ItemWear))))){
                    this.start(GuideType.AutoWay);
                    this.trackAutoWay(1, _view.toolbar.questTraceContent);
                };
            };
        }
        public function trackAutoWay(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.AutoWay, _arg1, _arg2);
        }
        public function stopAutoWayGuides():void{
            this.stop(GuideType.AutoWay);
        }
        private function initDeploy():void{
            this.guides[GuideType.Deploy] = [[833, 556, GuideDir.Right, deployLang.ClickHere], [55, 175, GuideDir.Right, deployLang.First], [537, 14, GuideDir.Right, deployLang.ClickHere]];
            this.initDeloy2();
        }
        public function trackDeploy(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.Deploy, _arg1, _arg2);
            if (_arg1 == 1){
                this.start(GuideType.Deploy2);
            };
            if (_arg1 == 2){
                this.trackDeploy2(1, _arg2);
            };
            if (_arg1 == 3){
                this.setCookie(GuideType.Deploy2);
                this.stop(GuideType.Deploy2);
            };
        }
        public function stopDeployGuides():void{
            var _local1:Object;
            for each (_local1 in this._ctrl.quest.townQuestData) {
                if ((((_local1["quest_id"] == QuestType.PartnersQuestId)) && ((_local1["state"] == QuestType.Completed)))){
                    this.setCookie(GuideType.Deploy);
                    this.stop(GuideType.Deploy);
                    this.stop(GuideType.Deploy2);
                    if (FunctionType.isPlayed(FunctionType.Deploy) == false){
                        this._view.toolbar.triggerDeploy();
                    };
                };
            };
        }
        public function startDeployGuides():void{
            var obj:* = null;
            var handler:* = null;
            for each (obj in this._ctrl.quest.townQuestData) {
                if ((((obj["quest_id"] == QuestType.PartnersQuestId)) && ((obj["state"] == QuestType.Accepted)))){
                    this.start(GuideType.Deploy);
                    handler = function ():void{
                        var _local1:Point = _view.toolbar.getFunctionPoint(FunctionType.Deploy);
                        guides[GuideType.Deploy][0][0] = (_local1.x - 20);
                        guides[GuideType.Deploy][0][1] = (_local1.y - 16);
                    };
                    this.guides[GuideType.Deploy][0] = [0, 0, GuideDir.Right, deployLang.ClickHere, handler];
                    handler();
                    this.trackDeploy(1, this._view.toolbar.content);
                };
            };
        }
        private function initDeloy2():void{
            this.guides[GuideType.Deploy2] = [[217, 0xFF, GuideDir.Right, deployLang.Second]];
        }
        public function trackDeploy2(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.Deploy2, _arg1, _arg2);
        }
        private function initFateLodge():void{
            this.guides[GuideType.FateLodge] = [[0, 0, GuideDir.Right, fateLang.IntoInn], [43, 5, GuideDir.Bottom, fateLang.ClickHere], [-26, 56, GuideDir.Top, fateLang.PickUp]];
        }
        public function trackFateLodge(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.FateLodge, _arg1, _arg2);
        }
        private function fateLodge(_arg1:int, _arg2:int):void{
            if ((((((_arg1 == QuestType.BeginnerFateIdByShuShan)) || ((_arg1 == QuestType.BeginnerFateIdByKunLun)))) && ((_arg2 == QuestType.Completed)))){
                if (!this.hasGuide(GuideType.FateLodge)){
                    this.start(GuideType.FateLodge);
                };
                this.startFateLodgeGuide();
            };
        }
        public function checkFateLodgeGuideVisible():void{
            if (this._ctrl.player.inSelfCampTown){
                if (!this.hasGuide(GuideType.FateLodge)){
                    this.trackFateLodge(1, _view.townMap.guideLayder);
                };
            } else {
                this.hideTrack(GuideType.FateLodge);
            };
        }
        public function startFateLodgeGuide():void{
            var _local1:int;
            var _local2:int;
            if (this._ctrl.player.campId == FactionType.campId(FactionType.KunLunCheng)){
                _local1 = 1035;
                _local2 = 200;
            } else {
                if (this._ctrl.player.campId == FactionType.campId(FactionType.ShuShanCheng)){
                    _local1 = 920;
                    _local2 = 180;
                };
            };
            if (this._ctrl.player.inSelfCampTown){
                this.guides[GuideType.FateLodge][0] = [_local1, _local2, GuideDir.Right, fateLang.IntoInn];
                this.trackFateLodge(1, _view.townMap.guideLayder);
            } else {
                this.hideTrack(GuideType.FateLodge);
            };
        }
        public function stopFateLodgeGuide(_arg1:MovieClip):void{
            if (this.hasGuide(GuideType.FateLodge)){
                this.start(GuideType.FateWear);
                this.trackFateWear(1, _arg1);
            };
            this.stop(GuideType.FateLodge);
        }
        private function initFateWear():void{
            this.guides[GuideType.FateWear] = [[860, 54, GuideDir.Right, fateLang.OpenBag], [40, 125, GuideDir.Right, fateLang.WearFate1], [693, 11, GuideDir.Right, fateLang.ClickClose], [840, -20, GuideDir.Right, fateLang.ClickClose]];
            this.initFateWear2();
        }
        private function initFateWear2():void{
            this.guides[GuideType.FateWear2] = [[365, 232, GuideDir.Right, fateLang.WearFate2]];
        }
        public function trackFateWear(_arg1:int, _arg2:Sprite):void{
            if (_arg2 == null){
                return;
            };
            this.track(GuideType.FateWear, _arg1, _arg2);
            if (_arg1 == 2){
                if (this.hasGuide(GuideType.FateWear)){
                    this.start(GuideType.FateWear2);
                    this.trackFateWear2(1, _arg2);
                };
            };
            if (_arg1 == 3){
                this.setCookie(GuideType.FateWear2);
                this.stop(GuideType.FateWear2);
            };
        }
        private function trackFateWear2(_arg1:int, _arg2:Sprite):void{
            this.track(GuideType.FateWear2, _arg1, _arg2);
        }
        public function stopFateWearGuide():void{
            if (FunctionType.isPlayed(FunctionType.Fate) == false){
                this._view.toolbar.triggerFate();
            };
            if (((this.hasGuide(GuideType.FateWear)) || (this.hasGuide(GuideType.FateLodge)))){
                _view.setCookie((((((URI.ip + "Guide") + "_") + this._ctrl.player.playerId) + "_") + GuideType.FateLodge), true);
                this.stop(GuideType.FateLodge);
                this.setCookie(GuideType.FateWear);
                this.setCookie(GuideType.FateWear2);
                this.stop(GuideType.FateWear);
                this.stop(GuideType.FateWear2);
            };
        }
        public function showAloneGuide(_arg1:Sprite, _arg2:String, _arg3:Point, _arg4:String="right"):void{
            var parent:* = _arg1;
            var text:* = _arg2;
            var point:* = _arg3;
            var dir:String = _arg4;
            var callback:* = function ():void{
                if (((hasTrack(GuideType.Upgrade)) || (hasTrack(GuideType.AutoWay)))){
                    return;
                };
                if (_guide){
                    parent.addChild(_guide.content);
                    return;
                };
                _guide = (new _Guide() as IGuide);
                _guide.text = text;
                _guide.dir = dir;
                _guide.x = point.x;
                _guide.y = point.y;
                parent.addChild(_guide.content);
            };
            this.load(callback);
        }
        public function hideAlongGuide():void{
            if (((this._guide) && (this._guide.content.parent))){
                this._guide.content.parent.removeChild(this._guide.content);
            };
        }

    }
}//package com.views 

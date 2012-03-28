//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import flash.display.*;
    import com.haloer.net.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.lang.client.com.views.processTips.*;

    public class ProcessTipsView extends Base implements IView {

        private var _tipsUrl:String;
        private var _tip:IProcessTips;
        private var _cacheList:Object;
        private var _timeOut:int = 0;
        private var _file:File;
        private var _loading:Boolean = false;
        private var _tempData:Object;
        private var _visible:Boolean = true;

        public function ProcessTipsView(){
            this._tipsUrl = URI.processTips;
            this._cacheList = {};
            super();
        }
        public function open(_arg1:int, _arg2:Object=null):void{
            if (this._cacheList[_arg1]){
                return;
            };
            var _local3:Object = this.getTopPrior();
            _arg2 = ((_arg2) || (ProcessTipsType.getTip(_arg1)));
            this._cacheList[_arg1] = _arg2;
            if ((((_arg2["prior"] < _local3["prior"])) || ((_local3["prior"] == 0)))){
                this.loadAllResource(_arg2);
            };
        }
        public function removeType(_arg1:int):void{
            if (((this._tempData) && ((this._tempData["type"] == _arg1)))){
                this.closeType(_arg1);
            } else {
                delete this._cacheList[_arg1];
            };
        }
        private function nextTip():void{
            var _local2:Object;
            var _local3:Function;
            var _local1:Object = this.getTopPrior();
            if (_local1["type"] > 0){
                _local2 = this._cacheList[_local1["type"]];
                _local3 = ((_local2["icon"] is String)) ? this.loadAllResource : this.render;
                this._timeOut = setTimeout(_local3, 10000, _local2);
            };
        }
        private function getTopPrior():Object{
            var _local3:Object;
            var _local4:Number;
            var _local1:int;
            var _local2:Number = 0;
            for (_local3 in this._cacheList) {
                _local4 = this._cacheList[_local3]["prior"];
                if (0 == _local2){
                    _local1 = (_local3 as int);
                    _local2 = _local4;
                } else {
                    if (_local2 > _local4){
                        _local1 = (_local3 as int);
                        _local2 = _local4;
                    };
                };
            };
            return ({
                type:_local1,
                prior:_local2
            });
        }
        public function test():void{
            this.open(ProcessTipsType.Equipment);
            this.open(ProcessTipsType.Gift);
            this.open(ProcessTipsType.LuckyShop);
            this.open(ProcessTipsType.Practice);
            this.open(ProcessTipsType.Partners);
            this.open(ProcessTipsType.PartnersCount);
            var handler:* = function (_arg1:MouseEvent):void{
            };
            _view.stage.addEventListener(MouseEvent.CLICK, handler);
        }
        private function loadAllResource(_arg1:Object):void{
            var tipData:* = _arg1;
            if (null == this._file){
                this._file = new File();
                this._file.onComplete = function ():void{
                    _tip = (_file.getClassObject("ProcessTips") as IProcessTips);
                    _tip.oParent = _popup;
                    _tip.onAction = onActionHandler;
                    _tip.onClose = closeType;
                    loadResource(tipData);
                };
                this._file.load(_view.getAssetsUrl("ProcessTips"));
            } else {
                if (this._tip != null){
                    this.loadResource(tipData);
                };
            };
        }
        private function loadResource(_arg1:Object):void{
            var file:* = null;
            var url:* = null;
            var tipData:* = _arg1;
            if (true == this._loading){
                return;
            };
            this._loading = true;
            clearTimeout(this._timeOut);
            if ((tipData["icon"] is String) == false){
                this.nextTip();
                return;
            };
            file = new File();
            url = ((tipData["iconUrl"]) || ((this._tipsUrl + tipData["icon"])));
            file.onComplete = function ():void{
                _loading = false;
                loaded(file.loader.content, tipData);
            };
            file.onError = function ():void{
                _view.alert.confirm(((("[ProcessTips] : " + tipData["type"]) + ":") + url.replace(/^[\s\S]+\//, "")));
            };
            file.load(url);
        }
        private function loaded(_arg1:DisplayObject, _arg2:Object):void{
            var _local3:Object = this.getTopPrior();
            if (_arg2["prior"] > _local3["prior"]){
                this.loadAllResource(this._cacheList[_local3["type"]]);
            } else {
                _arg2["icon"] = _arg1;
                this.render(_arg2);
            };
        }
        private function render(_arg1:Object):void{
            this._tempData = _arg1;
            this.checkVisible();
            this.reposition(false);
            this._tip.render(_arg1);
        }
        private function onActionHandler(_arg1:Object):void{
            delete this._cacheList[_arg1["type"]];
            switch (_arg1["type"]){
                case ProcessTipsType.Deplay:
                    break;
                case ProcessTipsType.Equipment:
                    break;
                case ProcessTipsType.Gift:
                    _view.pack.show();
                    break;
                case ProcessTipsType.Partners:
                    this.gotoPartnersNPC();
                    break;
                case ProcessTipsType.PartnersCount:
                    this.gotoPartnersNPC();
                    break;
                case ProcessTipsType.Research:
                    this.showResearchUI();
                    break;
                case ProcessTipsType.Practice:
                    _view.toolbar.startPractice();
                    break;
                case ProcessTipsType.CoinsInsufficient:
                    this.showRuneUI();
                    break;
                case ProcessTipsType.LuckyShop:
                    this.gotoLuckyShopNPC();
                    break;
                case ProcessTipsType.SuperDeploy:
                    this.showSuperDeployUI();
                    break;
                case ProcessTipsType.StudyStunt:
                    this.showStudyStuntUI();
                    break;
            };
            this.nextTip();
        }
        private function closeType(_arg1:int):void{
            delete this._cacheList[_arg1];
            this.nextTip();
        }
        public function show():void{
        }
        public function clear():void{
        }
        public function close():void{
        }
        override public function get inStage():Boolean{
            return (((this._tip) && (this._tip.content.parent)));
        }
        private function gotoLuckyShopNPC():void{
            this._view.quest.gotoNPCByFunc(NPCType.LuckyShopNPC);
        }
        private function gotoPartnersNPC():void{
            this._view.quest.gotoNPCByFunc(NPCType.PartnersNPC);
        }
        public function set visible(_arg1:Boolean):void{
            this._visible = _arg1;
            _arg1 = ((this._visible) && (_view.townMap.inStage));
            if (this._tip != null){
                this._tip.visible = _arg1;
            };
        }
        public function checkVisible():void{
            this.visible = this._visible;
        }
        public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                if (null != this._tip){
                    this._tip.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
                };
            };
        }
        public function checkOpenGift():void{
            var _local1:int;
            var _local2:Object;
            if (this._ctrl.player.giftItemId != 0){
                _local1 = ProcessTipsType.Gift;
                _local2 = ProcessTipsType.getTip(_local1);
                _local2.content = (ItemType.getName(this._ctrl.player.giftItemId) + ProcessTipsViewLang.IsOpen);
                this.open(_local1, _local2);
            };
        }
        public function openGiftTip():void{
            var _local1:int = ProcessTipsType.Gift;
            var _local2:Object = ProcessTipsType.getTip(_local1);
            this.open(_local1, _local2);
        }
        public function openResearch():void{
            var _local1:Array = this._ctrl.notify.getNewResearch();
            var _local2:Object = (_local1[0] as Object);
            var _local3:int = ProcessTipsType.Research;
            var _local4:Object = ProcessTipsType.getTip(_local3);
            _local4["iconUrl"] = ((URI.processTips + _local2["id"]) + ".swf");
            _local4["content"] = Lang.sprintf(researchLang.OpenResearch, _local2["name"]);
            this.open(_local3, _local4);
        }
        private function showResearchUI():void{
            if (!_popup.hasView(this._view.research)){
                _view.research.switchSelf();
            };
        }
        public function openPartnersCount():void{
            var _local1:int = this._ctrl.notify.getRoleCount();
            if (_local1 <= 4){
                return;
            };
            var _local2:int = ProcessTipsType.PartnersCount;
            var _local3:Object = ProcessTipsType.getTip(_local2);
            _local3["content"] = Lang.sprintf(partnersLang.UpperLimit, this._ctrl.player.level, _local1);
            this.open(_local2, _local3);
        }
        public function openPartners():void{
            var _local1:int = this._ctrl.notify.getNewPartnersId();
            if ((((_local1 == RoleType.getRoleId(RoleType.ZhangMaZi))) || ((_local1 == RoleType.getRoleId(RoleType.ChuChu))))){
                return;
            };
            var _local2:int = ProcessTipsType.Partners;
            var _local3:Object = ProcessTipsType.getTip(_local2);
            _local3["iconUrl"] = ((URI.processTips + RoleType.getRoleSign(_local1)) + ".swf");
            this.open(_local2, _local3);
        }
        public function openPracticeTip():void{
            var _local1:int = ProcessTipsType.Practice;
            var _local2:Object = ProcessTipsType.getTip(_local1);
            this.open(_local1, _local2);
        }
        public function openCoinsInsufficient():void{
            this.open(ProcessTipsType.CoinsInsufficient);
        }
        private function showRuneUI():void{
            this._view.rune.show();
        }
        public function openSuperDeploy():void{
            var _local1:int = ProcessTipsType.SuperDeploy;
            var _local2:Object = ProcessTipsType.getTip(_local1);
            this.open(_local1, _local2);
        }
        private function showSuperDeployUI():void{
            if (!this._view.superDeploy.inStage){
                this._view.superDeploy.switchSelf();
            };
        }
        public function openStudyStunt():void{
            var _local1:int = ProcessTipsType.StudyStunt;
            var _local2:Object = ProcessTipsType.getTip(_local1);
            this.open(_local1, _local2);
        }
        private function showStudyStuntUI():void{
            if (!_popup.hasView(this._view.studyStunt)){
                _view.studyStunt.switchSelf();
            };
        }

    }
}//package com.views 

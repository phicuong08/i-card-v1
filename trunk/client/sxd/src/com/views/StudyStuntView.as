//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.map.*;
    import com.lang.client.com.views.*;

    public class StudyStuntView extends Base implements IView {

        private var _studyStunt:IStudyStunt;
        private var _frameSprite:IFrameSprite;
        private var _blnInStudyStunt:Boolean = false;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._studyStunt.clear();
            if (this._studyStunt.content._Background.contains(this._frameSprite.content)){
                this._studyStunt.content._Background.removeChild(this._frameSprite.content);
            };
            this._frameSprite = null;
            this._view.removeFromFrameProcessList(String(this));
            this._view.openEvent();
        }
        public function reposition(_arg1:Boolean=true):void{
            if (!inStage){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._studyStunt.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageWidth, Structure.stageHeight);
            };
        }
        private function loadData():void{
            this.player_stunt_info(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            if (!this._ctrl.studyStunt.isLoadComplete){
                setTimeout(this.loadDataCallBack, 50);
                return;
            };
            loadAssets("StudyStunt", this.render, StudyStuntViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._studyStunt.content);
            this._view.chat.changePoint = 0;
            this._view.chat.updateDepth(this);
            this._view.screen.stopPlayerRun();
            this._view.closeEvent();
        }
        private function render():void{
            if (this._studyStunt == null){
                this._studyStunt = (_view.getAssetsObject("StudyStunt", "StudyStunt") as IStudyStunt);
            };
            this.init();
            this.playerStuntInfoCallBack();
            this.showUI();
            this.reposition(false);
        }
        private function init():void{
            this._studyStunt.tip = this._view.tip.iTip;
            this._studyStunt.onClose = this.close;
            this._studyStunt.onStudyStunt = this.player_study_stunt;
            this._studyStunt.onReturnTown = this.close;
            this._studyStunt.playerLevel = this._ctrl.player.level;
            this._studyStunt.iconUrl = URI.studyStuntIconUrl;
            this._studyStunt.init();
            if (this._frameSprite == null){
                this._frameSprite = MapStatic.mapInstance.frame;
                this._frameSprite.initUrl((_ctrl.player.playerInfo.sign + _ctrl.player.playerInfo.signSuffix), "seat");
                this._frameSprite.pass(_view.time2);
                this._frameSprite.content.x = 647;
                this._frameSprite.content.y = 412;
                this._studyStunt.content._Background.addChild(this._frameSprite.content);
                this._studyStunt.playerSeat = this._frameSprite.content;
            };
            _view.addToFrameProcessList(String(this), this.enterFrameHandler);
        }
        private function enterFrameHandler():void{
            if (inStage == false){
                _view.removeFromFrameProcessList(String(this));
                return;
            };
            this._frameSprite.pass(_view.time2);
        }
        private function player_stunt_info(_arg1:Function):void{
            _data.call(Mod_StudyStunt_Base.player_stunt_info, _arg1, []);
        }
        private function playerStuntInfoCallBack():void{
            var _local1:Array = this._ctrl.studyStunt.stuntInfo;
            var _local2:Array = this._ctrl.studyStunt.stuntPointInfo;
            var _local3:Object = this._ctrl.studyStunt.playerInfo;
            this._studyStunt.renderPlayerStuntInfo(_local1, _local2, _local3);
        }
        private function player_study_stunt(_arg1:int, _arg2:int, _arg3:String):void{
            var callBack:* = null;
            var intStuntId:* = _arg1;
            var intStuntLevel:* = _arg2;
            var strTip:* = _arg3;
            callBack = function ():void{
                playerStudyStuntCallBack(strTip);
            };
            if (this._blnInStudyStunt){
                return;
            };
            this._blnInStudyStunt = true;
            _data.call(Mod_StudyStunt_Base.player_study_stunt, callBack, [intStuntId, intStuntLevel]);
        }
        private function playerStudyStuntCallBack(_arg1:String):void{
            var strTip:* = _arg1;
            var objStudyStunt:* = this._ctrl.studyStunt.playerStudyStunt;
            if (objStudyStunt["result"] == Mod_StudyStunt_Base.STUDY_SUCCESS){
                var callBack:* = function ():void{
                    var _local1:Array = _ctrl.studyStunt.stuntInfo;
                    var _local2:Array = _ctrl.studyStunt.stuntPointInfo;
                    var _local3:Object = _ctrl.studyStunt.playerInfo;
                    _studyStunt.renderPlayStudyStunt(_local1, _local2, _local3, strTip);
                    _blnInStudyStunt = false;
                };
                this.player_stunt_info(callBack);
            } else {
                _view.showTip(this.message(objStudyStunt["result"]));
                this._blnInStudyStunt = false;
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_StudyStunt_Base.STUDY_SUCCESS:
                    _local2 = StudyStuntViewLang.StudySuccess;
                    break;
                case Mod_StudyStunt_Base.NOENOUGH_AURA:
                    _local2 = StudyStuntViewLang.NoenoughAura;
                    break;
                case Mod_StudyStunt_Base.INVALID_ELEMENT:
                    _local2 = StudyStuntViewLang.InvalidElement;
                    break;
                case Mod_StudyStunt_Base.INVALID_STUNT_LEVEL:
                    _local2 = StudyStuntViewLang.InvalidStuntLevel;
                    break;
                case Mod_StudyStunt_Base.INVALID_PLAYER_LEVEL:
                    _local2 = StudyStuntViewLang.InvalidPlayerLevel;
                    break;
                case Mod_StudyStunt_Base.INVALID_FUNCTION:
                    _local2 = StudyStuntViewLang.InvalidPlayerLevel;
                    break;
                default:
                    _local2 = (StudyStuntViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

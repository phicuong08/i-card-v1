//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.assist.view.interfaces.*;
    import ICard.protocols.*;
    import ICard.assist.server.*;
    import ICard.lang.client.com.views.*;

    public class AchievementView extends ICard.views.Base implements IView {

        private var _achievement:IAchievement;
        private var _delayGotoAchievementLabel:Function = null;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._achievement.clear();
        }
        private function loadData():void{
            var callBack:* = null;
            callBack = function ():void{
                get_player_achievement_list(loadDataCallBak);
            };
            AchievementType.loadData(callBack);
        }
        private function loadDataCallBak():void{
            loadAssets("Achievement", this.render, AchievementViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._achievement.content);
			_viewMgr.center(sign, this._achievement.content);
        }
        private function render():void{
            if (this._achievement == null){
                this._achievement = (_viewMgr.getAssetsObject("Achievement", "Achievement") as IAchievement);
            };
            this.init();
            this.getPlayerAchievementListCallBack();
            this.showUI();
            if ((this._delayGotoAchievementLabel is Function)){
                this._delayGotoAchievementLabel();
            };
        }
        private function init():void{
//            this._achievement.tip = this._viewMgr.tip.iTip;
//            this._achievement.drag = this._viewMgr.drag.iDrag;
            this._achievement.onClose = this.close;
            this._achievement.init();
        }
        public function gotoAchievementLabel(_arg1:int):void{
            var callBack:* = null;
            var delay:* = null;
            var intAchievementId:* = _arg1;
            callBack = function ():void{
                getPlayerAchievementListCallBack();
                _achievement.gotoAchievementLabel(intAchievementId);
            };
            delay = function ():void{
                _achievement.gotoAchievementLabel(intAchievementId);
                _delayGotoAchievementLabel = null;
            };
            if (this.inStage){
                this.get_player_achievement_list(callBack);
            } else {
                this.switchSelf();
                this._delayGotoAchievementLabel = delay;
            };
        }
        private function get_player_achievement_list(_arg1:Function):void{
            this._data.call(Mod_Achievement_Base.get_player_achievement_list, _arg1, [], false);
        }
        private function getPlayerAchievementListCallBack():void{
            var _local1:Array = this._ctrl.achievement.getPlayerAchievementList;
            this._achievement.renderAchievementList(_local1);
        }

    }
}//package com.views 

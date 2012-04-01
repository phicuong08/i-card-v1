//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import flash.events.*;
    import ICard.*;
    import flash.display.*;
    import ICard.haloer.net.*;
    import ICard.assist.view.*;
    import flash.utils.*;
    import ICard.assist.view.interfaces.*;
    import ICard.assist.*;
    import ICard.protocols.*;
    import ICard.assist.view.sound.*;
    import ICard.assist.server.*;
    import ICard.lang.client.com.views.*;
    import ICard.assist.view.toolbar.*;
	import ICard.views.Base;
    public class AchievementCompleteView extends Base {

        private var _aryNotifyData:Array;
        private var _achievementComplete:IAchievementComplete;
        private var _mcButton:MovieClip;
        private var _file:File;
        private var _intTemp:int = 0;

        public function AchievementCompleteView(){
            this._aryNotifyData = [];
            super();
        }
        public function close():void{
            if (this._viewMgr.stage.contains(this._achievementComplete.content)){
                this._viewMgr.stage.removeChild(this._achievementComplete.content);
            };
            if (this._viewMgr.stage.contains(this._mcButton)){
                this._viewMgr.stage.removeChild(this._mcButton);
            };
            this._mcButton.removeEventListener(MouseEvent.CLICK, this.onMcButtonMouseClick);
        }
        public function reposition(_arg1:Boolean=true):void{
            if (true == _arg1){
               // _viewMgr.toolbar.reposition();
            } else {
                if (((!((this._achievementComplete == null))) && (this._viewMgr.stage.contains(this._achievementComplete.content)))){
                    this._achievementComplete.content.x = Math.max(350, (Math.floor(((this._viewMgr.stage.stageWidth - this._achievementComplete.content.width) / 2)) - Structure.stageClip.x));
                    this._achievementComplete.content.y = Math.max((Structure.stageHeight - 160), ((this._viewMgr.stage.stageHeight - Structure.stageOffset.y) - 160));
                    this._mcButton.x = this._achievementComplete.content.x;
                    this._mcButton.y = this._achievementComplete.content.y;
                };
            };
        }
        public function notifyCompleteAchievementCallBack():void{
            if (this._ctrl.achievement.inLoadAchievementTypeData){
                setTimeout(this.notifyCompleteAchievementCallBack, 20);
                return;
            };
            this.loadAchievementTypeCallBack();
        }
        private function loadAchievementTypeCallBack():void{
            var _local2:Object;
            var _local1:Array = this._ctrl.achievement.notifyCompleteAchievement;
            if (FunctionType.isOpened(FunctionType.Achievement)){
                for each (_local2 in _local1) {
                    this._aryNotifyData.push(_local2);
                };
                if (this._file == null){
                    this._file = new File();
                };
                this._file.onComplete = this.render;
                this._file.load((URI.assetsUrl + "achievement_complete.swf"));
            };
        }
        private function render():void{
            var _local1:Class;
            if (this._achievementComplete == null){
                _local1 = this._file.getClassByName("AchievementComplete");
                this._achievementComplete = (new (_local1)() as IAchievementComplete);
            };
            if (this._mcButton == null){
                this._mcButton = new MovieClip();
                this._mcButton.graphics.beginFill(0xFFFFFF);
                this._mcButton.graphics.drawRect(0, 0, 71, 301);
                this._mcButton.graphics.endFill();
                this._mcButton.height = 71;
                this._mcButton.width = 301;
                this._mcButton.buttonMode = true;
                this._mcButton.alpha = 0;
            };
            this._mcButton.addEventListener(MouseEvent.CLICK, this.onMcButtonMouseClick);
            this._achievementComplete.onShowTownCartoon = this.onShowTownCartoon;
            this._achievementComplete.onClose = this.close;
            this._achievementComplete.onShowAchievement = this._viewMgr.achievement.gotoAchievementLabel;
            this.isDelayShow();
        }
        private function isDelayShow():void{
            if (_viewMgr.inWar){
                _viewMgr.onWarClose = function ():void{
                    _viewMgr.onWarClose = null;
                    showCartoon();
                };
            } else {
                this.showCartoon();
            };
        }
        private function showCartoon():void{
            var _local1:Object;
            var _local2:String;
            var _local3:String;
            var _local4:String;
            var _local5:Object;
            var _local6:String;
            var _local7:String;
            var _local8:String;
            var _local9:String;
            var _local10:String;
            var _local11:String;
            var _local12:String;
            for each (_local1 in this._aryNotifyData) {
//                if (_local1["player_id"] == this._ctrl.player.playerId){
//                    if (!this._viewMgr.stage.contains(this._achievementComplete.content)){
//                        this._viewMgr.stage.addChild(this._achievementComplete.content);
//                        this._viewMgr.stage.addChild(this._mcButton);
//                        this.reposition(false);
//                    };
//                    this._achievementComplete.show(_local1);
//                };
                if (ActivityType.FactionLevel > 0){
//                    _local2 = (((((((("<a href='event:" + TextLinkType.Player) + "_") + _local1["player_id"]) + "_") + _local1["player_nickname"]) + "'><u>") + _local1["player_nickname"]) + "</u></a>");
//                    _local3 = (((((("<a href='event:" + TextLinkType.Achievement) + "_") + _local1["achievement_id"]) + "'>[<u>") + AchievementType.getName(_local1["achievement_id"])) + "</u>]</a>");
//                    _local4 = ((("<font color='#80c269'>[" + AchievementCompleteViewLang.Faction) + "]</font>") + Lang.sprintf(HtmlText.white(AchievementCompleteViewLang.GetAchievement), HtmlText.yellow(_local2), HtmlText.yellow(_local3), HtmlText.white(AchievementType.getPoint(_local1["achievement_id"]).toString())));
//                    _viewMgr.chat.receive(_local4, false, Mod_Chat_Base.FACTION);
                };
            };
            if (((!((URI.weiBoNickName == ""))) && ((this._aryNotifyData.length > 0)))){
                _local5 = (this._aryNotifyData[0] as Object);
                _local6 = (("完成" + _local5["name"]) + "成就");
                _local7 = _local5["content"];
                _local8 = "加入游戏";
                _local9 = (("人见人爱，花见花开，车间胞胎，佛见发呆的我在《神仙道》完成" + _local5["name"]) + "成就。");
                _local10 = "http://game.weibo.com/shenxiandao";
                _local11 = "http://game.weibo.com/shenxiandao";
                _local12 = _local5["url"];
     //           _viewMgr.sendWeiBo(_local6, _local7, _local8, _local9, _local10, _local11, _local12);
            };
            this._aryNotifyData = [];
        }
        private function onShowTownCartoon():void{
 //           _viewMgr.townMap.showAchievement();
            SoundEffect.play(SoundEffect.AchievementComplete);
        }
        private function onMcButtonMouseClick(_arg1:MouseEvent):void{
            this._achievementComplete.onMcButtonMouseClick();
        }

    }
}//package com.views 

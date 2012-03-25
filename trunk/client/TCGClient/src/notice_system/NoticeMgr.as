//Created by Action Script Viewer - http://www.buraks.com/asv
package notice_system {
    import mx.events.*;
    import flash.events.*;
    import normal_window.*;
    import combat_element_script.*;
    import shop_system.*;
    import tool.*;

    public class NoticeMgr extends EventDispatcher {

        private static var _instance:NoticeMgr = new (NoticeMgr)();
;

        private var ignoreNoticeList:Object;
        private var noticeWindowInfoArr:Array;
        private var currentNoticeWindow:CommonNoticeTalkWindow;

        public function NoticeMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():NoticeMgr{
            return (_instance);
        }

        private function reset():void{
            this.ignoreNoticeList = new Object();
            this.noticeWindowInfoArr = new Array();
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stateChangeHandler);
        }
        private function stateChangeHandler(_arg1:CustomStateChangeEvent):void{
            var fuc:* = null;
            var e:* = _arg1;
            fuc = function ():void{
                removeAllNoticeWindow();
            };
            TCGClient.getInstance().callLater(fuc);
        }
        public function showNoticeWindow(_arg1:Object):void{
            var snw:* = null;
            var noticeInfo:* = _arg1;
            snw = function ():void{
                if (!UserObject.isBeginnerGuideUser){
                    noticeWindowInfoArr.push(noticeInfo);
                    showNextNoticeWindow();
                };
            };
            TCGClient.getInstance().callLater(snw);
        }
        private function showNextNoticeWindow():void{
            var noticeInfo:* = null;
            var windowRemoveHandler:* = null;
            if (TCGClient.getInstance().customCurrentState == "loginWindow"){
                this.removeAllNoticeWindow();
            } else {
                if (((!(this.currentNoticeWindow)) && ((this.noticeWindowInfoArr.length > 0)))){
                    noticeInfo = this.noticeWindowInfoArr.shift();
                    if (!this.ignoreNoticeList[noticeInfo["id"]]){
                        windowRemoveHandler = function (_arg1:FlexEvent):void{
                            (_arg1.currentTarget as CommonNoticeTalkWindow).removeEventListener(FlexEvent.REMOVE, windowRemoveHandler);
                            currentNoticeWindow = null;
                            showNextNoticeWindow();
                        };
                        this.currentNoticeWindow = new CommonNoticeTalkWindow();
                        TCGClient.getInstance().mainGroup.addElement(this.currentNoticeWindow);
                        this.currentNoticeWindow.setNoticeInfo(noticeInfo);
                        this.currentNoticeWindow.addEventListener(FlexEvent.REMOVE, windowRemoveHandler);
                    };
                };
            };
        }
        public function removeAllNoticeWindow():void{
            this.noticeWindowInfoArr = new Array();
            if (this.currentNoticeWindow){
                this.currentNoticeWindow.removeSelf();
            };
        }
        public function addIgnoreNoticeId(_arg1:String):void{
            this.ignoreNoticeList[_arg1] = true;
        }
        public function showLevelUpNotice(_arg1:int):void{
            var _local2:LevelUpNotice = new LevelUpNotice();
            _local2.levelText = _arg1.toString();
            TCGClient.getInstance().mainGroup.addElement(_local2);
            this.showLevelUpUnlockNotice(_arg1, 1000);
        }
        public function showLevelUpUnlockNotice(_arg1:int, _arg2:Number=1000):void{
            var show:* = null;
            var newLevel:* = _arg1;
            var showDelay:int = _arg2;
            show = function (_arg1=null):void{
                showLevelUpItemUnlockNotice(newLevel);
                showLevelUpPieceNotice(newLevel);
            };
            if (showDelay == 0){
                show();
            } else {
                CommonUtil.addTimerLaterCall(showDelay, show);
            };
        }
        private function showLevelUpItemUnlockNotice(_arg1:int):void{
            var _local3:Object;
            var _local4:Array;
            var _local6:Array;
            var _local2:Array = new Array();
            for each (_local3 in ShopLib.getCardShopConfig()) {
                if (_local3["level_request"] == _arg1.toString()){
                    _local2.push((("#g" + _local3["name"]) + "#n"));
                };
            };
            _local4 = new Array();
            for each (_local3 in ShopLib.getItemShopConfig()) {
                if (_local3["level_request"] == _arg1.toString()){
                    _local4.push((("#g" + _local3["name"]) + "#n"));
                };
            };
            if ((((_local2.length == 0)) && ((_local4.length == 0)))){
                return;
            };
            var _local5 = "";
            if (_local2.length > 0){
                _local5 = (_local5 + "解锁卡片：");
                _local6 = _local2.slice(0, 2);
                _local5 = (_local5 + _local6.join("、"));
                _local5 = (_local5 + ((_local2.length > 2)) ? "……<br>" : "。<br>");
            };
            if (_local4.length > 0){
                _local5 = (_local5 + "解锁卡包：");
                _local6 = _local4.slice(0, 2);
                _local5 = (_local5 + _local6.join("、"));
                _local5 = (_local5 + ((_local4.length > 2)) ? "……<br>" : "。<br>");
            };
            _local5 = (_local5 + "#o可以在商城中购买这些解锁的物品。#n");
            NoticeMgr.getInstance().showNoticeWindow({content:_local5});
        }
        private function showLevelUpPieceNotice(_arg1:int):void{
            if (_arg1 == 8){
                NoticeMgr.getInstance().showNoticeWindow({content:"你现在可以进入#g正式区#n进行游戏对战，正式区对战所用卡组的数目需在#g 40 到 80 #n之间。"});
            } else {
                if (_arg1 == 10){
                    NoticeMgr.getInstance().showNoticeWindow({content:"你现在可以报名参加#g日常竞赛#n活动，点击主菜单界面的#g竞赛选项#n，即可进入竞赛大厅。"});
                };
            };
        }

    }
}//package notice_system 

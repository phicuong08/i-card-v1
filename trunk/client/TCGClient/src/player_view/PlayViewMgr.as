//Created by Action Script Viewer - http://www.buraks.com/asv
package player_view {
    import mx.core.*;
    import mx.events.*;
    import normal_window.*;
    import custom_control1.*;
    import chat_system.*;
    import combat_element_script.*;
    import tool.*;

    public class PlayViewMgr {

        private static var _instance:PlayViewMgr = new (PlayViewMgr)();
;

        public var menuWindow:PlayerViewMenu;
        public var inviteWindow:InviteWindow;
        public var searchPlayerWindow:SearchPlayerWindow;
        public var allFreePlayerWindow:AllFreePlayerWindow;
        private var waitDuelAsViewerWindow:WaitDuelWindow;

        public function PlayViewMgr(){
            this.waitDuelAsViewerWindow = new WaitDuelWindow();
            super();
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():PlayViewMgr{
            return (_instance);
        }

        public function showOpMenu(_arg1:String, _arg2:Boolean=false):void{
            if (this.menuWindow){
                this.menuWindow.removeSelf();
            };
            this.menuWindow = new PlayerViewMenu();
            this.menuWindow.playerName = _arg1;
            if (_arg2){
                TCGClient.getInstance().addElement(this.menuWindow);
                this.menuWindow.x = (TCGClient.getInstance().mouseX - 20);
                this.menuWindow.y = (TCGClient.getInstance().mouseY - 15);
            } else {
                TCGClient.getInstance().mainGroup.addElement(this.menuWindow);
                this.menuWindow.x = (TCGClient.getInstance().mainGroup.mouseX - 20);
                this.menuWindow.y = (TCGClient.getInstance().mainGroup.mouseY - 15);
                this.rejustPos(this.menuWindow);
            };
        }
        public function showSearchPlayerWindow(_arg1:Boolean=false):void{
            if (!this.searchPlayerWindow){
                this.searchPlayerWindow = new SearchPlayerWindow();
                TCGClient.getInstance().addElement(this.searchPlayerWindow);
                this.searchPlayerWindow.x = ((TCGClient.getInstance().mouseX - this.searchPlayerWindow.width) + 20);
                this.searchPlayerWindow.y = ((TCGClient.getInstance().mouseY - this.searchPlayerWindow.height) - 20);
            };
        }
        public function showAllHallPlayerWindow():void{
            var windowRemoveHandler:* = null;
            if (!this.allFreePlayerWindow){
                windowRemoveHandler = function (_arg1:FlexEvent):void{
                    TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, allFreePlayerWindow.removeSelf);
                    allFreePlayerWindow.removeEventListener(FlexEvent.REMOVE, windowRemoveHandler);
                    allFreePlayerWindow = null;
                };
                this.allFreePlayerWindow = new AllFreePlayerWindow();
                this.allFreePlayerWindow.x = 940;
                this.allFreePlayerWindow.y = 93;
                TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.allFreePlayerWindow.removeSelf);
                this.allFreePlayerWindow.addEventListener(FlexEvent.REMOVE, windowRemoveHandler);
            };
            if (!this.allFreePlayerWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.allFreePlayerWindow);
            };
        }
        public function hideAllHallPlayerWindow():void{
            if (this.allFreePlayerWindow){
                this.allFreePlayerWindow.removeSelf();
            };
        }
        public function autoShowHideAllHallPlayerWindow():void{
            if (((this.allFreePlayerWindow) && (this.allFreePlayerWindow.parent))){
                this.hideAllHallPlayerWindow();
            } else {
                this.showAllHallPlayerWindow();
            };
        }
        public function setAllHallPlayerWindowInfo(_arg1:Object):void{
            if (this.allFreePlayerWindow){
                this.allFreePlayerWindow.usersInfo = _arg1;
            };
        }
        public function showUserDetailInfoWindow(_arg1:Object):void{
            var _local2:PlayerViewDetailInfoWindow;
            if (_arg1.name){
                _local2 = new PlayerViewDetailInfoWindow();
                _local2.setInfo(_arg1);
                TCGClient.getInstance().mainGroup.addElement(_local2);
                _local2.x = (TCGClient.getInstance().mainGroup.mouseX + 70);
                _local2.y = (TCGClient.getInstance().mainGroup.mouseY - 100);
                this.rejustPos(_local2);
            };
        }
        public function showInviteWindow(_arg1:Object):void{
            var removeHandler:* = null;
            var param:* = _arg1;
            if (!GameOptionsWindnow.acceptInviteFlag){
                return;
            };
            var arr:* = ["玩家"];
            arr.push({
                type:"clickLink",
                content:(("“" + param.inviter_name) + "”"),
                color:0xF57300,
                clickFunc:function ():void{
                    PlayViewMgr.getInstance().showOpMenu(param.inviter_name, true);
                }
            });
            arr.push("邀请你加入");
            arr.push(this.getLinkRoomConfig(param));
            if (((!((TCGClient.getInstance().customCurrentState == "roomsList"))) && (!((TCGClient.getInstance().customCurrentState == "competitionHall"))))){
                arr.push("。只当处大厅状态时才能接受其他玩家的邀请。");
                ChatWindowMgr.getInstance().addSystemContent(arr);
            } else {
                if (this.inviteWindow){
                    arr.push("。当前已存在邀请窗口，略过本次邀请操作。");
                    ChatWindowMgr.getInstance().addSystemContent(arr);
                } else {
                    removeHandler = function (_arg1:FlexEvent):void{
                        inviteWindow.removeEventListener(FlexEvent.REMOVE, removeHandler);
                        inviteWindow = null;
                    };
                    this.inviteWindow = new InviteWindow();
                    this.inviteWindow.setInfo(param);
                    TCGClient.getInstance().mainGroup.addElement(this.inviteWindow);
                    this.inviteWindow.addEventListener(FlexEvent.REMOVE, removeHandler);
                };
            };
        }
        private function getLinkRoomConfig(_arg1:Object):Object{
            var content:* = null;
            var clickFunc:* = null;
            var param:* = _arg1;
            content = (("【" + RoomUtil.getRoomNameByInfo(param)) + "】");
            if (RoomUtil.isCompetitionModeRoom(param.room_type)){
                clickFunc = function ():void{
                    LuaAgent.getInstance().run((((("u.competition_mgr:enter_room(" + param.group_index) + " , ") + param.room_number) + ")"));
                };
            } else {
                clickFunc = function ():void{
                    LuaAgent.getInstance().run((((("u.hall_room_mgr:enter_room(\"" + param.room_type) + "\", ") + param.room_number) + ", false)"));
                };
            };
            return ({
                type:"clickLink",
                content:content,
                clickFunc:clickFunc,
                color:0xF57300
            });
        }
        private function rejustPos(_arg1:UIComponent):void{
            if ((_arg1.x + _arg1.width) > 0x0500){
                _arg1.x = (_arg1.x - _arg1.width);
            } else {
                if (_arg1.x < 0){
                    _arg1.x = (_arg1.x + _arg1.width);
                };
            };
            if ((_arg1.y + _arg1.height) > 800){
                _arg1.y = (_arg1.y - _arg1.height);
            } else {
                if (_arg1.y < 0){
                    _arg1.y = (_arg1.y + _arg1.height);
                };
            };
        }
        public function clickWhisperHandler(_arg1:String):void{
            ChatWindowMgr.getInstance().setWhisperPlayer(_arg1);
        }
        public function inviteDuel(_arg1:String):void{
            if (UserObject.name == _arg1){
                ChatWindowMgr.getInstance().addSystemContent("无法邀请自己！除非系统故障...");
            } else {
                LuaAgent.getInstance().run((((("u.player_view_mgr:invite_other_player_to_room(\"" + _arg1) + "\" , \"") + RoomsList.getInstance().getRoomListType()) + "\")"));
            };
        }
        public function followPlayer(_arg1:String):void{
            if (UserObject.name == _arg1){
                ChatWindowMgr.getInstance().addSystemContent("你逗我玩呢！自己跟随自己...");
            } else {
                LuaAgent.getInstance().run((("u.player_view_mgr:follow_other_player_to_room(\"" + _arg1) + "\")"));
            };
        }
        public function getDetailInfo(_arg1:String):void{
            LuaAgent.getInstance().run((("u.player_view_mgr:get_other_user_detail_info(\"" + _arg1) + "\")"));
        }
        public function showRoomFullNotice():void{
            MessageBox.showMessageBox(MessageBox.NOTICE, "提示：", "房间已满，无法加入！");
        }
        public function showWaitDuelAsViewerWindow(_arg1:Object):void{
            if (!this.waitDuelAsViewerWindow.parent){
                TCGClient.getInstance().mainGroup.addElement(this.waitDuelAsViewerWindow);
            };
            this.waitDuelAsViewerWindow.setInfo(_arg1);
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.hideWaitDuelAsViewerWindow);
        }
        public function hideWaitDuelAsViewerWindow(_arg1=null):void{
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.hideWaitDuelAsViewerWindow);
            this.waitDuelAsViewerWindow.removeSelf();
        }

    }
}//package player_view 

//Created by Action Script Viewer - http://www.buraks.com/asv
package social_contact {
    import mx.events.*;
    import flash.events.*;
    import chat_system.*;
    import combat_element_script.*;

    public class SocialContactMgr extends EventDispatcher {

        private static var _instance:SocialContactMgr = new (SocialContactMgr)();
;

        private var socialContactWindow:SocialContactWindow;

        public function SocialContactMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():SocialContactMgr{
            return (_instance);
        }

        public function reset():void{
        }
        public function showSocialContactWindow():void{
            var clearWindow:* = null;
            if (!this.socialContactWindow){
                clearWindow = function (_arg1:FlexEvent):void{
                    socialContactWindow.removeEventListener(FlexEvent.REMOVE, clearWindow);
                    socialContactWindow = null;
                };
                this.socialContactWindow = new SocialContactWindow();
                this.socialContactWindow.x = 1000;
                this.socialContactWindow.y = 180;
                this.socialContactWindow.addEventListener(FlexEvent.REMOVE, clearWindow);
                TCGClient.getInstance().mainGroup.addElement(this.socialContactWindow);
            };
        }
        public function hideSocialContactWindow():void{
            if (this.socialContactWindow){
                this.socialContactWindow.removeSelf();
                this.socialContactWindow = null;
            };
        }
        public function autoShowHideSocialContactWindow():void{
            if (this.socialContactWindow){
                this.hideSocialContactWindow();
            } else {
                this.showSocialContactWindow();
            };
        }
        public function setAllSocialContactInfo(_arg1:Object):void{
            if (this.socialContactWindow){
                this.socialContactWindow.setAllSocialContactInfo(_arg1);
            };
        }
        public function friendLogin(_arg1:Object):void{
            ChatWindowMgr.getInstance().addSystemContent((("“" + _arg1.name) + "”登陆游戏！"));
            if (this.socialContactWindow){
                this.socialContactWindow.friendRefresh(_arg1);
            };
        }
        public function friendLevelUp(_arg1:Object):void{
            if (this.socialContactWindow){
                this.socialContactWindow.friendRefresh(_arg1);
            };
        }
        public function friendLogout(_arg1:Object):void{
            ChatWindowMgr.getInstance().addSystemContent((("“" + _arg1.name) + "”下线了。"));
            if (this.socialContactWindow){
                this.socialContactWindow.friendRefresh(_arg1);
            };
        }
        public function friendAdded(_arg1:Object):void{
            ChatWindowMgr.getInstance().addSystemContent((("成功添加“" + _arg1.name) + "”为好友。"));
            if (this.socialContactWindow){
                this.socialContactWindow.friendRefresh(_arg1);
            };
        }
        public function friendRemoved(_arg1:String):void{
            ChatWindowMgr.getInstance().addSystemContent((("将“" + _arg1) + "”从好友列表中移除。"));
            if (this.socialContactWindow){
                this.socialContactWindow.friendRemoved(_arg1);
            };
        }
        public function ignoreAdded(_arg1:Object):void{
            ChatWindowMgr.getInstance().addSystemContent((("成功添加“" + _arg1.name) + "”到忽略列表。"));
            if (this.socialContactWindow){
                this.socialContactWindow.ignoreAdded(_arg1);
            };
        }
        public function ignoreRemoved(_arg1:String):void{
            ChatWindowMgr.getInstance().addSystemContent((("将“" + _arg1) + "”从忽略列表中移除。"));
            if (this.socialContactWindow){
                this.socialContactWindow.ignoreRemoved(_arg1);
            };
        }
        public function tryAddFriend(_arg1:String):void{
            LuaAgent.getInstance().run((("u.social_contact_mgr:add_friend(\"" + _arg1) + "\")"));
        }
        public function tryRemoveFriend(_arg1:String):void{
            LuaAgent.getInstance().run((("u.social_contact_mgr:remove_friend(\"" + _arg1) + "\")"));
        }
        public function tryAddIgnore(_arg1:String):void{
            LuaAgent.getInstance().run((("u.social_contact_mgr:add_ignore(\"" + _arg1) + "\")"));
        }
        public function tryRemoveIgnore(_arg1:String):void{
            LuaAgent.getInstance().run((("u.social_contact_mgr:remove_ignore(\"" + _arg1) + "\")"));
        }

    }
}//package social_contact 

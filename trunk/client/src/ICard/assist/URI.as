//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist {
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;

    public class URI {

        private static var _domain:String = "4x001.xd.com";
        private static var _serverPort:int = 8000;
        private static var _clientUrl:String = "http://sxd.xdcdn.net/2012020401/";
        private static var _policyPort:int = 888;
        private static var _gateWayPort:int = 10010;
        private static var _args:Object = {};
        private static var _assetsUrl:String;
        private static var _fullClientUrl:String;
        private static var _version:Object = {};
        public static var test:Boolean = false;
        private static var _stage:Stage;
        private static var _lc:LocalConnection = new LocalConnection();

        public static function get playerName():String{
            return (_args["player_name"]);
        }
        public static function set playerName(_arg1:String):void{
            _args["player_name"] = _arg1;
        }
        public static function get hashCode():String{
            return (_args["hash_code"]);
        }
        public static function set hashCode(_arg1:String):void{
            _args["hash_code"] = _arg1;
        }
        public static function get time():String{
            return (_args["time"]);
        }
        public static function set time(_arg1:String):void{
            _args["time"] = _arg1;
        }
        public static function get ip():String{
            return (((_args["ip"]) || ("")));
        }
        public static function get port():int{
            return (((_args["port"]) || (0)));
        }
        public static function get gameVersion():int{
           // return (((((_args["game_version"]) || (Config.GameVersion))) || (0)));
			return 0;
        }
        public static function get assetsRnd():String{
            return (((_args["assets_rnd"]) || ("")));
        }
        public static function get openTime():int{
            return (((_args["open_time"]) || (0)));
        }
        public static function get serverName():String{
            return (((_args["server_name"]) || ("")));
        }
        public static function get serverUrl():String{
            return (((_args["server_url"]) || ("")));
        }
        public static function get worldWarServerUrl():String{
            return (((_args["world_war_server_url"]) || ("")));
        }
        public static function nickNameSuffix(_arg1:Boolean=false):String{
            var _local2:String = ((_args["nickname_suffix"]) || (""));
            if (((_arg1) && (!((_local2 == ""))))){
                _local2 = _local2.replace(".", "\\.");
                _local2 = _local2.replace("-", "\\-");
                _local2 = _local2.replace("[", "\\[");
                _local2 = _local2.replace("]", "\\]");
            };
            return (_local2);
        }
        public static function get webSiteUrl():String{
            return (((_args["website"]) || ("")));
        }
        public static function get bbsUrl():String{
            return (((_args["bbs"]) || ("")));
        }
        public static function get rechargeUrl():String{
            return (((_args["recharge"]) || ("")));
        }
        public static function get bugUrl():String{
            return (((_args["bug"]) || ("")));
        }
        public static function get bugListUrl():String{
            return (((_args["bug_list_url"]) || ("")));
        }
        public static function get bugFeedbackUrl():String{
            return (((_args["bug_feedback_url"]) || ("")));
        }
        public static function get activationKeysUrl():String{
            return (((_args["code"]) || ("")));
        }
        public static function get vipInfoUrl():String{
            return (((_args["vip_info"]) || ("")));
        }
        public static function get sourceUrl():String{
            return (((_args["source"]) || ("")));
        }
        public static function get regdate():int{
            return (((_args["regdate"]) || (0)));
        }
        public static function get publish():String{
            return (((_args["publish"]) || ("")));
        }
        public static function get isBaidu():Boolean{
            return ((parseInt(_args["baidu"]) == 1));
        }
        public static function get preventUrl():String{
            return (_args["prevent_url"]);
        }
        public static function get isMangguo():Boolean{
            return ((parseInt(_args["mangguo"]) == 1));
        }
        public static function get nonKid():Boolean{
            return ((parseInt(_args["non_kid"]) == 1));
        }
        public static function get vipHidden():Boolean{
            return ((parseInt(_args["vip_hidden"]) == 1));
        }
        public static function get gmUrl():String{
            return (((_args["gm_url"]) || ("")));
        }
        public static function get isSogou():Boolean{
            return ((parseInt(_args["sogou"]) == 1));
        }
        public static function get isPlatformB():Boolean{
            return ((parseInt(_args["platform_b"]) == 1));
        }
        public static function get weiBoNickName():String{
            return (((_args["weibo_nickname"]) || ("")));
        }
        public static function get weiBoGender():String{
            var _local1:String = _args["weibo_gender"];
            return 'm';//((/^(?:m|f|n)$/.test(_local1)) ? _local1 : "n");
        }
        public static function get domain():String{
            return (_domain);
        }
        public static function set domain(_arg1:String):void{
            _domain = _arg1;
        }
        public static function get fullClientUrl():String{
            return (_fullClientUrl);
        }
        public static function get fullAssetsUrl():String{
            return ((_fullClientUrl + "assets/"));
        }
        public static function get clientUrl():String{
            return (_clientUrl);
        }
        public static function get gateWayPort():int{
            return (_gateWayPort);
        }
        public static function get serverPort():int{
            return (_serverPort);
        }
        public static function set serverPort(_arg1:int):void{
            _serverPort = _arg1;
        }
        public static function get policyPort():int{
            return (_policyPort);
        }
        public static function get assetsUrl():String{
            return (_assetsUrl);
        }
        public static function get addonsUrl():String{
            return ((_assetsUrl + "addons/"));
        }
        public static function get townUrl():String{
            return ((_assetsUrl + "map/town/"));
        }
        public static function get soundUrl():String{
            return ((_assetsUrl + "map/sound/"));
        }
        public static function get mapUrl():String{
            return ((_assetsUrl + "map/"));
        }
        public static function get missionUrl():String{
            return ((_assetsUrl + "map/mission/"));
        }
        public static function get sportUrl():String{
            return ((_assetsUrl + "map/sport/"));
        }
        public static function get worldBossUrl():String{
            return ((_assetsUrl + "map/world_boss/"));
        }
        public static function get goodsIconUrl():String{
            return ((_assetsUrl + "icons/goods/"));
        }
        public static function get npcIconUrl():String{
            return ((_assetsUrl + "icons/npc/"));
        }
        public static function get buffIconUrl():String{
            return ((_assetsUrl + "icons/buff/"));
        }
        public static function get effectsUrl():String{
            return ((_assetsUrl + "roles/effects/"));
        }
        public static function get screenUrl():String{
            return ((_assetsUrl + "roles/screen/"));
        }
        public static function get dramaUrl():String{
            return ((_assetsUrl + "drama/"));
        }
        public static function get bossUrl():String{
            return ((_assetsUrl + "icons/boss/"));
        }
        public static function get fateUrl():String{
            return ((_assetsUrl + "icons/fate/"));
        }
        public static function get flowerUrl():String{
            return ((_assetsUrl + "icons/flower/"));
        }
        public static function get avatarUrl():String{
            return ((_assetsUrl + "roles/avatar/"));
        }
        public static function get stuntsUrl():String{
            return ((_assetsUrl + "roles/stunts/"));
        }
        public static function get roleUrl():String{
            return ((_assetsUrl + "roles/"));
        }
        public static function get iconsUrl():String{
            return ((_assetsUrl + "roles/icons/"));
        }
        public static function get chooseRolesUrl():String{
            return ((_assetsUrl + "icons/choose_roles/"));
        }
        public static function get warRolesUrl():String{
            return ((_assetsUrl + "roles/war/"));
        }
        public static function get researchIconUrl():String{
            return ((_assetsUrl + "icons/research/"));
        }
        public static function get farmIconUrl():String{
            return ((_assetsUrl + "icons/farm/"));
        }
        public static function get activityUrl():String{
            return ((_assetsUrl + "icons/activity/"));
        }
        public static function get triggerUrl():String{
            return ((_assetsUrl + "icons/trigger/"));
        }
        public static function get soundEffectUrl():String{
            return ((_assetsUrl + "sound_effect/"));
        }
        public static function getRoleIconUrl(_arg1:String):String{
            return (((iconsUrl + _arg1) + ".png"));
        }
        public static function getGoodsIconUrl(_arg1:int):String{
            return (((goodsIconUrl + _arg1) + ".png"));
        }
        public static function getSoulsIconUrl(_arg1:int):String{
            return ((((_assetsUrl + "icons/souls/") + _arg1) + ".swf"));
        }
        public static function get achievementUrl():String{
            return ((_assetsUrl + "icons/achievement/"));
        }
        public static function get sportIconUrl():String{
            return ((_assetsUrl + "roles/super_sport/"));
        }
        public static function formatVersion(_arg1:String):void{
            var _local3:String;
            var _local4:Array;
            var _local2:Array = _arg1.split(/\r\n|\r|\n/g);
            for each (_local3 in _local2) {
                _local4 = _local3.split("|");
                if (_local4.length == 2){
                    _version[_local4[0]] = _local4[1];
                };
            };
        }
        public static function getVersion(_arg1:String):String{
            var _local4:int;
            _arg1 = _arg1.replace(_assetsUrl, "");
            var _local2:Array = _arg1.split("/");
            var _local3:int = _local2.length;
            if (_local3 > 1){
                _arg1 = "";
                _local4 = 0;
                while (_local4 < (_local3 - 1)) {
                    _arg1 = (_arg1 + ("/" + _local2[_local4].substr(0, 1)));
                    _local4++;
                };
                _arg1 = ((_arg1 + "/") + _local2[(_local3 - 1)]);
            } else {
                _arg1 = ("/" + _arg1);
            };
            _arg1 = ((_version[_arg1]) || (""));
            return (_arg1);
        }
        public static function analyze(_arg1:Object):void{
            _stage = _arg1.stage;
            var _local2:Object = _stage.getChildAt(0);
            if (_local2.hasOwnProperty("args")){
                _args = _local2.args;
            };
            if (_args["client_url"]){
                _clientUrl = _args["client_url"];
            };
            _assetsUrl = (_clientUrl + "assets/");
            if ("./" == _clientUrl){
                _fullClientUrl = _arg1.loaderInfo.url.replace(/(Main|rw)\.swf(\?[\s\S]+?)?/, "");
            } else {
                _fullClientUrl = _clientUrl;
            };
        }
        public static function selectDomain(_arg1:Function=null):void{
            if (test){
                TempSelectDomain.stage = _stage;
                TempSelectDomain.show(_arg1);
            };
        }
        public static function localConnection(_arg1:String):void{
            var playerName:* = _arg1;
            _lc.allowDomain("*");
            _lc.allowInsecureDomain("*");
            _lc.client = Helper;
            _lc.addEventListener(StatusEvent.STATUS, statusHandler);
            var name:* = ((serverName) ? (serverName + "_") : "" + serverName);
            try {
                _lc.connect(name);
            } catch(e:ErrorEvent) {
            };
        }
        private static function statusHandler(_arg1:StatusEvent):void{
        }

    }
}//package com.assist 

import flash.events.*;
import flash.display.*;
import ICard.haloer.net.*;
import ICard.assist.URI;
class TempSelectDomain {

    public static var stage:Stage;
    private static var _login:Sprite;
    private static var _ipSelectedIndex:int = 0;
    private static var _onConnect:Function;

    public function TempSelectDomain(){
    }
    public static function show(_arg1:Function):void{
        var file:* = null;
        var callback:* = _arg1;
        if (_login){
            if (_login.parent){
                _onConnect = null;
                _login.parent.removeChild(_login);
            } else {
                _onConnect = callback;
                render();
            };
            return;
        };
        _onConnect = callback;
        file = new File();
        file.onComplete = function ():void{
            var _local1:Class;
            if (_login == null){
                _local1 = file.getClassByName("Login");
                _login = new (_local1)();
                _login.x = ((stage.stageWidth - _login.width) / 4);
                _login.y = ((stage.stageHeight - _login.height) / 4);
            };
            render();
        };
        file.load(((URI.assetsUrl + "login.swf?rnd=") + Math.random()));
    }
    private static function render():void{
        stage.addChild(_login);
        _login["_UserName"].text = "";
        _login["_IP"].selectedIndex = _ipSelectedIndex;
        _login["_Login"].addEventListener(MouseEvent.CLICK, onLoginHandler);
    }
    private static function onLoginHandler(_arg1:MouseEvent):void{
        var _local3:String;
        var _local2:String = _login["_UserName"].text;
        _local2 = _local2.replace(/^\s+|\s+$/, "");
        _ipSelectedIndex = _login["_IP"].selectedIndex;
        if (_local2){
            stage.removeChild(_login);
            URI.playerName = _local2;
            URI.hashCode = null;
            _local3 = (_login["_IP"].selectedItem) ? _login["_IP"].selectedItem.data : _login["_IP"].selectedLabel;
            _onConnect(_local3);
        };
    }

}

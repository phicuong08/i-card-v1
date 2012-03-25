//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element_script {
    import flash.events.*;
    import custom_control1.*;
    import task_guide.*;
    import flash.utils.*;
    import shop_system.*;
    import flash.net.*;
    import achievement_system.*;
    import luaAlchemy.*;

    public class LuaAgent extends EventDispatcher {

        public static const LUA_FILE_UPDATE_COMPLETE:String = "lua 文件更新完毕";
        public static const UPDATE_ONE_LUAFILE:String = "单个文件更新完毕";

        private static var _instance:LuaAgent = new (LuaAgent)();
;
        public static var lastCmd:String = "";

        public var nameList:Array;
        public var totalFileNum:int = 0;
        private var isUpdateFiles:Boolean = true;
        private var myLua:LuaAlchemy;
        private var currentLoadFileName:String;
        private var updateTime:int;
        private var noticeYPos:Number;
        private var debugCount:int = 0;

        public function LuaAgent(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():LuaAgent{
            return (_instance);
        }
        public static function objectToLuaString(_arg1:Object):String{
            var _local3:*;
            var _local4:*;
            var _local5:*;
            var _local6:*;
            if (!_arg1){
                return ("nil");
            };
            var _local2 = "{";
            for (_local3 in _arg1) {
                _local4 = _arg1[_local3];
                if ((_local3 is String)){
                    if ((((_local3.charAt(0) == "{")) && ((_local3.charAt((_local3.length - 1)) == "}")))){
                        _local5 = _local3;
                    } else {
                        _local5 = (("['" + _local3) + "']");
                    };
                } else {
                    _local5 = (("[" + _local3.toString()) + "]");
                };
                if ((_local4 is String)){
                    if ((((_local4.charAt(0) == "{")) && ((_local4.charAt((_local4.length - 1)) == "}")))){
                        _local6 = _local4;
                    } else {
                        _local6 = (("'" + _local4) + "'");
                    };
                } else {
                    _local6 = _local4.toString();
                };
                _local2 = ((((_local2 + _local5) + "=") + _local6) + ",");
            };
            _local2 = (_local2 + "}");
            return (_local2);
        }
        public static function arrayToLuaString(_arg1:Array):String{
            var _local5:*;
            var _local6:*;
            if (!_arg1){
                return ("nil");
            };
            var _local2:int = _arg1.length;
            var _local3 = "{";
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = _arg1[_local4];
                if ((_local5 is String)){
                    if ((((_local5.charAt(0) == "{")) && ((_local5.charAt((_local5.length - 1)) == "}")))){
                        _local6 = _local5;
                    } else {
                        _local6 = (("'" + _local5) + "'");
                    };
                } else {
                    _local6 = _local5.toString();
                };
                _local3 = ((_local3 + _local6) + ",");
                _local4++;
            };
            _local3 = (_local3 + "}");
            return (_local3);
        }

        public function createLua():void{
            if (this.myLua == null){
                this.myLua = new LuaAlchemy();
            } else {
                this.myLua.init();
            };
            this.updateFiles();
        }
        public function updateFiles():void{
            debugWindow.myTrace("lua 虚拟机开始初始化：");
            this.nameList = new Array();
            this.totalFileNum = 0;
            this.updateTime = 0;
            this.noticeYPos = 20;
            this.myDoString("g_flash = true;");
            this.enableTrace(false);
            this.isUpdateFiles = true;
            this.updateOneLuaFile("../src/lua/main.lua");
        }
        private function updateOneLuaFile(_arg1:String):void{
            this.currentLoadFileName = _arg1;
            if (TCGClient.isDebugMode){
                this.debugUpdate(_arg1);
            } else {
                TCGClient.getInstance().callLater(this.releaseUpdate, [_arg1]);
            };
        }
        public function addFileToList(_arg1:String):void{
            if (!this.isUpdateFiles){
                this.updateOneLuaFile((("../src/lua/" + _arg1) + ".lua"));
            } else {
                this.nameList.push(_arg1);
                this.totalFileNum++;
            };
        }
        private function releaseUpdate(_arg1:String):void{
            var _local2:Class = this.getFileCls(_arg1);
            this.supplyAndDoLuaFile(ByteArray(new (_local2)()));
        }
        private function getFileCls(_arg1:String):Class{
            var _local2:String = _arg1.replace("../src/lua/", "");
            _local2 = _local2.replace(".lua", "");
            _local2 = _local2.replace(new RegExp("/", "g"), "_");
            if (!LuaFiles[_local2]){
                throw (new Error(((("没有嵌入该 lua 文件! fileClsName = " + _local2) + "; path = ") + _arg1)));
            };
            return (LuaFiles[_local2]);
        }
        private function debugUpdate(_arg1:String):void{
            var _local2:URLLoader = new URLLoader();
            var _local3:URLRequest = new URLRequest(this.currentLoadFileName);
            _local2.addEventListener(Event.COMPLETE, this.onLoadCompleteHandler);
            _local2.addEventListener(IOErrorEvent.IO_ERROR, this.onLoadErrorHandler);
            _local2.dataFormat = "binary";
            _local2.load(_local3);
        }
        public function removeListener(_arg1:Event):void{
            var _local2:URLLoader = (_arg1.currentTarget as URLLoader);
            _local2.removeEventListener(Event.COMPLETE, this.onLoadCompleteHandler);
            _local2.removeEventListener(IOErrorEvent.IO_ERROR, this.onLoadErrorHandler);
        }
        private function onLoadCompleteHandler(_arg1:Event):void{
            this.removeListener(_arg1);
            this.updateTime = 0;
            this.supplyAndDoLuaFile(ByteArray(_arg1.target.data));
        }
        private function onLoadErrorHandler(_arg1:Event):void{
            this.removeListener(_arg1);
            this.updateTime++;
            var _local2:NoticeWindow = new NoticeWindow();
            _local2.y = this.noticeYPos;
            this.noticeYPos = (this.noticeYPos + _local2.height);
            _local2.noticeText = (this.currentLoadFileName + "载入失败！\n 重新尝试。");
            TCGClient.getInstance().mainGroup.addElement(_local2);
            if (this.updateTime > 4){
                _local2.noticeText = (this.currentLoadFileName + "载入异常！\n无法正常游戏。");
            } else {
                this.updateOneLuaFile(this.currentLoadFileName);
            };
        }
        private function supplyAndDoLuaFile(_arg1:ByteArray):void{
            this.myLua.supplyFile((this.debugCount.toString() + this.currentLoadFileName), _arg1);
            this.myLua.doFile((this.debugCount.toString() + this.currentLoadFileName));
            dispatchEvent(new Event(UPDATE_ONE_LUAFILE));
            if (this.isUpdateFiles){
                debugWindow.myTrace((this.currentLoadFileName + "  更新完毕"));
                if (this.nameList.length > 0){
                    this.updateOneLuaFile((("../src/lua/" + this.nameList.shift()) + ".lua"));
                } else {
                    this.setLibs();
                    dispatchEvent(new Event(LUA_FILE_UPDATE_COMPLETE));
                    this.myDoString("record_enable(true)");
                    debugWindow.myTraceEx("更新完毕");
                    this.isUpdateFiles = false;
                };
            } else {
                debugWindow.myTraceEx((this.currentLoadFileName + "  更新完毕"));
            };
            this.debugCount++;
        }
        public function closeLua():void{
            if (this.myLua != null){
                this.myLua.close();
            };
        }
        public function enableTrace(_arg1:Boolean):void{
            if (_arg1){
                this.myDoString("g_enable_trace = true");
                debugWindow.myTrace("开启 trace");
            } else {
                this.myDoString("g_enable_trace = false");
                debugWindow.myTrace("关闭 trace");
            };
        }
        public function run(_arg1:String, _arg2:Boolean=false, _arg3:Boolean=false):Array{
            if (this.myLua == null){
                return ([false]);
            };
            if (_arg1.indexOf("'") == 0){
                _arg1 = ("return " + _arg1.slice(1));
            };
            _arg1 = (("return xpcall(function () " + _arg1) + " end, error_handler)");
            var _local4:Array = this.myDoString(_arg1);
            _local4.splice(1, 1);
            if (((_local4[0]) && (!(_arg2)))){
                debugWindow.myTrace(("lua 命令执行结果：\n" + _local4.join("\n")));
            };
            return (_local4);
        }
        private function setLibs():void{
            this.setCardsLib();
            this.setCardShopLib();
            this.setItemShopLib();
            this.setAchievementLib();
            this.setGuideLib();
        }
        private function setCardsLib():void{
            var _local2:Array;
            var _local3:Object;
            var _local4:String;
            var _local5:String;
            debugWindow.myTrace("设置卡库数据到 lua");
            var _local1:Object = CardsInfo.getAllCardsInfo();
            for each (_local3 in _local1) {
                _local2 = new Array();
                for (_local4 in _local3) {
                    if ((((((((((((((_local4 == "id")) || ((_local4 == "star")))) || ((_local4 == "str")))) || ((_local4 == "int")))) || ((_local4 == "rare")))) || ((_local4 == "rare_level")))) || ((_local4 == "use_level")))){
                        _local2.push((("\"" + _local4) + "\""), int(_local3[_local4]));
                    } else {
                        _local2.push((("\"" + _local4) + "\""), (("\"" + _local3[_local4]) + "\""));
                    };
                };
                _local5 = (("set_card_info(" + _local2.toString()) + ");");
                this.myDoString(_local5);
            };
        }
        private function setCardShopLib():void{
            var _local2:Array;
            var _local3:Object;
            var _local4:String;
            var _local5:String;
            debugWindow.myTrace("设置卡片商店数据到 lua");
            var _local1:Object = ShopLib.getCardShopConfig();
            for each (_local3 in _local1) {
                _local2 = new Array();
                for (_local4 in _local3) {
                    if (_local4 == "name"){
                        _local2.push((("\"" + _local4) + "\""), (("\"" + _local3[_local4]) + "\""));
                    } else {
                        _local2.push((("\"" + _local4) + "\""), int(_local3[_local4]));
                    };
                };
                _local5 = (("set_card_shop_info(" + _local2.toString()) + ");");
                this.myDoString(_local5);
            };
        }
        private function setItemShopLib():void{
            var _local2:Array;
            var _local3:Object;
            var _local4:String;
            var _local5:String;
            debugWindow.myTrace("设置道具商店数据到 lua");
            var _local1:Object = ShopLib.getItemShopConfig();
            for each (_local3 in _local1) {
                _local2 = new Array();
                for (_local4 in _local3) {
                    if ((((((((((_local4 == "name")) || ((_local4 == "pack_name")))) || ((_local4 == "type")))) || ((_local4 == "desc")))) || ((_local4 == "sale_arg")))){
                        _local2.push((("\"" + _local4) + "\""), (("\"" + _local3[_local4]) + "\""));
                    } else {
                        _local2.push((("\"" + _local4) + "\""), int(_local3[_local4]));
                    };
                };
                _local5 = (("set_item_shop_info(" + _local2.toString()) + ");");
                this.myDoString(_local5);
            };
        }
        private function setAchievementLib():void{
            var _local2:Array;
            var _local3:Object;
            var _local4:String;
            var _local5:String;
            debugWindow.myTrace("设置成就数据到 lua");
            var _local1:Object = AchievementLib.achievementConfig;
            for each (_local3 in _local1) {
                _local2 = new Array();
                for (_local4 in _local3) {
                    if ((((_local4 == "id")) || ((_local4 == "score")))){
                        _local2.push((("\"" + _local4) + "\""), int(_local3[_local4]));
                    } else {
                        _local2.push((("\"" + _local4) + "\""), (("\"" + _local3[_local4]) + "\""));
                    };
                };
                _local5 = (("set_achievement_info(" + _local2.toString()) + ");");
                this.myDoString(_local5);
            };
        }
        private function setGuideLib():void{
            var _local2:Array;
            var _local3:String;
            var _local4:Object;
            var _local5:String;
            var _local6:String;
            debugWindow.myTrace("设置指引配置到 lua");
            var _local1:Object = GuideLib.guideConfig;
            for (_local3 in _local1) {
                for each (_local4 in _local1[_local3]) {
                    _local2 = new Array();
                    _local2.push(_local3);
                    for (_local5 in _local4) {
                        if (_local5 == "step"){
                            _local2.push((("\"" + _local5) + "\""), int(_local4[_local5]));
                        } else {
                            _local2.push((("\"" + _local5) + "\""), (("\"" + _local4[_local5]) + "\""));
                        };
                    };
                    _local6 = (("set_guide_info(" + _local2.toString()) + ");");
                    this.myDoString(_local6);
                };
            };
        }
        public function myDoString(_arg1:String):Array{
            lastCmd = _arg1;
            return (this.myLua.doString(_arg1));
        }

    }
}//package combat_element_script 

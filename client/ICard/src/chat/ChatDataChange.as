package {
    import com.lang.client_resources.chat.*;
    import com.protocols.*;
    import com.assist.view.*;
    import com.assist.view.toolbar.*;
    import com.assist.server.*;
    import com.assist.view.pack.*;
    import com.assist.view.war.*;
    import com.*;

    public class chatDataChange {

        private static var _smileys:Array = ["", "eip1", "eip2", "eip3", "eip4", "eip5", "eip6", "eip7", "eip8", "eip9", "eip10", "eip11", "eip12", "eip13", "eip14", "eip15", "eip16", "eip17", "eip18", "eip19", "eip20", "eip21", "eip22", "eip23", "eip24", "eip25", "Male", "Female", "Star"];
        private static var _eipList:Array;
        private static var _mainNum:int = 20;
        private static var _systemType:int = 100;
        private static var shieldPlayerList:Array = [];
        private static var _titleNum:int = 12;
        private static var _titleCountNum:int = 0;
        private static var _eipBleak:String = " ";
        private static var _lineLimit:int = 40;
        private static var _iconPx:int = 5;
        private static var _changeLineNum:int = 0;
        private static var _spaceStr:String = " 　　 ";
        private static var townMsg:Array;

        public static function renderMessage(_arg1:Array, _arg2:int=99):Array{
            var _local5:Object;
            var _local6:Boolean;
            _eipList = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _arg1[_local4];
                if (shieldPlayerList.length > 0){
                    _local6 = isShieldPlayer(_local5);
                    //unresolved if
                } else {
                    _local5.nameNum = countStr(_local5.playName);
                    switch (_local5.msgType){
                        case Mod_Chat_Base.ACTIVITY:
                            _local5.chatType = (("[" + ChatLang.Activity) + "]");
                            _local5.typeColor = "#ffffff";
                            break;
                        case Mod_Chat_Base.WORLD:
                            _local5.chatType = (("[" + ChatLang.World) + "]");
                            _local5.typeColor = "#ffffff";
                            break;
                        case Mod_Chat_Base.FACTION:
                            _local5.typeColor = "#80c269";
                            _local5.chatType = (("[" + ChatLang.Faction) + "]");
                            break;
                        case _systemType:
                            _local5.chatType = (("[" + ChatLang.Tip) + "]");
                            _local5.typeColor = "#ffffff";
                            _local5.playName = "";
                            _local5.showName = "";
                            break;
                    };
                    if (/^MSG\d+/.test(_local5.msgTxt)){
                        renderReport(_local5);
                    } else {
                        _local5.eipLive = {};
                        countTitleNum(_local5);
                    };
                };
                _local4++;
            };
            townChatInfo(_arg1);
            return (_eipList);
        }
        public static function getShieldPlayerInfo(_arg1:String, _arg2:int):String{
            var _local8:Array;
            var _local9:Object;
            var _local10:Object;
            var _local3:Array = _arg1.split("_");
            var _local4:int = _local3.length;
            var _local5:Array = [];
            var _local6:int;
            while (_local6 < _local4) {
                _local8 = _local3[_local6].split(",");
                _local9 = {};
                _local9.playId = _local8[0];
                _local9.addTime = _local8[1];
                _local10 = TimeChange.diffTimerInfo(_local9.addTime, _arg2);
                if (_local10.date < 1){
                    shieldPlayerList.push(_local9);
                    _local5.push(_local3[_local6]);
                };
                _local6++;
            };
            var _local7:String = _local5.join("_");
            return (_local7);
        }
        public static function isShieldPlayer(_arg1:Object, _arg2:Boolean=false):Boolean{
            var _local5:Object;
            var _local6:Object;
            var _local3:int = shieldPlayerList.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = shieldPlayerList[_local4];
                if (_local5.playId == _arg1.playId){
                    if (_arg2 == false){
                        _local6 = TimeChange.diffTimerInfo(_local5.addTime, _arg1.serverTime);
                        if (_local6.date >= 1){
                            shieldPlayerList.splice(_local4, 1);
                            return (true);
                        };
                    };
                    return (false);
                };
                _local4++;
            };
            if (_arg2){
                shieldPlayerList.push(_arg1);
            };
            return (true);
        }
        private static function renderReport(_arg1:Object):void{
            _titleNum = ((countStr(_arg1.chatType) + countStr(_arg1.playName)) + _iconPx);
            _arg1.type = _arg1.msgType;
            var _local2:String = _arg1.msgTxt;
            var _local3:Array = _local2.split("_");
            var _local4:XML = <rtf>
							<text></text>
							<sprites>
							</sprites>
							</rtf>
            ;
            switch (_local3[0]){
                case ChatMsgType.Item:
                    break;
                case ChatMsgType.WarReport:
                    _arg1.chatType = (("[" + ChatLang.WarReport) + "]");
                    break;
            };
            var _local5:String = (((((((((((((((((((((((("<a href = \"event:" + _arg1.msgType) + "\">") + "<font color=\"") + _arg1.typeColor) + "\">") + _arg1.chatType) + "</font>") + "</a>") + "<font color=\"#ffcc99\">") + "<a href = \"event:") + TextLinkType.Player) + "_") + _arg1.playId) + "_") + _arg1.playName) + "_") + _arg1.sex) + "\">") + "<u>") + _arg1.showName) + "</u>") + "</a>") + "</font>") + ":");
            switch (_local3[0]){
                case ChatMsgType.Item:
                    _local5 = (_local5 + renderItem(_local3[1], _local3[2], _arg1.msgTxt, ((_local3[3]) || (0)), ((_local3[4]) || (0)), ((_local3[5]) || (""))));
                    break;
                case ChatMsgType.WarReport:
                    _local5 = (_local5 + renderWarReport(_arg1.nickNameSuffix(_local3[1]), _arg1.nickNameSuffix(_local3[2]), _local3[3], _local3[4], _local3[5], _local3[6], _local3[7], _local3[8]));
                    break;
                case ChatMsgType.Soul:
                    _local5 = (_local5 + renderSoul(_local3[1], _local3[2], _local3[3], _local3[4], ((_local3[5]) || (0)), ((_local3[6]) || (0)), ((_local3[7]) || (0))));
                    break;
            };
            var _local6:String = "";
            if (_arg1.sex == RoleType.Nan){
                _local6 = "Male";
            };
            if (_arg1.sex == RoleType.Nv){
                _local6 = "Female";
            };
            _local4.sprites.sprite[0] = new XML(<sprite/>
            );
            _local4.sprites.sprite[0].@src = _local6;
            _local4.sprites.sprite[0].@index = _arg1.chatType.length;
            _local4.text[0] = _local5;
            _arg1.msgInfo = _local5;
            _arg1.xmlInfo = _local4;
            _eipList.push(_arg1);
        }
        private static function renderItem(_arg1:int, _arg2:int, _arg3:String, _arg4:int, _arg5:int, _arg6:String):String{
            var _local7:uint = 0xFFFFFF;
            _local7 = ItemBasically.getBasic(_arg1).getItemColor(_arg5);
            var _local8:String = ItemBasically.getBasic(_arg1).getItemName(_arg5);
            var _local9:String = "";
            if (_local8 == ""){
                _local9 = (_local9 + _arg3);
            } else {
                _local9 = (_local9 + (((((((((((((((((((("<font color=\"#" + _local7.toString(16)) + "\">") + "<a href = \"event:") + TextLinkType.Item) + "_") + _arg1) + "_") + _arg2) + "_") + _arg4) + "_") + _arg5) + "_") + _arg6) + "\">") + "<u>") + _local8) + "</u>") + "</a>") + "</font>"));
            };
            return (_local9);
        }
        private static function renderWarReport(_arg1:String, _arg2:String, _arg3:int, _arg4:String, _arg5:int, _arg6:int, _arg7:String, _arg8:int):String{
            if (_arg4 == WarType.War){
                _arg2 = MonsterType.getMonsterNameById(int(_arg2));
            };
            var _local9:String = (((((((((((((((((((((((((((((((("<font>" + "<a href = \"event:") + TextLinkType.ViewReport) + "_") + _arg3) + "_") + _arg4) + "_") + _arg5) + "_") + _arg6) + "_") + _arg7) + "\">") + "<u>") + "<font color=\"#ffffff\">") + Lang.sprintf(ChatLang.BattleRank, _arg8)) + "</font>") + "\n") + "<font color=\"#00b7ee\">") + "【") + _arg1) + "】") + "</font>") + "<font color=\"#ffffff\">VS</font>") + "<font color=\"#00b7ee\">") + "【") + _arg2) + "】") + "</font>") + "</u>") + "</a>") + "</font>");
            return (_local9);
        }
        private static function renderSoul(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:int, _arg7:int):String{
            var _local18:Number;
            var _local19:Number;
            var _local20:Number;
            var _local8:String = SoulType.getSoulName(_arg1);
            var _local9:int = SoulType.getSoulQualityId(_arg1);
            var _local10:uint = SoulType.getQualityColor(_local9);
            var _local11:String = "";
            var _local12:Object = {};
            var _local13:uint;
            var _local14:String = "";
            var _local15:String = "";
            var _local16:String = renderKongGe(_titleNum);
            if (_arg2 > 0){
                _local18 = (_arg5 / 1000);
                _local14 = SoulType.warAttributeIdToName(_arg2);
                _local12 = SoulType.getDataColor(_arg2, _local9, _local18);
                _local13 = _local12.color;
                _local15 = SoulType.warValueChange(_arg2, _local18);
                _local11 = (_local11 + (((((((HtmlText.white("，") + "<font color=\"#") + _local13.toString(16)) + "\">") + _local14) + "+") + _local15) + "</font>"));
            };
            if (_arg3 > 0){
                _local19 = (_arg6 / 1000);
                _local14 = SoulType.warAttributeIdToName(_arg3);
                _local12 = SoulType.getDataColor(_arg3, _local9, _local19);
                _local13 = _local12.color;
                _local15 = SoulType.warValueChange(_arg3, _local19);
                _local11 = (_local11 + (((((((("\n" + _local16) + "<font color=\"#") + _local13.toString(16)) + "\">") + _local14) + "+") + _local15) + "</font>"));
            };
            if (_arg4 > 0){
                _local20 = (_arg7 / 1000);
                _local14 = SoulType.warAttributeIdToName(_arg4);
                _local12 = SoulType.getDataColor(_arg4, _local9, _local20);
                _local13 = _local12.color;
                _local15 = SoulType.warValueChange(_arg4, _local20);
                _local11 = (_local11 + (((((((HtmlText.white("，") + "<font color=\"#") + _local13.toString(16)) + "\">") + _local14) + "+") + _local15) + "</font>"));
            };
            var _local17:String = ((((((((((((((((((((((((((("<font>" + "<a href = \"event:") + TextLinkType.soul) + "_") + _arg1) + "_") + _arg2) + "_") + _arg3) + "_") + _arg4) + "_") + _arg5) + "_") + _arg6) + "_") + _arg7) + "\">") + "<u>") + "<font color=\"#") + _local10.toString(16)) + "\">") + _local8) + "</font>") + "</u>") + "</a>") + "</font>") + _local11);
            return (_local17);
        }
        private static function renderKongGe(_arg1:int):String{
            var _local2:String = "";
            var _local3:int;
            while (_local3 < _arg1) {
                _local2 = (_local2 + " ");
                _local3++;
            };
            return (_local2);
        }
        private static function renderEip(_arg1:Object):void{
            var _local7:int;
            var _local8:Object;
            var _local2:Array = _arg1.eipIndex.split(",");
            var _local3:Array = _arg1.eipNum.split(",");
            var _local4:Object = _arg1.eipLive;
            var _local5:int = _local2.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = int(_local2[_local6]);
                if (_arg1.eipLive[_local7] == undefined){
                    _local4[_local7] = {};
                    _local4[_local7].eip = [];
                };
                _local8 = {};
                _local8.index = _local7;
                _local8.src = _smileys[_local3[_local6]];
                _local8.isLoad = false;
                _local4[_local7].eip.push(_local8);
                _local4[_local7].isAllLoad = false;
                _local6++;
            };
        }
        private static function countStr(_arg1:String):int{
            var _local2:int;
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                if (_arg1.charCodeAt(_local4) > 127){
                    _local2 = (_local2 + 2);
                } else {
                    _local2++;
                };
                _local4++;
            };
            return (_local2);
        }
        private static function isEmptyStr(_arg1:String):Boolean{
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                if (((!((_arg1.charAt(_local3) == " "))) && (!((_arg1.charAt(_local3) == "　"))))){
                    return (false);
                };
                _local3++;
            };
            return (true);
        }
        private static function countTitleNum(_arg1:Object):void{
            var _local2:Object = {};
            _arg1.playName = _arg1.playName.replace(/\&/g, "&amp;");
            _arg1.playName = _arg1.playName.replace(/\</g, "&lt;");
            _arg1.playName = _arg1.playName.replace(/\>/g, "&gt;");
            _arg1.playName = _arg1.playName.replace(/\n/g, "");
            _arg1.playName = _arg1.playName.replace(/\r/g, "");
            _arg1.playName = _arg1.playName.replace(/\"/g, "");
            _arg1.playName = _arg1.playName.replace(/\'/g, "");
            _titleNum = ((countStr(_arg1.chatType) + countStr(_arg1.playName)) + _iconPx);
            _titleCountNum = ((_arg1.chatType.length + _arg1.playName.length) + 1);
            _local2.icon = renderTownMsgIcon(_arg1);
            var _local3:int = _local2.icon.length;
            renderEipAndStr(_arg1, _local2.icon, 0, 0, _titleNum);
        }
        private static function renderEipAndStr(_arg1:Object, _arg2:Array, _arg3:int=0, _arg4:int=0, _arg5:int=0):void{
            var _local13:int;
            var _local14:Object;
            var _local15:int;
            var _local16:int;
            var _local17:int;
            var _local18:int;
            var _local19:Object;
            var _local20:int;
            var _local21:Object;
            var _local6:String = _arg1.msgTxt;
            var _local7:int = _local6.length;
            var _local8:int = _arg2.length;
            var _local9:String = "";
            var _local10:int = _arg5;
            var _local11:Array = [];
            var _local12:Object = {};
            _local12.chatType = _arg1.chatType;
            _local12.msgTxt = _arg1.msgTxt;
            _local12.msgType = _arg1.msgType;
            _local12.playId = _arg1.playId;
            _local12.playName = _arg1.playName;
            _local12.sex = _arg1.sex;
            _local12.showName = _arg1.showName;
            _local12.townKey = _arg1.townKey;
            _local12.typeColor = _arg1.typeColor;
            _local12.type = _arg1.msgType;
            _local12.fileColor = _arg1.fileColor;
            _local12.isStar = _arg1.isStar;
            if ((((_local6.length > 0)) && ((_arg3 < _local7)))){
                _local7 = _local6.length;
                _local13 = _arg3;
                while (_local13 < _local7) {
                    if (_local6.charCodeAt(_local13) > 127){
                        _local10 = (_local10 + 2);
                    } else {
                        _local10++;
                    };
                    _local9 = (_local9 + _local6.charAt(_local13));
                    if (_arg4 < _local8){
                        _local14 = _arg2[_arg4];
                        if (_local14.index == _local13){
                            _local10 = (_local10 + _iconPx);
                            _local11.push(_local14);
                            _arg4++;
                        };
                    };
                    if ((((_local10 >= _lineLimit)) || ((_local13 >= (_local7 - 1))))){
                        _local12.msg = _local9;
                        _local12.iconList = _local11;
                        _eipList.push(_local12);
                        if ((((_local13 >= (_local7 - 1))) && ((_arg4 >= _local8)))){
                            renderEipList();
                        } else {
                            if ((((_local13 >= (_local7 - 1))) && ((_arg4 < _local8)))){
                                _local15 = Math.floor(((_lineLimit - _local10) / _iconPx));
                                _local16 = (_local8 - _arg4);
                                _local17 = ((_local16 >= _local15)) ? _local15 : _local16;
                                _local18 = _arg4;
                                while (_local18 < (_arg4 + _local17)) {
                                    _local19 = _arg2[_local18];
                                    _local12.iconList.push(_local19);
                                    _local18++;
                                };
                                if (_local16 > _local15){
                                    _local13 = (_local13 + 1);
                                    renderEipAndStr(_arg1, _arg2, _local13, (_arg4 + _local17), 6);
                                } else {
                                    renderEipList();
                                };
                            } else {
                                _local13 = (_local13 + 1);
                                renderEipAndStr(_arg1, _arg2, _local13, _arg4, 6);
                            };
                        };
                        return;
                    };
                    _local13++;
                };
            } else {
                _local20 = _arg4;
                while (_local20 < _local8) {
                    _local21 = _arg2[_local20];
                    _local10 = (_local10 + _iconPx);
                    _local11.push(_local21);
                    if ((((_local10 >= _lineLimit)) || ((_local20 >= (_local8 - 1))))){
                        _local12.msg = "";
                        _local12.iconList = _local11;
                        _eipList.push(_local12);
                        if (_local20 >= (_local8 - 1)){
                            renderEipList();
                        } else {
                            renderEipAndStr(_arg1, _arg2, _arg3, (_local20 + 1), 6);
                        };
                        return;
                    };
                    _local20++;
                };
            };
        }
        private static function renderEipList():void{
            var _local4:Object;
            var _local5:String;
            var _local6:Boolean;
            var _local7:Object;
            var _local8:String;
            var _local9:int;
            var _local10:int;
            var _local11:int;
            var _local1:int = _eipList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local4 = _eipList[_local2];
                if (_local2 == 0){
                    if (_systemType != _local4.msgType){
                        addIconIndex(_local4.iconList, _titleCountNum);
                        _local5 = "";
                        _local6 = false;
                        if (_local4.sex == RoleType.Nan){
                            _local5 = "Male";
                            _local6 = true;
                        };
                        if (_local4.sex == RoleType.Nv){
                            _local5 = "Female";
                            _local6 = true;
                        };
                        _local7 = {};
                        if (_local4.isStar){
                            _local7 = {
                                index:_local4.chatType.length,
                                isLoad:true,
                                src:"Star",
                                startNum:0
                            };
                            _local4.iconList.unshift(_local7);
                        } else {
                            if (_local6){
                                _local7 = {
                                    index:_local4.chatType.length,
                                    isLoad:true,
                                    src:_local5,
                                    startNum:0
                                };
                                _local4.iconList.unshift(_local7);
                            };
                        };
                        _local4.msgInfo = ((((((((((((((((((((((("<a href = \"event:" + _local4.msgType) + "\">") + "<font color=\"") + _local4.typeColor) + "\">") + _local4.chatType) + "</font>") + "</a>") + "<font color=\"#ffcc99\">") + "<a href = \"event:") + TextLinkType.Player) + "_") + _local4.playId) + "_") + _local4.playName) + "_") + _local4.sex) + "\">") + "<u>") + _local4.showName) + "</u>") + "</a>") + ":");
                    } else {
                        _local4.msgInfo = (((("<font color=\"" + _local4.typeColor) + "\">") + _local4.chatType) + "</font>");
                    };
                    renderMsg(_local4);
                } else {
                    _local8 = _eipList[(_local2 - 1)].msg;
                    _local9 = _local8.length;
                    _local10 = (countStr(_local4.chatType) + 2);
                    _local11 = (_local10 - _local9);
                    _local4.msg = (renderKongGe(_local10) + _local4.msg);
                    _local4.msgInfo = "";
                    addIconIndex(_local4.iconList, _local11);
                    renderMsg(_local4);
                };
                _local2++;
            };
            var _local3:String = "";
        }
        private static function addIconIndex(_arg1:Array, _arg2:int):void{
            var _local5:Object;
            var _local6:int;
            var _local3:int = _arg1.length;
            var _local4:int = (_local3 - 1);
            while (_local4 >= 0) {
                _local5 = _arg1[_local4];
                if (_local5 == null){
                    _arg1.splice(_local4, 1);
                } else {
                    _local6 = _local5.index;
                    _local6 = (_local6 + _arg2);
                    _local5.index = _local6;
                };
                _local4--;
            };
        }
        private static function renderMsg(_arg1:Object):void{
            var _local2:XML = <rtf>
										<text></text>
										<sprites>
										</sprites>
										</rtf>
            ;
            _arg1.msgInfo = (_arg1.msgInfo + (((("<font color=\"#" + _arg1.fileColor.toString(16)) + "\">") + _arg1.msg) + "</font>"));
            renderXml(_local2, _arg1.iconList, 0, true);
            _local2.text[0] = _arg1.msgInfo;
            _arg1.xmlInfo = _local2;
        }
        private static function get renderSpace():String{
            var _local1:String = "   ";
            var _local2:int;
            while (_local2 < 6) {
                _local1 = (_local1 + " ");
                _local2++;
            };
            return (_local1);
        }
        private static function renderXml(_arg1:XML, _arg2:Array, _arg3:int=0, _arg4:Boolean=false):void{
            var _local8:Object;
            var _local5:int;
            var _local6:int = _arg2.length;
            var _local7:int;
            while (_local7 < _local6) {
                _local8 = _arg2[_local7];
                if (_local8){
                    _arg1.sprites.sprite[_local5] = new XML(<sprite/>
                    );
                    _arg1.sprites.sprite[_local5].@src = _local8.src;
                    _arg1.sprites.sprite[_local5].@index = int(_local8.index);
                    _local5++;
                };
                _local7++;
            };
        }
        public static function townChatInfo(_arg1:Array):Array{
            var _local4:Object;
            var _local5:Object;
            var _local6:XML;
            var _local7:String;
            townMsg = [];
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _arg1[_local3];
                _local5 = {};
                _local5.iconList = [];
                _local6 = <rtf>
								<text></text>
								<sprites>
								</sprites>
								</rtf>
                ;
                if (_local4.eipIndex != ""){
                    _local5.iconList = renderTownMsgIcon(_local4);
                    renderXml(_local6, _local5.iconList);
                };
                _local7 = (("<font color=\"#F5E49F\">" + _local4.msgTxt) + "</font>");
                _local6.text[0] = _local7;
                _local5.iconLen = _local5.iconList.length;
                _local5.info = _local4.msgTxt;
                _local5.msgLen = (_local4.msgTxt.length + _local5.iconLen);
                _local5.playerId = _local4.playId;
                _local5.playerName = _local4.playName;
                _local5.type = _local4.msgType;
                _local5.xmlInfo = _local6;
                townMsg.push(_local5);
                _local3++;
            };
            return (townMsg);
        }
        private static function renderTownMsgIcon(_arg1:Object):Array{
            var _local7:Object;
            var _local2:Array = _arg1.eipIndex.split(",");
            var _local3:Array = _arg1.eipNum.split(",");
            if (_local2[0] == ""){
                return ([]);
            };
            var _local4:Array = [];
            var _local5:int = _local2.length;
            var _local6:int;
            while (_local6 < _local5) {
                _local7 = {};
                _local7.index = _local2[_local6];
                _local7.src = _smileys[_local3[_local6]];
                _local4.push(_local7);
                _local6++;
            };
            return (_local4);
        }

    }
}//package 

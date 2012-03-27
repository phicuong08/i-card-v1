//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {
    import __AS3__.vec.*;
    
    import com.*;
    import com.assist.view.*;
    import com.lang.client.com.assist.view.info.*;

    public class ServerWarInfo {

        public static var removeNickNameSuffix:Function = function (_arg1:String):String{
            return (_arg1);
        };
        public static var juString:Array = [ServerWarInfoLang.Ju1, ServerWarInfoLang.Ju2, ServerWarInfoLang.Ju3, ServerWarInfoLang.Ju4, ServerWarInfoLang.Ju5];
        public static var serverWarType:int = 0;

        public var serverState:int = 0;
        public var userState:int = 0;
        public var groupCup:int = 0;
        public var groupPlayer:int = 0;
        public var zoneName:String = "";
        public var knockoutList:Vector.<RecordClass>;
        public var knockoutTip:String = ".............";
        public var knockoutRule:String = "";
        public var signupState:int = 0;
        public var userList:Array;
        public var idList:Array;
        public var winList:Array;
        public var hasWinList:Array;
        public var groupList:Array;
        public var cupRoundWar:Array;
        public var cupMsg:String = "";
        public var cupRecord:Vector.<RecordClass>;
        public var cupRecordTip:String = "";
        public var cupRecordSee:RecordClass;
        public var cupGuessList:Vector.<GuessClass>;
        public var cupGuessTip:String = "";
        public var cupCanBetList:Array;
        public var cupBetRankList:Array;
        public var winnerId:int = 0;
        public var playerId:int = 0;
        public var playerName:String = "";
        public var roundTimeList:Array;
        public var roundTimeInterval:int = 0;
        public var serverNameList:Array;
        private var _date:Date;

        public function ServerWarInfo(_arg1:int=0){
            this.userList = [];
            this.idList = [];
            this.winList = [];
            this.hasWinList = [];
            this.groupList = [];
            this.cupRoundWar = [];
            this.cupCanBetList = [];
            this.cupBetRankList = [];
            this.roundTimeList = [];
            this.serverNameList = [];
            this._date = new Date();
            super();
           // this.groupCup = (this.groupPlayer = ??callstaticsub1=??getglobalscope);
        }
        public function resetRecord():void{
            this.cupRecord = new Vector.<RecordClass>(16);
            this.cupRecord[16] = new RecordClass();
            this.cupRecord[8] = new RecordClass();
            this.cupRecord[4] = new RecordClass();
            this.cupRecord[2] = new RecordClass();
            this.cupRecord[1] = new RecordClass();
            this.cupRecordTip = HtmlText.red(ServerWarInfoLang.YouOut);
//            switch (this.serverState){
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                        this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo32, this.getGroupName(this.groupPlayer)));
//                    } else {
//                        if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                            this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo16, this.getGroupName(this.groupPlayer)));
//                        };
//                    };
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                        this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo16, this.getGroupName(this.groupPlayer)));
//                    } else {
//                        if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                            this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo8, this.getGroupName(this.groupPlayer)));
//                        };
//                    };
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                        this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo8, this.getGroupName(this.groupPlayer)));
//                    } else {
//                        if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                            this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo4, this.getGroupName(this.groupPlayer)));
//                        };
//                    };
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                        this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo4, this.getGroupName(this.groupPlayer)));
//                    } else {
//                        if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                            this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo2, this.getGroupName(this.groupPlayer)));
//                        };
//                    };
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    if ((((this.userState == ??callstaticsub1=??getglobalscope
// )) || ((this.userState == ??callstaticsub1=??getglobalscope
// )))){
//                        this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo2, this.getGroupName(this.groupPlayer)));
//                    };
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    if (this.userState == ??callstaticsub1=??getglobalscope
// ){
//                        this.cupRecordTip = HtmlText.green(Lang.sprintf(ServerWarInfoLang.YouInTo1, this.getGroupName(this.groupPlayer)));
//                    };
//                    break;
//            };
        }
        public function pushRecord(_arg1:int, _arg2:int, _arg3:String, _arg4:int, _arg5:int, _arg6:String, _arg7:String):void{
            var _local8:int;
            var _local9:RecordClass = this.cupRecord[_arg1];
            if (_arg1 == 0){
                _local9 = new RecordClass();
                this.cupRecord.push(_local9);
            };
            _local9.warIdx = _arg7;
            _local9.idA = this.playerId;
            _local9.nameA = this.playerName;
            _local9.idB = _arg2;
            _local9.nameB = _arg3;
            _local9.warList.push({
                win:_arg4,
                war_report_id:_arg5,
                report_version:_arg6
            });
        }
        public function pushRecordSee(_arg1:Array):void{
            var _local2:Array;
            this.cupRecordSee = new RecordClass();
            for each (_local2 in _arg1) {
                this.cupRecordSee.idA = _local2[0];
                this.cupRecordSee.nameA = this.getUser(_local2[0]).name;
                this.cupRecordSee.idB = _local2[1];
                this.cupRecordSee.nameB = this.getUser(_local2[1]).name;
                this.cupRecordSee.warList.push({
                    win:_local2[2],
                    name:this.getUser(_local2[2]).name,
                    war_report_id:_local2[3],
                    report_version:_local2[4]
                });
            };
        }
        public function getUser(_arg1:int):UserClass{
            return (((this.userList[_arg1]) || (new UserClass())));
        }
        public function setKnockoutTip(_arg1:int, _arg2:int, _arg3:int=-1):void{
//            this.knockoutRule = "";
//            this.knockoutTip = ServerWarInfoLang.ServerWarOver;
//            if ((((this.serverState == ??callstaticsub1=??getglobalscope
// )) || ((this.serverState == ??callstaticsub1=??getglobalscope
// )))){
//                this.knockoutTip = Lang.sprintf(ServerWarInfoLang.RoundNumTip, this.getSerStateName(this.serverState, 0), _arg1, _arg2);
//            };
//            if ((((this.groupPlayer == ??callstaticsub1=??getglobalscope
// )) || ((this.groupPlayer == ??callstaticsub1=??getglobalscope
// )))){
//                this.knockoutTip = Lang.sprintf(ServerWarInfoLang.GroupInKnockoutTip, this.getGroupName(this.groupPlayer), this.knockoutTip);
//                this.knockoutTip = HtmlText.green(this.knockoutTip);
//            } else {
//                if (_arg3 == 2){
//                    this.knockoutTip = Lang.sprintf(ServerWarInfoLang.GroupOutKnockoutTip, this.knockoutTip);
//                    this.knockoutTip = HtmlText.red(this.knockoutTip);
//                } else {
//                    this.knockoutTip = HtmlText.green(this.knockoutTip);
//                };
//            };
//            if (this.isThisService){
//                this.knockoutRule = ServerWarInfoLang.OutRule5;
//            } else {
//                this.knockoutRule = ServerWarInfoLang.OutRule3;
//            };
        }
        public function setKnockoutList(_arg1:Array):void{
            var _local4:Array;
            var _local5:RecordClass;
            this.knockoutList = new Vector.<RecordClass>();
            var _local2:int;
            var _local3:String = this.getGroupName(this.groupPlayer);
            if (_local3 == ""){
//                if (this.serverState == ??callstaticsub1=??getglobalscope
// ){
//                    _local3 = ServerWarInfoLang.DiBangKnockout;
//                } else {
//                    _local3 = ServerWarInfoLang.TianBangKnockout;
//                };
            };
            for each (_local4 in _arg1) {
                _local2++;
                _local5 = new RecordClass();
                _local5.idA = this.playerId;
                _local5.nameA = this.playerName;
                _local5.idB = _local4[0];
                _local5.nameB = removeNickNameSuffix(_local4[1]);
                _local5.warIdx = (_local3 + Lang.sprintf(ServerWarInfoLang.KnockoutIdxTip, _local2));
                if (_local4[2] == 1){
                    _local5.winString = linkText(HtmlText.white(ServerWarInfoLang.Win), ["war", _local4[3], _local4[4]]);
                    _local5.markString = "1:0";
                } else {
                    _local5.winString = linkText(HtmlText.red(ServerWarInfoLang.UnWin), ["war", _local4[3], _local4[4]]);
                    _local5.markString = "0:1";
                };
                this.knockoutList.unshift(_local5);
            };
        }
        public function pushRoundWin(_arg1:int, _arg2:Array):void{
            var _local3:Array;
            if (this.idList.length <= _arg1){
                this.winList[_arg1] = this.idList;
            } else {
                this.winList[_arg1] = [];
                for each (_local3 in _arg2) {
                    this.winList[_arg1].push(_local3[0]);
                    this.hasWinList.push(_local3[0]);
                };
            };
        }
        public function addCupGroup(_arg1:Object):void{
            var _local2:int = _arg1.idA;
            var _local3:int = _arg1.idB;
            this.userList[_local2] = new UserClass(((_arg1.idA) || (0)), ((_arg1.nameA) || ("")), ((_arg1.roleIdA) || (0)), ((_arg1.dpsA) || (0)), ((_arg1.fameA) || (0)), ((_arg1.levelA) || (0)), ((_arg1.stageNameA) || ("")), ((_arg1.serverNameA) || ("")), ((_arg1.betNumA) || (0)), ((_arg1.headUrlA) || ("")));
            this.userList[_local3] = new UserClass(((_arg1.idB) || (0)), ((_arg1.nameB) || ("")), ((_arg1.roleIdB) || (0)), ((_arg1.dpsB) || (0)), ((_arg1.fameB) || (0)), ((_arg1.levelB) || (0)), ((_arg1.stageNameB) || ("")), ((_arg1.serverNameB) || ("")), ((_arg1.betNumB) || (0)), ((_arg1.headUrlB) || ("")));
            this.groupList.push([_local2, _local3]);
            if (_local2 != 0){
                this.idList.push(_local2);
            };
            if (_local3 != 0){
                this.idList.push(_local3);
            };
        }
        public function setCupGroupType(_arg1:int):void{
//            this.groupCup = _arg1;
//            this.cupMsg = "";
//            switch (this.serverState){
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = ((this.getTime_MDHI_AtState(??callstaticsub1=??getglobalscope
// ) + ServerWarInfoLang.WillGoon) + this.getSerStateName(this.serverState, _arg1));
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = ((this.getTime_MDHI_AtState(??callstaticsub1=??getglobalscope
// ) + ServerWarInfoLang.WillGoon) + this.getSerStateName(this.serverState, _arg1));
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = ((this.getTime_MDHI_AtState(??callstaticsub1=??getglobalscope
// ) + ServerWarInfoLang.WillGoon) + this.getSerStateName(this.serverState, _arg1));
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = ((this.getTime_MDHI_AtState(??callstaticsub1=??getglobalscope
// ) + ServerWarInfoLang.WillGoon) + this.getSerStateName(this.serverState, _arg1));
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = ((this.getTime_MDHI_AtState(??callstaticsub1=??getglobalscope
// ) + ServerWarInfoLang.WillGoon) + this.getSerStateName(this.serverState, _arg1));
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = Lang.sprintf(ServerWarInfoLang.InGoon, this.getGroupName(_arg1), this.getSerStateName(this.serverState, 0));
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    this.cupMsg = "";
//                    break;
//            };
        }
        public function setCupRoundWar(_arg1:Array):void{
		
//            var _local4:Array;
//            this.cupRoundWar = [];
//            if (this.serverState == ??callstaticsub1=??getglobalscope
// ){
//                return;
//            };
//            var _local2:int = int((new Date().time / 1000));
//            var _local3 = -1;
//            switch (this.serverState){
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    if (_local2 >= this.getRoundTime(this.serverState, 4)){
//                        _local3 = 4;
//                    } else {
//                        if (_local2 >= this.getRoundTime(this.serverState, 3)){
//                            _local3 = 3;
//                        } else {
//                            if (_local2 >= this.getRoundTime(this.serverState, 2)){
//                                _local3 = 2;
//                            } else {
//                                if (_local2 >= this.getRoundTime(this.serverState, 1)){
//                                    _local3 = 1;
//                                } else {
//                                    if (_local2 >= this.getRoundTime(this.serverState, 0)){
//                                        _local3 = 0;
//                                    };
//                                };
//                            };
//                        };
//                    };
//                    break;
//            };
//            var _local5:int;
//            var _local6:int;
//            for each (_local4 in _arg1) {
//                if (_local4[0] == 1){
//                    _local6++;
//                    this.cupRoundWar.push(HtmlText.white(juString[_local5]));
//                    this.cupRoundWar.push(HtmlText.white(linkText(ServerWarInfoLang.Win, ["war", _local4[1], _local4[2]])));
//                } else {
//                    if (_local4[0] == 2){
//                        this.cupRoundWar.push(HtmlText.white(juString[_local5]));
//                        this.cupRoundWar.push(HtmlText.red(linkText(ServerWarInfoLang.UnWin, ["war", _local4[1], _local4[2]])));
//                        _local6--;
//                    };
//                };
//                _local5++;
//            };
//            while (_local5 < 5) {
//                if (Math.abs(_local6) >= 3){
//                    this.cupRoundWar.push(HtmlText.white(juString[_local5]));
//                    this.cupRoundWar.push(HtmlText.white(ServerWarInfoLang.Over));
//                } else {
//                    if (_local3 == -1){
//                        this.cupRoundWar.push(HtmlText.white(juString[_local5]));
//                        this.cupRoundWar.push(HtmlText.white(this.getTime_HI_AtState(this.serverState, _local5)));
//                    } else {
//                        if (_local3 == _local5){
//                            this.cupRoundWar.push(HtmlText.yellow2(juString[_local5]));
//                            this.cupRoundWar.push(HtmlText.yellow2(this.getTime_HI_AtState(this.serverState, _local5)));
//                        } else {
//                            if (_local3 < _local5){
//                                this.cupRoundWar.push(HtmlText.white(juString[_local5]));
//                                this.cupRoundWar.push(HtmlText.white(this.getTime_HI_AtState(this.serverState, _local5)));
//                            } else {
//                                if (_local3 > _local5){
//                                    this.cupRoundWar.push(HtmlText.white(juString[_local5]));
//                                    this.cupRoundWar.push(HtmlText.white(ServerWarInfoLang.Over));
//                                };
//                            };
//                        };
//                    };
//                };
//                _local5++;
//            };
        
		}
        public function getTime_MDHI_AtState(_arg1:int):String{
            var _local2:Number = (this.getRoundTime(_arg1) * 1000);
            var _local3:Array = this.getDateArray(_local2);
            var _local4:Date = new Date();
            if (_local4.date == _local3[1]){
                return ((((ServerWarInfoLang.Today + _local3[2]) + ":") + _local3[3]));
            };
            _local4.time = (_local4.time + (24 * 3600000));
            if (_local4.date == _local3[1]){
                return ((((ServerWarInfoLang.Tomorrow + _local3[2]) + ":") + _local3[3]));
            };
            return ((((((((_local3[0] + ServerWarInfoLang.Moth) + _local3[1]) + ServerWarInfoLang.Day) + " ") + _local3[2]) + ":") + _local3[3]));
        }
		public function getTime_HI_AtState(_arg1:int, _arg2:int):String{
            var _local3:Number = (this.getRoundTime(_arg1, _arg2) * 1000);
            var _local4:Array = this.getDateArray(_local3);
            return (((_local4[2] + ":") + _local4[3]));
        }
		public function getDateArray(_arg1:Number):Array{
            this._date.time = _arg1;
            var _local2:String = ("" + this._date.hours);
            var _local3:String = ("" + ((this._date.minutes)<10) ? ("0" + this._date.minutes.toString()) : this._date.minutes.toString());
            var _local4:String = ("" + ((this._date.seconds)<10) ? ("0" + this._date.seconds.toString()) : this._date.seconds.toString());
            return ([(this._date.month + 1), this._date.date, _local2, _local3, _local4, this._date.fullYear]);
        }
        public function getRoundTime(_arg1:int, _arg2:int=0):Number{
            var _local3:int;
//            switch (this.serverState){
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = int(this.roundTimeList[??callstaticsub1=??getglobalscope
// ]);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = int(this.roundTimeList[??callstaticsub1=??getglobalscope
// ]);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = int(this.roundTimeList[??callstaticsub1=??getglobalscope
// ]);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = int(this.roundTimeList[??callstaticsub1=??getglobalscope
// ]);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = int(this.roundTimeList[??callstaticsub1=??getglobalscope
// ]);
//                    break;
//            };
//            _local3 = ((int(this.roundTimeList[_arg1])) || (_local3));
//            _local3 = (_local3 + (_arg2 * this.roundTimeInterval));
            return (_local3);
        }
        public function get showTianBang():Boolean{
//            if (this.groupCup == ??callstaticsub1=??getglobalscope
// ){
//                return (true);
//            };
            return (false);
        }
        public function get showDiBang():Boolean{
//            if (this.groupCup == ??callstaticsub1=??getglobalscope
// ){
//                return (true);
//            };
            return (false);
        }
        public function getSerStateName(_arg1:int, _arg2:int):String{
            var _local3:String = "";
//            switch (_arg1){
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = ServerWarInfoLang.TianBangKnockout;
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = ServerWarInfoLang.DiBangKnockout;
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = (this.getGroupName(_arg2) + ServerWarInfoLang.War16);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = (this.getGroupName(_arg2) + ServerWarInfoLang.War8);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = (this.getGroupName(_arg2) + ServerWarInfoLang.War4);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = (this.getGroupName(_arg2) + ServerWarInfoLang.War2);
//                    break;
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    _local3 = (this.getGroupName(_arg2) + ServerWarInfoLang.War1);
//                    break;
//            };
            return (_local3);
        }
        public function getGroupName(_arg1:int):String{
//            if (_arg1 == ??callstaticsub1=??getglobalscope
// ){
//                return (ServerWarInfoLang.TianBang);
//            };
//            if (_arg1 == ??callstaticsub1=??getglobalscope
// ){
//                return (ServerWarInfoLang.DiBang);
//            };
            return ("");
        }
        public function setCupCanBet(_arg1:Array):void{
            var _local2:Array;
            this.cupCanBetList = [];
            for each (_local2 in _arg1) {
                this.cupCanBetList.push({
                    label:(int((_local2[0] / 10000)) + ServerWarInfoLang.Wang),
                    num:int(_local2[0])
                });
            };
        }
        public function setCupGuessList(_arg1:Array):void{
            var _local4:GuessClass;
            var _local5:Array;
            var _local6:String;
            var _local7:String;
            this.cupGuessTip = "";
            this.cupGuessList = new Vector.<GuessClass>();
            var _local2:Number = 0;
            var _local3:Number = 0;
            for each (_local5 in _arg1) {
                _local4 = new GuessClass();
                this.cupGuessList.push(_local4);
                _local4.race_step = _local5[0];
                _local4.group_type = _local5[6];
                _local4.roundTip = this.getSerStateName(_local5[0], _local5[6]);
                _local4.id = _local5[1];
                _local4.name = removeNickNameSuffix(_local5[2]);
                _local4.result = _local5[3];
                _local4.bet_coin = _local5[4];
                _local4.win_coin = _local5[5];
                _local2 = (_local2 + _local4.bet_coin);
                if (_local4.result == 1){
                    _local3 = (_local3 + _local4.bet_coin);
                } else {
                    if (_local4.result == 2){
                        _local3 = (_local3 - (_local4.bet_coin / 2));
                    };
                };
            };
            _local6 = "";
            _local7 = "";
            if (_local2 != 0){
                _local6 = (((_local2 / 10000) + ServerWarInfoLang.Wang) + ServerWarInfoLang.Coin);
            } else {
                _local6 = ((_local2 / 10000) + ServerWarInfoLang.Coin);
            };
            if (_local3 != 0){
                _local7 = ((Math.abs((_local3 / 10000)) + ServerWarInfoLang.Wang) + ServerWarInfoLang.Coin);
            } else {
                _local7 = ("0" + ServerWarInfoLang.Coin);
            };
            _local6 = HtmlText.yellow2(_local6);
            _local7 = ((_local3)>=0) ? HtmlText.green(_local7) : HtmlText.red(_local7);
            if (_local3 > 0){
                this.cupGuessTip = Lang.sprintf(ServerWarInfoLang.GuessAllTip1, HtmlText.yellow((_arg1.length + "")), _local6, _local7);
            } else {
                this.cupGuessTip = Lang.sprintf(ServerWarInfoLang.GuessAllTip2, HtmlText.yellow((_arg1.length + "")), _local6, _local7);
            };
        }
        public function setBetRank(_arg1:Array):void{
            var _local3:Array;
            var _local4:String;
            var _local5:String;
            var _local6:Number;
            var _local7:String;
            this.cupBetRankList = [];
            var _local2:int;
            for each (_local3 in _arg1) {
                _local4 = removeNickNameSuffix(_local3[1]);
                ++_local2;
                _local4 = ((_local2 + ".") + linkText(_local4, ["player", _local3[0], _local4]));
                _local5 = "0";
                _local6 = _local3[4];
                if (_local6 >= 1000000000){
                    _local5 = (int((_local6 / 100000000)) + ServerWarInfoLang.Yi);
                } else {
                    if (_local6 >= 10000){
                        _local5 = (int((_local6 / 10000)) + ServerWarInfoLang.Wang);
                    };
                };
                _local7 = "";
                if (this.isCrossService){
                    _local7 = Lang.sprintf(ServerWarInfoLang.From, _local3[2], _local3[3]);
                };
                this.cupBetRankList.push([_local4, _local5, _local7]);
            };
        }
        public function hasBet(_arg1:int):GuessClass{
            var _local2:GuessClass;
            for each (_local2 in this.cupGuessList) {
                if ((((_local2.race_step == this.betState)) && ((((_local2.id == _arg1)) || ((_arg1 == 0)))))){
                    return (_local2);
                };
            };
            return (null);
        }
        public function get betState():int{
//            switch (this.serverState){
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (??callstaticsub1=??getglobalscope
// );
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (??callstaticsub1=??getglobalscope
// );
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (??callstaticsub1=??getglobalscope
// );
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (??callstaticsub1=??getglobalscope
// );
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (??callstaticsub1=??getglobalscope
// );
//            };
            return (0);
        }
        public function get nowStateLv():int{
//            switch (this.serverState){
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (16);
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (8);
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (4);
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (2);
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                case ??callstaticsub1=??getglobalscope
// :
//                    return (1);
//            };
            return (16);
        }
        public function get worldZone():String{
            return (Lang.sprintf(ServerWarInfoLang.ZoneName, this.zoneName));
        }
        public function get worldZoneIdx():int{
            return (int(this.zoneName));
        }
        public function get isCrossService():Boolean{
			return false;
//            return false;//return ((ServerWarInfo.serverWarType == ??callstaticsub1=??getglobalscope
// ));
        }
        public function get isThisService():Boolean{
			return false;
//            return ((ServerWarInfo.serverWarType == ??callstaticsub1=??getglobalscope
// ));
        }

    }
}//package com.assist.view.info 

import com.*;
import com.assist.view.*;
import com.lang.client.com.assist.view.info.*;

class RecordClass {

    public var warIdx:String = "";
    public var idA:int;
    public var nameA:String;
    public var idB:int;
    public var nameB:String;
    public var markString:String;
    public var winString:String;
    public var recordString:String;
    public var warList:Array;

    public function RecordClass(){
        this.warList = [];
        super();
    }
    public function get mineMarkString():String{
        var _local1:int;
        var _local2:Object;
        if ((((this.markString == null)) || ((this.markString == "")))){
            _local1 = 0;
            for each (_local2 in this.warList) {
                if (_local2.win == 1){
                    _local1++;
                };
            };
            this.markString = ((_local1 + ":") + (this.warList.length - _local1));
        };
        return (this.markString);
    }
    public function get mineRecordString():String{
        var _local1:int;
        var _local2:Array;
        var _local3:Object;
        var _local4:String;
        if (this.warList.length == 0){
            return (ServerWarInfoLang.Waiting);
        };
        this.warList.sortOn("war_report_id", Array.NUMERIC);
        if ((((this.recordString == null)) || ((this.recordString == "")))){
            _local1 = 0;
            _local2 = [];
            for each (_local3 in this.warList) {
                ++_local1;
                _local4 = linkText((("（" + _local1) + "）"), ["war", _local3.war_report_id, _local3.report_version]);
                if (_local3.win == 1){
                    _local4 = (("<font color='#FFFFFF'>" + _local4) + "</font>");
                } else {
                    _local4 = (("<font color='#FF0000'>" + _local4) + "</font>");
                };
                _local2.push(_local4);
            };
            this.recordString = _local2.join(" ");
        };
        return (this.recordString);
    }
    public function get markAB():String{
        var _local3:Object;
        if (this.warList.length == 0){
            return (ServerWarInfoLang.Waiting);
        };
        var _local1:int;
        var _local2:int;
        for each (_local3 in this.warList) {
            if (_local3.win == this.idA){
                _local1++;
            } else {
                _local2++;
            };
        };
        if (_local1 > _local2){
            return ((((("<b>" + this.nameA) + HtmlText.white(((((" " + _local1) + ":") + _local2) + " "))) + this.nameB) + "</b>"));
        };
        return ((((("<b>" + this.nameB) + HtmlText.white(((((" " + _local2) + ":") + _local1) + " "))) + this.nameA) + "</b>"));
    }
    public function get seeList():Array{
        var _local5:Object;
        var _local6:Object;
        var _local1:Array = [];
        var _local2:int;
        var _local3:int;
        var _local4:int = this.warList.length;
//        for each (_local5 in this.warList) {
//            _local6 = {};
//            --_local4;
//            _local6.win = ((((ServerWarInfo.juString[_local4] + " 【<font color='#F39800'>") + this.linkWin(_local5.win)) + "</font>】 ") + ServerWarInfoLang.Win);
//            _local6.see = linkText(ServerWarInfoLang.See, ["war", _local5.war_report_id, _local5.report_version]);
//            _local1.push(_local6);
//            if (_local5.win == this.idA){
//                _local2++;
//            } else {
//                _local3++;
//            };
//        };
//        if ((((((_local1.length > 0)) && ((_local2 < 3)))) && ((_local3 < 3)))){
//            _local1.unshift({
//                win:(ServerWarInfo.juString[this.warList.length] + ServerWarInfoLang.Waiting),
//                see:""
//            });
//        };
        return (_local1);
    }
    public function get linkA():String{
        return (linkText(this.nameA, ["player", this.idA, this.nameA]));
    }
    public function get linkB():String{
        return (linkText(this.nameB, ["player", this.idB, this.nameB]));
    }
    public function linkWin(_arg1:int):String{
        if (_arg1 == this.idA){
            return ((("<b>" + this.linkA) + "</b>"));
        };
        if (_arg1 == this.idB){
            return ((("<b>" + this.linkB) + "</b>"));
        };
        return ("");
    }

}
class GuessClass {

    public var race_step:int = 0;
    public var group_type:int = 0;
    public var id:int = 0;
    public var name:String = "";
    public var result:int = 0;
    public var bet_coin:int = 0;
    public var win_coin:int = 0;
    public var roundTip:String = "";

    public function GuessClass(){
    }
    public function get resultTip():String{
        var _local1:int = int((this.bet_coin / 10000));
        if (this.result == 2){
            return (Lang.sprintf(ServerWarInfoLang.GuessUnWinTip, this.name, _local1, HtmlText.red(("" + (_local1 * 0.5)))));
        };
        if (this.result == 1){
            return (Lang.sprintf(ServerWarInfoLang.GuessWinTip, this.name, _local1, HtmlText.green(("" + _local1))));
        };
        return (Lang.sprintf(ServerWarInfoLang.GuessWaitTip, this.name, _local1));
    }
    public function get betTip():String{
        return (Lang.sprintf(ServerWarInfoLang.GuessBetTip, this.name, int((this.bet_coin / 10000))));
    }

}
class UserClass {

    public var name:String = "";
    public var id:int = 0;
    public var roleId:int = 0;
    public var roleHeadUrl:String = "";
    public var dps:int = 0;
    public var fame:int = 0;
    public var level:int = 0;
    public var stageName:String = "";
    public var serverName:String = "";
    public var socialStatus:Number = 0;

    public function UserClass(_arg1:int=0, _arg2:String="", _arg3:int=0, _arg4:int=0, _arg5:int=0, _arg6:int=0, _arg7:String="", _arg8:String="", _arg9:Number=0, _arg10:String=""):void{
        this.id = _arg1;
        this.name = com.assist.view.info.ServerWarInfo.removeNickNameSuffix(_arg2);
        this.roleId = _arg3;
        this.dps = _arg4;
        this.fame = _arg5;
        this.level = _arg6;
        this.stageName = _arg7;
        this.serverName = _arg8;
        this.socialStatus = _arg9;
        this.roleHeadUrl = _arg10;
    }
    public function get nameLink():String{
        if (this.id == 0){
            return ("");
        };
        return (linkText(this.name, ["player", this.id, this.name]));
    }
    public function get nameTip():String{
//        if (this.id == 0){
//            return ("");
//        };
//        var _local1:String = ((ServerWarInfoLang.Socialstatus + ": ") + this.socialStatusTip);
//        if (??callstaticsub1=??getglobalscope
// ){
//            _local1 = (((_local1 + "\n") + ServerWarInfoLang.Dps) + this.dps);
//            _local1 = ((_local1 + "\n") + Lang.sprintf(ServerWarInfoLang.From, this.stageName, this.serverName));
//        };
//        return (_local1);
		return "";
    }
    public function get socialStatusTip():String{
        if (this.socialStatus == 0){
            return ("0");
        };
        if (this.socialStatus >= 1000000000){
            return ((int((this.socialStatus / 100000000)) + ServerWarInfoLang.Yi));
        };
        return ((int((this.socialStatus / 10000)) + ServerWarInfoLang.Wang));
    }
    public function get dpsTip():String{
//        if (this.id == 0){
//            return ("");
//        };
//        if (??callstaticsub1=??getglobalscope
// ){
//            return ("");
//        };
        return ((ServerWarInfoLang.Dps + this.dps));
    }
    public function get lvTip():String{
        if (this.id == 0){
            return ("");
        };
        return ((ServerWarInfoLang.Lv + this.level));
    }
    public function get fameTip():String{
        if (this.id == 0){
            return ("");
        };
        return ((ServerWarInfoLang.Fame + this.fame));
    }

}
const linkText:Function = function (_arg1:String, _arg2:Array):String{
//        if (((??callstaticsub1=??getglobalscope
// ) && ((_arg2[0] == "player")))){
//            return (_arg1);
//        };
//        return ((((("<u><a href='event:" + _arg2.join("_")) + "'>") + _arg1) + "</a></u>"));
		return "";
    };
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)
//unhandled trait type in script info (getter/setter)

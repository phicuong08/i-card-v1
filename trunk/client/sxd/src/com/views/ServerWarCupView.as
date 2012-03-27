//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.serverWar.*;
    import com.assist.view.war.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.events.*;
    import flash.text.*;
    import flash.utils.*;

    public final class ServerWarCupView extends Base implements IView {

        private var _info:ServerWarInfo;
        private var _target:IServerWarCup;
        private var _linkData:Array;
        private var _ServerWarCupViewSign:String = "ServerWarCupViewSign";
        private var _timeUpdate:int = 0;
        private var _date:Date;
        private var _ingotChange:ChangeColor;
        private var _coinChange:ChangeColor;
        private var _onWarTime:int = 0;

        public function ServerWarCupView(){
            this._linkData = [];
            this._date = new Date();
            super();
            _inStageTipTitle = ServerWarCupViewLang.ServerWarOpening;
            _inStageTipContent = "";
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            this._info = _ctrl.serverWar.info;
            this.get_race_list(this._info.groupCup);
        }
        public function close():void{
            if (((this._target) && ((this._target.content.parent == _popup)))){
                _popup.removeChild(this._target.content);
            };
            _view.chat.resetDepth();
            _view.chat.changePoint = 0;
        }
        public function clear():void{
        }
        public function update():void{
            if (this.inStage == false){
                return;
            };
            this._info = _ctrl.serverWar.info;
            this.get_race_list(this._info.groupCup);
        }
        override public function get inStage():Boolean{
            return (((((this._target) && (this._target.content))) && (this._target.content.parent)));
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("ServerWarCup", "MCWarCup") as IServerWarCup);
                this._target.onClose = this.close;
                this._target.onRecord = this.onRecord;
                this._target.onSee = this.onSee;
                this._target.onDeploy = _view.superDeploy.switchSelf;
                this._target.onFate = this.onFate;
                this._target.onPack = _view.pack.switchSelf;
                this._target.onResearch = _view.research.switchSelf;
                this._target.onRoleMsg = _view.roleMsg.switchSelf;
                this._target.onSealSoul = this.onSealSoul;
                this._target.onUpgrade = _view.upgrade.switchSelf;
                this._target.onLink = this.onLink;
                this._target.onBet = this.onBet;
                this._target.onTip = this.onTip;
                this._target.onChat = this.onChat;
                this._target.onDiBan = this.onDiBan;
                this._target.onTianBan = this.onTianBan;
            };
            if (this._target.content.parent == null){
                _popup.closeAll();
                _popup.addChild(this._target.content);
                this._target.reset();
                _view.chat.changePoint = 1;
                _view.chat.parent = this._target.chatMark;
                this._target.chatMark.visible = false;
            };
            this._target.init(this._info);
            _view.addToTimerProcessList(this._ServerWarCupViewSign, this.timeUpdate);
            this.timeUpdate();
            this.onTip(this._target.tfTime, ServerWarCupViewLang.ServerWarTime);
            this._target.tfCoins.text = this._ctrl.player.coinsString;
            this._target.tfIngot.text = this._ctrl.player.ingotString;
            this.onTip(this._target.tfCoins, (ServerWarCupViewLang.Coin + this._ctrl.player.coins));
            this.onTip(this._target.tfIngot, (ServerWarCupViewLang.Ingot + this._ctrl.player.ingot));
        }
        private function timeUpdate():void{
            this._date.time = (_ctrl.player.serverTime * 1000);
            var _local1:String = ("" + this._date.hours);
            var _local2:String = ("" + ((this._date.minutes)<10) ? ("0" + this._date.minutes.toString()) : this._date.minutes.toString());
            var _local3:String = ("" + ((this._date.seconds)<10) ? ("0" + this._date.seconds.toString()) : this._date.seconds.toString());
            this._target.tfTime.text = ((((_local1 + ":") + _local2) + ":") + _local3);
            if ((this._timeUpdate + 30000) < getTimer()){
                this.update();
            };
        }
        private function onChat():void{
            _view.chat.changePoint = 1;
            _view.chat.parent = this._target.chatMark;
        }
        private function onTianBan(_arg1:int):void{
            this.get_race_list(Mod_ServerWar_Base.GROUP_TIAN_BANG);
            this._target.reset();
        }
        private function onDiBan(_arg1:int):void{
            this.get_race_list(Mod_ServerWar_Base.GROUP_DI_BANG);
            this._target.reset();
        }
        private function onRecord():void{
            this.get_race_standings();
        }
        private function onSee(_arg1:int, _arg2:int, _arg3:int):void{
            switch (_arg3){
                case 16:
                    this.get_war_result_list(_arg1, _arg2, Mod_ServerWar_Base.SERVER_WAR_16);
                    break;
                case 8:
                    this.get_war_result_list(_arg1, _arg2, Mod_ServerWar_Base.SERVER_WAR_8);
                    break;
                case 4:
                    this.get_war_result_list(_arg1, _arg2, Mod_ServerWar_Base.SERVER_WAR_4);
                    break;
                case 2:
                    this.get_war_result_list(_arg1, _arg2, Mod_ServerWar_Base.SERVER_WAR_2);
                    break;
                case 1:
                    this.get_war_result_list(_arg1, _arg2, Mod_ServerWar_Base.SERVER_WAR_1);
                    break;
            };
        }
        private function onBet(_arg1:int, _arg2:int):void{
            var id:* = _arg1;
            var num:* = _arg2;
            if (num == 0){
                _view.showTip(ServerWarCupViewLang.CanNoZero);
            } else {
                if (_view.coinEnough(num) == true){
                    _view.alert.showYesNoMsg(Lang.sprintf(ServerWarCupViewLang.BetTip, this._info.getUser(id).name, HtmlText.yellow2(("" + int((num / 10000))))), ServerWarCupViewLang.Yes, ServerWarCupViewLang.No, function (_arg1:int):void{
                        if (_arg1 == AlertButtonType.Yes){
                            bet(id, num);
                            _target.closeBet();
                        };
                    });
                };
            };
        }
        public function onTip(_arg1:DisplayObject, _arg2:Object=null):void{
            if (_arg1 == null){
                return;
            };
            if ((((_arg2 == null)) || ((_arg2 == "")))){
                _view.tip.iTip.removeTarget(_arg1);
            } else {
                _view.tip.iTip.addTarget(_arg1, _arg2);
            };
        }
        public function set renderIngot(_arg1:Number):void{
            if (this.inStage == false){
                return;
            };
            this._ingotChange = ((this._ingotChange) || (new ChangeColor()));
            var _local2:TextField = this._target.tfIngot;
            this.onTip(_local2, (ServerWarCupViewLang.Ingot + _arg1));
            if (int(_local2.text) > _arg1){
                this._ingotChange.textColorForIngot(_local2, _arg1, 0xFF00, 0xFFF200);
            } else {
                this._ingotChange.textColorForIngot(_local2, _arg1, 0xFF0000, 0xFFF200);
            };
        }
        public function set renderCoins(_arg1:Number):void{
            if (this.inStage == false){
                return;
            };
            this._coinChange = ((this._coinChange) || (new ChangeColor()));
            var _local2:TextField = this._target.tfCoins;
            this.onTip(_local2, (ServerWarCupViewLang.Coin + _arg1));
            if (int(_local2.text) > _arg1){
                this._coinChange.textColorForCoins(_local2, _arg1, 0xFF0000);
            } else {
                this._coinChange.textColorForCoins(_local2, _arg1, 0xFF00);
            };
        }
        private function onFate():void{
            if (FunctionType.isOpened(FunctionType.Fate) == false){
                _view.showTip(ServerWarCupViewLang.UnOpen);
                return;
            };
            _view.fate.switchSelf();
        }
        private function onSealSoul():void{
            if (FunctionType.isOpened(FunctionType.SealSoul) == false){
                _view.showTip(ServerWarCupViewLang.UnOpen);
                return;
            };
            _view.sealSoul.switchSelf();
        }
        private function onWarClose(_arg1:Boolean=false):void{
            _view.chat.changePoint = 1;
            _view.chat.parent = this._target.chatMark;
            this._onWarTime = getTimer();
        }
        private function onLink(_arg1:TextEvent):void{
            var _local2:Array;
            var _local3:ClickTipList;
            this._linkData = _arg1.text.split("_");
            if (this._linkData[0] == "war"){
                if (this._onWarTime > getTimer()){
                    return;
                };
                this._onWarTime = (getTimer() + 15000);
                _view.chat.changePoint = 0;
                _view.chat.resetDepth();
                _view.strategyWar.isServerWar = this._info.isCrossService;
                _view.strategyWar.sameServer = this._info.isThisService;
                _view.strategyWar.warType = WarType.ServerWar;
                _view.strategyWar.version = this._linkData[2];
                _view.strategyWar.reportId = int(this._linkData[1]);
                _view.strategyWar.onClose = this.onWarClose;
                _view.strategyWar.show();
            } else {
                if (this._linkData[0] == "player"){
                    if (_ctrl.player.playerId == int(this._linkData[1])){
                        return;
                    };
                    _local2 = [ServerWarCupViewLang.See, ServerWarCupViewLang.Add, ServerWarCupViewLang.Send, ServerWarCupViewLang.Talk];
                    _local3 = new ClickTipList(_local2, _local2, this.onTextClick);
                    setTimeout(_view.tip.iTip.clickToOpen, 50, _local3);
                };
            };
        }
        private function onTextClick(_arg1:String):void{
            var _local2:int = int(this._linkData[1]);
            var _local3:String = this._linkData[2];
            if (_arg1 == ServerWarCupViewLang.See){
                _view.otherRoleMsg.init(_local2, _local3);
                _view.otherRoleMsg.show();
            } else {
                if (_arg1 == ServerWarCupViewLang.Add){
                    _view.friendList.addFriend(_local3, _local2);
                } else {
                    if (_arg1 == ServerWarCupViewLang.Talk){
                        this._view.friendChat.get_friendinfo_chatrecord_list(_local2);
                    } else {
                        if (_arg1 == ServerWarCupViewLang.Send){
                            this._view.sendFlower.sendPlayerID = _local2;
                            this._view.sendFlower.show();
                        };
                    };
                };
            };
        }
        private function get_race_list(_arg1:int):void{
            this._timeUpdate = getTimer();
            _data.call(Mod_ServerWar_Base.get_player_bet, null, []);
            _data.call(Mod_ServerWar_Base.get_race_list, this.get_race_list_back, [_arg1, Mod_ServerWar_Base.WORLD_WAR_LEVEL_NULL]);
            _data.call(Mod_ServerWar_Base.get_bet_coin_rank, null, []);
        }
        private function get_race_list_back():void{
            loadAssets("ServerWarCup", null, ServerWarCupViewLang.Loading, false, false, this.loadComplete);
        }
        private function get_race_standings():void{
            _data.call(Mod_ServerWar_Base.get_race_standings, this.get_race_standings_back, []);
        }
        private function get_race_standings_back():void{
            if (this._info.cupRecord.length <= 17){
                return;
            };
            this._target.showMineRecord(this._info);
        }
        private function get_war_result_list(_arg1:int, _arg2:int, _arg3:int):void{
            _data.call(Mod_ServerWar_Base.get_war_result_list, this.get_war_result_list_back, [_arg1, _arg2, _arg3]);
        }
        private function get_war_result_list_back():void{
            this._target.showSeeRecord(this._info);
        }
        private function bet(_arg1:int, _arg2:int):void{
            _data.call(Mod_ServerWar_Base.bet, this.bet_back, [this._info.betState, _arg1, _arg2]);
        }
        private function bet_back():void{
            switch (_ctrl.serverWar.result){
                case Mod_ServerWar_Base.SUCCESS:
                    _view.showTip(ServerWarCupViewLang.BetSuccess, null, TipType.Success);
                    this.get_race_list(this._info.groupCup);
                    break;
                case Mod_ServerWar_Base.REBET:
                    _view.showTip(ServerWarCupViewLang.BetNoBet);
                    break;
                case Mod_ServerWar_Base.INVALID_RACE:
                    _view.showTip(ServerWarCupViewLang.BetError1);
                    break;
                case Mod_ServerWar_Base.NOT_ENOUGH_COIN:
                    _view.showTip(ServerWarCupViewLang.BetNoCoin);
                    break;
                default:
                    _view.showTip(ServerWarCupViewLang.BetError2);
            };
        }

    }
}//package com.views 

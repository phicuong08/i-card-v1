//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.pack.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.controllers.*;

    public class NotifyController extends Base {

        private var colorObj:Object;

        public function NotifyController(){
            this.colorObj = {
                1:0x999999,
                2:2272312,
                3:44783,
                4:0xFF00FF,
                5:0xFFF100,
                6:0xFF0000
            };
            super();
        }
        public function get missionAwardList():Array{
            var _local2:Object;
            var _local3:Array;
            var _local4:String;
            var _local5:String;
            var _local1:Array = [];
            for each (_local2 in _data.notify.missionAwardList) {
                _local3 = [_local2.player_id];
                _local4 = MissionType.getMissionName(_local2.mission_id);
                _local4 = _local4.replace("(", "").replace(")", "");
                _local5 = "";
                if (MissionType.isHeroMission(_local2.mission_id)){
                    _local5 = ((((((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + this.getLinkPlayer(_local2.player_id, _local2.nickname, _ctrl.player.removeNickNameSuffix(_local2.nickname))) + NotifyControllerLang.Beat) + "<font color=\"#fff200\">") + _local4) + "</font>");
                } else {
                    _local5 = ((((((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + this.getLinkPlayer(_local2.player_id, _local2.nickname, _ctrl.player.removeNickNameSuffix(_local2.nickname))) + NotifyControllerLang.Into) + "<font color=\"#fff200\">") + _local4) + "</font>");
                };
                if (_local2.ingot != 0){
                    _local3.push((((((_local5 + NotifyControllerLang.Get) + "<font color=\"#fff200\">") + _local2.ingot) + NotifyControllerLang.Ingot) + "</font>"));
                };
                if (_local2.item_id != 0){
                    _local3.push(((_local5 + NotifyControllerLang.Get) + this.getLinkItem(_local2.item_id)));
                };
                if (_local2.boss_id != 0){
                    _local4 = MonsterType.getMonsterNameById(_local2.boss_id);
                    _local3.push(((((_local5 + NotifyControllerLang.Beat) + "<font color=\"#fff200\">") + _local4) + "</font>"));
                };
                _local1.push(_local3);
            };
            _data.notify.missionAwardList = [];
            return (_local1);
        }
        public function get giftList():Array{
            return (_data.notify.giftObjList);
        }
        public function get reelList():Array{
            var _local2:Object;
            var _local3:int;
            var _local4:String;
            var _local5:String;
            var _local1:Array = [];
            for each (_local2 in _data.notify.reelList) {
                _local3 = ItemType.getTypeId(_local2.reel_id);
                _local4 = ItemType.getName(_local2.item_id);
                _local5 = ((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + this.getLinkPlayer(_local2.player_id, _local2.nickname, _ctrl.player.removeNickNameSuffix(_local2.nickname)));
                if (_local3 == ItemType.LianDanJuanZhou){
                    _local5 = Lang.sprintf(NotifyControllerLang.ReelInfo, _local5, _local4.charAt(0), this.getLinkItem(_local2.item_id));
                } else {
                    if (_local3 == ItemType.LianQiJuanZhou){
                        _local5 = Lang.sprintf(NotifyControllerLang.ReeledInfo, _local5, this.getLinkItem(_local2.item_id, _local2.qlv, _local2.gold_id, _local2.playerItemid));
                    };
                };
                _local1.push(_local5);
            };
            _data.notify.reelList = [];
            return (_local1);
        }
        public function get pkAward():String{
            var _local1:Array = _data.notify.pkAward;
            var _local2:Object = {};
            _local2.id = _local1[0];
            _local2.nickName = _local1[1];
            _local2.awardType = _local1[2];
            _local2.awardId = _local1[3];
            _local2.num = _local1[4];
            _local2.site = NotifyControllerLang.SuperSport;
            var _local3:String = this.htmlReturn(_local2);
            return (_local3);
        }
        private function htmlReturn(_arg1:Object):String{
            var _local3:String;
            var _local2:String = ((((((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + this.getLinkPlayer(_arg1.id, _arg1.nickName, _ctrl.player.removeNickNameSuffix(_arg1.nickname))) + NotifyControllerLang.Into) + "<font color=\"#fff200\">") + _arg1.site) + "</font>");
            switch (_arg1.awardType){
                case Mod_Notify_Base.COINS:
                    _arg1.type = NotifyControllerLang.Coin;
                    _local2 = (_local2 + ((((NotifyControllerLang.GetInfo + "<font color=\"#fff200\">") + _arg1.type) + _arg1.num) + "</font>"));
                    break;
                case Mod_Notify_Base.ITEM:
                    _arg1.type = ItemType.getName(_arg1.awardId);
                    _arg1.num = ("x" + _arg1.num);
                    _local2 = (_local2 + ((((((((NotifyControllerLang.GetInfo + "<font color=\"#fff200\"><u><a href=\"event:") + TextLinkType.Item) + "_") + _arg1.awardId) + "\">") + _arg1.type) + _arg1.num) + "</a></u></font>"));
                    break;
                case Mod_Notify_Base.ROLE:
                    _local3 = RoleType.getRoleName(_arg1.awardId);
                    _arg1.type = _local3;
                    _arg1.num = "";
                    _local2 = (_local2 + ((((NotifyControllerLang.GetInfo + "<font color=\"#fff200\">") + _arg1.type) + _arg1.num) + "</font>"));
                    break;
                case Mod_Notify_Base.FAME:
                    _arg1.type = NotifyControllerLang.Fram;
                    _local2 = (_local2 + ((((NotifyControllerLang.GetInfo + "<font color=\"#fff200\">") + _arg1.type) + _arg1.num) + "</font>"));
                    break;
            };
            return (_local2);
        }
        public function getRoleCount():int{
            return (_data.notify.getRoleCount());
        }
        public function getNewResearch():Array{
            return (_data.notify.getNewResearch());
        }
        public function getNewPartnersId():int{
            return (_data.notify.getNewPartnersId());
        }
        public function get eq_PlayerId():int{
            return (_data.notify.eq_PlayerId);
        }
        public function get getGoodFate():String{
            var _local1:Array = _data.notify.getGoodFate;
            var _local2:int = _local1[2];
            return  ((((((((((((((((((((((((((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _local1[0]) + "_") + _local1[1]) + "\">") + _ctrl.player.removeNickNameSuffix(_local1[1])) + "</a></u></font>") + "<font color=\"#ffffff\">") + NotifyControllerLang.GetFateInfo) + "</font>") + "<font color=\"#") + this.colorObj[FateType.getFateQuality(_local2)].toString(16)) + "\">") + "<u>") + "<a href=\"event:") + TextLinkType.Fate) + "_") + _local2) + "\">") + FateType.getFateName(_local2)) + "</a></u></font>");
            
        }
        public function getBuyGoodStuffInLuckyShop():Object{
            var _local1:Object = _data.notify.getBuyGoodStuffInLuckyShop;
            _local1["chat"] = ((((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + this.getPlayerNameHtmlText(_local1["player_id"], _local1["player_name"])) + htmlFormat(NotifyControllerLang.BuyGoodStuff, 12, 0xFFFFFF)) + this.getItemNameHtmlText(_local1["item_id"], ItemType.getName(_local1["item_id"]), ItemType.getItemColor(_local1["item_id"])));
            return (_local1);
        }
        private function getPlayerNameHtmlText(_arg1:int, _arg2:String):String{
            return (((((((("<font color=\"#fff200\" size=\"12\"><a href=\"event:" + TextLinkType.Player) + "_") + _arg1) + "_") + _arg2) + "\"><u>") + _arg2) + "</u></a></font>");
            
        }
        private function getItemNameHtmlText(_arg1:int, _arg2:String, _arg3:uint):String{
            var _local4:String = ("#" + _arg3.toString(16));
            return  (((((((("<font color=\"" + _local4) + "\" size=\"12\"><a href=\"event:") + TextLinkType.Item) + "_") + _arg1) + "\"><u>") + _arg2) + "</u></a></font>");
        }
        private function getLinkPlayer(_arg1:int, _arg2:String, _arg3:String):String{
            var _local4:String = ((((TextLinkType.Player + "_") + _arg1) + "_") + _arg2);
            return ((((("<font color=\"#fff200\"><a href=\"event:" + _local4) + "\"><u>") + _arg3) + "</u></a></font>"));
        }
        private function getLinkItem(_arg1:int, _arg2:int=1, _arg3:int=0, _arg4:int=0):String{
            var _local5:ItemBasically = ItemBasically.getBasic(_arg1);
            var _local6:String = _local5.getItemColor(_arg3).toString(16);
            var _local7:String = _local5.getItemName(_arg3);
            var _local8:String = [TextLinkType.Item, _arg1, _arg2, _arg4, _arg3].join("_");
            return ((((((("<font color=\"#" + _local6) + "\"><a href=\"event:") + _local8) + "\"><u>") + _local7) + "</u></a></font>"));
        }
        public function get takeBible():Object{
            var _local1:Array = _data.notify.takeBible;
            var _local2:Object = {};
            _local2.name = _local1[0];
            _local2.npc = this.protectionData(_local1[1]);
            _local2.info = Lang.sprintf(NotifyControllerLang.TakeBible, _ctrl.player.removeNickNameSuffix(_local2.name), _local2.npc);
            return (_local2);
        }
        public function get takeBibleBerobbed():Object{
            var _local1:Array = _data.notify.takeBibleBerobbed;
            var _local2:Object = {};
            _local2.robPlayerNickname = _ctrl.player.removeNickNameSuffix(_local1[0]);
            _local2.berobPlayerNickname = _ctrl.player.removeNickNameSuffix(_local1[1]);
            _local2.npc = this.protectionData(_local1[2]);
            _local2.info = Lang.sprintf(NotifyControllerLang.TakeBibleBerobbed, _local2.robPlayerNickname, _local2.berobPlayerNickname, _local2.npc);
            return (_local2);
        }
        private function protectionData(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_TakeBible_Base.TANG_SENG:
                    _local2 = NotifyControllerLang.TS;
                    break;
                case Mod_TakeBible_Base.SUN_WU_KONG:
                    _local2 = NotifyControllerLang.SWK;
                    break;
                case Mod_TakeBible_Base.ZHU_BA_JIE:
                    _local2 = NotifyControllerLang.ZBJ;
                    break;
                case Mod_TakeBible_Base.SHA_WU_JING:
                    _local2 = NotifyControllerLang.SWJ;
                    break;
                case Mod_TakeBible_Base.BAI_LONG_MA:
                    _local2 = NotifyControllerLang.BLM;
                    break;
            };
            return (_local2);
        }
        public function get gameTimer():Object{
            return (this._data.notify.gameTimer);
        }
        public function get sendFlowerInfo():Object{
            return (this._data.notify.sendFlowerInfo);
        }
        public function get passTowerMsg():Array{
            var _local1:Array = this._data.notify.passTowerMsg;
            this._data.notify.passTowerMsg = [];
            return (_local1);
        }
        public function get rulaiStatus():Object{
            var _local1:Array = this._data.notify.RulaiStatus;
            var _local2:Object = {};
            _local2.type = _local1[0];
            _local2.rulaiPlayerId = _local1[1];
            _local2.rulaiNickName = _local1[2];
            _local2.time = _local1[3];
            _local2.awardFame = _local1[4];
            _local2.isSelf = (_local2.rulaiPlayerId == _ctrl.player.playerId);
            _local2.info = Lang.sprintf(NotifyControllerLang.CallRuLai, _local2.rulaiNickName, _local2.awardFame);
            _local2.diffTime = _ctrl.player.diffServerTime;
            return (_local2);
        }
        public function get rollCakInfo():Object{
            var _local1:Array = this._data.notify.rollCake;
            var _local2:Object = {};
            _local2.playerId = _local1[0];
            _local2.nickname = _local1[1];
            _local2.type = _local1[2];
            _local2.typeName = RollCakeType.getRollCakeNickName(_local2.type);
            _local2.awardSkill = RollCakeType.getRollCakeSkill(_local2.type);
            _local2.statePoint = RollCakeType.getRollCakeStatePoint(_local2.type);
            _local2.info = (((((((((((((("<font color=\"#fff200\">[" + NotifyControllerLang.Notice) + "]</font>") + "<font color=\"#fff200\">") + "<u>") + "<a href=\"event:") + TextLinkType.Player) + "_") + _local2.playerId) + "_") + _local2.nickname) + "\">") + _ctrl.player.removeNickNameSuffix(_local2.nickname)) + "</a></u></font>") + Lang.sprintf(NotifyControllerLang.RoleCake, _local2.typeName, HtmlText.yellow(_local2.awardSkill), HtmlText.yellow(_local2.statePoint)));
            return (_local2);
        }
        public function get serverWarWinnerMsg():String{
            return (this._data.notify.serverWarWinnerMsg);
        }
        public function get firstLoginChat():String{
            return (this._data.notify.firstLoginChat);
        }
        public function get firstLoginWorld():String{
            return (this._data.notify.firstLoginWorld);
        }
        public function set firstLoginWorld(_arg1:String):void{
            this._data.notify.firstLoginWorld = "";
        }
        public function get zodiacEntryNotify():Object{
            return (this._data.notify.zodiacEntryNotify);
        }
        public function get petBaoJi():String{
            return (this._data.notify.petBaoJi);
        }
        public function get missionPracticeStatus():Object{
            var _local1:Array = _data.notify.MissionPracticeStatus;
            var _local2:Object = {};
            _local2.playerId = _local1[0];
            _local2.status = _local1[1];
            return (_local2);
        }
        public function get studyStuntNotify():Object{
            return (this._data.notify.studyStuntNotify);
        }

    }
}//package com.controllers 

//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import flash.events.*;
    import ICard.*;
    import flash.display.*;
    import ICard.haloer.net.*;
    import ICard.assist.view.*;
    import flash.utils.*;
    import flash.geom.*;
    import ICard.assist.view.interfaces.*;
    import ICard.assist.view.info.*;
    
    
    import ICard.assist.*;
    import ICard.haloer.data.*;
    import ICard.protocols.*;
    import ICard.assist.view.controls.*;
    import ICard.assist.view.sound.*;
    import ICard.assist.server.*;
    import ICard.assist.view.toolbar.*;
    import ICard.lang.client.com.views.toolbar.*;
    import flash.desktop.*;

    public class ToolbarView extends Base implements IView {

        private static var CleanUpgradeCdSign:String = "CleanUpgradeCd";

        private var _toolbar:IToolbar;
        private var _alert:IAlert;
        private var _firstInTown:Boolean = true;
        private var _soundMuteEnabled:Boolean = false;
        public var isBuy:Boolean = false;
        public var isCanBuy:Boolean = true;
        public var upgradeCdTime:int;
        public var upgradeListData:Array;
        private var _upgradeOpenIngot:int;
        public var researchCdTime:int;
        private var _travelEventEndTime:Number;
        public var travelEventCdTime:int;
        public var travelEventJoinCount:int;
        public var travelEventTotalCount:int;
        private var _miniMap:IMiniMap;
        private var _lastTraceVisible:Boolean = true;
        private var _first:Boolean = true;
        private var _fateTipSprite:FateTipSprite;
        private var _soulTipSprite:SoulTipSprite;
        private var _isOpenFactionActivity:Boolean = false;
        public var showChatId:int = 0;
        private var _hasDeploy:Boolean = false;
        private var _hasFate:Boolean = false;
        private var _takeBibleData:Object = null;
        private var _robList:Array;
        private var _showMessageList:Array;
        private var thisAwardList:Array;
        private var _blockedHealth:Boolean = false;
        private var _oldPower:int = 0;
        private var _loadEffectCircle:Class;
        private var _practiceTime:int = 0;
        private var _px:int = 0xFFFFFF;
        private var _py:int = 0xFFFFFF;

        public function ToolbarView(){
            this.upgradeListData = [];
            this._robList = [];
            this._showMessageList = [];
            this.thisAwardList = [];
            super();
        }
        public function get width():Number{
            return (this._toolbar.content.width);
        }
        public function get height():Number{
            return (this._toolbar.content.height);
        }
        public function get content():Sprite{
            return (this._toolbar.content);
        }
        override public function get inStage():Boolean{
            return (((this._toolbar) && (this._toolbar.content.parent)));
        }
        public function init():void{
            this._toolbar = (_viewMgr.getAssetsObject("Toolbar", "Toolbar") as IToolbar);
            this._toolbar.tip = _viewMgr.tip.iTip;
            this._toolbar.goodsIconUrl = URI.goodsIconUrl;
            this._toolbar.addonsUrl = URI.addonsUrl;
            this._toolbar.init();
            this._toolbar.alert = _viewMgr.alert.iAlert;
            this._alert = _viewMgr.alert.iAlert;
            this.playerData();
            this.buffInfo();
            this.functionLink();
            this.activityInfo();
            this.initMiniMap();
            this.questTrace();
            this.chat();
            this.functionBar();
            this.keepAlive();
            this.friend();
            _viewMgr.addToPositionList(sign, this.reposition);
            this.autoPractice();
            _viewMgr.whatsNew.show();
            this.load_effect_circle();
        }
        public function show():void{
            this._toolbar.content.visible = true;
        }
        public function hide():void{
            this._toolbar.content.visible = false;
        }
        public function close():void{
            this.clear();
            if (this._toolbar.content.parent){
                this._toolbar.content.parent.removeChild(this._toolbar.content);
            };
        }
        public function clear():void{
            _data.cancelPatch(Mod_Player_Base.receive_player_delay_notify_message);
            _data.cancelPatch(Mod_Notify_Base.mission_award);
            _data.cancelPatch(Mod_Notify_Base.pk_award);
            _data.cancelPatch(Mod_Friend_Base.notify_online_state);
            _data.cancelPatch(Mod_Friend_Base.notify_message_count);
            _data.cancelPatch(Mod_CampWar_Base.notify);
            _data.cancelPatch(Mod_HeroesWar_Base.notify);
            _data.cancelPatch(Mod_Notify_Base.role_num_notify);
            _data.cancelPatch(Mod_Notify_Base.new_research_notify);
            _data.cancelPatch(Mod_Notify_Base.new_partners_notify);
            this._toolbar.clear();
        }
        public function set playerDataVisible(_arg1:Boolean):void{
            this._toolbar.playerDataVisible = _arg1;
            this._toolbar.visibleBuff = _arg1;
        }
        public function set functionLinkVisible(_arg1:Boolean):void{
            this._toolbar.functionLinkVisible = _arg1;
        }
        public function reposition():void{
            if (this.inStage == true){
                this._toolbar.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
            Tip.offset = Structure.stageOffset;
            _structure.reposition();
            _viewMgr.reposition();
            _viewMgr.achievementComplete.reposition(false);
            _viewMgr.activities.reposition(false);
            _viewMgr.alert.reposition();
            _viewMgr.chat.reposition(false);
            _viewMgr.delayMessage.reposition(false);
            _viewMgr.dujieWar.reposition(false);
            _viewMgr.factionWar.reposition(false);
            _viewMgr.fate.reposition(false);
            _viewMgr.factionWarMap.reposition(false);
            _viewMgr.friendMessage.reposition(false);
            _viewMgr.getPeachWar.reposition(false);
            _viewMgr.guide.reposition();
            _viewMgr.inCampWar.reposition(false);
            _viewMgr.initLoading.reposition(false);
            _viewMgr.lodge.reposition(false);
            _viewMgr.miniFactionWar.reposition(false);
            _viewMgr.missionMap.reposition(false);
            _viewMgr.missionFailedTips.reposition(false);
            _viewMgr.multiWar.reposition(false);
            _viewMgr.pkWar.reposition(false);
            _viewMgr.processTip.reposition(false);
            _viewMgr.sealSoul.reposition(false);
            _viewMgr.sendFlower.reposition(false);
            _viewMgr.sportWar.reposition(false);
            _viewMgr.superSport.reposition(false);
            _viewMgr.superSportWar.reposition(false);
            _viewMgr.takeBibleRoad.reposition(false);
            _viewMgr.takeBibleWar.reposition(false);
            _viewMgr.tip2.reposition();
            _viewMgr.towerWar.reposition(false);
            _viewMgr.townMap.reposition(false);
            _viewMgr.war.reposition(false);
            _viewMgr.world.reposition(false);
            _viewMgr.worldBossMap.reposition(false);
            _viewMgr.worldBossWar.reposition(false);
            _viewMgr.worldNotice.reposition(false);
            _viewMgr.rollCake.reposition(false);
            _viewMgr.factionRollCake.reposition(false);
            _viewMgr.zodiacWar.reposition(false);
        }
        public function repositionInTown():void{
            if (((_viewMgr.townMap.inStage) && ((true == this._firstInTown)))){
                this._firstInTown = false;
                this.reposition();
            };
        }
        public function set vipLevel(_arg1:int):void{
            this._toolbar.vipLevel = _arg1;
        }
        public function checkRechargeVisible():void{
            this._toolbar.rechargeVisible = VIPType.enabled;
        }
        public function soundMute(_arg1:Boolean):void{
            this._toolbar.soundMute(_arg1);
            this._soundMuteEnabled = _arg1;
        }
        private function playerData():void{
            this.vipLevel = _ctrl.player.vipLevel;
            this._toolbar.onPlayerIcon = _viewMgr.roleMsg.switchSelf;
            var url:* = ((URI.avatarUrl + RoleType.getRoleSign(_ctrl.player.mainRoleId)) + ".swf");
            this._toolbar.loadPlayerAvatar(url);
            this._toolbar.onSoundControl = function ():void{
                if (_soundMuteEnabled){
                    _viewMgr.setting.openSound();
                } else {
                    _viewMgr.setting.closeSound();
                };
            };
            this._toolbar.onBuyPower = this.buy_power;
            this._toolbar.onPlayerIconOver = this.MainPlayerInfo;
            this.MainPlayerInfo();
            this._toolbar.onRecharge = _viewMgr.vip.switchSelf;
            this.checkRechargeVisible();
            this.updateCoins();
            this.updateIngot();
            this._toolbar.nickName = _ctrl.player.nickname;
            this.updateHealth();
            this.updatePower();
            this.updateLevel();
            this.initBuffer();
            this.rune();
        }
        public function buy_power():void{
            this.isBuy = true;
            _data.call(Mod_Player_Base.buy_power, this.buyPowerCallBack, []);
        }
        private function buyPowerCallBack():void{
            var _local1:Object = _ctrl.player.buyPower;
            this._viewMgr.missionPractice.getLostPowerNum = _local1.buyNum;
            this._viewMgr.heroPractice.getLostPowerNum = _local1.buyNum;
            switch (_local1.msg){
                case Mod_Player_Base.NOT_ENOUGH_INGOT:
                    _viewMgr.showTip(playerDataLang.NoIngot);
                    this.isCanBuy = false;
                    break;
                case Mod_Player_Base.FULL_BUY_TIMES:
                    _viewMgr.showTip(playerDataLang.NoPowerCount);
                    this.isCanBuy = false;
                    break;
                case Mod_Player_Base.SUCCESS:
                    this._toolbar.powerInfo = _local1;
                    this.isCanBuy = true;
                    break;
            };
            this.isBuy = false;
        }
        private function MainPlayerInfo():void{
            _data.call(Mod_Player_Base.player_info_contrast, this.PlayerInfoContrastCallBack, [this._ctrl.player.playerId], false);
        }
        private function PlayerInfoContrastCallBack():void{
            var _local1:Object = this._ctrl.player.playerInfoContrastData;
            var _local2:Boolean = this.isShowPlayerInfo;
            if (_local2 == false){
                this._toolbar.PlayerInfo = "";
                return;
            };
            var _local3 = "";
            if (ActivityType.FactionLevel >= 1){
                _local3 = ((playerDataLang.FactionName + _local1.factionName) + "\n");
            };
            var _local4:String = (((((((((((((((((((((((playerDataLang.RankIng + _local1.rankIng) + "\n") + _local3) + playerDataLang.Combat) + _local1.combat) + "\n") + playerDataLang.Fame) + _local1.fame) + "\n") + playerDataLang.Skill) + _local1.skill) + "\n") + playerDataLang.AchievmentPoints) + _local1.achievmentPoints) + "\n") + playerDataLang.FirstAttack) + _local1.firstAttack) + "\n") + playerDataLang.StatePoint) + _local1.statePoint) + "\n") + playerDataLang.FlowerCount) + _local1.flowerCount);
            this._toolbar.PlayerInfo = (("<font color=\"#ffffff\">" + _local4) + "</font>");
        }
        public function get isShowPlayerInfo():Boolean{
            var _local1:Array = this._ctrl.mission.renderTownMission(TownType.getId(TownType.LiShuShan));
            var _local2:Object = _local1[0];
            var _local3 = (this._ctrl.player.missionKey >= _local2.lock);
            return (_local3);
        }
        public function get PlayerInfoContrastCallBackOther():String{
            var _local1:Object = this._ctrl.player.playerInfoContrastData;
            var _local2:String = (((((((((((((((((playerDataLang.RankIng + _local1.rankIng) + "\n") + ((_local1.factionName)=="") ? "" : ((playerDataLang.FactionName + _local1.factionName) + "\n")) + playerDataLang.Combat) + _local1.combat) + "\n") + playerDataLang.Fame) + _local1.fame) + "\n") + playerDataLang.AchievmentPoints) + _local1.achievmentPoints) + "\n") + playerDataLang.FirstAttack) + _local1.firstAttack) + "\n") + playerDataLang.FlowerCount) + _local1.flowerCount);
            return ((("<textformat leading=\"10\"><font color=\"#ffffff\">" + _local2) + "</font></textformat>"));
        }
        private function rune():void{
            this.runeVisible = false;
            this._toolbar.onOpenRune = _viewMgr.rune.switchSelf;
        }
        public function set runeVisible(_arg1:Boolean):void{
            this._toolbar.runeVisible = _arg1;
        }
        public function set showBuff(_arg1:Object):void{
            this._toolbar.addBuff = _arg1;
        }
        public function set removeBuff(_arg1:String):void{
            this._toolbar.removeBuff = _arg1;
        }
        public function set visbleBuff(_arg1:Boolean):void{
            this._toolbar.visibleBuff = _arg1;
        }
        private function buffInfo():void{
            this._toolbar.onDoubleRemoveBuff = function (_arg1:String):void{
                if (_arg1 == BufferType.Mounts){
                    _data.call(Mod_Item_Base.dismount_transport, null, []);
                } else {
                    if (_arg1 == BufferType.Avatar){
                        _data.call(Mod_Item_Base.avatar_card_off, null, []);
                    };
                };
            };
        }
        private function updateExtraPower():void{
            var _local1:int = this._ctrl.player.extraPower;
            var _local2:int = this._ctrl.player.maxExtraPower;
            if (_local1 <= 0){
                this.removeBuff = BufferType.ExtraPower;
            } else {
                this.showBuff = {
                    type:BufferType.ExtraPower,
                    doubleClickable:false,
                    sign:BufferType.ExtraPower,
                    name:buffInfoLang.PowerName,
                    effect:Lang.sprintf(buffInfoLang.Powereffect, _local1),
                    info:buffInfoLang.PowerInfo
                };
            };
        }
        private function updateMountsBuffer():void{
            var _local2:Object;
            if (BufferType.MountsSign.length == 0){
                BufferType.MountsSign[32] = "Cloud";
                BufferType.MountsSign[1055] = "BaiHu";
                BufferType.MountsSign[1008] = "FeiJian";
                BufferType.MountsSign[1094] = "LiuGuangXiangYun";
                BufferType.MountsSign[1177] = "JinYu";
                BufferType.MountsSign[1192] = "HuLu";
                BufferType.MountsSign[1195] = "HuLu2";
                BufferType.MountsSign[1196] = "FengLeiYi";
            };
            var _local1:int = this._ctrl.player.mounts;
            if (_local1 == 0){
                this.removeBuff = BufferType.Mounts;
            } else {
                _local2 = {};
                _local2.doubleClickable = true;
                _local2.type = BufferType.Mounts;
                _local2.sign = ((BufferType.MountsSign[_local1]) || ("Cloud"));
                _local2.name = ItemType.getName(_local1);
                _local2.info = buffInfoLang.ClickCancel;
                _local2.effect = ItemType.getDescription(_local1);
                this.showBuff = _local2;
            };
        }
        private function updateAvatarBuffer():void{
            var _local3:int;
            var _local4:int;
            var _local5:int;
            var _local6:String;
            var _local7:Object;
            var _local1:int = this._ctrl.player.avatar;
            var _local2:int = ((this._ctrl.player.avatarCD - getTimer()) * 0.001);
            if ((_local2 < 0)){
                _local2 = 0;
            };
            if (_local1 == 0){
                this.removeBuff = BufferType.Avatar;
                this._viewMgr.removeFromTimerProcessList(BufferType.Avatar);
            } else {
                _local3 = int((_local2 / 3600));
                _local4 = (int((_local2 / 60)) % 60);
                _local5 = (_local2 % 60);
                _local6 = buffInfoLang.RemainingTime;
                if (_local3 > 0){
                    _local6 = (_local6 + (_local3 + buffInfoLang.Hours));
                };
                if (_local4 > 0){
                    _local6 = (_local6 + (_local4 + buffInfoLang.Minute));
                };
                _local6 = (_local6 + (_local5 + buffInfoLang.Second));
                if (BufferType.AvatarSign.length == 0){
                    BufferType.AvatarSign[1273] = "QingRenJieZhiYi";
                };
                _local7 = {};
                _local7.doubleClickable = true;
                _local7.type = BufferType.Avatar;
                _local7.sign = ((BufferType.AvatarSign[_local1]) || (BufferType.Avatar));
                _local7.name = ItemType.getName(_local1);
                _local7.info = ((_local6 + "\n") + buffInfoLang.ClickCancel);
                _local7.effect = ItemType.getDescription(_local1);
                this.showBuff = _local7;
                this._viewMgr.addToTimerProcessList(BufferType.Avatar, this.updateAvatarBuffer);
            };
        }
        private function updateMedicalBuffer():void{
            var _local1:int;
            var _local2:Array;
            if (BufferType.MedicalSign.length == 0){
                BufferType.MedicalSign[0] = "0 0";
                BufferType.MedicalSign[7500] = ("Medical1 " + buffInfoLang.Medical1);
                BufferType.MedicalSign[100000] = ("Medical2 " + buffInfoLang.Medical2);
                BufferType.MedicalSign[500000] = ("Medical3 " + buffInfoLang.Medical3);
                BufferType.MedicalSign[3000000] = ("Medical4 " + buffInfoLang.Medical4);
            };
            if (this._viewMgr.ctrl.player.medical == 0){
                this.removeBuff = BufferType.Medical;
            } else {
                _local1 = this._viewMgr.ctrl.player.medicalMax;
                _local2 = BufferType.MedicalSign[_local1].split(" ");
                this.showBuff = {
                    doubleClickable:false,
                    type:BufferType.Medical,
                    sign:_local2[0],
                    name:_local2[1],
                    info:Lang.sprintf(buffInfoLang.MedicalInfo, _local1),
                    effect:Lang.sprintf(buffInfoLang.MedicalEffect, this._viewMgr.ctrl.player.medical)
                };
            };
        }
        public function updateFactionBlessing(_arg1:Object):void{
            if (_arg1["count"] <= 0){
                this.removeBuff = BufferType.FactionBlessing;
                return;
            };
            this.showBuff = {
                type:BufferType.FactionBlessing,
                doubleClickable:false,
                sign:BufferType.FactionBlessing,
                name:buffInfoLang.FactionBlessingName,
                effect:Lang.sprintf(buffInfoLang.FactionBlessingEffect, HtmlText.green(_arg1["count"])),
                info:Lang.sprintf(buffInfoLang.FactionBlessingInfo, HtmlText.green((("+" + _arg1["coin_add"]) + "%")))
            };
        }
        public function updateMarsBlessing(_arg1:Object):void{
            if (_arg1["count"] <= 0){
                this.removeBuff = BufferType.MarsBlessing;
                return;
            };
            this.showBuff = {
                type:BufferType.MarsBlessing,
                doubleClickable:false,
                sign:BufferType.MarsBlessing,
                name:buffInfoLang.MarsBlessingName,
                effect:Lang.sprintf(buffInfoLang.MarsBlessingEffect, HtmlText.green(_arg1["count"])),
                info:Lang.sprintf(buffInfoLang.MarsBlessingInfo, HtmlText.green((("+" + _arg1["exp_add"]) + "%")))
            };
        }
        public function updateCampWarInspire(_arg1:int):void{
            if (_arg1 <= 0){
                this.removeBuff = BufferType.CampWarInspire;
                return;
            };
            this.showBuff = {
                type:BufferType.CampWarInspire,
                doubleClickable:false,
                sign:BufferType.CampWarInspire,
                name:buffInfoLang.WarName,
                effect:Lang.sprintf(buffInfoLang.WarEffect, _arg1),
                info:buffInfoLang.WarInfo
            };
        }
        private function initBuffer():void{
            this.updateMountsBuffer();
            this.updateAvatarBuffer();
            this.updateExtraPower();
            this._viewMgr.factionBlessing.getBlessingCount();
            this._data.call(Mod_Player_Base.update_player_data, null, [Mod_Player_Base.PLAYER_INIT_MEDICAL]);
            this._data.call(Mod_Player_Base.update_player_data, null, [Mod_Player_Base.PLAYER_MEDICAL]);
            this._data.call(Mod_Player_Base.update_player_data, null, [Mod_Player_Base.CAN_INCENSE_COUNT]);
        }
        public function updateWorldBossInspireBuffer(_arg1:int, _arg2:String):void{
            if (_arg1 <= 0){
                this.removeBuff = _arg2;
                return;
            };
            this.showBuff = {
                type:_arg2,
                doubleClickable:false,
                sign:BufferType.WorldBossInspire,
                name:buffInfoLang.WarName,
                effect:Lang.sprintf(buffInfoLang.WarEffect, _arg1),
                info:buffInfoLang.WarInfo
            };
        }
        public function renderFunctionLink(_arg1:Object):void{
            this._toolbar.renderFunctionLink(_arg1);
        }
        public function renderFunctionLinkBtnTip(_arg1:String, _arg2:String):void{
            this._toolbar.renderFunctionLinkBtnTip(_arg1, _arg2);
        }
        public function renderFunctionTextTip(_arg1:String, _arg2:String):void{
            this._toolbar.renderFunctionTextTip(_arg1, _arg2);
        }
        private function functionLink():void{
            this._toolbar.onLinkTextClick = this.onLinkTextClick;
            this._toolbar.onLinkBtnClick = this.onLinkBtnClick;
            _viewMgr.addToTimerProcessList((sign + Math.random()), this.functionLinkTimer);
        }
        private function functionLinkTimer():void{
            if (this.upgradeCdTime > 0){
                this.upgradeCdTime--;
                if ((this.upgradeCdTime % 60) == 0){
                    this.getFunctionLink(FunctionType.Upgrade);
                };
            };
            if (this.researchCdTime > 0){
                this.researchCdTime--;
                if ((this.researchCdTime % 60) == 0){
                    this.getFunctionLink(FunctionType.Research);
                };
            };
            this.travelEventCdTime = Math.ceil(((this._travelEventEndTime - new Date().time) / 1000));
            if (this.travelEventCdTime > 0){
                if ((this.travelEventCdTime % 60) == 0){
                    this.renderTravelEventTip(Math.ceil((this.travelEventCdTime / 60)));
                };
            } else {
                this.travelEventCdTime = 0;
            };
            this.renderResearchLink(this.researchCdTime);
            this.renderTravelEventLink(this.travelEventCdTime);
            this.renderUpgradeLink(this.upgradeListData);
            this.renderUpgradeOpenLink(this._upgradeOpenIngot);
            this.setFunctionLinkPoint();
        }
        private function onLinkTextClick(_arg1:String):void{
            switch (_arg1){
                case FunctionType.Research:
                    if (this.researchCdTime > 0){
                        _viewMgr.research.clearCdTime();
                    } else {
                        _viewMgr.research.switchSelf();
                    };
                    break;
                case FunctionType.Farm:
                    _viewMgr.farm.switchSelf();
                    break;
                case FunctionType.MultiMission:
                    if (_viewMgr.multiMission.inStage){
                        _viewMgr.multiMission.clear();
                    } else {
                        _viewMgr.multiMission.show();
                    };
                    break;
                case FunctionType.TravelEvent:
                    if (this.travelEventJoinCount >= this.travelEventTotalCount){
                        _viewMgr.showTip(functionLinkLang.CountUsed);
                        return;
                    };
                    if (this.travelEventCdTime > 0){
                        _viewMgr.travelEvent.cancelCd();
                        return;
                    };
                    _viewMgr.travelEvent.switchSelf();
                    break;
                case FunctionType.EquipUpgradeQueue:
                    if (this._upgradeOpenIngot > 0){
                        _viewMgr.upgrade.openUpgradeOpportunity(this._upgradeOpenIngot);
                    };
                    break;
                case ActivityType.FactionSeal:
                    if (!_viewMgr.factionSeal.inStage){
                        _viewMgr.factionSeal.switchSelf();
                    };
                case CleanUpgradeCdSign:
                    this._viewMgr.upgrade.permanentCleanItemUpdate();
                default:
                    if (_arg1.indexOf(FunctionType.Upgrade) >= 0){
                        this.upgradeClick(_arg1);
                    };
            };
        }
        private function onLinkBtnClick(_arg1:String):void{
            switch (_arg1){
                case FunctionType.Research:
                    this._viewMgr.research.clearCdTime(this.researchClearCdCallBack);
                    break;
                case FunctionType.TravelEvent:
                    _viewMgr.travelEvent.cancelCd();
                    break;
                default:
                    if (_arg1.indexOf(FunctionType.Upgrade) >= 0){
                        this.upgradeClick(_arg1);
                    };
            };
        }
        public function clearFunctionLink():void{
            this._toolbar.clearFunctionLink();
            this.upgradeListData = [];
            this.upgradeCdTime = 0;
            this.researchCdTime = 0;
            this.travelEventCdTime = 0;
        }
        public function removeFunctionLink(_arg1:String):void{
            this._toolbar.removeFunctionLink(_arg1);
        }
        private function getFunctionLink(_arg1:String):void{
            switch (_arg1){
                case FunctionType.Upgrade:
                    _viewMgr.upgrade.getPermanentCleanItemUpdateCd();
                    break;
                case FunctionType.Research:
                    _viewMgr.research.getResearchState();
                    break;
                case FunctionType.Farm:
                    _viewMgr.farm.getFarmState();
                    break;
                case FunctionType.TravelEvent:
                    _viewMgr.travelEvent.get_activity_info();
                    break;
            };
        }
        public function showFunctionLink():void{
            if (((FunctionType.isOpened(FunctionType.Upgrade)) || (FunctionType.isOpened(FunctionType.EquipUpgradeQueue)))){
                this.getFunctionLink(FunctionType.Upgrade);
            };
            if (FunctionType.isOpened(FunctionType.Research)){
                this.getFunctionLink(FunctionType.Research);
            };
            if (FunctionType.isOpened(FunctionType.TravelEvent)){
                this.getFunctionLink(FunctionType.TravelEvent);
            };
            if (FunctionType.isOpened(FunctionType.Farm)){
                this.getFunctionLink(FunctionType.Farm);
            };
            setTimeout(this.setFunctionLinkPoint, 1000);
            setTimeout(this.setFunctionLinkPoint, 2000);
        }
        public function setFunctionLinkPoint():void{
            this._toolbar.setFunctionLinkPoint();
        }
        private function getFunctionLinkIndex(_arg1:String):int{
            var _local2:int;
            switch (_arg1){
                case FunctionType.Upgrade:
                    _local2 = 1;
                    break;
                case CleanUpgradeCdSign:
                case FunctionType.EquipUpgradeQueue:
                    _local2 = 2;
                    break;
                case FunctionType.Research:
                    _local2 = 3;
                    break;
                case FunctionType.TravelEvent:
                    _local2 = 4;
                    break;
                case FunctionType.Farm:
                    _local2 = 5;
                    break;
                case FunctionType.MultiMission:
                    _local2 = 6;
                    break;
                case ActivityType.FactionSeal:
                    _local2 = 7;
                    break;
            };
            return (_local2);
        }
        public function renderUpgradeLink(_arg1:Array):void{
            var _local3:Object;
            var _local4:Object;
            if (((!(FunctionType.isOpened(FunctionType.Upgrade))) && (!(FunctionType.isOpened(FunctionType.EquipUpgradeQueue))))){
                return;
            };
            var _local2:Object = this._ctrl.upgrade.getPermanentCleanItemUpdateCd();
            for each (_local3 in _arg1) {
                _local4 = {
                    sign:(FunctionType.Upgrade + _local3["upgrade_id"]),
                    timeText:((_local3["cd_time"] == 0)) ? "" : DateTime.formatFromSecond(_local3["cd_time"]),
                    stopText:((_local2["state"] == 1)) ? "" : htmlFormat(functionLinkLang.CanUpgrade, 12, 0xFF00, false, true),
                    runText:HtmlText.white(functionLinkLang.InUpgradeCd),
                    index:this.getFunctionLinkIndex(FunctionType.Upgrade),
                    time:_local3["cd_time"]
                };
                if (_local3["cd_time"] > 0){
                    var _local7 = _local3;
                    var _local8 = "cd_time";
                    var _local9 = (_local7[_local8] - 1);
                    _local7[_local8] = _local9;
                };
                if (((((_local3["cd_time"] % 60) == 0)) && (!((_local3["cd_time"] == 0))))){
                    this.renderFunctionLinkBtnTip((FunctionType.Upgrade + _local3["upgrade_id"]), HtmlText.orange(Lang.sprintf(functionLinkLang.ClearCd, Math.ceil((_local3["cd_time"] / 60)))));
                };
                this.renderFunctionLink(_local4);
            };
        }
        public function renderUpgradeLinkTip(_arg1:Array):void{
            var _local2:Object;
            for each (_local2 in _arg1) {
                this.renderFunctionLinkBtnTip((FunctionType.Upgrade + _local2["upgrade_id"]), HtmlText.orange(Lang.sprintf(functionLinkLang.ClearCd, Math.ceil((_local2["cd_time"] / 60)))));
            };
        }
        public function renderUpgradeOpenLink(_arg1:int):void{
            if ((((this._upgradeOpenIngot == _arg1)) || (!(FunctionType.isOpened(FunctionType.EquipUpgradeQueue))))){
                return;
            };
            this._upgradeOpenIngot = _arg1;
            var _local2 = "";
            if (_arg1 > 0){
                _local2 = htmlFormat(functionLinkLang.OpenQueue, 12, 44783, false, true);
            };
            this.renderFunctionLink({
                sign:FunctionType.EquipUpgradeQueue,
                timeText:"",
                stopText:_local2,
                runText:"",
                index:this.getFunctionLinkIndex(FunctionType.EquipUpgradeQueue),
                time:0
            });
            this.renderFunctionTextTip(FunctionType.EquipUpgradeQueue, HtmlText.orange(Lang.sprintf(functionLinkLang.OpenQueueNeed, this._upgradeOpenIngot)));
        }
        public function renderCLeanUpgradeCd():void{
            var _local2:Object;
            var _local1:Object = this._ctrl.upgrade.getPermanentCleanItemUpdateCd();
            if ((((((_local1["state"] == 2)) || ((_local1["state"] == 1)))) && (VIPType.check(VIPType.Level5)))){
                _local2 = {
                    sign:CleanUpgradeCdSign,
                    timeText:"",
                    stopText:((_local1["state"] == 1)) ? "" : htmlFormat(functionLinkLang.PermanentCleanCd, 12, 44783, false, true),
                    runText:"",
                    index:this.getFunctionLinkIndex(CleanUpgradeCdSign),
                    time:0
                };
                this.renderFunctionLink(_local2);
                this.renderFunctionTextTip(CleanUpgradeCdSign, HtmlText.orange(functionLinkLang.PermanentCleanCdNeed));
            };
        }
        private function upgradeClick(_arg1:String):void{
            var _local3:Object;
            var _local4:int;
            var _local2:int = int(_arg1.substring(FunctionType.Upgrade.length));
            for each (_local3 in this.upgradeListData) {
                if (_local3["upgrade_id"] != _local2){
                } else {
                    if (_local3["cd_time"] > 0){
                        _local4 = Math.ceil((_local3["cd_time"] / 60));
                        this._viewMgr.upgrade.clearCdTime(_local2, _local4);
                    } else {
                        _viewMgr.upgrade.switchSelf();
                    };
                    break;
                };
            };
        }
        private function researchClearCdCallBack():void{
            _viewMgr.research.renderClearCd();
            _viewMgr.deploy.clearCdTimer();
        }
        private function renderResearchLink(_arg1:int):void{
            if (!FunctionType.isOpened(FunctionType.Research)){
                return;
            };
            var _local2:Object = {
                sign:FunctionType.Research,
                timeText:((_arg1 == 0)) ? "" : DateTime.formatFromSecond(_arg1),
                stopText:htmlFormat(functionLinkLang.CanResearch, 12, 0xFF00, false, true),
                runText:htmlFormat(functionLinkLang.InResearchCd, 12, 0xFFFFFF),
                index:this.getFunctionLinkIndex(FunctionType.Research),
                time:_arg1
            };
            this.renderFunctionLink(_local2);
        }
        public function set travelEventEndTime(_arg1:Number):void{
            this._travelEventEndTime = _arg1;
        }
        public function renderTravelEventLink(_arg1:int):void{
            if (!FunctionType.isOpened(FunctionType.TravelEvent)){
                return;
            };
            var _local2:uint = ((((this.travelEventJoinCount == this.travelEventTotalCount)) || ((_arg1 > 0)))) ? 0xFFFFFF : 0xFF00;
            var _local3:Object = {
                sign:FunctionType.TravelEvent,
                timeText:((_arg1 == 0)) ? "" : DateTime.formatFromSecond(_arg1),
                stopText:htmlFormat((((((functionLinkLang.TravelEvent + "(") + this.travelEventJoinCount) + "/") + this.travelEventTotalCount) + ")"), 12, _local2, false, true),
                runText:htmlFormat(functionLinkLang.InTravelCd, 12, _local2),
                index:this.getFunctionLinkIndex(FunctionType.TravelEvent),
                time:_arg1
            };
            this.renderFunctionLink(_local3);
        }
        public function renderTravelEventTip(_arg1:int):void{
            this._viewMgr.toolbar.renderFunctionLinkBtnTip(FunctionType.TravelEvent, HtmlText.orange(Lang.sprintf(functionLinkLang.ClearCd, _arg1)));
        }
        public function setFarmLink(_arg1:int, _arg2:int):void{
            this.renderFarmLink(_arg1, _arg2);
        }
        private function renderFarmLink(_arg1:int, _arg2:int):void{
            if (!FunctionType.isOpened(FunctionType.Farm)){
                return;
            };
            var _local3:uint = ((_arg1 < _arg2)) ? 0xFF00 : 0xFFFFFF;
            var _local4:Object = {
                sign:FunctionType.Farm,
                timeText:"",
                stopText:htmlFormat((((((functionLinkLang.Farm + "(") + _arg1) + "/") + _arg2) + ")"), 12, _local3, false, true),
                runText:"",
                index:this.getFunctionLinkIndex(FunctionType.Farm),
                time:0
            };
            this.renderFunctionLink(_local4);
        }
        public function renderMultMissionLink(_arg1:String):void{
            if (!FunctionType.isOpened(FunctionType.MultiMission)){
                return;
            };
            this.renderFunctionLink({
                sign:FunctionType.MultiMission,
                timeText:"",
                stopText:_arg1,
                runText:"",
                index:this.getFunctionLinkIndex(FunctionType.MultiMission),
                time:0
            });
            this.setFunctionLinkPoint();
        }
        public function renderFactionSealLink(_arg1:Boolean, _arg2:int, _arg3:int):void{
            if (!FunctionType.isOpened(FunctionType.Faction)){
                return;
            };
            var _local4:uint = ((_arg2 < _arg3)) ? 0xFF00 : 0xFFFFFF;
            var _local5:String = (_arg1) ? htmlFormat((((((functionLinkLang.FactionSeal + "(") + _arg2) + "/") + _arg3) + ")"), 12, _local4, false, true) : "";
            var _local6:Object = {
                sign:ActivityType.FactionSeal,
                timeText:"",
                stopText:_local5,
                runText:"",
                index:this.getFunctionLinkIndex(FunctionType.MultiMission),
                time:0
            };
            this.renderFunctionLink(_local6);
        }
        public function get miniMap():IMiniMap{
            return (this._miniMap);
        }
        private function initMiniMap():void{
            this._miniMap = this._toolbar.miniMap;
            this._miniMap.tip = _viewMgr.tip.iTip;
            this._miniMap.sublineVisible = false;
            this._miniMap.worldVisible = false;
            this._miniMap.settingVisible = false;
            this._miniMap.showVisible = false;
            this._miniMap.hideVisible = false;
            this._miniMap.sublineInfo = "";
            this._miniMap.onLine = _viewMgr.gameHelper.switchSelf;
            this._miniMap.onWorld = _viewMgr.world.switchSelf;
            this._miniMap.onSetting = _viewMgr.setting.switchSelf;
            var _local1:Sprite = this._miniMap.content;
            if (_local1.parent){
                _local1.parent.removeChild(_local1);
            };
        }
        public function set questTraceVisible(_arg1:Boolean):void{
            this._toolbar.questTraceVisible = _arg1;
            this._lastTraceVisible = _arg1;
        }
        public function get questTraceVisible():Boolean{
            return (this._toolbar.questTraceVisible);
        }
        private function set tempTraceVisible(_arg1:Boolean):void{
            this._toolbar.questTraceVisible = _arg1;
        }
        private function restoreTraceVisible():void{
            this._toolbar.questTraceVisible = this._lastTraceVisible;
        }
        public function set questTraceTipVisible(_arg1:Boolean):void{
            this._toolbar.questTraceTipVisible = _arg1;
        }
        private function questTrace():void{
            this.questTraceVisible = true;
            this._toolbar.questTraceLink = function (_arg1:String):void{
                if (_viewMgr.campWar.inStageWithTip){
                    return;
                };
                if (_viewMgr.heroesWar.inStageWithTip){
                    return;
                };
                if (_viewMgr.multiMission.isMinimumWithTip){
                    return;
                };
                if (_viewMgr.zodiac.inStageWithTip){
                    return;
                };
                _viewMgr.quest.wayFinding(_arg1);
            };
        }
        public function get questTraceContent():Sprite{
            return (this._toolbar.questTraceContent);
        }
        public function loadQuestTrace():void{
            _data.call(Mod_Quest_Base.town_quest_show, this.renderQuestTrace, []);
        }
        public function renderQuestTrace():void{
            if (_ctrl.quest.townQuestData == null){
                return;
            };
            this._toolbar.renderQuestTrace(_ctrl.quest.townQuest);
            this.renderQuestStatus();
        }
        private function renderQuestStatus():void{
            var _local1:Object = _ctrl.quest.relatedNPC;
            _viewMgr.townMap.resetNPCHead(_local1);
            _viewMgr.guide.open();
            this.showFreeMedicalTip();
            this.questTraceVisible = true;
            this.questTraceTipVisible = _viewMgr.townMap.inStage;
        }
        public function loadQuestTraceInTown():void{
            if (true == this._first){
                this._first = false;
                this.loadQuestTrace();
            } else {
                this.renderQuestStatus();
            };
        }
        private function chat():void{
            this._viewMgr.chat.show();
        }
        public function set chatVisible(_arg1:Boolean):void{
            this._viewMgr.chat.chatVisible = _arg1;
        }
        public function receiveTown(_arg1:String, _arg2:Boolean=true, _arg3:int=99):void{
            this._viewMgr.chat.receive(_arg1, _arg2, _arg3);
        }
        public function onTextLink(_arg1):void{
            var _local6:int;
            var _local7:int;
            var _local8:int;
            var _local9:int;
            var _local10:int;
            var _local11:int;
            var _local12:int;
            var _local13:int;
            var _local14:int;
            var _local2:String = ((_arg1 is TextEvent)) ? _arg1.text : String(_arg1);
            var _local3:Array = _local2.split("_");
            var _local4:String = _local3[0];
            var _local5:int = _local3[1];
            switch (_local4){
                case TextLinkType.Player:
                    setTimeout(this.showPlayerInfo, 50, _local5, String(_local3[2]), ((_local3[3]) || ("")));
                    break;
                case TextLinkType.Item:
                    setTimeout(this.showItemInfo, 50, int(_local3[1]), int(_local3[2]), int(_local3[3]), int(_local3[4]), _local3[5]);
                    break;
                case TextLinkType.SeeMsg:
                    this._viewMgr.otherRoleMsg.init(_local5, _local3[2]);
                    this._viewMgr.otherRoleMsg.show();
                    break;
                case TextLinkType.AddFocus:
                    this._viewMgr.friendList.addFriend(String(_local3[2]));
                    break;
                case TextLinkType.Fate:
                    _local6 = _local3[1];
                    setTimeout(this.showFateInfo, 50, _local6);
                    break;
                case TextLinkType.ViewReport:
                    this._viewMgr.war.formatReportUrl(_local3.slice(1));
                    break;
                case TextLinkType.Gag:
                    this._viewMgr.chat.disableTalkPlayer(_local5, _local3[2]);
                    break;
                case TextLinkType.Shield:
                    this._viewMgr.chat.isShieldPlayerTalk(_local5, _local3[2]);
                    break;
                case TextLinkType.PM:
                    this._viewMgr.friendChat.get_friendinfo_chatrecord_list(_local5);
                    break;
                case TextLinkType.PK:
                    if (this._viewMgr.factionWarMap.inStageWithTip){
                        return;
                    };
                    this._viewMgr.pkWar.defenderPlayerId = _local5;
                    this._viewMgr.pkWar.show();
                    break;
                case TextLinkType.CopyName:
                    Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, _local3[2]);
                    this._viewMgr.showTip(Lang.sprintf(chatLang.CopySuccess, _local3[2]), "", TipType.Success);
                    break;
                case TextLinkType.SendFlower:
                    this._viewMgr.sendFlower.sendPlayerID = _local5;
                    this._viewMgr.sendFlower.show();
                    break;
                case TextLinkType.soul:
                    _local7 = _local3[1];
                    _local8 = _local3[2];
                    _local9 = _local3[3];
                    _local10 = _local3[4];
                    _local11 = _local3[5];
                    _local12 = _local3[6];
                    _local13 = _local3[7];
                    setTimeout(this.showSoulInfo, 50, _local7, _local8, _local9, _local10, _local11, _local12, _local13);
                    break;
                case TextLinkType.Achievement:
                    _local14 = _local3[1];
                    this._viewMgr.achievement.gotoAchievementLabel(_local14);
            };
        }
        private function showPlayerInfo(_arg1:int, _arg2:String, _arg3:String):void{
            if (_arg1 == this._ctrl.player.playerId){
                return;
            };
            var _local4:Array = [chatLang.CopyData];
            var _local5:Array = [[TextLinkType.SeeMsg, _arg1].join("_")];
            if (FunctionType.isOpened(FunctionType.Friend)){
                _local4.push(chatLang.AddAttention, chatLang.SendTalk);
                _local5.push([TextLinkType.AddFocus, _arg1, _arg2].join("_"), [TextLinkType.PM, _arg1, _arg2].join("_"));
            };
            if (this._ctrl.player.isAdvancedTester == true){
                _local4.push(chatLang.Gag);
                _local5.push([TextLinkType.Gag, _arg1, _arg2].join("_"));
            };
            _local4.push(chatLang.ShieldTalk, chatLang.CopyName);
            _local5.push([TextLinkType.Shield, _arg1, _arg2].join("_"), [TextLinkType.CopyName, _arg1, _arg2].join("_"));
            if (FunctionType.isOpened(FunctionType.SendFlower)){
                _local4.push(chatLang.SendFlower);
                _local5.push([TextLinkType.SendFlower, _arg1, _arg2].join("_"));
            };
            var _local6:ClickTipList = new ClickTipList(_local4, _local5, this.onTextLink);
            this._viewMgr.tip.iTip.clickToOpen(_local6);
        }
        private function showItemInfo(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:String):void{
            var _local6:ItemInfo = new ItemInfo();
            _local6.parseSee(_arg1, _arg2);
            _local6.playerItemId = _arg3;
            _local6.goldId = _arg4;
            _arg5 = ((_arg5) || (""));
            var _local7:Sprite = _local6.getTipsSprite1("", ((_arg5)=="") ? "" : (chatLang.Owner + _arg5));
            this._viewMgr.tip.iTip.clickToOpen(_local7);
        }
        private function showFateInfo(_arg1:int):void{
            if (this._fateTipSprite == null){
                this._fateTipSprite = new FateTipSprite();
                this._fateTipSprite.tip = this._viewMgr.tip.iTip;
            };
            this._fateTipSprite.getFateId = _arg1;
            this._fateTipSprite.target = this._toolbar.content;
        }
        private function showSoulInfo(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:int, _arg6:int, _arg7:int):void{
            var _local17:int;
            var _local18:int;
            var _local19:int;
            var _local8:String = SoulType.getSoulName(_arg1);
            var _local9:int = SoulType.getSoulQualityId(_arg1);
            var _local10:uint = SoulType.getQualityColor(_local9);
            var _local11:int = SoulType.getSoulSubTypeId(_arg1);
            var _local12:int = SoulType.getSoulTypeIdByAllTypeId(_local11);
            var _local13:String = SoulType.getJobNameToTypeId(_local12);
            var _local14:String = URI.getSoulsIconUrl(_arg1);
            var _local15 = "";
            var _local16:Object = {};
            if (this._soulTipSprite == null){
                this._soulTipSprite = new SoulTipSprite();
            } else {
                this._soulTipSprite.ischange = true;
            };
            this._soulTipSprite.iconUrl = _local14;
            this._soulTipSprite.star1 = 0;
            this._soulTipSprite.star2 = 0;
            this._soulTipSprite.star3 = 0;
            if (_arg2 != 0){
                _local16 = this._ctrl.sealSoul.renderLocationList(_arg2, _local9, _arg5);
                _local15 = (_local15 + (HtmlText.format(((_local16.name + " +") + _local16.valueInfo), _local16.color) + "\n"));
                _local17 = SoulType.getQualityForIDValue(_arg2, _local9, _arg5);
                this._soulTipSprite.star1 = _local17;
            };
            if (_arg3 != 0){
                _local16 = this._ctrl.sealSoul.renderLocationList(_arg3, _local9, _arg6);
                _local15 = (_local15 + (HtmlText.format(((_local16.name + " +") + _local16.valueInfo), _local16.color) + "\n"));
                _local18 = SoulType.getQualityForIDValue(_arg3, _local9, _arg6);
                this._soulTipSprite.star2 = _local18;
            };
            if (_arg4 != 0){
                _local16 = this._ctrl.sealSoul.renderLocationList(_arg4, _local9, _arg7);
                _local15 = (_local15 + (HtmlText.format(((_local16.name + " +") + _local16.valueInfo), _local16.color) + "\n"));
                _local19 = SoulType.getQualityForIDValue(_arg4, _local9, _arg7);
                this._soulTipSprite.star3 = _local19;
            };
            _local15 = (_local15 + HtmlText.white((Lang.sprintf(chatLang.EquipRequire, _local13) + _local13)));
            this._soulTipSprite.nameHtml = HtmlText.format(_local8, _local10);
            this._soulTipSprite.desHtml = "";
            this._soulTipSprite.addHtml = _local15;
            this._viewMgr.tip.iTip.clickToOpen(this._soulTipSprite);
        }
        private function functionBar():void{
            this._toolbar.onBody = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.roleMsg.switchSelf();
            };
            this._toolbar.onPack = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.pack.switchSelf();
            };
            this._toolbar.onUpgrade = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.upgrade.switchSelf();
            };
            this._toolbar.onDeploy = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.deploy.switchSelf();
            };
            this._toolbar.onResearch = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.research.switchSelf();
            };
            this._toolbar.onFate = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.fate.switchSelf();
            };
            this._toolbar.onSealSoul = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.sealSoul.switchSelf();
            };
            this._toolbar.onFarm = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.farm.switchSelf();
            };
            this._toolbar.onQuest = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.quest.switchSelf();
            };
            this._toolbar.onFriend = function ():void{
                SoundEffect.play(SoundEffect.Button);
                if (_viewMgr.friendMessage.isShowMostBox){
                    _viewMgr.friendMessage.clear();
                } else {
                    _viewMgr.friendMessage.message_box_list();
                };
            };
            this._toolbar.onFaction = function ():void{
                SoundEffect.play(SoundEffect.Button);
                _viewMgr.myFaction.switchSelf();
            };
            this._toolbar.onPractice = function ():void{
                SoundEffect.play(SoundEffect.Button);
                switchPractice();
            };
            this.renderFunctionBar();
            this.bubble();
            this.updateExperience();
        }
        public function set functionBarParent(_arg1:Sprite):void{
            this._toolbar.functionBarParent = _arg1;
        }
        public function switchPractice():void{
            if (this._ctrl.player.playerInfo.practice == Mod_Town_Base.ON_PRACTICE){
                this.closePractice();
            } else {
                if (this._viewMgr.factionWarMap.isFactionWarStart == true){
                    return;
                };
                this.startPractice();
            };
        }
        private function renderFunctionBar():void{
            this._toolbar.newFunctionBar(FunctionType.DefaultList, FunctionType.DefaultList);
            this.get_player_function();
        }
        private function get_player_function():void{
            this._data.call(Mod_Player_Base.get_player_function, this.getPlayerFunctionCallback, []);
        }
        private function getPlayerFunctionCallback(_arg1:Boolean=false):void{
            var downOldList:* = null;
            var downNewList:* = null;
            var sign:* = null;
            var index:* = 0;
            var newAddedIds:* = null;
            var newAddedSigns:* = null;
            var item:* = null;
            var id:* = null;
            var trigger:Boolean = _arg1;
            var list:* = this._ctrl.player.functionList;
            var upList:* = [];
            downOldList = [];
            downNewList = [];
            this.checkHasManual(list);
            FunctionType.updateOpenedList(list);
            for each (sign in FunctionType.DefaultList) {
                index = FunctionType.functionIndex(sign);
                downOldList[index] = sign;
                downNewList[index] = sign;
            };
            newAddedIds = [];
            newAddedSigns = [];
            for each (item in list) {
                sign = FunctionType.sign(item["id"]);
                index = FunctionType.functionIndex(sign);
                if ((((false == trigger)) && (((this.isDeploy(sign)) || (this.isFate(sign)))))){
                } else {
                    if (index > -1){
                        if (1 == item["isPlayed"]){
                            downOldList[index] = sign;
                        };
                        downNewList[index] = sign;
                    } else {
                        upList.push(sign);
                    };
                    if (0 == item["isPlayed"]){
                        item["isPlayed"] = 1;
                        newAddedIds.push(item["id"]);
                        if ((((sign == FunctionType.Robot)) && ((VIPType.check(VIPType.Level5) == false)))){
                        } else {
                            if (FunctionType.isIgnoreTip(sign) == false){
                                if (index == -1){
                                    newAddedSigns.push(sign);
                                } else {
                                    newAddedSigns.unshift(sign);
                                };
                            };
                        };
                    };
                };
            };
            this.removeUndefined(downOldList);
            this.removeUndefined(downNewList);
            this._toolbar.newFunctionBar(downOldList, downOldList);
            if (newAddedSigns.length > 0){
                if (downNewList.length > downOldList.length){
                    _viewMgr.triggerFunction.onStart = function ():void{
                        _toolbar.newFunctionBar(downOldList, downNewList);
                        _viewMgr.triggerFunction.onStart = null;
                    };
                    this._toolbar.onEnd = function ():void{
                        _toolbar.updatePackMessageXY();
                        _viewMgr.guide.stopPartnersGuide();
                        _viewMgr.guide.startUpgradeGuides();
                        _viewMgr.guide.startDeployGuides();
                        _viewMgr.guide.startFateLodgeGuide();
                    };
                };
                _viewMgr.triggerFunction.triggerList(newAddedSigns);
                _viewMgr.triggerFunction.switchSelf();
            };
            this.updateFunction();
            this.openOtherFunction(upList);
            for each (id in newAddedIds) {
                this._data.call(Mod_Player_Base.sign_play_player_function, null, [parseInt(id)]);
                switch (FunctionType.sign(parseInt(id))){
                    case FunctionType.Medical:
                        _ctrl.player.freeMedicalEnabled = true;
                        this.showFreeMedicalTip();
                        break;
                    case FunctionType.LuckyShop:
                        _viewMgr.processTip.open(ProcessTipsType.LuckyShop);
                        break;
                };
            };
        }
        private function updateFunction():void{
            this.showFunctionLink();
            this._toolbar.updatePackMessageXY();
            _viewMgr.chat.chatOpenFunction();
            if (FunctionType.isOpened(FunctionType.Friend)){
                this._data.patch(Mod_Friend_Base.get_unreceive_friend_list, this.unreceiveMsg);
                this._data.call(Mod_Friend_Base.get_unreceive_friend_list, this.unreceiveMsg, []);
            };
            if (FunctionType.isOpened(FunctionType.Faction)){
                this._viewMgr.chat.isOpenFaction = true;
                this.get_faction_level();
                this._viewMgr.activities.factionWarInit();
            } else {
                this._viewMgr.chat.isOpenFaction = false;
            };
            if (FunctionType.isOpened(FunctionType.MultiMission)){
                this._viewMgr.activities.openActivity(TownType.All);
                this._viewMgr.activities.openActivity(TownType.MultiMission);
                this._viewMgr.chat.isOpenActivity = true;
            };
            if (FunctionType.isOpened(FunctionType.Farm)){
                this._data.patch(Mod_Farm_Base.get_simple_farmlandinfo, _viewMgr.farm.getSimpleFarmlandinfoCallBack);
            };
            if (FunctionType.isOpened(FunctionType.TakeBible)){
                this._viewMgr.takeBibleRoad.get_rulai_open_time();
            };
            if (FunctionType.isOpened(FunctionType.Friend)){
                this._viewMgr.friendMessage.show();
            };
            if (FunctionType.isOpened(FunctionType.RollCake)){
                this._data.call(Mod_Player_Base.update_player_data, null, [Mod_Player_Base.STATE_POINT]);
            };
            if (FunctionType.isOpened(FunctionType.TakeBible)){
                this.takeBibleInfo();
            };
        }
        private function openOtherFunction(_arg1:Array):void{
            var _local2:String;
            for each (_local2 in _arg1) {
                switch (_local2){
                    case FunctionType.World:
                        this._miniMap.sublineVisible = true;
                        this._miniMap.worldVisible = true;
                        this._miniMap.hideVisible = true;
                        this._miniMap.settingVisible = true;
                        this._data.call(Mod_Item_Base.has_level_gift_item, null, []);
                        break;
                    case FunctionType.MultiMission:
                        this._viewMgr.activities.openActivity(TownType.MultiMission);
                        break;
                    case FunctionType.DailyQuest:
                        this._viewMgr.activities.openActivity(FunctionType.DailyQuest);
                        break;
                    case FunctionType.SuperSport:
                        this.patchNotifyGlobal();
                        this._viewMgr.activities.openActivity(FunctionType.SuperSport);
                        break;
                    case FunctionType.OfflineExp:
                        this._viewMgr.activities.openActivity(TownType.OfflineExp);
                        break;
                    case FunctionType.Rune:
                        this._viewMgr.rune.rune_list();
                        break;
                    case FunctionType.OnlineGift:
                        if (this._ctrl.player.onlineGiftTime > 0){
                            this._viewMgr.activities.openActivity(TownType.OnlineGift);
                        };
                        break;
                    case FunctionType.CampWar:
                        this._viewMgr.activities.openActivity(FunctionType.CampWar);
                        break;
                    case FunctionType.BuyPower:
                        this._toolbar.powerVisible = (((this._ctrl.player.power < 200)) && (VIPType.enabled));
                        this.updatePower();
                        break;
                    case FunctionType.WorldBoss:
                        this._viewMgr.activityWindow.get_world_boss_list();
                        break;
                    case FunctionType.TakeBible:
                        this._viewMgr.activities.openActivity(FunctionType.TakeBible);
                        break;
                    case FunctionType.Tower:
                        this._viewMgr.activities.addActivity(FunctionType.Tower);
                        break;
                    case FunctionType.RollCake:
                        this._viewMgr.rollCake.get_count();
                        break;
                    case FunctionType.GetPeach:
                        this.peach_info();
                        break;
                    case FunctionType.WorshipMars:
                        this._viewMgr.activities.openActivity(FunctionType.WorshipMars);
                        break;
                    case FunctionType.Zodiac:
                        this._viewMgr.activities.openActivity(FunctionType.Zodiac);
                        break;
                };
            };
        }
        public function peach_info():void{
            if (FunctionType.isOpened(FunctionType.GetPeach)){
                _data.call(Mod_GetPeach_Base.peach_info, this.peachInfoCallback, []);
            };
        }
        private function peachInfoCallback():void{
            var _local1:Object = this._ctrl.getPeach.peachInfo;
            if (_local1.peachNum <= 0){
                this._viewMgr.activities.removeActivity(FunctionType.GetPeach);
            } else {
                this._viewMgr.activities.addActivity(FunctionType.GetPeach);
            };
        }
        public function get_faction_level():void{
            this._data.patch(Mod_Faction_Base.get_faction_level, this.getFactionLevelCallBack);
            this._data.call(Mod_Faction_Base.get_faction_level, this.getFactionLevelCallBack, []);
        }
        private function getFactionLevelCallBack():void{
            var _local1:int = _ctrl.faction.getFactionLevel;
            ActivityType.FactionLevel = _local1;
            if ((((_local1 > 0)) && ((this._isOpenFactionActivity == false)))){
                this._viewMgr.activities.openActivity(ActivityType.FactionAll);
                this._isOpenFactionActivity = true;
                this._data.call(Mod_Faction_Base.is_can_join_activity, null, []);
                this._viewMgr.factionSeal.seal_satan_info();
                this._data.patch(Mod_Faction_Base.seal_satan_info, _viewMgr.factionSeal.sealSatanInfoCallBack);
                this._data.patch(Mod_Faction_Base.call_eat_detailed_info, _viewMgr.factionEat.callEatDetailedInfoCallBack);
            } else {
                if (((this._isOpenFactionActivity) && ((_local1 <= 0)))){
                    this._viewMgr.activities.removeActivity(ActivityType.FactionAll);
                    this._isOpenFactionActivity = false;
                };
            };
            this._viewMgr.factionBlessing.checkIncense();
            this._viewMgr.factionEat.checkFactionEat();
        }
        private function removeUndefined(_arg1:Array):void{
            var _local2:int = _arg1.length;
            var _local3:int = (_local2 - 1);
            while (_local3 > -1) {
                if (undefined == _arg1[_local3]){
                    _arg1.splice(_local3, 1);
                };
                _local3--;
            };
        }
        private function bubble():void{
            this._data.call(Mod_Player_Base.update_player_data, this.updatePlayerDataCallback, [Mod_Player_Base.PLAYER_PACK_EMPTY_NUM]);
        }
        private function unreceiveMsg():void{
            var _local4:int;
            var _local5:Boolean;
            var _local1:Array = this._ctrl.friend.getUnreceiveFriendList;
            if (_local1.length <= 0){
                this._viewMgr.friendMessage.clearList();
            };
            if ((((((_local1 == null)) || ((_local1.length <= 0)))) || (this._viewMgr.friendMessage.isShowMostBox))){
                this.friendMsg(0);
                return;
            };
            var _local2:int = _local1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _local1[_local3];
                _local5 = this._viewMgr.friendChat.checkPlayerId(_local4);
                if (_local5){
                    this._viewMgr.friendList.check_receive_message(_local4);
                    this._ctrl.friend.clearPlayerId = _local4;
                } else {
                    this.showChatId = _local4;
                };
                _local3++;
            };
            _local1 = this._ctrl.friend.getUnreceiveFriendList;
            _local2 = _local1.length;
            this.friendMsg(_local2);
        }
        public function friendMsg(_arg1:int):void{
            this._toolbar.switchBubble(_arg1);
        }
        public function playGoodsEffect(_arg1:String):void{
            var url:* = _arg1;
            var callback:* = function (_arg1:Array):void{
                var obj:* = null;
                var list:* = _arg1;
                var QuestGoods:* = list[1].getClassByName("QuestGoods");
                obj = new QuestGoods(list[0].bitmap.bitmapData);
                _toolbar.content.addChild((obj as MovieClip));
                var handler:* = function ():void{
                    var _local1:Point = _toolbar.getFunctionPoint(FunctionType.Pack);
                    obj.x = ((_local1.x - 67) - Structure.stageOffset.x);
                    obj.y = ((_local1.y - 147) - Structure.stageOffset.y);
                };
                handler();
                obj.onEnterFrame = handler;
                obj.gotoAndPlay(2);
            };
            File.loadList([url, (URI.addonsUrl + "quest_goods.swf")], callback);
        }
        private function takeBibleInfo():void{
            this._data.call(Mod_TakeBible_Base.take_bible_info, this.takeBibleInfoCallBack, []);
        }
        private function takeBibleInfoCallBack():void{
            this._viewMgr.takeBibleRoad.getRulaiOpenTimeCallBack();
        }
        private function checkHasManual(_arg1:Array):void{
            var _local2:Object;
            var _local3:int;
            var _local4:String;
            var _local5:int;
            for (_local2 in _arg1) {
                _local3 = _arg1[_local2]["id"];
                _local4 = FunctionType.sign(_local3);
                _local5 = _arg1[_local2]["isPlayed"];
                if ((((FunctionType.Deploy == _local4)) && ((0 == _local5)))){
                    this._hasDeploy = true;
                    break;
                };
                if ((((FunctionType.Fate == _local4)) && ((0 == _local5)))){
                    this._hasFate = true;
                    break;
                };
            };
        }
        private function isDeploy(_arg1:String):Boolean{
            return (((this._hasDeploy) && ((FunctionType.Deploy == _arg1))));
        }
        private function isFate(_arg1:String):Boolean{
            return (((this._hasFate) && ((FunctionType.Fate == _arg1))));
        }
        public function triggerDeploy():void{
            this.getPlayerFunctionCallback(true);
            this._hasDeploy = false;
        }
        public function triggerFate():void{
            this.getPlayerFunctionCallback(true);
            this._hasFate = false;
        }
        public function getFunctionPoint(_arg1:String):Point{
            var _local2:Point = this._toolbar.getFunctionPoint(_arg1);
            return (_local2);
        }
        private function keepAlive():void{
            this._viewMgr.consumeAlertSetting.loadSettingInfo();
            this._viewMgr.delayMessage.init();
            this._data.patch(Mod_Player_Base.update_player_data, this.updatePlayerDataCallback);
            this._data.patch(Mod_CampWar_Base.notify, this.campWarNotifyCallBack);
            this._data.patch(Mod_HeroesWar_Base.notify, this.heroesWarNotifyCallBack);
            this._data.patch(Mod_Notify_Base.mission_award, this.mission_award_back);
            this._data.patch(Mod_Notify_Base.pk_award, this.pkAwardCallBack);
            this._data.patch(Mod_Notify_Base.notify_get_good_fate, this.goodFateCallBack);
            this._data.patch(Mod_Notify_Base.complete_reel_production, this.completeReelProduction);
            this._data.patch(Mod_Notify_Base.role_num_notify, this.roleNumNotifyCallBack);
            this._data.patch(Mod_Notify_Base.new_research_notify, this.newResearchNotifyCallBack);
            this._data.patch(Mod_Notify_Base.new_partners_notify, this.newPartnersNotifyCallBack);
            this._data.patch(Mod_Notify_Base.buy_good_stuff_in_lucky_shop, this.buyGoodStuffInLuckyShopCallBack);
            this._data.patch(Mod_Notify_Base.player_take_bible, this.playerTakeBibleCallBack);
            this._data.patch(Mod_Notify_Base.player_take_bible_berobbed, this.playerTakeBibleBerobbedCallBack);
            this._data.patch(Mod_WorldBoss_Base.open_world_boss, this.open_world_boss_back);
            this._data.patch(Mod_WorldBoss_Base.close_world_boss, this.close_world_boss_back);
            this._data.patch(Mod_WorldBoss_Base.defeat_world_boss, this.defeat_world_boss_back);
            this._data.patch(Mod_Notify_Base.disband_faction_notify, this.disband_faction_notify_back);
            this._data.patch(Mod_Notify_Base.kickout_member_notify, this.kickout_member_notify_back);
            this._data.patch(Mod_Faction_Base.faction_message_notify, this.faction_message_notify_back);
            this._data.patch(Mod_FactionWar_Base.notify_good_faction_war_gift, this.notify_good_faction_war_gift_back);
            this._data.patch(Mod_FactionWar_Base.notify_faction_war_over, this.notify_faction_war_over_back);
            this._data.patch(Mod_FactionWar_Base.notify_give_faction_war_gift, this.notify_give_faction_war_gift_back);
            this._data.patch(Mod_Faction_Base.blessing_count_change, this.blessingCountChangeCallBack);
            this._data.patch(Mod_WorshipMars_Base.blessing_times_and_exp_add_notify, this.blessingCountAndExpAddNotifyCallBack);
            this._data.patch(Mod_Notify_Base.game_timer, this.server_time);
            this._data.call(Mod_Player_Base.update_player_data, null, [Mod_Player_Base.PLAYER_SKILL]);
            this._viewMgr.addToTimerProcessList((this.sign + Math.random()), this.hourlyRefresh);
            this._data.patch(Mod_Rune_Base.rune_use_notify, this.runeUseNotifyCallback);
            this._data.patch(Mod_TakeBible_Base.notify_global, this.takeBibleNotifyCallBack);
            this._data.patch(Mod_Notify_Base.send_flower, this.sendFlowerCallBack);
            this._data.patch(Mod_Notify_Base.pass_tower, this.pass_tower_back);
            this._data.patch(Mod_Notify_Base.update_rulai_status, this.rulaiStateCallBack);
            this._data.patch(Mod_Notify_Base.roll_cake, this.rollCakeCallBack);
            this._data.patch(Mod_Achievement_Base.notify_complete_achievement, this.notifyCompleteAchievementCallBack);
            this._viewMgr.dailyQuest.finish_all_day_quest();
            this._data.patch(Mod_Item_Base.notify_super_gift_items, this.notify_super_gift_items_back);
            this._data.patch(Mod_Notify_Base.server_war_winner, this.server_war_winner_back);
            this._data.patch(Mod_Notify_Base.world_war_top_login, this.world_war_top_login_back);
        }
        private function pass_tower_back():void{
            this._viewMgr.tower.updateNotice(this._ctrl.notify.passTowerMsg);
        }
        private function rollCakeCallBack():void{
            RollCakeType.loadData(function ():void{
                var _local1:Object = _ctrl.notify.rollCakInfo;
                _viewMgr.chat.receive(_local1.info, true);
            });
        }
        private function notify_super_gift_items_back():void{
            this._viewMgr.alert.confirm(this._ctrl.item.giftUseMsg);
        }
        private function server_war_winner_back():void{
            this._viewMgr.worldNotice.showMessage(this._ctrl.notify.serverWarWinnerMsg);
        }
        public function world_war_top_login_back():void{
            if (this._ctrl.notify.firstLoginWorld == ""){
                return;
            };
            this._viewMgr.worldNotice.showMessage(this._ctrl.notify.firstLoginWorld);
            this._viewMgr.chat.receive(this._ctrl.notify.firstLoginChat, true, Mod_Chat_Base.WORLD);
            this._ctrl.notify.firstLoginWorld = "";
        }
        public function rulaiStateCallBack():void{
            var _local1:Object;
            var _local2:Number;
            var _local3:int;
            var _local4:Object;
            if (FunctionType.isOpened(FunctionType.TakeBible)){
                _local1 = this._ctrl.notify.rulaiStatus;
                this._viewMgr.takeBibleRoad.rulaiType = _local1.type;
                switch (_local1.type){
                    case Mod_Notify_Base.RULAI_OPEN_FOR_CALL:
                        this.rulaiType(1);
                        _viewMgr.takeBibleReady.awardState = 0;
                        break;
                    case Mod_Notify_Base.RULAI_OPEN:
                        _local2 = ((_local1.isSelf == true)) ? 1 : 0.2;
                        this._viewMgr.takeBibleReady.awardState = _local2;
                        this.rulaiType(2);
                        break;
                    case Mod_Notify_Base.RULAI_CLOSE:
                        if (this._viewMgr.takeBibleReady.inStage){
                            _viewMgr.takeBibleReady.awardState = 0;
                            this._viewMgr.takeBibleReady.get_take_bible_info();
                        };
                        this.rulaiType(3);
                        _local3 = this._viewMgr.takeBibleRoad.getStartTime;
                        if (_local3 == 0){
                            _local4 = this._viewMgr.takeBibleRoad._rulaiStartTimeList[0];
                            _local3 = _local4.startTime;
                        };
                        _local1.time = _local3;
                        break;
                };
                if (this._viewMgr.takeBibleReady.inStage){
                    this._viewMgr.takeBibleReady.get_take_bible_info();
                };
                this._viewMgr.takeBibleRoad.getRuLaiData = _local1;
                this._viewMgr.takeBibleRoad.get_take_bible_updata_data();
                if (_local1.type == Mod_Notify_Base.RULAI_OPEN){
                    this._viewMgr.worldNotice.showMessage(_local1.info);
                };
            };
        }
        public function rulaiType(_arg1:int):void{
            var _local2:Boolean = VIPType.check(VIPType.Level5);
            switch (_arg1){
                case 1:
                    _viewMgr.activities.showActivityTitle(FunctionType.TakeBible, keepAliveLang.CanCall);
                    this._viewMgr.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit, false);
                    this._viewMgr.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.CanCall, false);
                    if (_local2 == false){
                        this._viewMgr.activities.hideActivityTimer(FunctionType.TakeBible, keepAliveLang.CanCall);
                    };
                    break;
                case 2:
                    if (this._ctrl.TakeBible.canTakeBibleTimes > 0){
                        this._viewMgr.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit, true);
                    } else {
                        this._viewMgr.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.CanCall, false);
                        this._viewMgr.activities.visibleBtnEffect(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit, false);
                    };
                    _viewMgr.activities.showActivityTitle(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit);
                    break;
                case 3:
                    _viewMgr.activities.showActivityTitle(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit);
                    this._viewMgr.activities.hideActivityTimer(FunctionType.TakeBible, keepAliveLang.RuLaiSpirit);
                    break;
            };
        }
        private function playerTakeBibleCallBack():void{
            var _local1:Object;
            if (FunctionType.isOpened(FunctionType.TakeBible)){
                _local1 = this._ctrl.notify.takeBible;
                this._viewMgr.worldNotice.showMessage(_local1.info);
            };
        }
        private function playerTakeBibleBerobbedCallBack():void{
            var _local1:Object;
            if (FunctionType.isOpened(FunctionType.TakeBible)){
                _local1 = this._ctrl.notify.takeBibleBerobbed;
                if (_local1.robPlayerNickname != this._ctrl.player.nickname){
                    this._viewMgr.worldNotice.showMessage(_local1.info);
                } else {
                    this._takeBibleData = _local1;
                };
            };
        }
        public function renderTakeBibleBerobbed():void{
            if (this._takeBibleData == null){
                return;
            };
            this._viewMgr.worldNotice.showMessage(this._takeBibleData.info);
            this._takeBibleData = null;
        }
        private function takeBibleNotifyCallBack():void{
            var data:* = this._ctrl.TakeBible.notifyGlobal;
            switch (data.type){
                case Mod_TakeBible_Base.BEROB:
                    if (this._viewMgr.inWar){
                        this._robList.push(data);
                        this._viewMgr.onWarClose = function ():void{
                            robShow();
                        };
                    } else {
                        this._viewMgr.takeBibleRoad.beRob = data;
                    };
                    break;
                case Mod_TakeBible_Base.PROTECT_BEROB:
                    if (this._viewMgr.inWar){
                        this._robList.push(data);
                        this._viewMgr.onWarClose = function ():void{
                            robShow();
                        };
                    } else {
                        this._viewMgr.takeBibleRoad.beRob = data;
                    };
                    break;
                case Mod_TakeBible_Base.APPLY_PROTECT:
                    this.applyProtectList();
                    break;
            };
        }
        public function robShow():void{
            var _local1:Object;
            if (this._robList.length > 0){
                _local1 = this._robList[0];
                switch (_local1.type){
                    case Mod_TakeBible_Base.BEROB:
                        this._viewMgr.takeBibleRoad.beRob = _local1;
                        break;
                    case Mod_TakeBible_Base.PROTECT_BEROB:
                        this._viewMgr.takeBibleRoad.protectRob = _local1;
                        break;
                };
                this._robList.splice(0, 1);
            };
        }
        private function applyProtectList():void{
            var _local4:Object;
            var _local5:String;
            var _local6:uint;
            var _local1:Array = this._ctrl.TakeBible.applyProtectList;
            var _local2:int = _local1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _local1[_local3];
                _local5 = Lang.sprintf(keepAliveLang.Invite, (("<【" + _local4.playerShowName) + "】&Y>"), _local4.protectName, _local4.protectAwardFame);
                _local6 = (AlertButtonType.Yes | AlertButtonType.No);
                this._viewMgr.delayMessage.addDelayMessage(DelayNotifyType.TakeBibleApplyProtect, _local5, _local6, this.applyProtectCallback(_local4));
                this._ctrl.TakeBible.removeApplyProtect(_local4.playerId);
                _local3++;
            };
        }
        private function applyProtectCallback(_arg1:Object):Function{
            var data:* = _arg1;
            var handler:* = function (_arg1:uint):void{
                if (AlertButtonType.Yes == _arg1){
                    _viewMgr.takeBibleReady.approve_apply(data.playerId);
                } else {
                    _viewMgr.takeBibleReady.reject_apply(data.playerId);
                };
            };
            return (handler);
        }
        private function faction_message_notify_back():void{
            var _local1:Object = this._ctrl.faction.factionMessage;
            this._viewMgr.chat.receive(_local1.info, false, Mod_Chat_Base.FACTION);
        }
        private function runeUseNotifyCallback():void{
            var _local1:Object = this._ctrl.rune.runeUseNotify;
            this._viewMgr.chat.addSystemMessage(Lang.sprintf(keepAliveLang.Rune, _local1.coins));
            this._viewMgr.rune.isBtnUser(_local1);
        }
        private function disband_faction_notify_back():void{
            this._viewMgr.townMap.quitJiHuiSuo();
            this._ctrl.player.playerInfo.factionId = 0;
            this._ctrl.player.playerInfo.factionName = "";
        }
        private function kickout_member_notify_back():void{
            this._viewMgr.townMap.quitJiHuiSuo();
            this._ctrl.player.playerInfo.factionId = 0;
            this._ctrl.player.playerInfo.factionName = "";
        }
        private function notify_faction_war_over_back():void{
            this._viewMgr.factionWarMap.showWorldNotice(this._ctrl.factionWarMap.overWorldMsg);
            var _local1:String = this._ctrl.factionWarMap.overChatMsg;
            if (_local1 != ""){
                this.receiveTown(_local1, true, Mod_Chat_Base.FACTION);
            };
        }
        private function notify_give_faction_war_gift_back():void{
            var _local2:String;
            var _local1:Array = this._ctrl.factionWarMap.chatFaction;
            for each (_local2 in _local1) {
                this.receiveTown(_local2, true, Mod_Chat_Base.FACTION);
            };
        }
        private function notify_good_faction_war_gift_back():void{
            var _local2:String;
            var _local1:Array = this._ctrl.factionWarMap.chatWorld;
            for each (_local2 in _local1) {
                this.receiveTown(_local2);
            };
            _local1 = this._ctrl.factionWarMap.chatFaction;
            for each (_local2 in _local1) {
                this.receiveTown(_local2, false, Mod_Chat_Base.FACTION);
            };
            _local1 = this._ctrl.factionWarMap.showWorld;
            for each (_local2 in _local1) {
                this._viewMgr.worldNotice.showMessage(_local2, 9);
            };
        }
        private function hourlyRefresh():void{
            var _local1:Number = this._viewMgr.ctrl.player.serverTime;
            var _local2:String = TimeChange.timerToNum(_local1);
            if (_local2 == "00:00"){
                this._viewMgr.rune.rune_list();
            };
        }
        private function completeReelProduction():void{
            var _local2:String;
            var _local1:Array = this._ctrl.notify.reelList;
            for each (_local2 in _local1) {
                this.receiveTown(_local2);
            };
        }
        public function patchNotifyGlobal():void{
            this._data.patch(Mod_SuperSport_Base.notify_global, this.notifyGlobalCallBack);
        }
        public function cancelPatchNotifyGlobal():void{
            this._data.cancelPatch(Mod_SuperSport_Base.notify_global);
        }
        private function open_world_boss_back():void{
            var _local1:String = this._ctrl.worldBossMap.notifyBoss.worldTips;
            if (_local1 != ""){
                this._viewMgr.worldNotice.showMessage(_local1);
            };
            var _local2:String = this._ctrl.worldBossMap.notifyBoss.chatTips;
            if (_local2 != ""){
                this.receiveTown(_local2, false, Mod_Chat_Base.FACTION);
            };
            this._viewMgr.activityWindow.get_world_boss_list();
            this._viewMgr.worldBossMap.updateBossOpen();
        }
        private function close_world_boss_back():void{
            var _local1:String = this._ctrl.worldBossMap.notifyBoss.chatTips;
            setTimeout(this.receiveTown, 5000, _local1);
            setTimeout(this.receiveTown, 30000, _local1);
            this._viewMgr.activityWindow.get_world_boss_list();
            this._viewMgr.worldBossMap.updateBossOver();
        }
        private function defeat_world_boss_back():void{
            var _local1:String = this._ctrl.worldBossMap.notifyBoss.chatTips;
            setTimeout(this.receiveTown, 5000, _local1);
            setTimeout(this.receiveTown, 30000, _local1);
            this._viewMgr.activityWindow.get_world_boss_list();
            this._viewMgr.worldBossMap.updateBossKill();
        }
        private function pkAwardCallBack():void{
            var _local1:String = this._ctrl.notify.pkAward;
            this.receiveTown(_local1);
        }
        private function goodFateCallBack():void{
            var _local1:String = this._ctrl.notify.getGoodFate;
            this.receiveTown(_local1);
        }
        public function notifyGlobalCallBack():void{
            var _local1:Object = this._ctrl.superSport.notifyGlobal;
            if (_local1.type == Mod_SuperSport_Base.AWARD_TOP){
                this.receiveTown(_local1.info);
            } else {
                if (this._viewMgr.superSport.startChallenge){
                    this._showMessageList.push(_local1);
                } else {
                    this.hasGlobalShow(_local1);
                };
            };
        }
        public function saveNotifyGlobal():void{
            var _local3:Object;
            var _local1:int = this._showMessageList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._showMessageList[_local2];
                this.hasGlobalShow(_local3);
                _local2++;
            };
            this._showMessageList = [];
        }
        private function hasGlobalShow(_arg1:Object):void{
            if (_arg1.type == Mod_SuperSport_Base.WIN_TOP){
                if (_arg1.winTimesTop >= 5){
                    this.sendGlobalShow(_arg1);
                };
            } else {
                if (_arg1.type == Mod_SuperSport_Base.KILL_WIN_TOP){
                    if (_arg1.timesTop >= 5){
                        this.sendGlobalShow(_arg1);
                    };
                } else {
                    this.sendGlobalShow(_arg1);
                };
            };
        }
        private function sendGlobalShow(_arg1:Object):void{
            this._viewMgr.worldNotice.showMessage(_arg1.worldInfo);
            this._viewMgr.superSport.changeNotife(_arg1.info);
        }
        private function mission_award_back():void{
            var _local2:Array;
            var _local3:int;
            var _local1:Array = this._ctrl.notify.missionAwardList;
            for each (_local2 in _local1) {
                _local3 = _local2.shift();
                if ((((_local3 == this._ctrl.player.playerId)) && ((this._viewMgr.war.requested == true)))){
                    this.thisAwardList = this.thisAwardList.concat(_local2);
                    this._viewMgr.delayExecute(DelayType.MissionAward, this.mission_award_back);
                } else {
                    while (_local2.length) {
                        this.receiveTown(_local2.pop());
                    };
                };
            };
            if (this._viewMgr.war.requested == false){
                while (this.thisAwardList.length) {
                    this.receiveTown(this.thisAwardList.pop());
                };
            };
        }
        private function updatePlayerDataCallback():void{
            var change:* = 0;
            var str:* = null;
            var control:* = this._ctrl.player;
            if (control.isChanged(Mod_Player_Base.PLAYER_COINS)){
                this.updateCoins();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_INGOT)){
                this.updateIngot();
            };
            if (((control.isChanged(Mod_Player_Base.PLAYER_HEALTH)) || (control.isChanged(Mod_Player_Base.PLAYER_MAX_HEALTH)))){
                this.updateHealth();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_POWER)){
                this.updatePower();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_EXPERIENCE)){
                this.updateExperience();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_TOWN_KEY)){
                this._viewMgr.heroMission.changeTownKey();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_PACK_EMPTY_NUM)){
                this._viewMgr.missionPractice.pickNum = control.packNum;
                if (control.packNum == 0){
                    this._toolbar.addPackFull();
                } else {
                    this._toolbar.removePackFull();
                };
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_LEVEL)){
                this.updateLevel();
            };
            this.partnerUpgrade();
            if (control.isChanged(Mod_Player_Base.PLAYER_TRANSPORT)){
                this._viewMgr.missionMap.updatePlayerBody();
                this.updateMountsBuffer();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_AVATAR)){
                this._viewMgr.missionMap.updatePlayerBody();
                this.updateAvatarBuffer();
            };
            if (((control.isChanged(Mod_Player_Base.PLAYER_INIT_MEDICAL)) || (control.isChanged(Mod_Player_Base.PLAYER_MEDICAL)))){
                this.updateMedicalBuffer();
            };
            this.updateExtraPower();
            if (control.hasNewFunction){
                control.hasNewFunction = false;
                this.delayOpenFunction();
            };
            if (control.hasQuestState){
                control.hasQuestState = false;
                this.delayLoadQuestTrace();
            };
            if (control.isChanged(Mod_Player_Base.HEALTH_UP_SYS)){
                this._viewMgr.delayExecute(DelayType.HealthUpdateMessage, function ():void{
                    _viewMgr.chat.addSystemMessage(keepAliveLang.HealthFull);
                });
            };
            if (control.isChanged(Mod_Player_Base.HEALTH_UP_MEDICAL)){
                this.updateMedicalNum();
            };
            if (control.isChanged(Mod_Player_Base.HEALTH_UP_MEDICAL_EMPTY)){
                this.updateMedicalEmpty();
                this.updateMedicalBuffer();
            };
            if (control.isChanged(Mod_Player_Base.GET_ONLINE_GIFT)){
                this._viewMgr.activities.onlineGiftActivity();
            };
            if (control.isChanged(Mod_Player_Base.CAMP_SALARY)){
                if (this._ctrl.player.campSalaryEnabled){
                    this._viewMgr.activities.openActivity(TownType.CampSalary);
                    this._viewMgr.activities.addCampSalaryActivityTip();
                } else {
                    this._viewMgr.activities.removeActivity(TownType.CampSalary);
                };
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_DAY_QUEST)){
                if (this._ctrl.player.dayQuestState == 1){
                    this._viewMgr.activities.showActivityTitle(FunctionType.DailyQuest, keepAliveLang.CanComplete);
                    this._viewMgr.activities.visibleBtnEffect(FunctionType.DailyQuest, FunctionType.DailyQuest, true);
                } else {
                    if (this._ctrl.player.dayQuestState == 0){
                        this._viewMgr.activities.hideActivityTimer(FunctionType.DailyQuest, keepAliveLang.CanComplete);
                        this._viewMgr.activities.visibleBtnEffect(FunctionType.DailyQuest, FunctionType.DailyQuest, false);
                    };
                };
            };
            if (control.isChanged(Mod_Player_Base.FINISH_DAY_QUEST)){
                if (this._ctrl.player.finishDayQuest == 1){
                    this._viewMgr.activities.removeActivity(FunctionType.DailyQuest);
                } else {
                    if (this._ctrl.player.finishDayQuest == 0){
                        this._viewMgr.activities.addActivity(FunctionType.DailyQuest);
                    };
                };
            };
            if (control.isChanged(Mod_Player_Base.CAN_INCENSE_COUNT)){
                this._viewMgr.factionBlessing.checkIncense();
            };
            this.showFreeMedicalTip();
            if (control.isChanged(Mod_Player_Base.VIP_LEVEL)){
                if (FunctionType.isOpened(FunctionType.Rune)){
                    this._viewMgr.rune.rune_list();
                };
                if (FunctionType.isOpened(FunctionType.EquipUpgradeQueue)){
                    this.getFunctionLink(FunctionType.Upgrade);
                };
                this.checkRechargeVisible();
                this.updatePower();
            };
            if (control.isChanged(Mod_Player_Base.PLAYER_SKILL)){
                this._viewMgr.campWar.updateSkill(this._ctrl.player.skill);
                this._viewMgr.heroesWar.updateSkill(this._ctrl.player.skill);
                change = this._ctrl.player.skillChange;
                if (change > 0){
                    str = (("+" + change) + keepAliveLang.Skill);
                    this.showPlayerTextEffect(str, 0xFF6600);
                };
            };
            if (control.isChanged(Mod_Player_Base.FAME)){
                change = this._ctrl.player.fameChange;
                if (change > 0){
                    str = (("+" + change) + keepAliveLang.Fame);
                    this.showPlayerTextEffect(str, 0xEEEEEE);
                };
            };
            if (control.isChanged(Mod_Player_Base.STATE_POINT)){
                this.updateStatePoint();
            };
            this.vipLevel = control.vipLevel;
            this._viewMgr.processTip.checkOpenGift();
        }
        private function updateMedicalEmpty():void{
            if (this._viewMgr.war.requested == true){
                this._viewMgr.delayExecute(DelayType.HealthUpdateMessage, this.updateMedicalEmpty);
            } else {
                this._viewMgr.chat.addSystemMessage(keepAliveLang.MedicalEmpty);
                this._viewMgr.processTip.checkHasMedical();
            };
        }
        private function updateMedicalNum():void{
            if (this._viewMgr.war.requested == true){
                this._viewMgr.delayExecute(DelayType.HealthUpdateMessage, this.updateMedicalNum);
            } else {
                this._viewMgr.chat.addSystemMessage(keepAliveLang.MedicalFullHealth);
                this._viewMgr.processTip.removeType(ProcessTipsType.HasMedical);
                this._viewMgr.processTip.removeType(ProcessTipsType.NotMedical);
            };
        }
        private function updateCoins():void{
            var _local2:String;
            this._toolbar.coins = this._ctrl.player.coins;
            this._viewMgr.superSport.renderCoins = this._ctrl.player.coins;
            this._viewMgr.lodge.renderCoins = this._ctrl.player.coins;
            this._viewMgr.upgrade.updateCoins = this._ctrl.player.coins;
            this._viewMgr.takeBibleRoad.renderCoins = this._ctrl.player.coins;
            this._viewMgr.serverWarCup.renderCoins = this._ctrl.player.coins;
            var _local1:Number = this._ctrl.player.coinChange;
            if (_local1 > 0){
                _local2 = (("+" + _local1) + keepAliveLang.Coin);
                this.showPlayerTextEffect(_local2, 0xEEEEEE);
            };
        }
        private function updateIngot():void{
            var _local2:String;
            this._toolbar.ingot = this._ctrl.player.ingot;
            this._viewMgr.superSport.renderIngot = this._ctrl.player.ingot;
            this._viewMgr.lodge.renderIngot = this._ctrl.player.ingot;
            this._viewMgr.takeBibleRoad.renderIngot = this._ctrl.player.ingot;
            this._viewMgr.serverWarCup.renderIngot = this._ctrl.player.ingot;
            var _local1:int = this._ctrl.player.ingotChange;
            if (_local1 > 0){
                _local2 = (("+" + _local1) + keepAliveLang.Ingot);
                this.showPlayerTextEffect(_local2, 0xFFF200);
            };
        }
        private function updateStatePoint():void{
            this._viewMgr.goldOilShop.updateStatePoint();
        }
        private function showPlayerTextEffect(_arg1:String, _arg2:uint):void{
            if (this._viewMgr.screen.currentMap != null){
                this._viewMgr.screen.currentMap.showTextEffect(_arg1, _arg2);
            };
        }
        private function updateHealth():void{
            var _local1:int = this._ctrl.player.health;
            var _local2:int = this._ctrl.player.maxHealth;
            if (true == this._blockedHealth){
                this._toolbar.health(_local2, _local2);
                return;
            };
            if (this._viewMgr.war.requested == true){
                this._viewMgr.delayExecute(DelayType.UpdateHealth, this.updateHealth);
            } else {
                if (_local1 > _local2){
                    Helper.alert(keepAliveLang.Health, _local1, keepAliveLang.MaxHealth, _local2, keepAliveLang.CheckReturn);
                    _local1 = _local2;
                };
                this._toolbar.health(_local1, _local2);
            };
        }
        public function blockHealthInCampWar():void{
            this._blockedHealth = true;
            this.updateHealth();
        }
        public function unblockHealthInCampWar():void{
            this._blockedHealth = false;
            this.updateHealth();
        }
        private function updatePower():void{
            var _local3:String;
            var _local1:int = this._ctrl.player.power;
            this._data.call(Mod_Player_Base.get_buy_power_data, this.buyPowerDataCallBack, []);
            this._toolbar.powerVisible = ((((FunctionType.isOpened(FunctionType.BuyPower)) && ((_local1 < 200)))) && (VIPType.enabled));
            if (_local1 < 5){
                this._viewMgr.processTip.openPracticeTip();
            } else {
                this._viewMgr.processTip.removeType(ProcessTipsType.Practice);
            };
            this._viewMgr.gameHelper.updateGameAssistant();
            this._viewMgr.missionPractice.upDataPower = _local1;
            this._viewMgr.heroPractice.upDataPower = _local1;
            this._toolbar.power(_local1, ((_local1 > 200)) ? _local1 : 200);
            var _local2:int = (_local1 - this._oldPower);
            if (_local2 > 0){
                this._viewMgr.chat.addSystemMessage(Lang.sprintf(keepAliveLang.GetPower, _local2));
                _local3 = (("+" + _local2) + keepAliveLang.Power);
                this.showPlayerTextEffect(_local3, 2552101);
            };
            this._oldPower = _local1;
        }
        private function buyPowerDataCallBack():void{
            var _local1:Object = this._ctrl.player.buyPowerData;
            this._toolbar.powerInfo = _local1;
            this._viewMgr.missionPractice.getLostPowerNum = _local1.buyNum;
            this._viewMgr.heroPractice.getLostPowerNum = _local1.buyNum;
        }
        public function showFreeMedicalTip():void{
            if (FunctionType.isOpened(FunctionType.Medical) == false){
                return;
            };
            if (_viewMgr.townMap.inStage == false){
                return;
            };
            var handler:* = function ():void{
                var _local1:int = TownType.getTownNPCIdByFunc(_ctrl.player.mapId, NPCType.ItemShopNPC);
                if (_local1){
                    _viewMgr.townMap.setNpcGetVisible(_local1, _ctrl.player.freeMedicalEnabled);
                };
            };
            _data.call(Mod_Item_Base.player_free_medical_info, handler, []);
        }
        public function checkWarCdTime(_arg1:Function):void{
            var callback:* = _arg1;
            var handle:* = function ():void{
                var _local1:Object = _ctrl.player.hasWarCdTime;
                if (_local1.hasWarTime){
                    _viewMgr.tip2.showHackToolsTip(_local1.cdTimer);
                };
                callback(_local1.hasWarTime);
            };
            this._data.call(Mod_Player_Base.get_player_war_cd_time, handle, []);
        }
        private function buyGoodStuffInLuckyShopCallBack():void{
            var _local1:Object = this._ctrl.notify.getBuyGoodStuffInLuckyShop();
            this._viewMgr.chat.addSystemMessage((_local1["chat"] as String));
        }
        private function blessingCountChangeCallBack():void{
            this._viewMgr.factionBlessing.getBlessingCount();
        }
        private function blessingCountAndExpAddNotifyCallBack():void{
            this._viewMgr.worshipMars.getBlessingTimesAndExpAdd();
        }
        private function gameTimerCallBack():void{
            var callBack:* = null;
            callBack = function ():void{
                if (_viewMgr.factionWindow.inStage){
                    _viewMgr.factionEat.call_eat_info();
                    _viewMgr.factionSeal.seal_satan_info();
                } else {
                    if (_viewMgr.factionSeal.inStage){
                        _viewMgr.factionSeal.seal_satan_member_list();
                        _viewMgr.factionSeal.seal_satan_info();
                    };
                };
            };
            if (this._ctrl.notify.gameTimer["timer_type"] == Mod_Notify_Base.FACTION){
                this._data.call(Mod_Faction_Base.is_can_join_activity, callBack, []);
            };
            if (this._ctrl.notify.gameTimer["timer_type"] == Mod_Notify_Base.CHANGE_MONEY){
                this._viewMgr.rune.rune_list();
            };
            this._viewMgr.rollCake.get_count();
            this._viewMgr.activities.redEnvelopes();
            this.peach_info();
            this._viewMgr.farm.getFarmlandinfoList();
            this._viewMgr.worshipMars.getRemainIncenseTimes();
            this._viewMgr.travelEvent.get_activity_info();
            this._viewMgr.sendFlower.update();
        }
        private function server_time():void{
            _data.call(Mod_Player_Base.server_time, this.gameTimerCallBack, []);
        }
        private function sendFlowerCallBack():void{
            var _local1:Object = this._ctrl.notify.sendFlowerInfo;
            var _local2 = "";
            if (this.isNewYear()){
                if (_local1["receive_player_sex"] == 0){
                    _local2 = Lang.sprintf(keepAliveLang.SendFlowerToMan, _local1["send_player_nickname"], _local1["receive_player_nickname"], HtmlText.format(_local1["flower_count"], HtmlText.Green, 24));
                } else {
                    _local2 = Lang.sprintf(keepAliveLang.SendFlowerToWoman, _local1["send_player_nickname"], _local1["receive_player_nickname"], HtmlText.format(_local1["flower_count"], HtmlText.Green, 24));
                };
            } else {
                _local2 = Lang.sprintf(keepAliveLang.SendFlower, _local1["send_player_nickname"], _local1["receive_player_nickname"], HtmlText.format(_local1["flower_count"], HtmlText.Green, 24));
            };
            this._viewMgr.worldNotice.showMessage(_local2);
        }
        private function notifyCompleteAchievementCallBack():void{
            this._viewMgr.achievementComplete.notifyCompleteAchievementCallBack();
        }
        private function isNewYear():Boolean{
            var _local1:Date = new Date((this._ctrl.player.serverTime * 1000));
            var _local2:Boolean = (((((_local1.month == 0)) && ((((_local1.date >= 18)) && ((_local1.date <= 31)))))) || ((((_local1.month == 1)) && ((((_local1.date >= 1)) && ((_local1.date <= 6)))))));
            return (_local2);
        }
        private function updateExperience():void{
            var _local1:int;
            var _local2:String;
            if ((((((this._viewMgr.war.requested == true)) || ((this._viewMgr.missionRank.requested == true)))) || ((this._viewMgr.getPeachWar.requested == true)))){
                this._viewMgr.delayExecute(DelayType.Experience, this.updateExperience);
            } else {
                this._toolbar.updateExperience(this._ctrl.player.experience, this._ctrl.player.maxExperience);
                _local1 = this._ctrl.rolemsg.ExpChange;
                if (_local1 > 0){
                    _local2 = (("+" + _local1) + keepAliveLang.Exp);
                    this.showPlayerTextEffect(_local2, 2552101);
                };
            };
        }
        private function updateLevel():void{
            if ((((((((this._viewMgr.war.requested == true)) || ((this._viewMgr.missionRank.requested == true)))) || (this._viewMgr.drama.inStage))) || ((this._viewMgr.getPeachWar.requested == true)))){
                this._viewMgr.delayExecute(DelayType.LevelUp, this.updateLevel);
            } else {
                this._toolbar.level = this._ctrl.player.level;
                this._viewMgr.chat.addSystemMessage(((this._ctrl.player.nickname + " ") + keepAliveLang.LevelUp), 0xFFFF00);
                if (this._viewMgr.screen.currentMap != null){
                    this._viewMgr.screen.currentMap.showLevelUp();
                };
                if (((this._ctrl.quest.hasLevelLimit) && ((this._viewMgr.townMap.inStage == true)))){
                    this.loadQuestTrace();
                };
            };
        }
        private function partnerUpgrade():void{
            var _local1:Array;
            var _local2:int;
            if ((((this._viewMgr.war.requested == true)) || ((this._viewMgr.getPeachWar.requested == true)))){
                this._viewMgr.delayExecute(DelayType.PartnerUpgrade, this.partnerUpgrade);
            } else {
                _local1 = this._ctrl.player.upLevelRoles;
                for each (_local2 in _local1) {
                    delete _local1[_local2];
                    this._viewMgr.chat.addSystemMessage(((RoleType.getRoleName(_local2) + " ") + keepAliveLang.LevelUp), 0xFFFF00);
                };
            };
        }
        private function delayOpenFunction():void{
            if (this._viewMgr.townMap.inStage == false){
                this._viewMgr.delayExecute(DelayType.OpenFunction, this.get_player_function);
            } else {
                this.get_player_function();
            };
        }
        private function delayLoadQuestTrace():void{
            if ((((this._viewMgr.townMap.inStage == false)) && ((this._viewMgr.war.requested == true)))){
                this._viewMgr.delayExecute(DelayType.QuestTrace, this.loadQuestTrace);
            } else {
                this.loadQuestTrace();
            };
        }
        private function campWarNotifyCallBack():void{
            var _local2:Object;
            if (FunctionType.isPlayed(FunctionType.CampWar) == false){
                return;
            };
            var _local1:Object = this._ctrl.campWar.getNotifyType();
            if (_local1["notify_type"] == Mod_CampWar_Base.END_CAMP_WAR){
                this.showCampTopWinMessage();
                this.showCampWinMessage();
            };
            if (_local1["notify_type"] == Mod_CampWar_Base.OPEN_CAMP_WAR){
                this._viewMgr.worldNotice.showMessage(keepAliveLang.CampWarOpen);
                _local2 = this._ctrl.campWar.getCurrentCampOpenTime();
                this._viewMgr.activities.activityShowCampWar(1, _local2["start_time"], _local2["end_time"]);
            };
            this._viewMgr.campWar.notifyCallBack(_local1);
        }
        private function showCampTopWinMessage():void{
            var _local2:Object;
            var _local3:String;
            var _local1:Array = this._ctrl.campWar.getNotifyTopWinner();
            for each (_local2 in _local1) {
                if ((((((_local2["min_level"] <= this._ctrl.player.level)) && ((_local2["max_level"] >= this._ctrl.player.level)))) && ((_local2["top_win_times"] > 8)))){
                    _local3 = Lang.sprintf(keepAliveLang.CampTopWin, htmlFormat(_local2["top_player_nick_name"], 24, 0xFFFF00), htmlFormat(_local2["top_win_times"], 24, 0xFFFF00));
                    this._viewMgr.worldNotice.showMessage(_local3);
                    break;
                };
            };
        }
        private function showCampWinMessage():void{
            var strMsg:* = null;
            var showMessage:* = null;
            showMessage = function ():void{
                _viewMgr.chat.addSystemMessage(strMsg);
            };
            var obj:* = this._ctrl.campWar.getNotifyIntegral();
            if (obj["win_camp_id"] == 0){
                return;
            };
            var strWinCampName:* = FactionType.campName(obj["win_camp_id"]);
            var strLoseCampName:* = ((obj["win_camp_id"] == FactionType.campId(FactionType.KunLunCheng))) ? FactionType.campName(FactionType.campId(FactionType.ShuShanCheng)) : FactionType.campName(FactionType.campId(FactionType.KunLunCheng));
            strMsg = Lang.sprintf(keepAliveLang.CampWin, strWinCampName, strLoseCampName);
            this._viewMgr.worldNotice.showMessage(strMsg);
            strMsg = (("<font color=\"#fff200\">" + Lang.sprintf(keepAliveLang.CampDisciple, strWinCampName, strLoseCampName, strWinCampName)) + "</font>");
            showMessage();
            setTimeout(showMessage, 3000);
        }
        private function heroesWarNotifyCallBack():void{
            var _local2:Object;
            if (FunctionType.isPlayed(FunctionType.CampWar) == false){
                return;
            };
            var _local1:Object = this._ctrl.heroesWar.getNotifyType();
            if (_local1["notify_type"] == Mod_HeroesWar_Base.END_HEROES_WAR){
                this.showHeroesTopWinMessage();
                this.showHeroesWinMessage();
            };
            if (_local1["notify_type"] == Mod_HeroesWar_Base.OPEN_HEROES_WAR){
                this._viewMgr.worldNotice.showMessage(keepAliveLang.HeroesWarOpen);
                _local2 = this._ctrl.heroesWar.getCurrentHeroesOpenTime();
                this._viewMgr.activities.activityShowHeroesWar(1, _local2["start_time"], _local2["end_time"]);
            };
            this._viewMgr.heroesWar.notifyCallBack(_local1);
        }
        private function showHeroesTopWinMessage():void{
            var _local2:Object;
            var _local3:String;
            var _local1:Array = this._ctrl.heroesWar.getNotifyTopWinner();
            for each (_local2 in _local1) {
                if ((((((_local2["min_level"] <= this._ctrl.player.level)) && ((_local2["max_level"] >= this._ctrl.player.level)))) && ((_local2["top_win_times"] > 8)))){
                    _local3 = Lang.sprintf(keepAliveLang.HeroesTopWin, htmlFormat(_local2["top_player_nick_name"], 24, 0xFFFF00), htmlFormat(_local2["top_win_times"], 24, 0xFFFF00));
                    this._viewMgr.worldNotice.showMessage(_local3);
                    break;
                };
            };
        }
        private function showHeroesWinMessage():void{
        }
        private function roleNumNotifyCallBack():void{
            if (this._viewMgr.townMap.inStage == false){
                this._viewMgr.delayExecute(DelayType.PartnersCount, this._viewMgr.processTip.openPartnersCount);
            } else {
                this._viewMgr.processTip.openPartnersCount();
            };
        }
        private function newResearchNotifyCallBack():void{
            if (this._viewMgr.townMap.inStage == false){
                this._viewMgr.delayExecute(DelayType.Research, this._viewMgr.processTip.openResearch);
            } else {
                this._viewMgr.processTip.openResearch();
            };
        }
        private function newPartnersNotifyCallBack():void{
            if (this._viewMgr.townMap.inStage == false){
                this._viewMgr.delayExecute(DelayType.Partners, this._viewMgr.processTip.openPartners);
            } else {
                this._viewMgr.processTip.openPartners();
            };
        }
        private function friend():void{
            _data.patch(Mod_Friend_Base.notify_online_state, this.onlineStateCallBack);
            _data.patch(Mod_Friend_Base.notify_message_count, this.messageCountCallBack);
        }
        private function onlineStateCallBack():void{
            var _local1:Object = _ctrl.friend.onlineState();
            _viewMgr.friendList.onlineState = _local1;
            _viewMgr.friendChat.onlineState = _local1;
            _viewMgr.audience.onlineState = _local1;
        }
        private function messageCountCallBack():void{
            var _local1:Object = _ctrl.friend.messageCount();
            _viewMgr.friendList.messageCount = _local1;
        }
        private function activityInfo():void{
            _viewMgr.activities.activityInfo();
        }
        public function startPractice():void{
            _viewMgr.screen.currentMap.startPractice();
        }
        public function closePractice():void{
            _viewMgr.screen.currentMap.closePractice(true);
        }
        private function load_effect_circle():void{
            var _local1:Array = [(URI.addonsUrl + "load_effect_circle.swf")];
            File.loadList(_local1, this.loadEffectCircle);
        }
        private function loadEffectCircle(_arg1:Array):void{
            this._loadEffectCircle = ((_arg1[0] as File).getClassByName("LoadEffectCircle") as Class);
        }
        public function get getLoadEffectCircle():Class{
            return (this._loadEffectCircle);
        }
        public function playFlowerRain():void{
            this._toolbar.playFlowerRain(URI.flowerUrl, Structure.maxStageHeight, Structure.maxStageWidth);
        }
        private function autoPractice():void{
            setTimeout(this.autoPractice, 60000);
            var _local1:int = int(_viewMgr.stage.mouseX);
            var _local2:int = int(_viewMgr.stage.mouseY);
            if (((!((_local1 == this._px))) || (!((_local2 == this._py))))){
                this._px = _local1;
                this._py = _local2;
                this._practiceTime = (getTimer() + 300000);
                return;
            };
            if (getTimer() < this._practiceTime){
                return;
            };
            if (_ctrl.player.playerInfo.practice == Mod_Town_Base.ON_PRACTICE){
                return;
            };
            if (_viewMgr.missionPractice.isBatton){
                return;
            };
            if (_viewMgr.heroPractice.isBatton){
                return;
            };
            if (FunctionType.isOpened(FunctionType.Practice) == false){
                return;
            };
            if (_viewMgr.screen.currentMap == null){
                return;
            };
            _viewMgr.screen.currentMap.startPractice();
        }

    }
}//package com.views 

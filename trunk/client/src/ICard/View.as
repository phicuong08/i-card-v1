//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.events.*;
    import flash.display.*;
    import ICard.views.*;
    import ICard.haloer.net.*;
    import ICard.assist.view.*;
    import flash.ui.*;
	import flash.ui.ContextMenu.*;
    import flash.utils.*;
   
    import flash.text.*;
    import flash.net.*;
    import ICard.assist.*;
    import ICard.protocols.*;
    
    import ICard.assist.view.sound.*;
    import ICard.assist.server.*;
    import ICard.lang.client.com.*;
    import flash.external.*;

    public class View extends ViewBase {

        private var _cookie:Cookie;
        public var time1:Number;
        public var time2:Number;
        private var _fcount:int;
        private var _hasEvent:Boolean = true;
        private var _hasKeyDown:Boolean = false;
        private var _delayList:Object;
        private var _info:TextField;
		
	
		private function contextMenuItem(_arg1:String, _arg2:String, _arg3:Boolean=true):ContextMenuItem{
			var text:* = _arg1;
			var url:* = _arg2;
			var enabled:Boolean = _arg3;
			var item:* = new ContextMenuItem(text);
			item.enabled = enabled;
			item.separatorBefore = true;
			var handler:* = function (_arg1:ContextMenuEvent):void{
				if (url){
					navigateToURL(new URLRequest(url));
				};
			};
			item.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, handler);
			return (item);
		}
		
		private function initContextMenu():void{
			var _local1:ContextMenu = new ContextMenu();
			_local1.customItems.push(this.contextMenuItem(ViewLang.WebSite, URI.webSiteUrl));
			_local1.customItems.push(this.contextMenuItem(ViewLang.BBS, URI.bbsUrl));
			_local1.customItems.push(this.contextMenuItem(Lang.sprintf(ViewLang.Version, "1.0.1"), "", false));
			_local1.customItems.push(this.contextMenuItem(ViewLang.Company, "", false));
			var _local2:Object = stage.getChildAt(0);
			_local2.contextMenu = _local1;
		}
		
        public function View(_arg1:Stage){
            this._delayList = {};
            super(_arg1);
            this.initAddAssets();
            this.initContextMenu();
            this.initFrameTime();
            
        }
        public function initAddAssets():void{
            addAssets("Achievement", "achievement.swf");
            addAssets("AchievementComplete", "achievement_complete.swf");
 
        }
        
        public function get achievement():AchievementView{
            return ((createObject(AchievementView) as AchievementView));
        }
        public function get achievementComplete():AchievementCompleteView{
            return ((createObject(AchievementCompleteView) as AchievementCompleteView));
        }
       
        public function hideLoadingText():void{
            var _local1:Object = stage.getChildAt(0);
            _local1.visible = false;
        }
        public function formatServerData():void{
            var _local1 = "Templet";
            ServerType.format(getAssetsObj(_local1));
            removeResource(_local1);
            WarData.removeNickNameSuffix = _ctrl.player.removeNickNameSuffix;
        }
        public function afterGetPlayerInfo():void{
            this.initCookie();
            structure.drawMark();
            this.panelLoading.show();
            this.screen.show();
            _data.call(Mod_Player_Base.server_time, this.serverTimeCallBack, []);
            MouseCursor.init(structure.mouse, _stage);
            BoxGrid.dragLayer = structure.tip;
            BoxGrid.itip = this.tip.iTip;
            MapStatic.mapStage = _stage;
            MapStatic.effectLayder = structure.tip;
            MapStatic.FolderDrama = URI.dramaUrl;
            MapStatic.FolderRole = URI.roleUrl;
            MapStatic.FolderScreen = URI.screenUrl;
            MapStatic.FolderMap = URI.mapUrl;
            MapStatic.FolderItemIcon = URI.goodsIconUrl;
            MapStatic.FolderNPCIcon = URI.npcIconUrl;
            MapStatic.removeNickNameSuffix = _data.player.removeNickNameSuffix;
            MapStatic.getVersion = URI.getVersion;
            this.initEvent();
            SoundEffect.url = URI.soundEffectUrl;
            SoundEffect.onVersion = URI.getVersion;
            SoundEffect.load();
        }
        public function reposition():void{
            this.webInfo();
        }
        public function serverTimeCallBack():void{
            this.activities.redEnvelopes();
        }
        private function initCookie():void{
            this._cookie = new Cookie(("age_" + _data.player.playerId));
        }
        public function setCookie(_arg1:String, _arg2:Object):void{
            this._cookie.setCookie(_arg1, _arg2);
        }
        public function getCookie(_arg1:String):Object{
            return (this._cookie.getCookie(_arg1));
        }
        public function get superViews():Array{
            return ([ActivitiesView, CampWarView, HeroesWarView, ChooseRolesView, FactionWarView, GetPeachView, InCampWarView, LodgeView, MiniFactionWarView, MissionFailedTipsView, MultiWarView, MultiMissionView, PKWarView, PreventIndulgeView, SuperSportView, SuperSportWarView, SportWarView, StrategyWarView, TowerView, WarView, WorldBossWarView, ZodiacView, ZodiacWarView]);
        }
        public function get coexistViews():Array{
            return ([[AudienceView, FriendChatView, FriendListView, OtherRoleMsgView, RoleMsgView], [OtherRoleMsgView, RoleMsgView, ImmortalityMsgView], [RoleMsgView, MyFactionView, OtherRoleMsgView], [RoleMsgView, TrainingView, AchievementView], [RoleMsgView, MyFlowerRecordView], [RoleMsgView, ArmsGoldView], [PackView, ArmsGoldView], [RoleMsgView, OtherRoleMsgView, RoleDetailInfoView], [OtherRoleMsgView, PlayerCompareView], [PackView, WarehouseView], [PackView, ShopView], [RoleMsgView, PackView], [RoleMsgView, RefineView], [RoleMsgView, DuJieView], [OtherRoleMsgView, ServerWarRecordView], [FateView, RoleMsgView], [WorldView, TravelEventView], [GameHelperView, RuneView], [GameHelperView, DailyQuestView], [FactionBlessingView, RoleMsgView, OtherRoleMsgView], [FactionWarSignUpView, FactionWarSignUpListView], [FactionWindowView, FactionBossSelectView], [ImmortalityMsgView, InheritView], [GoldOilShopView, ZodiacView]]);
        }
        public function get exclusiveViews():Array{
            return ([{
                master:FactionWarView,
                black:[],
                white:[]
            }, {
                master:InitLoadingView,
                black:[],
                white:[]
            }, {
                master:MultiWarView,
                black:[],
                white:[]
            }, {
                master:PKWarView,
                black:[],
                white:[]
            }, {
                master:StrategyWarView,
                black:[],
                white:[]
            }, {
                master:TowerWarView,
                black:[],
                white:[]
            }, {
                master:WorldBossWarView,
                black:[],
                white:[]
            }]);
        }
        public function get inTownViews():Array{
            return ([ChooseCampView, ChooseMissionView, SuperSportView, TowerView]);
        }
        public function get freeViews():Array{
            return ([ChatView, ChooseCampView, GameMasterView, MissionPracticeView, PanelLoadingView, RuneView, TakeBibleReadyView, TakeBibleRoadView, TravelEventView, WhatsNewView, TriggerFunctionView, FriendMessageView]);
        }
        private function initFrameTime():void{
            var ftime:* = NaN;
            var ftime1:* = NaN;
            var ftime2:* = NaN;
            var fcount:* = 0;
            ftime = getTimer();
            ftime1 = 0;
            ftime2 = 0;
            fcount = 0;
            this.addToFrameProcessList(sign, function ():void{
                fcount++;
                ftime2 = (getTimer() - ftime);
                ftime1 = (ftime2 * 0.001);
                ftime = getTimer();
                time1 = ftime1;
                time2 = ftime2;
                _fcount = fcount;
            });
        }
        private function initEvent():void{
            _stage.addEventListener(KeyboardEvent.KEY_UP, this.onKeyUpHandler);
            _stage.addEventListener(KeyboardEvent.KEY_DOWN, this.onKeyDownHandler);
            _stage.addEventListener(Event.ACTIVATE, this.stageActivateHandler);
            MapKey.initKey();
        }
        public function openEvent():void{
            this._hasEvent = true;
        }
        public function closeEvent():void{
            this._hasEvent = false;
        }
        private function onKeyUpHandler(_arg1:KeyboardEvent):void{
            if (false == this._hasKeyDown){
                return;
            };
            if (this.isTextFieldInput(_arg1.target)){
                return;
            };
            MapKey.keyUpHandler(_arg1);
        }
        private function onKeyDownHandler(_arg1:KeyboardEvent):void{
            this._hasKeyDown = true;
            if (((_arg1.ctrlKey) && ((_arg1.keyCode == 49)))){
                this.resetHost();
                _stage.focus = null;
                return;
            };
            if (((_arg1.ctrlKey) && ((_arg1.keyCode == 50)))){
                Helper.switchInteraction();
                _stage.focus = null;
                return;
            };
            if (Keyboard.TAB == _arg1.keyCode){
                _stage.focus = null;
                return;
            };
            if (false == this._hasEvent){
                return;
            };
            if (this.alert.iAlert.visible){
                if (_arg1.keyCode == Keyboard.ENTER){
                    this.alert.iAlert.defaultCloseEvent();
                };
                return;
            };
            if (this.isTextFieldInput(_arg1.target)){
                return;
            };
            switch(_arg1.keyCode)
            {
            		case Keyboard.ESCAPE:
            				_structure.popup.closeAll();
            			break;
            		case Keyboard.ENTER:
            			break;
            		case 192:
            			break;
            		case 67:
            			{
            				SoundEffect.play(SoundEffect.Button);
                      		this.roleMsg.switchSelf();
            			}
            			break;
            		case 66:
            			{
            				SoundEffect.play(SoundEffect.Button);
                      		this.pack.switchSelf();
            			}
						break;
					case 70:
					{
						if (FunctionType.isOpened(FunctionType.Upgrade)){
							SoundEffect.play(SoundEffect.Button);
							this.upgrade.switchSelf();
						}
						break;
					}
					case 69:
					{
						if (FunctionType.isOpened(FunctionType.Deploy)){
							SoundEffect.play(SoundEffect.Button);
							this.deploy.switchSelf();
						}
						break;
					}
						case :
            }
        
            MapKey.keyDownHandler(_arg1);
        }
		
        private function stageActivateHandler(_arg1:Event):void{
            stage.focus = null;
        }
        private function isTextFieldInput(_arg1:Object):Boolean{
            return ((((_arg1 is TextField)) && (((_arg1 as TextField).type == "input"))));
        }
        public function resetHost():void{
            var callback:* = function (_arg1:String):void{
                var host:* = _arg1;
                if (war.inStage){
                    return;
                };
                alert.socketClosed(ViewLang.Connecting);
                structure.popup.closeAll();
                try {
                    townMap.clear();
                } catch(e) {
                };
                try {
                    missionMap.clear();
                } catch(e) {
                };
                try {
                    toolbar.close();
                } catch(e) {
                };
                destroyAllObject("alert");
                _data.onConnect = function ():void{
                    alert.close();
                    show();
                };
                _data.connect(host, URI.serverPort);
            };
            URI.selectDomain(callback);
        }

        
        public function showTip(_arg1:String, _arg2:String=null, _arg3:int=5):void{
            this.tip2.showTip(htmlFormat(_arg1, 14, 44783, true), _arg2, _arg3);
        }
        public function hideTip():void{
            this.tip2.hideTip();
        }
       
        public function ingotEnough(_arg1:int):Boolean{
            if (_data.player.ingot < _arg1){
                this.showTip(ViewLang.IngotEnough);
                return (false);
            };
            return (true);
        }
        public function coinEnough(_arg1:int):Boolean{
            if (_data.player.coins < _arg1){
                this.showTip(ViewLang.CoinEnough);
                return (false);
            };
            return (true);
        }
        public function get inWar():Boolean{
            return (((((((((((((((((((((this.dujieWar.opened) || (this.getPeachWar.opened))) || (this.inCampWar.opened))) || (this.multiWar.opened))) || (this.superSportWar.opened))) || (this.takeBibleWar.opened))) || (this.towerWar.opened))) || (this.war.opened))) || (this.worldBossWar.opened))) || (this.strategyWar.opened))) || (this.zodiacWar.opened)));
        }
        public function set onWarClose(_arg1:Function):void{
            this.dujieWar.onWarClose = _arg1;
            this.getPeachWar.onWarClose = _arg1;
            this.inCampWar.onWarClose = _arg1;
            this.multiWar.onWarClose = _arg1;
            this.superSportWar.onWarClose = _arg1;
            this.takeBibleWar.onWarClose = _arg1;
            this.towerWar.onWarClose = _arg1;
            this.war.onWarClose = _arg1;
            this.worldBossWar.onWarClose = _arg1;
            this.strategyWar.onWarClose = _arg1;
            this.zodiacWar.onWarClose = _arg1;
        }
        public function hasDelayed(_arg1:String):Boolean{
            return (!(!(this._delayList[_arg1])));
        }
        public function delayExecute(_arg1:String, _arg2:Function, _arg3:int=0):void{
            this._delayList[_arg1] = [_arg2, _arg3];
        }
        public function removeDelayed(_arg1:String):void{
            delete this._delayList[_arg1];
        }
        public function triggerDelayed(... _args):void{
            var _local4:String;
            var _local2:int = _args.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _args[_local3];
                if (this._delayList[_local4]){
                    this.delayDone(_local4);
                };
                _local3++;
            };
        }
        private function delayDone(_arg1:String):void{
            var type:* = _arg1;
            var callback:* = this._delayList[type][0];
            var delay:* = this._delayList[type][1];
            delete this._delayList[type];
            if (!(callback is Function)){
                return;
            };
            if (delay > 0){
                addToFrameProcessList(type, function ():void{
                    if (--delay == 0){
                        removeFromFrameProcessList(type);
                        callback();
                    };
                });
            } else {
                callback();
            };
        }
        public function show():void{
            this.load.show();
        }
        public function showLoading(_arg1:String, _arg2:int, _arg3:int=1, _arg4:int=1):void{
            this.panelLoading.updatePanelLoading(_arg1, _arg2, _arg3, _arg4);
        }
        public function hideLoading():void{
            this.panelLoading.close();
        }
        public function showViewProcess(_arg1:String, _arg2:int=0):void{
        }
        public function hideViewProcess():void{
        }
        public function showDataProcess(_arg1:String):void{
        }
        public function hideDataProcess():void{
        }
        private function webInfo():void{
            if (this._info == null){
                this._info = new TextField();
                _stage.addChild(this._info);
                this._info.textColor = 0x999999;
                this._info.selectable = false;
                this._info.multiline = true;
                this._info.autoSize = TextFieldAutoSize.LEFT;
                this._info.htmlText = ((URI.publish) || (""));
                this._info.setTextFormat(new TextFormat("", 13, null, null, null, null, null, null, "center"));
                this._info.addEventListener(TextEvent.LINK, this.infoHandler);
            };
            this._info.x = Math.floor(((_stage.stageWidth - this._info.width) / 2));
            this._info.y = Math.floor(((Structure.stageOffset.y + Structure.stageHeight) + 10));
        }
        private function infoHandler(_arg1:TextEvent):void{
            if (_arg1.text == "Favorite"){
                this.addToFavorite();
            };
        }
      
        public function mapSwitched(_arg1:uint):void{
            this.initLoading.close();
            this.delayMessage.checkVisible();
            this.guide.checkVisible();
            this.processTip.checkVisible();
            this.toolbar.world_war_top_login_back();
            switch (_arg1){
                case MapViewBase.Town:
                    this.activities.activityVisible = true;
                    this.chat.visiblePost = true;
                    this.toolbar.playerDataVisible = true;
                    this.toolbar.functionLinkVisible = true;
                    this.toolbar.loadQuestTraceInTown();
                    this.toolbar.repositionInTown();
                    this.triggerDelayed(DelayType.WayFinding, DelayType.AutoEnterMission, DelayType.MoveToPortal, DelayType.OpenFunction, DelayType.PartnersCount, DelayType.Partners, DelayType.Research);
                    this.missionPractice.get_continue_practice_info();
                    if (FunctionType.isOpened(FunctionType.HeroMissionPractice)){
                        this.heroPractice.get_continue_practice_info();
                    };
                    this.factionBlessing.checkIncense();
                    this.factionEat.checkFactionEat();
                    this.factionRollCake.showRollCake();
                    this.takeBibleRoad.close();
                    this.takeBibleReady.close();
                    this.toolbar.renderQuestTrace();
                    break;
                case MapViewBase.Mission:
                    this.activities.activityVisible = false;
                    this.toolbar.questTraceTipVisible = false;
                    this.processTip.checkHasMedical();
                    break;

            };
        }

    }
}//package com 

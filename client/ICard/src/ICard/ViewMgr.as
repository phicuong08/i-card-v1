//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import flash.events.*;
    import flash.display.*;
    import ICard.views.*;
    import ICard.haloer.net.*;
    import ICard.assist.view.*;
    import flash.ui.*;
//	import flash.ui.ContextMenu.*;
    import flash.utils.*;
   
    import flash.text.*;
    import flash.net.*;
    import ICard.assist.*;
    import ICard.protocols.*;
    
    import ICard.assist.view.sound.*;
    import ICard.assist.server.*;
    import ICard.lang.client.com.*;
    import flash.external.*;

    public class ViewMgr extends ViewBaseMgr {

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
		
        public function ViewMgr(_arg1:Stage){
            this._delayList = {};
            super(_arg1);
            this.initAddAssets();
            this.initContextMenu();
            this.initFrameTime();
            
        }
		    public function initAddAssets():void{
				addAssets("carddb","carddb.swf");
				addAssets("templet","templet.swf");
				addAssets("battlefield","battlefield.swf");
				addAssets("toolbar", "toolbar.swf");
				addAssets("waitroom", "waitroom.swf");
				addAssets("login", "login.swf");
				addAssets("mainmenu", "mainmenu.swf");
				addAssets("roomlist", "roomlist.swf");
				addAssets("Achievement", "achievement.swf");
				addAssets("AchievementComplete", "achievement_complete.swf");
				addAssets("Alert", "alert.swf");
				addAssets("Tip2", "addons/tip2.swf");
				addAssets("InitLoading", "init_loading.swf");
				addAssets("InitLoadingBaidu", "init_loading_baidu.swf");
				addAssets("InitLoadingMangguo", "init_loading_mangguo.swf");
		    }
				public function get load():LoadView{
					return ((createObject(LoadView) as LoadView));
				}
				public function get tip():TipView{
		    		return ((this.createObject(TipView) as TipView));
		    }
				public function get toolbar():ToolbarView{
					return ((createObject(ToolbarView) as ToolbarView));
				}
				public function get screen():ScreenView{
					return ((createObject(ScreenView) as ScreenView));
				}
				public function get alert():AlertView{
						return ((this.createObject(AlertView) as AlertView));
				}
				public function get login():LoginView{
						return ((this.createObject(LoginView) as LoginView));
				}
				public function get roomList():RoomListView{
						return ((this.createObject(RoomListView) as RoomListView));
				}
				public function get mainmenu():MainmenuView{
						return ((this.createObject(MainmenuView) as MainmenuView));
				}
				public function get waitroom():WaitRoomView{
						return ((this.createObject(WaitRoomView) as WaitRoomView));
				}
				public function get battleField():BattleFieldView{
					return ((this.createObject(BattleFieldView) as BattleFieldView));
				}
				public function get fightMovie():FightMovieView{
					return ((this.createObject(FightMovieView) as FightMovieView));
				}
				public function get initLoading():InitLoadingView{
						return ((this.createObject(InitLoadingView) as InitLoadingView));
				}
				public function get tip2():Tip2View{
						return ((this.createObject(Tip2View) as Tip2View));
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
		        var _local1:String = "templet";
		        ServerType.format(getAssetsObj(_local1));
		        removeResource(_local1);
		        //WarData.removeNickNameSuffix = _ctrl.player.removeNickNameSuffix;
		    }
        public function afterGetPlayerInfo():void{
            this.initCookie();
            structure.drawMark();
//            this.panelLoading.show();
//            this.screen.show();
//            _data.call(Mod_Player_Base.server_time, this.serverTimeCallBack, []);
//            MouseCursor.init(structure.mouse, _stage);
//            BoxGrid.dragLayer = structure.tip;
//            BoxGrid.itip = this.tip.iTip;
//            MapStatic.mapStage = _stage;
//            MapStatic.effectLayder = structure.tip;
//            MapStatic.FolderDrama = URI.dramaUrl;
//            MapStatic.FolderRole = URI.roleUrl;
//            MapStatic.FolderScreen = URI.screenUrl;
//            MapStatic.FolderMap = URI.mapUrl;
//            MapStatic.FolderItemIcon = URI.goodsIconUrl;
//            MapStatic.FolderNPCIcon = URI.npcIconUrl;
//            MapStatic.removeNickNameSuffix = _data.player.removeNickNameSuffix;
//            MapStatic.getVersion = URI.getVersion;
            this.initEvent();
            SoundEffect.url = URI.soundEffectUrl;
            SoundEffect.onVersion = URI.getVersion;
            SoundEffect.load();
        }
        public function reposition():void{
            //this.webInfo();
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
            //return ([ActivitiesView, CampWarView, HeroesWarView, ChooseRolesView, FactionWarView, GetPeachView, InCampWarView, LodgeView, MiniFactionWarView, MissionFailedTipsView, MultiWarView, MultiMissionView, PKWarView, PreventIndulgeView, SuperSportView, SuperSportWarView, SportWarView, StrategyWarView, TowerView, WarView, WorldBossWarView, ZodiacView, ZodiacWarView]);
						return ([]);
        }
        public function get coexistViews():Array{
            //return ([[AudienceView, FriendChatView, FriendListView, OtherRoleMsgView, RoleMsgView], [OtherRoleMsgView, RoleMsgView, ImmortalityMsgView], [RoleMsgView, MyFactionView, OtherRoleMsgView], [RoleMsgView, TrainingView, AchievementView], [RoleMsgView, MyFlowerRecordView], [RoleMsgView, ArmsGoldView], [PackView, ArmsGoldView], [RoleMsgView, OtherRoleMsgView, RoleDetailInfoView], [OtherRoleMsgView, PlayerCompareView], [PackView, WarehouseView], [PackView, ShopView], [RoleMsgView, PackView], [RoleMsgView, RefineView], [RoleMsgView, DuJieView], [OtherRoleMsgView, ServerWarRecordView], [FateView, RoleMsgView], [WorldView, TravelEventView], [GameHelperView, RuneView], [GameHelperView, DailyQuestView], [FactionBlessingView, RoleMsgView, OtherRoleMsgView], [FactionWarSignUpView, FactionWarSignUpListView], [FactionWindowView, FactionBossSelectView], [ImmortalityMsgView, InheritView], [GoldOilShopView, ZodiacView]]);
			return [];
        }
        public function get exclusiveViews():Array{
//            return ([{
//                master:FactionWarView,
//                black:[],
//                white:[]
//            }, {
//                master:InitLoadingView,
//                black:[],
//                white:[]
//            }, {
//                master:MultiWarView,
//                black:[],
//                white:[]
//            }, {
//                master:PKWarView,
//                black:[],
//                white:[]
//            }, {
//                master:StrategyWarView,
//                black:[],
//                white:[]
//            }, {
//                master:TowerWarView,
//                black:[],
//                white:[]
//            }, {
//                master:WorldBossWarView,
//                black:[],
//                white:[]
//            }]);
						return [];
        }
   
        public function get freeViews():Array{
            //return ([ChatView, ChooseCampView, GameMasterView, MissionPracticeView, PanelLoadingView, RuneView, TakeBibleReadyView, TakeBibleRoadView, TravelEventView, WhatsNewView, TriggerFunctionView, FriendMessageView]);
			return [];
        }
		public function get stackViews():Array{
			return [MainmenuView,RoomListView,WaitRoomView];
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
            //MapKey.initKey();
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
            //MapKey.keyUpHandler(_arg1);
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
            }
        
            //MapKey.keyDownHandler(_arg1);
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
                
//                alert.socketClosed(ViewLang.Connecting);
//                structure.popup.closeAll();
//                try {
//                    townMap.clear();
//                } catch(e) {
//                };
//                try {
//                    missionMap.clear();
//                } catch(e) {
//                };
//                try {
//                    toolbar.close();
//                } catch(e) {
//                };
//                destroyAllObject("alert");
//                _data.onConnect = function ():void{
//                    alert.close();
//                    show();
//                };
                _data.connect();
            };
            URI.selectDomain(callback);
        }

        
        public function showTip(_arg1:String, _arg2:String=null, _arg3:int=5):void{
            //this.tip2.showTip(htmlFormat(_arg1, 14, 44783, true), _arg2, _arg3);
        }
        public function hideTip():void{
           // this.tip2.hideTip();
        }
       
        public function ingotEnough(_arg1:int):Boolean{
//            if (_data.player.ingot < _arg1){
//                this.showTip(ViewLang.IngotEnough);
//                return (false);
//            };
            return (true);
        }
        public function coinEnough(_arg1:int):Boolean{
//            if (_data.player.coins < _arg1){
//                this.showTip(ViewLang.CoinEnough);
//                return (false);
//            };
            return (true);
        }
		public function firstLogin(_arg1:Boolean):void{
			if (ExternalInterface.available){
				ExternalInterface.call("firstLogin", ((_arg1) || (false)));
			};
		}
		
        public function get inWar():Boolean{
            return false;//(((((((((((((((((((((this.dujieWar.opened) || (this.getPeachWar.opened))) || (this.inCampWar.opened))) || (this.multiWar.opened))) || (this.superSportWar.opened))) || (this.takeBibleWar.opened))) || (this.towerWar.opened))) || (this.war.opened))) || (this.worldBossWar.opened))) || (this.strategyWar.opened))) || (this.zodiacWar.opened)));
        }
        public function set onWarClose(_arg1:Function):void{
           
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
            //this.panelLoading.updatePanelLoading(_arg1, _arg2, _arg3, _arg4);
        }
        public function hideLoading():void{
            //this.panelLoading.close();
        }
        public function showViewProcess(_arg1:String, _arg2:int=0):void{
        }
        public function hideViewProcess():void{
        }
        public function showDataProcess(_arg1:String):void{
        }
        public function hideDataProcess():void{
        }
      
      

    }
}//package com 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com {
    import flash.events.*;
    import flash.display.*;
    import com.views.*;
    import com.haloer.net.*;
    import com.assist.view.*;
    import flash.ui.*;
    import flash.utils.*;
    import com.assist.data.mission.*;
    import flash.text.*;
    import com.assist.view.pack.*;
    import com.views.map.*;
    import flash.net.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.map.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.*;
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

        public function View(_arg1:Stage){
            this._delayList = {};
            super(_arg1);
            this.initAddAssets();
            this.initContextMenu();
            this.initFrameTime();
            this.initJSHandler();
        }
        public function initAddAssets():void{
            addAssets("Activities", "activities.swf");
            addAssets("ActivitiesShow", "activities_show.swf");
            addAssets("ArmsRecast", "arms_recast.swf");
            addAssets("ArmsGold", "arms_gold.swf");
            addAssets("ActivationKeys", "activation_keys.swf");
            addAssets("ActivityWindow", "activity_window.swf");
            addAssets("Alert", "alert.swf");
            addAssets("Audience", "audience.swf");
            addAssets("CampWar", "camp_war.swf");
            addAssets("HeroesWar", "heroes_war.swf");
            addAssets("Chat", "chat.swf");
            addAssets("DuJie", "dujie.swf");
            addAssets("ChooseCamp", "choose_camp.swf");
            addAssets("ChooseMission", "choose_mission.swf");
            addAssets("ChooseRoles", "choose_roles.swf");
            addAssets("DailyQuest", "daily_quest.swf");
            addAssets("Deploy", "deploy.swf");
            addAssets("Farm", "farm.swf");
            addAssets("Fate", "fate.swf");
            addAssets("FriendChatBox", "friend_chat.swf");
            addAssets("FriendList", "friend_list.swf");
            addAssets("FactionWarSignUp", "faction_war_sign_up.swf");
            addAssets("FactionTrophy", "faction_trophy.swf");
            addAssets("FactionTable", "faction_war_table.swf");
            addAssets("FactionWarSignUpList", "faction_war_sign_up_list.swf");
            addAssets("FactionBossSelect", "faction_boss_select.swf");
            addAssets("FactionBlessing", "faction_blessing.swf");
            addAssets("FactionWindow", "faction_window.swf");
            addAssets("FriendMessage", "friend_message.swf");
            addAssets("FactionSeal", "faction_seal.swf");
            addAssets("GameHelper", "game_helper.swf");
            addAssets("GameMaster", "game_master.swf");
            addAssets("HeroMission", "hero_mission.swf");
            addAssets("HeroPractice", "hero_practice.swf");
            addAssets("ImmortalityMsg", "immortality_msg.swf");
            addAssets("InitLoading", "init_loading.swf");
            addAssets("InitLoadingBaidu", "init_loading_baidu.swf");
            addAssets("InitLoadingMangguo", "init_loading_mangguo.swf");
            addAssets("JoinFaction", "join_faction.swf");
            addAssets("Lodge", "lodge.swf");
            addAssets("LuckyShop", "lucky_shop.swf");
            addAssets("Map", "map.swf");
            addAssets("MiniFactionWar", "mini_faction_war.swf");
            addAssets("MissionFailedTips", "mission_failed_tips.swf");
            addAssets("MissionPractice", "mission_practice.swf");
            addAssets("MissionRank", "mission_rank.swf");
            addAssets("MultiMission", "multi_mission.swf");
            addAssets("MultiWar", "multi_war.swf");
            addAssets("MyFaction", "my_faction.swf");
            addAssets("NPCDialog", "npc_dialog.swf");
            addAssets("DelayMessage", "delay_message.swf");
            addAssets("DramaPlayBack", "drama_playback.swf");
            addAssets("OtherHead", "other_head.swf");
            addAssets("Pack", "pack.swf");
            addAssets("PanelLoading", "panel_loading.swf");
            addAssets("Partners", "partners.swf");
            addAssets("Pet", "pet.swf");
            addAssets("PreventIndulge", "prevent_indulge.swf");
            addAssets("ProcessTips", "process_tips.swf");
            addAssets("Quest", "quest.swf");
            addAssets("Ranking", "ranking.swf");
            addAssets("Refine", "refine.swf");
            addAssets("Research", "research.swf");
            addAssets("RoleMsg", "role_msg.swf");
            addAssets("RoleMsgSee", "role_msg_see.swf");
            addAssets("Rune", "rune.swf");
            addAssets("RollCake", "roll_cake.swf");
            addAssets("Setting", "setting.swf");
            addAssets("Shop", "shop.swf");
            addAssets("StandaloneChat", "standalone_chat.swf");
            addAssets("Strategy", "strategy.swf");
            addAssets("Subline", "subline.swf");
            addAssets("SuperSport", "super_sport.swf");
            addAssets("ServerWarSignUp", "serverwar_signup.swf");
            addAssets("ServerWarRecord", "serverwar_record.swf");
            addAssets("ServerWarCup", "serverwar_cup.swf");
            addAssets("Templet", "templet.swf");
            addAssets("Tip2", "addons/tip2.swf");
            addAssets("Toolbar", "toolbar.swf");
            addAssets("ToolbarFooter", "toolbar_footer.swf");
            addAssets("Training", "training.swf");
            addAssets("RoleDetailInfo", "role_detail_info.swf");
            addAssets("TravelEvent", "travel_event.swf");
            addAssets("TriggerFunction", "trigger_function.swf");
            addAssets("TakeBibleRoad", "take_bible_road.swf");
            addAssets("TakeBibleReady", "take_bible_ready.swf");
            addAssets("Tower", "tower.swf");
            addAssets("Upgrade", "upgrade.swf");
            addAssets("Vip", "vip.swf");
            addAssets("War", "war.swf");
            addAssets("WarResources", "war_resources.swf");
            addAssets("WhatsNew", "whats_new.swf");
            addAssets("WinEffect", "win_effect.swf");
            addAssets("World", "world.swf");
            addAssets("WorldNotice", "notice.swf");
            addAssets("ProgressBar", "progress_bar.swf");
            addAssets("SendFlower", "send_flower.swf");
            addAssets("SealSoul", "seal_soul.swf");
            addAssets("Inherit", "inherit.swf");
            addAssets("ConsumeAlertSetting", "consume_alert_setting.swf");
            addAssets("Achievement", "achievement.swf");
            addAssets("AchievementComplete", "achievement_complete.swf");
            addAssets("WorshipMars", "worship_mars.swf");
            addAssets("GetPeach", "get_peach.swf");
            addAssets("RedEnvelopes", "red_envelopes.swf");
            addAssets("FactionRollCake", "faction_roll_cake.swf");
            addAssets("PlayerCompare", "player_compare.swf");
            addAssets("SealShop", "seal_shop.swf");
            addAssets("GoldOilShop", "gold_oil_shop.swf");
            addAssets("Zodiac", "zodiac.swf");
            addAssets("SuperDeploy", "super_deploy.swf");
            addAssets("SealStone", "seal_stone.swf");
            addAssets("SealStoneShop", "seal_stone_shop.swf");
            addAssets("StudyStunt", "study_stunt.swf");
        }
        public function get activities():ActivitiesView{
            return ((createObject(ActivitiesView) as ActivitiesView));
        }
        public function get activitiesShow():ActivitiesShowView{
            return ((createObject(ActivitiesShowView) as ActivitiesShowView));
        }
        public function get activityWindow():ActivityWindowView{
            return ((createObject(ActivityWindowView) as ActivityWindowView));
        }
        public function get activationKeys():ActivationKeysView{
            return ((createObject(ActivationKeysView) as ActivationKeysView));
        }
        public function get alert():AlertView{
            return ((this.createObject(AlertView) as AlertView));
        }
        public function get audience():AudienceView{
            return ((createObject(AudienceView) as AudienceView));
        }
        public function get campWar():CampWarView{
            return ((createObject(CampWarView) as CampWarView));
        }
        public function get heroesWar():HeroesWarView{
            return ((createObject(HeroesWarView) as HeroesWarView));
        }
        public function get chat():ChatView{
            return ((createObject(ChatView) as ChatView));
        }
        public function get chooseCamp():ChooseCampView{
            return ((createObject(ChooseCampView) as ChooseCampView));
        }
        public function get chooseMission():ChooseMissionView{
            return ((createObject(ChooseMissionView) as ChooseMissionView));
        }
        public function get chooseRoles():ChooseRolesView{
            return ((this.createObject(ChooseRolesView) as ChooseRolesView));
        }
        public function get dramaPlayBack():DramaPlayBackView{
            return ((createObject(DramaPlayBackView) as DramaPlayBackView));
        }
        public function get dailyQuest():DailyQuestView{
            return ((this.createObject(DailyQuestView) as DailyQuestView));
        }
        public function get deploy():DeployView{
            return ((createObject(DeployView) as DeployView));
        }
        public function get dujie():DuJieView{
            return ((createObject(DuJieView) as DuJieView));
        }
        public function get dujieWar():DuJieWarView{
            return ((createObject(DuJieWarView) as DuJieWarView));
        }
        public function get drag():DragView{
            return ((this.createObject(DragView) as DragView));
        }
        public function get drama():DramaView{
            return ((createObject(DramaView) as DramaView));
        }
        public function get dramaWar():DramaWarView{
            return ((createObject(DramaWarView) as DramaWarView));
        }
        public function get farm():FarmView{
            return ((this.createObject(FarmView) as FarmView));
        }
        public function get fate():FateView{
            return ((createObject(FateView) as FateView));
        }
        public function get friendChat():FriendChatView{
            return ((createObject(FriendChatView) as FriendChatView));
        }
        public function get friendList():FriendListView{
            return ((createObject(FriendListView) as FriendListView));
        }
        public function get friendMessage():FriendMessageView{
            return ((createObject(FriendMessageView) as FriendMessageView));
        }
        public function get factionBlessing():FactionBlessingView{
            return ((createObject(FactionBlessingView) as FactionBlessingView));
        }
        public function get factionSeal():FactionSealView{
            return ((createObject(FactionSealView) as FactionSealView));
        }
        public function get factionEat():FactionEatView{
            return ((createObject(FactionEatView) as FactionEatView));
        }
        public function get factionWar():FactionWarView{
            return ((createObject(FactionWarView) as FactionWarView));
        }
        public function get factionWarMap():FactionWarMapView{
            return ((createObject(FactionWarMapView) as FactionWarMapView));
        }
        public function get factionTrophy():FactionTrophyView{
            return ((createObject(FactionTrophyView) as FactionTrophyView));
        }
        public function get factionBossSelect():FactionBossSelectView{
            return ((createObject(FactionBossSelectView) as FactionBossSelectView));
        }
        public function get factionWarSignUp():FactionWarSignUpView{
            return ((createObject(FactionWarSignUpView) as FactionWarSignUpView));
        }
        public function get factionWarSignUpList():FactionWarSignUpListView{
            return ((createObject(FactionWarSignUpListView) as FactionWarSignUpListView));
        }
        public function get factionTable():FactionTableView{
            return ((createObject(FactionTableView) as FactionTableView));
        }
        public function get factionWindow():FactionWindowView{
            return ((createObject(FactionWindowView) as FactionWindowView));
        }
        public function get gameHelper():GameHelperView{
            return ((this.createObject(GameHelperView) as GameHelperView));
        }
        public function get gameMaster():GameMasterView{
            return ((createObject(GameMasterView) as GameMasterView));
        }
        public function get getPeachWar():GetPeachWarView{
            return ((createObject(GetPeachWarView) as GetPeachWarView));
        }
        public function get guide():GuideView{
            return ((createObject(GuideView) as GuideView));
        }
        public function get heroMission():HeroMissionView{
            return ((createObject(HeroMissionView) as HeroMissionView));
        }
        public function get heroPractice():HeroPracticeView{
            return ((createObject(HeroPracticeView) as HeroPracticeView));
        }
        public function get immortalityMsg():ImmortalityMsgView{
            return ((createObject(ImmortalityMsgView) as ImmortalityMsgView));
        }
        public function get inCampWar():InCampWarView{
            return ((createObject(InCampWarView) as InCampWarView));
        }
        public function get initLoading():InitLoadingView{
            return ((this.createObject(InitLoadingView) as InitLoadingView));
        }
        public function get joinFaction():JoinFactionView{
            return ((createObject(JoinFactionView) as JoinFactionView));
        }
        public function get load():LoadView{
            return ((createObject(LoadView) as LoadView));
        }
        public function get login():LoginView{
            return ((createObject(LoginView) as LoginView));
        }
        public function get lodge():LodgeView{
            return ((createObject(LodgeView) as LodgeView));
        }
        public function get miniFactionWar():MiniFactionWarView{
            return ((createObject(MiniFactionWarView) as MiniFactionWarView));
        }
        public function get missionFailedTips():MissionFailedTipsView{
            return ((createObject(MissionFailedTipsView) as MissionFailedTipsView));
        }
        public function get missionMap():MissionMapView{
            return ((createObject(MissionMapView) as MissionMapView));
        }
        public function get missionPractice():MissionPracticeView{
            return ((createObject(MissionPracticeView) as MissionPracticeView));
        }
        public function get missionRank():MissionRankView{
            return ((createObject(MissionRankView) as MissionRankView));
        }
        public function get multiMission():MultiMissionView{
            return ((createObject(MultiMissionView) as MultiMissionView));
        }
        public function get multiWar():MultiWarView{
            return ((this.createObject(MultiWarView) as MultiWarView));
        }
        public function get myFaction():MyFactionView{
            return ((createObject(MyFactionView) as MyFactionView));
        }
        public function get npcDialog():NPCDialogView{
            return ((this.createObject(NPCDialogView) as NPCDialogView));
        }
        public function get otherRoleMsg():OtherRoleMsgView{
            return ((createObject(OtherRoleMsgView) as OtherRoleMsgView));
        }
        public function get otherHead():OtherHeadView{
            return ((createObject(OtherHeadView) as OtherHeadView));
        }
        public function get pack():PackView{
            return ((createObject(PackView) as PackView));
        }
        public function get pet():PetView{
            return ((createObject(PetView) as PetView));
        }
        public function get panelLoading():PanelLoadingView{
            return ((this.createObject(PanelLoadingView) as PanelLoadingView));
        }
        public function get partners():PartnersView{
            return ((this.createObject(PartnersView) as PartnersView));
        }
        public function get pkWar():PKWarView{
            return ((createObject(PKWarView) as PKWarView));
        }
        public function get preventIndulge():PreventIndulgeView{
            return ((createObject(PreventIndulgeView) as PreventIndulgeView));
        }
        public function get processTip():ProcessTipsView{
            return ((createObject(ProcessTipsView) as ProcessTipsView));
        }
        public function get quest():QuestView{
            return ((createObject(QuestView) as QuestView));
        }
        public function get ranking():RankingView{
            return ((this.createObject(RankingView) as RankingView));
        }
        public function get refine():RefineView{
            return ((createObject(RefineView) as RefineView));
        }
        public function get research():ResearchView{
            return ((this.createObject(ResearchView) as ResearchView));
        }
        public function get roleMsg():RoleMsgView{
            return ((createObject(RoleMsgView) as RoleMsgView));
        }
        public function get rune():RuneView{
            return ((createObject(RuneView) as RuneView));
        }
        public function get rollCake():RollCakeView{
            return ((createObject(RollCakeView) as RollCakeView));
        }
        public function get screen():ScreenView{
            return ((createObject(ScreenView) as ScreenView));
        }
        public function get shop():ShopView{
            return ((createObject(ShopView) as ShopView));
        }
        public function get setting():SettingView{
            return ((createObject(SettingView) as SettingView));
        }
        public function get sportWar():SportWarView{
            return ((createObject(SportWarView) as SportWarView));
        }
        public function get standaloneChat():StandaloneChatView{
            return ((createObject(StandaloneChatView) as StandaloneChatView));
        }
        public function get strategy():StrategyView{
            return ((createObject(StrategyView) as StrategyView));
        }
        public function get strategyWar():StrategyWarView{
            return ((createObject(StrategyWarView) as StrategyWarView));
        }
        public function get subline():SublineView{
            return ((this.createObject(SublineView) as SublineView));
        }
        public function get superSport():SuperSportView{
            return ((createObject(SuperSportView) as SuperSportView));
        }
        public function get superSportWar():SuperSportWarView{
            return ((createObject(SuperSportWarView) as SuperSportWarView));
        }
        public function get takeBibleWar():TakeBibleWarView{
            return ((createObject(TakeBibleWarView) as TakeBibleWarView));
        }
        public function get tip():TipView{
            return ((this.createObject(TipView) as TipView));
        }
        public function get tip2():Tip2View{
            return ((this.createObject(Tip2View) as Tip2View));
        }
        public function get toolbar():ToolbarView{
            return ((createObject(ToolbarView) as ToolbarView));
        }
        public function get towerWar():TowerWarView{
            return ((createObject(TowerWarView) as TowerWarView));
        }
        public function get townMap():TownMapView{
            return ((createObject(TownMapView) as TownMapView));
        }
        public function get training():TrainingView{
            return ((createObject(TrainingView) as TrainingView));
        }
        public function get tower():TowerView{
            return ((createObject(TowerView) as TowerView));
        }
        public function get takeBibleRoad():TakeBibleRoadView{
            return ((createObject(TakeBibleRoadView) as TakeBibleRoadView));
        }
        public function get takeBibleReady():TakeBibleReadyView{
            return ((createObject(TakeBibleReadyView) as TakeBibleReadyView));
        }
        public function get travelEvent():TravelEventView{
            return ((createObject(TravelEventView) as TravelEventView));
        }
        public function get triggerFunction():TriggerFunctionView{
            return ((createObject(TriggerFunctionView) as TriggerFunctionView));
        }
        public function get upgrade():UpgradeView{
            return ((this.createObject(UpgradeView) as UpgradeView));
        }
        public function get vip():VipView{
            return ((this.createObject(VipView) as VipView));
        }
        public function get war():WarView{
            return ((createObject(WarView) as WarView));
        }
        public function get warehouse():WarehouseView{
            return ((createObject(WarehouseView) as WarehouseView));
        }
        public function get whatsNew():WhatsNewView{
            return ((createObject(WhatsNewView) as WhatsNewView));
        }
        public function get world():WorldView{
            return ((createObject(WorldView) as WorldView));
        }
        public function get worldBossMap():WorldBossMapView{
            return ((createObject(WorldBossMapView) as WorldBossMapView));
        }
        public function get worldBossWar():WorldBossWarView{
            return ((createObject(WorldBossWarView) as WorldBossWarView));
        }
        public function get worldNotice():WorldNoticeView{
            return ((createObject(WorldNoticeView) as WorldNoticeView));
        }
        public function get luckyShop():LuckyShopView{
            return ((createObject(LuckyShopView) as LuckyShopView));
        }
        public function get delayMessage():DelayMessageView{
            return ((createObject(DelayMessageView) as DelayMessageView));
        }
        public function get progressBar():ProgressBarView{
            return ((createObject(ProgressBarView) as ProgressBarView));
        }
        public function get sendFlower():SendFlowerView{
            return ((createObject(SendFlowerView) as SendFlowerView));
        }
        public function get myFlowerRecord():MyFlowerRecordView{
            return ((createObject(MyFlowerRecordView) as MyFlowerRecordView));
        }
        public function get sealSoul():SealSoulView{
            return ((createObject(SealSoulView) as SealSoulView));
        }
        public function get serverWarSignUp():ServerWarSignUpView{
            return ((createObject(ServerWarSignUpView) as ServerWarSignUpView));
        }
        public function get serverWarRecord():ServerWarRecordView{
            return ((createObject(ServerWarRecordView) as ServerWarRecordView));
        }
        public function get serverWarCup():ServerWarCupView{
            return ((createObject(ServerWarCupView) as ServerWarCupView));
        }
        public function get inherit():InheritView{
            return ((createObject(InheritView) as InheritView));
        }
        public function get roleDetailInfo():RoleDetailInfoView{
            return ((createObject(RoleDetailInfoView) as RoleDetailInfoView));
        }
        public function get consumeAlertSetting():ConsumeAlertSettingView{
            return ((createObject(ConsumeAlertSettingView) as ConsumeAlertSettingView));
        }
        public function get achievement():AchievementView{
            return ((createObject(AchievementView) as AchievementView));
        }
        public function get achievementComplete():AchievementCompleteView{
            return ((createObject(AchievementCompleteView) as AchievementCompleteView));
        }
        public function get armsRecast():ArmsRecastView{
            return ((createObject(ArmsRecastView) as ArmsRecastView));
        }
        public function get armsGold():ArmsGoldView{
            return ((createObject(ArmsGoldView) as ArmsGoldView));
        }
        public function get worshipMars():WorshipMarsView{
            return ((createObject(WorshipMarsView) as WorshipMarsView));
        }
        public function get getPeach():GetPeachView{
            return ((createObject(GetPeachView) as GetPeachView));
        }
        public function get redEnvelopes():RedEnvelopesView{
            return ((createObject(RedEnvelopesView) as RedEnvelopesView));
        }
        public function get factionRollCake():FactionRollCakeView{
            return ((createObject(FactionRollCakeView) as FactionRollCakeView));
        }
        public function get playerCompare():PlayerCompareView{
            return ((createObject(PlayerCompareView) as PlayerCompareView));
        }
        public function get sealShop():SealShopView{
            return ((createObject(SealShopView) as SealShopView));
        }
        public function get goldOilShop():GoldOilShopView{
            return ((createObject(GoldOilShopView) as GoldOilShopView));
        }
        public function get zodiac():ZodiacView{
            return ((createObject(ZodiacView) as ZodiacView));
        }
        public function get zodiacWar():ZodiacWarView{
            return ((createObject(ZodiacWarView) as ZodiacWarView));
        }
        public function get superDeploy():SuperDeployView{
            return ((createObject(SuperDeployView) as SuperDeployView));
        }
        public function get sealStone():SealStoneView{
            return ((createObject(SealStoneView) as SealStoneView));
        }
        public function get sealStoneShop():SealStoneShopView{
            return ((createObject(SealStoneShopView) as SealStoneShopView));
        }
        public function get studyStunt():StudyStuntView{
            return ((createObject(StudyStuntView) as StudyStuntView));
        }
        public function hideLoadingText():void{
            var _local1:Object = stage.getChildAt(0);
            _local1.visible = false;
        }
        public function formatServerData():void{
            var _local1:String = "Templet";
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
            com.assist.MouseCursor.init(structure.mouse, _stage);
            MapStatic.mapStage = _stage;
            MapStatic.effectLayder = structure.tip;
            MapStatic.FolderDrama = URI.dramaUrl;
            MapStatic.FolderRole = URI.roleUrl;
            MapStatic.FolderScreen = URI.screenUrl;
            MapStatic.FolderMap = URI.mapUrl;
            MapStatic.FolderItemIcon = URI.goodsIconUrl;
            MapStatic.FolderNPCIcon = URI.npcIconUrl;
            MapStatic.FolderEffects = URI.effectsUrl;
            MapStatic.getRoleName = RoleType.getRoleName;
            MapStatic.getRoleSign = RoleType.getRoleSign;
            MapStatic.removeNickNameSuffix = _data.player.removeNickNameSuffix;
            ItemTipSprite.iTip = this.tip.iTip;
            BoxGrid.itip = this.tip.iTip;
            BoxGrid.dragLayer = structure.tip;
            SoundEffect.url = URI.soundEffectUrl;
            SoundEffect.onVersion = URI.getVersion;
            SoundEffect.load();
            SoundManage.getVersion = URI.getVersion;
            this.initEvent();
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
            return ([ActivitiesView, CampWarView, HeroesWarView, ChooseRolesView, FactionWarView, GetPeachView, InCampWarView, LodgeView, MiniFactionWarView, MissionFailedTipsView, MultiWarView, MultiMissionView, PKWarView, PreventIndulgeView, SuperSportView, SuperSportWarView, SportWarView, StrategyWarView, StudyStuntView, WarView, WorldBossWarView, ZodiacView, ZodiacWarView, ActivitiesShowView]);
        }
        public function get coexistViews():Array{
            return ([[AudienceView, FriendChatView, FriendListView, OtherRoleMsgView, RoleMsgView], [OtherRoleMsgView, RoleMsgView, ImmortalityMsgView], [RoleMsgView, MyFactionView, OtherRoleMsgView], [RoleMsgView, TrainingView, AchievementView], [RoleMsgView, MyFlowerRecordView], [RoleMsgView, ArmsGoldView], [PackView, ArmsGoldView], [RoleMsgView, OtherRoleMsgView, RoleDetailInfoView], [OtherRoleMsgView, PlayerCompareView], [PackView, WarehouseView], [PackView, ShopView], [RoleMsgView, PackView], [RoleMsgView, RefineView], [RoleMsgView, DuJieView], [OtherRoleMsgView, ServerWarRecordView], [FateView, RoleMsgView], [WorldView, TravelEventView], [GameHelperView, RuneView], [GameHelperView, DailyQuestView], [FactionBlessingView, RoleMsgView, OtherRoleMsgView], [FactionWarSignUpView, FactionWarSignUpListView], [FactionWindowView, FactionBossSelectView], [ImmortalityMsgView, InheritView], [GoldOilShopView, ZodiacView], [SealSoulView, SealStoneShopView], [SealStoneShopView, TowerView], [SealStoneView, TowerView]]);
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
            if (this.drama.inStage == true){
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
            if (_arg1.keyCode == Keyboard.ESCAPE){
                _structure.popup.closeAll();
            } else {
                if (_arg1.keyCode == Keyboard.ENTER){
                } else {
                    if (_arg1.keyCode == 192){
                    } else {
                        if (_arg1.keyCode == 67){
                            SoundEffect.play(SoundEffect.Button);
                            this.roleMsg.switchSelf();
                        } else {
                            if (_arg1.keyCode == 66){
                                SoundEffect.play(SoundEffect.Button);
                                this.pack.switchSelf();
                            } else {
                                if (_arg1.keyCode == 70){
                                    if (FunctionType.isOpened(FunctionType.Upgrade)){
                                        SoundEffect.play(SoundEffect.Button);
                                        this.upgrade.switchSelf();
                                    };
                                } else {
                                    if (_arg1.keyCode == 69){
                                        if (FunctionType.isOpened(FunctionType.Deploy)){
                                            SoundEffect.play(SoundEffect.Button);
                                            this.superDeploy.switchSelf();
                                        };
                                    } else {
                                        if (_arg1.keyCode == 84){
                                            if (FunctionType.isOpened(FunctionType.Research)){
                                                SoundEffect.play(SoundEffect.Button);
                                                this.research.switchSelf();
                                            };
                                        } else {
                                            if (_arg1.keyCode == 88){
                                                if (FunctionType.isOpened(FunctionType.Fate)){
                                                    SoundEffect.play(SoundEffect.Button);
                                                    this.fate.switchSelf();
                                                };
                                            } else {
                                                if (_arg1.keyCode == 89){
                                                    if (FunctionType.isOpened(FunctionType.SealSoul)){
                                                        SoundEffect.play(SoundEffect.Button);
                                                        this.sealSoul.switchSelf();
                                                    };
                                                } else {
                                                    if (_arg1.keyCode == 82){
                                                        if (FunctionType.isOpened(FunctionType.Farm)){
                                                            SoundEffect.play(SoundEffect.Button);
                                                            this.farm.switchSelf();
                                                        };
                                                    } else {
                                                        if (_arg1.keyCode == 81){
                                                            SoundEffect.play(SoundEffect.Button);
                                                            this.quest.switchSelf();
                                                        } else {
                                                            if (_arg1.keyCode == 86){
                                                                if (FunctionType.isOpened(FunctionType.Friend)){
                                                                    SoundEffect.play(SoundEffect.Button);
                                                                    this.friendList.switchSelf();
                                                                };
                                                            } else {
                                                                if (_arg1.keyCode == 71){
                                                                    if (FunctionType.isOpened(FunctionType.Faction)){
                                                                        SoundEffect.play(SoundEffect.Button);
                                                                        this.myFaction.switchSelf();
                                                                    };
                                                                } else {
                                                                    if (_arg1.keyCode == 90){
                                                                        if (FunctionType.isOpened(FunctionType.Practice)){
                                                                            SoundEffect.play(SoundEffect.Button);
                                                                            this.toolbar.switchPractice();
                                                                        };
                                                                    } else {
                                                                        if (_arg1.keyCode == 80){
                                                                            if (FunctionType.isOpened(FunctionType.PetAnimal)){
                                                                                SoundEffect.play(SoundEffect.Button);
                                                                                this.pet.switchSelf();
                                                                            };
                                                                        } else {
                                                                            if (_arg1.keyCode == 72){
                                                                                if (FunctionType.isOpened(FunctionType.StudyStunt)){
                                                                                    SoundEffect.play(SoundEffect.Button);
                                                                                    this.studyStunt.switchSelf();
                                                                                };
                                                                            } else {
                                                                                if ((((_arg1.keyCode == Keyboard.UP)) && (Shortcut.moveUp()))){
                                                                                    this._hasKeyDown = false;
                                                                                    return;
                                                                                };
                                                                                if ((((_arg1.keyCode == Keyboard.DOWN)) && (Shortcut.moveDown()))){
                                                                                    this._hasKeyDown = false;
                                                                                    return;
                                                                                };
                                                                                if ((((_arg1.keyCode == Keyboard.SPACE)) && (Shortcut.execute()))){
                                                                                    this._hasKeyDown = false;
                                                                                    return;
                                                                                };
                                                                                if (_arg1.keyCode == Keyboard.HOME){
                                                                                } else {
                                                                                    if (_arg1.keyCode == 85){
                                                                                    };
                                                                                };
                                                                            };
                                                                        };
                                                                    };
                                                                };
                                                            };
                                                        };
                                                    };
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
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
                } catch(e:ErrorEvent) {
                };
                try {
                    missionMap.clear();
                } catch(e:ErrorEvent) {
                };
                try {
                    toolbar.close();
                } catch(e:ErrorEvent) {
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
        private function initContextMenu():void{
            var _local1:ContextMenu = new ContextMenu();
            _local1.customItems.push(this.contextMenuItem(ViewLang.WebSite, URI.webSiteUrl));
            _local1.customItems.push(this.contextMenuItem(ViewLang.BBS, URI.bbsUrl));
            _local1.customItems.push(this.contextMenuItem(Lang.sprintf(ViewLang.Version, "1.0.1"), "", false));
            _local1.customItems.push(this.contextMenuItem(ViewLang.Company, "", false));
            var _local2:Object = stage.getChildAt(0);
            _local2.contextMenu = _local1;
        }
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
        public function showTip(_arg1:String, _arg2:String=null, _arg3:int=5):void{
            this.tip2.showTip(htmlFormat(_arg1, 14, 2272312, true), _arg2, _arg3);
        }
        public function hideTip():void{
            this.tip2.hideTip();
        }
        public function get vipEnabled():Boolean{
            if (VIPType.enabled == false){
                this.showTip(ViewLang.VipEnabled);
                return (false);
            };
            return (true);
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
        private function initJSHandler():void{
        }
        public function firstLogin(_arg1:Boolean):void{
            if (ExternalInterface.available){
                ExternalInterface.call("firstLogin", ((_arg1) || (false)));
            };
        }
        public function switchToBaiDu():void{
            if (ExternalInterface.available){
                ExternalInterface.call("switchToBaiDu");
            };
        }
        public function addToFavorite():void{
            if (ExternalInterface.available){
                ExternalInterface.call("addToFavorite");
            };
        }
        public function switchWeiBoFriend(_arg1:Boolean):void{
            if (ExternalInterface.available){
                ExternalInterface.call("switchWeiBoFriend", _arg1);
            };
        }
        public function sendWeiBo(_arg1:String, _arg2:String, _arg3:String, _arg4:String, _arg5:String, _arg6:String, _arg7:String):void{
            if (ExternalInterface.available){
                ExternalInterface.call("sendWeiBo", _arg1, _arg2, _arg3, _arg4, _arg5, _arg6, _arg7);
            };
        }
        public function mapSwitched(_arg1:uint):void{
            this.initLoading.close();
            this.delayMessage.checkVisible();
            this.guide.checkVisible();
            this.processTip.checkVisible();
            this.toolbar.miniMap.content.visible = false;
            this.toolbar.world_war_top_login_back();
            this.activitiesShow.removeChildren();
            switch (_arg1){
                case MapViewBase.Town:
                    this.activities.activityVisible = true;
                    this.toolbar.miniMap.content.visible = true;
                    this.chat.visiblePost = true;
                    this.toolbar.playerDataVisible = true;
                    this.toolbar.functionLinkVisible = true;
                    this.toolbar.loadQuestTraceInTown();
                    this.toolbar.repositionInTown();
                    this.triggerDelayed(DelayType.WayFinding, DelayType.AutoEnterMission, DelayType.MoveToPortal, DelayType.OpenFunction, DelayType.PartnersCount, DelayType.Partners, DelayType.Research, DelayType.StudyStunt);
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
                    this.guide.hideAlongGuide();
                    break;
                case MapViewBase.WorldBoss:
                    this.activities.activityVisible = false;
                    this.toolbar.questTraceVisible = false;
                    this.toolbar.reposition();
                    break;
                case MapViewBase.FactionWar:
                    this.activities.activityVisible = false;
                    this.chat.visiblePost = false;
                    this.chat.changeChannel(Mod_Chat_Base.ACTIVITY);
                    this.toolbar.questTraceVisible = false;
                    this.toolbar.playerDataVisible = false;
                    this.toolbar.functionLinkVisible = false;
                    this.toolbar.repositionInTown();
                    break;
            };
        }

    }
}//package com 

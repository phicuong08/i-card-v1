/**
 * SmartFoxServer 2X Examples - BuddyMessenger
 * http://www.smartfoxserver.com
 * (c) 2011 gotoAndPlay
 */



import SoundSystem.*;

import achievement_system.*;

import auction_system.*;

import beginner_guide.*;

import buff_system.*;

import card_smelt.*;

import chat_system.*;

import cmodule.lua_wrapper.flash_delegate;

import combat_element.*;

import combat_element_script.*;

import competition.*;

import custom_control1.*;

import debug1.*;
import flash.events.Event;

import mx.collections.ArrayCollection;
import mx.controls.Alert;
import mx.managers.PopUpManager;
import mx.core.*;

import flash.accessibility.*;
import flash.debugger.*;
import flash.display.*;
import flash.errors.*;
import flash.events.*;
import flash.external.*;
import flash.geom.*;
import flash.media.*;
import flash.net.*;
import flash.printing.*;
import flash.profiler.*;
import flash.system.*;
import flash.text.*;
import flash.ui.*;
import flash.utils.*;
import flash.xml.*;

import item_system.*;

import mouse_keyboard_mgr.*;

import mx.binding.*;
import mx.core.*;
import mx.core.FlexGlobals;

import mx.events.*;
import mx.filters.*;
import mx.managers.*;
import mx.styles.*;
import mx.effects.Sequence;
import mx.effects.AnimateProperty;
import normal_window.*;

import shop_system.*;

import skins.*;

import source_manager.*;

import spark.components.*;

import task.*;

import task_guide.*;

import tool.*;

import train_system.*;

import ui_element.*;

import web_service.*;


//[Embed(source="assets/icon_available.png")]
//public static var iconAvailable:Class;

//[Bindable]
//public function set isBuddyListInited(value:Boolean):void
//{
//	_isBuddyListInited = value;
//}
//
//public function get isBuddyListInited():Boolean
//{
//	return _isBuddyListInited;
//}



public static const isDebugMode:Boolean = false;

private static var _instance:TCGClient;
private static var _watcherSetupUtil:IWatcherSetupUtil2;
private static var _skinParts1:Object = {
	contentGroup:false,
	controlBarGroup:false
};

private var __moduleFactoryInitialized_:Boolean = false;
private var initLoadingBar:ApplicationLoadingBar;
private var mainGroupBasicElementNum:int;
public var customCurrentState:String = "init";
public var loginWindow:LoginWindowSimple;
public var mainMenu:MainMenuWindow;
public var roomsList:RoomsList;
public var roomWindow:RoomWindow;
public var judgeCard:JudgeCards;
public var trainList:TrainListWindow;
public var combatStage:CombatStage;
public var stateWindowInfo:Object;




private var _93650647bgMap:SmoothImage;
private var _97474bgg:UIComponent;
private var _1555465880chatWindow:ChatWindow;

private var _547777289debugBtn:DebugShowBtn;
private var _273241018mainGroup:MyGroup;
private var _274144980operationBar:BasicOperationBar;
private var _335484983shakeEffect:Sequence;




private var _embed_mxml_source_backgroundImages______png_432151424:Class;
private var _embed_mxml_source_backgroundImages______jpg_979502484:Class;




var target:* = null;
var watcherSetupUtilClass:* = null;
loginWindow = new LoginWindowSimple();
mainMenu = new MainMenuWindow();
roomsList = new RoomsList();
roomWindow = new RoomWindow();
judgeCard = new JudgeCards();
trainList = new TrainListWindow();
combatStage = new CombatStage();
stateWindowInfo = {
	init:null,
	loginWindow:loginWindow,
		mainMenu:mainMenu,
		competitionHall:null,
		roomsList:roomsList,
		roomWindow:roomWindow,
		combatStage:combatStage,
		judgeCard:judgeCard,
		trainList:trainList,
		shopWindow:null,
		guideMapWindow:null,
		auctionWindow:null,
		smeltWindow:null,
		common:null,
		loadingWindow:null
};
_embed_mxml_source_backgroundImages______png_432151424 = newTCGClient__embed_mxml_source_backgroundImages______png_432151424;
_embed_mxml_source_backgroundImages______jpg_979502484 = newTCGClient__embed_mxml_source_backgroundImages______jpg_979502484;



public static function getInstance():TCGClient{
	return (_instance);
}
public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
	TCGClient._watcherSetupUtil = _arg1;
}

override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
	var factory:* = _arg1;
	super.moduleFactory = factory;
	if (this.__moduleFactoryInitialized_){
		return;
	};
	this.__moduleFactoryInitialized_ = true;
	if (!this.styleDeclaration){
		this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
	};
	this.styleDeclaration.defaultFactory = function ():void{
		this.backgroundColor = 1578515;
	};
	mx_internal::_newTCGClient_StylesInit();
}
override public function initialize():void{
	super.initialize();
}
private function init():void{
	_instance = this;
}

public function changeCurrentState(_arg1:String):void{
	if (_arg1 == this.customCurrentState){
		return;
	};
	dispatchEvent(new CustomStateChangeEvent(_arg1, this.customCurrentState));
	if (((this.stateWindowInfo[this.customCurrentState]) && ((this.stateWindowInfo[this.customCurrentState].parent == this.mainGroup)))){
		this.mainGroup.removeElement(this.stateWindowInfo[this.customCurrentState]);
	};
	if (this.stateWindowInfo[_arg1]){
		this.mainGroup.addElement(this.stateWindowInfo[_arg1]);
	};
	this.customCurrentState = _arg1;
}

public function enterWindowByCustomCurrentState(_arg1:String):void{
	switch (_arg1){
		case "loginWindow":
			this.enterLoginWindow();
			break;
		case "mainMenu":
			this.enterMainMenu();
			break;
		case "competitionHall":
			this.enterCompetitionHall();
			break;
		case "roomsList":
			this.enterRoomsListWindow();
			break;
		case "roomWindow":
			this.enterRoom((this.roomWindow.roomType) ? this.roomWindow.roomType : "normal");
			break;
		case "combatStage":
			this.enterCombatStage();
			break;
		case "judgeCard":
			this.enterJudgeCardsWindow((JudgeCards.lastCustomCurrentState) ? JudgeCards.lastCustomCurrentState : "mainMenu");
			break;
		case "trainList":
			this.enterTrainListWindow();
			break;
		case "shopWindow":
			this.showShopWindow();
			break;
		case "auctionWindow":
			this.showAuctionWindow();
			break;
		case "smeltWindow":
			this.showSmeltWindow();
			break;
		case "guideMapWindow":
			this.showGuideMapWindow();
			break;
	};
}


private function checkStageSize():void{
	var selectHandler:* = function (_arg1:Array):Boolean{
		if (_arg1[0]){
			GameOptionsWindnow.scaleWithBrowserFlag = true;
		};
		return (true);
	};
	if ((((width < 0x0500)) || ((height < 800)))){
		this.resizeByWindow(true);
		callLater(this.resizePointBg);
	};
}
private function addBackGround():void{
	this.bgg.addChild(new BackGroudPointImageForFlex());
	this.initLoadingBar = new ApplicationLoadingBar();
	this.initLoadingBar.depth = 5;
	this.mainGroup.addElement(this.initLoadingBar);
	this.initLoadingBar.setLoadingProgress(0.82);
	this.initLoadingBar.addEventListener(FlexEvent.REMOVE, this.initCompleteHandler);
}
private function createComplete():void{
	HeXie.init();
	MouseMgr.getInstance().init();
	KeyboardMgr.getInstance().init(stage);
	this.addBackGround();
	this.checkStageSize();
	MySocket.getInstance().builderSocket();
	ToolTipManager.showDelay = 200;
	ToolTipManager.scrubDelay = 0;
	ToolTipManager.toolTipClass = MyToolTipWindow;
	var _local1:ImagePreloadManager = new ImagePreloadManager();
	_local1.loadImageWhenInit();
	TipManager.buildTipConfig();
	CardsInfo.buildCardsInfo();
	ShopLib.buildShopConfig();
	GuideLib.buildGuideConfig();
	GuideLib.buildGuideFlashConfig();
	AchievementLib.buildAchievementConfig();
	LuaAgent.getInstance().addEventListener(LuaAgent.LUA_FILE_UPDATE_COMPLETE, this.luaComplete);
	LuaAgent.getInstance().addEventListener(LuaAgent.UPDATE_ONE_LUAFILE, this.luaProgress);
	LuaAgent.getInstance().createLua();
	this.setMainGroupTransForm();
}
private function initCompleteHandler(_arg1:FlexEvent):void{
	this.initLoadingBar.removeEventListener(FlexEvent.REMOVE, this.initCompleteHandler);
	this.initLoadingBar = null;
	this.enterLoginWindow();
}
private function luaProgress(_arg1:Event):void{
	var _local2:LuaAgent = (_arg1.target as LuaAgent);
	this.initLoadingBar.setLoadingProgress((0.82 + (((_local2.totalFileNum - _local2.nameList.length) / _local2.totalFileNum) * 0.179)));
}
private function luaComplete(_arg1:Event):void{
	var _local2:LuaAgent = (_arg1.target as LuaAgent);
	_local2.removeEventListener(LuaAgent.UPDATE_ONE_LUAFILE, this.luaProgress);
	_local2.removeEventListener(LuaAgent.LUA_FILE_UPDATE_COMPLETE, this.luaComplete);
	this.changeCurrentState("combatStage");
	this.changeCurrentState("common");
	CombatStageSourceMgr.getInstance().loadSwfFile();
	SoundSource.startLoadAllSound();
	this.initLoadingBar.setLoadingProgress(1);
}
private function setMainGroupTransForm():void{
	var _local1:PerspectiveProjection = new PerspectiveProjection();
	_local1.fieldOfView = 30;
	_local1.projectionCenter = new Point(640, 400);
	this.mainGroup.transform.perspectiveProjection = _local1;
}
private function stageResizeHanlder():void{
	this.resizeByWindow(true);
}
public function resizeByWindow(_arg1:Boolean):void{
	var _local2:Number;
	var _local3:Number;
	var _local4:Number;
	if (this.bgg == null){
		return;
	};
	if (_arg1){
		_local2 = (this.width / 0x0500);
		_local3 = (this.height / 800);
		_local4 = ((_local2 > _local3)) ? _local3 : _local2;
		if (!GameOptionsWindnow.scaleWithBrowserFlag){
			_local4 = ((_local4 > 1)) ? 1 : _local4;
		};
		this.mainGroup.scaleX = _local4;
		this.mainGroup.scaleY = _local4;
		this.bgg.scaleX = (1 / _local4);
		this.bgg.scaleY = (1 / _local4);
		callLater(this.chatWindow.resetWindowXYPos);
	} else {
		this.mainGroup.scaleX = 1;
		this.mainGroup.scaleY = 1;
		this.bgg.scaleX = 1;
		this.bgg.scaleY = 1;
	};
}
public function resizePointBg():void{
	if (this.bgg == null){
		return;
	};
	var _local1:BackGroudPointImageForFlex = (this.bgg.getChildAt(0) as BackGroudPointImageForFlex);
	if (_local1){
		_local1.drawImage();
	};
}
protected function application1_deactivateHandler(_arg1:Event):void{
	var bgV:* = NaN;
	var efV:* = NaN;
	var resetVol:* = null;
	var event:* = _arg1;
	if (!GameOptionsWindnow.deactivateMusicOnFlag){
		resetVol = function (_arg1:Event):void{
			removeEventListener(Event.ACTIVATE, resetVol);
			SoundMgr.getInstance().bgVolume = bgV;
			SoundMgr.getInstance().effectVolume = efV;
		};
		bgV = SoundMgr.getInstance().bgVolume;
		efV = SoundMgr.getInstance().effectVolume;
		if ((((bgV == 0)) && ((efV == 0)))){
			return;
		};
		SoundMgr.getInstance().bgVolume = 0;
		SoundMgr.getInstance().effectVolume = 0;
		addEventListener(Event.ACTIVATE, resetVol);
	};
}

public function showWindowByUserState(_arg1:Boolean=false):void{
	UserObject.isNewUser = _arg1;
	if (_arg1){
		this.showSelectCardWindow();
	} else {
		this.enterMainMenu();
		this.chatWindow.moveOut(true);
		this.operationBar.moveOut(true);
	};
}
public function enterCommonState():void{
	this.changeCurrentState("common");
}
public function showSelectCardWindow():void{
	var b:* = null;
	var removeSelectCardWindow:* = null;
	var w:* = null;
	if (BasicCardSelectWindowSourceMgr.getInstance().loadingComplete){
		removeSelectCardWindow = function (_arg1:CustomStateChangeEvent):void{
			if (_arg1.newState != "loginWindow"){
				chatWindow.moveOut(true);
				operationBar.moveOut(true);
			};
			removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, removeSelectCardWindow);
			var _local2:* = b.parent;
			if (_local2){
				_local2.removeElement(b);
			};
		};
		this.enterCommonState();
		b = new BasicCardSelectWindow();
		this.mainGroup.addElement(b);
		addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, removeSelectCardWindow);
	} else {
		this.changeCurrentState("loadingWindow");
		w = new BasicCardSelectWindowLoadingBar();
		this.mainGroup.addElement(w);
	};
}
public function showCreateUserWindow():void{
	this.enterCommonState();
	this.mainGroup.addElement(new CreateUserWindow());
}
public function showGuideMapWindow():void{
	var a:* = null;
	var stateChange:* = null;
	var w:* = null;
	if (GuideMapWindowSourceMgr.getInstance().loadingComplete){
		stateChange = function (_arg1:CustomStateChangeEvent):void{
			removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
			var _local2:* = a.parent;
			if (_local2){
				_local2.removeElement(a);
			};
		};
		a = new GuideMapWindow();
		this.changeCurrentState("guideMapWindow");
		this.mainGroup.addElement(a);
		addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
	} else {
		this.changeCurrentState("loadingWindow");
		w = new GuideMapWindowLoadingBar();
		this.mainGroup.addElement(w);
	};
}
public function showShopWindow():void{
	var s:* = null;
	var stateChange:* = null;
	var w:* = null;
	if (ShopMainWindowSourceMgr.getInstance().loadingComplete){
		stateChange = function (_arg1:CustomStateChangeEvent):void{
			removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
			s.removeSelf();
		};
		this.changeCurrentState("shopWindow");
		s = new ShopMainWindow();
		this.mainGroup.addElement(s);
		addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
	} else {
		this.changeCurrentState("loadingWindow");
		w = new ShopMainWindowLoadingBar();
		this.mainGroup.addElement(w);
	};
}
public function showAuctionWindow():void{
	var stateChange:* = null;
	stateChange = function (_arg1:CustomStateChangeEvent):void{
		removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
		AuctionMgr.getInstance().hideAuctionMainWindow();
	};
	this.changeCurrentState("auctionWindow");
	AuctionMgr.getInstance().showAuctionMainWindow();
	addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
}
public function showSmeltWindow():void{
	var stateChange:* = null;
	var w:* = null;
	if (JudgeCardsSourceMgr.getInstance().loadingComplete){
		stateChange = function (_arg1:CustomStateChangeEvent):void{
			removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
			CardSmeltMgr.getInstance().hideSmeltMainWindow();
		};
		this.changeCurrentState("smeltWindow");
		CardSmeltMgr.getInstance().showSmeltMainWindow();
		addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
	} else {
		this.changeCurrentState("loadingWindow");
		w = new JudgeCardsLoadingBar();
		this.mainGroup.addElement(w);
	};
}
public function enterLoginWindow():void{
	this.changeCurrentState("loginWindow");
}
public function enterMainMenu():void{
	var _local1:MainMenuWindowLoadingBar;
	if (MainMenuWindowSourceMgr.getInstance().loadingComplete){
		this.changeCurrentState("mainMenu");
	} else {
		this.changeCurrentState("loadingWindow");
		_local1 = new MainMenuWindowLoadingBar();
		this.mainGroup.addElement(_local1);
	};
}
public function enterCompetitionHall():void{
	var a:* = null;
	var stateChange:* = null;
	var w:* = null;
	if (this.customCurrentState != "competitionHall"){
		if (CompetitionHallSourceMgr.getInstance().loadingComplete){
			stateChange = function (_arg1:CustomStateChangeEvent):void{
				removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
				var _local2:* = a.parent;
				if (_local2){
					_local2.removeElement(a);
				};
			};
			this.changeCurrentState("competitionHall");
			a = CompetitionMgr.getInstance().getCompetitionWindow();
			this.mainGroup.addElement(a);
			addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, stateChange);
		} else {
			this.changeCurrentState("loadingWindow");
			w = new CompetitionHallLoadingBar();
			this.mainGroup.addElement(w);
		};
	};
}
public function enterRoomsListWindow():void{
	var _local1:RoomsListLoadingBar;
	if (RoomsListSourceMgr.getInstance().loadingComplete){
		this.changeCurrentState("roomsList");
	} else {
		this.changeCurrentState("loadingWindow");
		_local1 = new RoomsListLoadingBar();
		this.mainGroup.addElement(_local1);
	};
}
public function enterRoom(_arg1:String=null):void{
	var _local2:RoomWindowLoadingBar;
	if (_arg1){
		this.roomWindow.roomType = _arg1;
	};
	if (RoomWindowSourceMgr.getInstance().loadingComplete){
		this.changeCurrentState("roomWindow");
	} else {
		this.changeCurrentState("loadingWindow");
		_local2 = new RoomWindowLoadingBar();
		this.mainGroup.addElement(_local2);
	};
}
public function enterJudgeCardsWindow(_arg1:String=null):void{
	var _local2:JudgeCardsLoadingBar;
	if (_arg1){
		JudgeCards.lastCustomCurrentState = _arg1;
	};
	if (JudgeCardsSourceMgr.getInstance().loadingComplete){
		this.changeCurrentState("judgeCard");
	} else {
		this.changeCurrentState("loadingWindow");
		_local2 = new JudgeCardsLoadingBar();
		this.mainGroup.addElement(_local2);
	};
}
public function enterTrainListWindow():void{
	var _local1:TrainListWindowLoadingBar;
	if (TrainListWindowSourceMgr.getInstance().loadingComplete){
		if (!this.trainList.parent){
			this.trainList.alpha = 0;
		};
		this.changeCurrentState("trainList");
	} else {
		this.changeCurrentState("loadingWindow");
		_local1 = new TrainListWindowLoadingBar();
		this.mainGroup.addElement(_local1);
	};
}
public function enterCombatStage():void{
	var _local1:CombatStageLoadingBar;
	if (CombatStageSourceMgr.getInstance().loadingComplete){
		SoundMgr.getInstance().playBgSound("bg_duel");
		if (!this.combatStage.parent){
			this.combatStage.alpha = 0;
		};
		this.changeCurrentState("combatStage");
	} else {
		this.changeCurrentState("loadingWindow");
		_local1 = new CombatStageLoadingBar();
		this.mainGroup.addElement(_local1);
	};
}
public function duelBegin(_arg1:String):void{
	ChatWindowMgr.getInstance().addSystemContent("开始对战。");
	CombatConsole.getInstance().clearConsole();
	this.combatStage.cleanStage();
	CombatConsole.getInstance().addActionList([1300, [this.enterCombatStage], [this.combatStage.setStageInfo]]);
	CombatConsole.getInstance().addActionList([1500, [CombatStageCommonEffectMgr.showDuelBeginEffect]]);
	if (_arg1 == "a"){
		CombatConsole.getInstance().showCoinRotationEffect(true);
		CombatConsole.getInstance().showMessage("firstPlayer");
	} else {
		if (_arg1 == "b"){
			CombatConsole.getInstance().showCoinRotationEffect(false);
			CombatConsole.getInstance().showMessage("secondPlayer");
		};
	};
}
public function guideBegin(_arg1:int):void{
	this.combatStage.cleanStage();
	GuideSystem.getInstance().guideStart(_arg1);
	var _local2 = (("u.guide_mgr:start_guide(" + _arg1) + ")");
	LuaAgent.getInstance().run(_local2);
}
public function logout(_arg1:Boolean=true):void{
	if (_arg1){
		MySocket.getInstance().sendMsgToServer("logout:");
	};
	LuaAgent.getInstance().run("g_all_user = {}; u = nil;");
	GuideSystem.getInstance().guideClean();
	TrainSystem.getInstance().trainClean();
	CombatConsole.getInstance().clearConsole();
	if (this.customCurrentState != "loginWindow"){
		this.clearMainGroup();
		this.enterLoginWindow();
		this.chatWindow.moveOut(false);
		this.operationBar.moveOut(false);
		BuffSystem.getInstance().reset();
		ItemMgr.getInstance().reset();
		TaskMgr.getInstance().reset();
		BeginnerGuideUtil.reset();
	};
}
private function clearMainGroup():void{
	CommonUtil.cleanGroupElements(this.mainGroup, this.mainGroupBasicElementNum);
}
private function _newTCGClient_Sequence1_i():Sequence{
	var _local1:Sequence = new Sequence();
	_local1.duration = 20;
	_local1.children = [this._newTCGClient_AnimateProperty1_c(), this._newTCGClient_AnimateProperty2_c(), this._newTCGClient_AnimateProperty3_c(), this._newTCGClient_AnimateProperty4_c(), this._newTCGClient_AnimateProperty5_c(), this._newTCGClient_AnimateProperty6_c(), this._newTCGClient_AnimateProperty7_c(), this._newTCGClient_AnimateProperty8_c()];
	this.shakeEffect = _local1;
	BindingManager.executeBindings(this, "shakeEffect", this.shakeEffect);
	return (_local1);
}
private function _newTCGClient_AnimateProperty1_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = 0;
	_local1.toValue = 15;
	_local1.duration = 10;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty2_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = 10;
	_local1.toValue = -10;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty3_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = -10;
	_local1.toValue = 10;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty4_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = 10;
	_local1.toValue = -10;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty5_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = -10;
	_local1.toValue = 8;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty6_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = 8;
	_local1.toValue = -6;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty7_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = -6;
	_local1.toValue = 4;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_AnimateProperty8_c():AnimateProperty{
	var _local1:AnimateProperty = new AnimateProperty();
	_local1.property = "horizontalCenter";
	_local1.fromValue = 4;
	_local1.toValue = 0;
	_local1.duration = 10;
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_Array2_c():Array{
	var _local1:Array = [this._newTCGClient_MyGroup1_i(), this._newTCGClient_ChatWindow1_i()];
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_MyGroup1_i():MyGroup{
	var _local1:MyGroup = new MyGroup();
	_local1.width = 0x0500;
	_local1.height = 800;
	_local1.horizontalCenter = 0;
	_local1.verticalCenter = 0;
	_local1.mxmlContent = [this._newTCGClient_UIComponent1_i(), this._newTCGClient_BackGroundFrameUIComponentWindow1_c(), this._newTCGClient_SmoothImage1_i(), this._newTCGClient_SmoothBitmapImage1_c(), this._newTCGClient_SmoothBitmapImage2_c(), this._newTCGClient_DebugShowBtn1_i(), this._newTCGClient_debugWindow1_i(), this._newTCGClient_BasicOperationBar1_i()];
	_local1.addEventListener("creationComplete", this.__mainGroup_creationComplete);
	_local1.id = "mainGroup";
	if (!_local1.document){
		_local1.document = this;
	};
	this.mainGroup = _local1;
	BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
	return (_local1);
}
private function _newTCGClient_UIComponent1_i():UIComponent{
	var _local1:UIComponent = new UIComponent();
	_local1.depth = 2;
	_local1.id = "bgg";
	if (!_local1.document){
		_local1.document = this;
	};
	this.bgg = _local1;
	BindingManager.executeBindings(this, "bgg", this.bgg);
	return (_local1);
}
private function _newTCGClient_BackGroundFrameUIComponentWindow1_c():BackGroundFrameUIComponentWindow{
	var _local1:BackGroundFrameUIComponentWindow = new BackGroundFrameUIComponentWindow();
	_local1.depth = 2;
	if (!_local1.document){
		_local1.document = this;
	};
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_SmoothImage1_i():SmoothImage{
	var _local1:SmoothImage = new SmoothImage();
	_local1.source = this._embed_mxml_source_backgroundImages______jpg_979502484;
	_local1.mouseEnabled = false;
	_local1.mouseChildren = false;
	_local1.id = "bgMap";
	if (!_local1.document){
		_local1.document = this;
	};
	this.bgMap = _local1;
	BindingManager.executeBindings(this, "bgMap", this.bgMap);
	return (_local1);
}
private function _newTCGClient_SmoothBitmapImage1_c():SmoothBitmapImage{
	var _local1:SmoothBitmapImage = new SmoothBitmapImage();
	_local1.horizontalCenter = 0;
	_local1.source = this._embed_mxml_source_backgroundImages______png_432151424;
	_local1.initialized(this, null);
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_SmoothBitmapImage2_c():SmoothBitmapImage{
	var _local1:SmoothBitmapImage = new SmoothBitmapImage();
	_local1.horizontalCenter = 0;
	_local1.rotation = 180;
	_local1.bottom = 0;
	_local1.source = this._embed_mxml_source_backgroundImages______png_432151424;
	_local1.initialized(this, null);
	BindingManager.executeBindings(this, "temp", _local1);
	return (_local1);
}
private function _newTCGClient_DebugShowBtn1_i():DebugShowBtn{
	var _local1:DebugShowBtn = new DebugShowBtn();
	_local1.id = "debugBtn";
	if (!_local1.document){
		_local1.document = this;
	};
	this.debugBtn = _local1;
	BindingManager.executeBindings(this, "debugBtn", this.debugBtn);
	return (_local1);
}
private function _newTCGClient_debugWindow1_i():debugWindow{
	var _local1:debugWindow = new debugWindow();
	_local1.x = 1040;
	_local1.y = 50;
	_local1.visible = false;
	_local1.id = "debug";
	if (!_local1.document){
		_local1.document = this;
	};
	this.debug = _local1;
	BindingManager.executeBindings(this, "debug", this.debug);
	return (_local1);
}
private function _newTCGClient_BasicOperationBar1_i():BasicOperationBar{
	var _local1:BasicOperationBar = new BasicOperationBar();
	_local1.id = "operationBar";
	if (!_local1.document){
		_local1.document = this;
	};
	this.operationBar = _local1;
	BindingManager.executeBindings(this, "operationBar", this.operationBar);
	return (_local1);
}
public function __mainGroup_creationComplete(_arg1:FlexEvent):void{
	this.mainGroupBasicElementNum = this.mainGroup.numElements;
}
private function _newTCGClient_ChatWindow1_i():ChatWindow{
	var _local1:ChatWindow = new ChatWindow();
	_local1.id = "chatWindow";
	if (!_local1.document){
		_local1.document = this;
	};
	this.chatWindow = _local1;
	BindingManager.executeBindings(this, "chatWindow", this.chatWindow);
	return (_local1);
}

private function _newTCGClient_bindingsSetup():Array{
	var result:* = [];
	result[0] = new Binding(this, null, null, "shakeEffect.target", "mainGroup");
	result[1] = new Binding(this, function ():Number{
		return (((0x0500 - width) / 2));
	}, null, "bgg.x");
	result[2] = new Binding(this, function ():Number{
		return (((800 - height) / 2));
	}, null, "bgg.y");
	result[3] = new Binding(this, function ():Number{
		return ((width / 2));
	}, null, "bgg.transformX");
	result[4] = new Binding(this, function ():Number{
		return ((height / 2));
	}, null, "bgg.transformY");
	return (result);
}
mx_internal function _newTCGClient_StylesInit():void{
	var style:* = null;
	var effects:* = null;
	var conditions:* = null;
	var condition:* = null;
	var selector:* = null;
	if (mx_internal::_newTCGClient_StylesInit_done){
		return;
	};
	mx_internal::_newTCGClient_StylesInit_done = true;
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("global", conditions, selector);
	style = styleManager.getStyleDeclaration("global");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.fontFamily = "宋体";
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("mx.controls.ToolTip", conditions, selector);
	style = styleManager.getStyleDeclaration("mx.controls.ToolTip");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.color = 0xFFFFFF;
			this.backgroundColor = 0x222222;
			this.fontSize = 15;
			this.backgroundAlpha = 0.7;
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("normal_window.JudgeCardDataGrid", conditions, selector);
	conditions = null;
	selector = new CSSSelector("spark.components.Button", conditions, selector);
	style = styleManager.getStyleDeclaration("normal_window.JudgeCardDataGrid spark.components.Button");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.skinClass = dataGridTitleButtonSkin;
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("spark.components.VScrollBar", conditions, selector);
	style = styleManager.getStyleDeclaration("spark.components.VScrollBar");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.skinClass = vScrollBarSkin;
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("spark.components.HScrollBar", conditions, selector);
	style = styleManager.getStyleDeclaration("spark.components.HScrollBar");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.skinClass = hScrollBarSkin;
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("spark.components.HSlider", conditions, selector);
	style = styleManager.getStyleDeclaration("spark.components.HSlider");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.skinClass = hSliderSkin;
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("spark.components.ComboBox", conditions, selector);
	style = styleManager.getStyleDeclaration("spark.components.ComboBox");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.skinClass = comboBoxSkin;
		};
	};
	selector = null;
	conditions = null;
	conditions = null;
	selector = new CSSSelector("spark.components.CheckBox", conditions, selector);
	style = styleManager.getStyleDeclaration("spark.components.CheckBox");
	if (!style){
		style = new CSSStyleDeclaration(selector, styleManager);
	};
	if (style.factory == null){
		style.factory = function ():void{
			this.skinClass = checkBoxSkin;
		};
	};
	styleManager.initProtoChainRoots();
}

protected function get skinParts():Object{
	return (_skinParts1);
}
public function get bgMap():SmoothImage{
	return (this._93650647bgMap);
}
public function set bgMap(_arg1:SmoothImage):void{
	var _local2:Object = this._93650647bgMap;
	if (_local2 !== _arg1){
		this._93650647bgMap = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgMap", _local2, _arg1));
		};
	};
}
public function get bgg():UIComponent{
	return (this._97474bgg);
}
public function set bgg(_arg1:UIComponent):void{
	var _local2:Object = this._97474bgg;
	if (_local2 !== _arg1){
		this._97474bgg = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bgg", _local2, _arg1));
		};
	};
}
public function get chatWindow():ChatWindow{
	return (this._1555465880chatWindow);
}
public function set chatWindow(_arg1:ChatWindow):void{
	var _local2:Object = this._1555465880chatWindow;
	if (_local2 !== _arg1){
		this._1555465880chatWindow = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chatWindow", _local2, _arg1));
		};
	};
}

public function get debugBtn():DebugShowBtn{
	return (this._547777289debugBtn);
}
public function set debugBtn(_arg1:DebugShowBtn):void{
	var _local2:Object = this._547777289debugBtn;
	if (_local2 !== _arg1){
		this._547777289debugBtn = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "debugBtn", _local2, _arg1));
		};
	};
}
public function get mainGroup():MyGroup{
	return (this._273241018mainGroup);
}
public function set mainGroup(_arg1:MyGroup):void{
	var _local2:Object = this._273241018mainGroup;
	if (_local2 !== _arg1){
		this._273241018mainGroup = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainGroup", _local2, _arg1));
		};
	};
}
public function get operationBar():BasicOperationBar{
	return (this._274144980operationBar);
}
public function set operationBar(_arg1:BasicOperationBar):void{
	var _local2:Object = this._274144980operationBar;
	if (_local2 !== _arg1){
		this._274144980operationBar = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "operationBar", _local2, _arg1));
		};
	};
}
public function get shakeEffect():Sequence{
	return (this._335484983shakeEffect);
}
public function set shakeEffect(_arg1:Sequence):void{
	var _local2:Object = this._335484983shakeEffect;
	if (_local2 !== _arg1){
		this._335484983shakeEffect = _arg1;
		if (this.hasEventListener("propertyChange")){
			this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "shakeEffect", _local2, _arg1));
		};
	};
}









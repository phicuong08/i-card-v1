//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import chat_system.*;
    
    import combat_element.*;
    
    import combat_element_script.*;
    
    import custom_control1.*;
    
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
    
    import mx.binding.*;
    import mx.core.*;
//    import mx.effects.*;
    import mx.events.*;
	import mx.effects.Parallel;
    import mx.filters.*;
    import mx.styles.*;
    
    import player_view.*;
    
    import source_manager.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.effects.easing.*;
    import spark.filters.*;
    import spark.layouts.*;
    
    import tool.*;
    
    import train_system.*;
    
    import ui_element.*;

    public class RoomWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _RoomWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _RoomWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _RoomWindow_Move1:Move;
        public var _RoomWindow_Move2:Move;
        public var _RoomWindow_Move3:Move;
        public var _RoomWindow_Move4:Move;
        public var _RoomWindow_Move5:Move;
        public var _RoomWindow_Move6:Move;
        public var _RoomWindow_Move7:Move;
        public var _RoomWindow_Move8:Move;
        private var _413245038addEffect:Parallel;
        private var _1649940947bounceEasing:Bounce;
        private var _94755854clock:CountdownClock;
        private var _935487553clockDesc:Label;
        private var _1901031789inviteBtn:RoomWindowFunctionButton;
        private var _720609738kickBtn:RoomWindowFunctionButton;
        private var _338668849lockBtn:RoomWindowFunctionButton;
        private var _1267520715removeEffect:Parallel;
        private var _558409586roomNameLabel:Label;
        private var _849541456roomNumberLabel:Label;
        private var _988229078topGroup:Group;
        private var _914705889user1Info2Mode:RoomWindowUserArea2Mode;
        private var _916552931user1Info4Mode:RoomWindowUserArea4Mode;
        private var _718192384user2Info2Mode:RoomWindowUserArea2Mode;
        private var _720039426user2Info4Mode:RoomWindowUserArea4Mode;
        private var _523525921user3Info4Mode:RoomWindowUserArea4Mode;
        private var _327012416user4Info4Mode:RoomWindowUserArea4Mode;
        private var _717989233viewerAreaWindow:RoomWindowViewerArea;
        private var __moduleFactoryInitialized:Boolean = false;
        private var acceptServerMsgFlag:Boolean = false;
        private var isLoading:Boolean = false;
        private var npcTrainArea:RoomWindowNpcTrainArea;
        private var userAreaList:Array;
        private var _207785457upUserAreaList:Array;
        private var _104190328downUserAreaList:Array;
        public var isMeRoomOwner:Boolean = false;
        private var _roomType:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function RoomWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoomWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RoomWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (RoomWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._RoomWindow_BasicLayout1_c();
            this.mxmlContent = [this._RoomWindow_Group2_i(), this._RoomWindow_RoomWindowViewerArea1_i()];
            this._RoomWindow_Parallel1_i();
            this._RoomWindow_Bounce1_i();
            this._RoomWindow_Parallel2_i();
            this._RoomWindow_RoomWindowUserArea2Mode1_i();
            this._RoomWindow_RoomWindowUserArea4Mode1_i();
            this._RoomWindow_RoomWindowUserArea2Mode2_i();
            this._RoomWindow_RoomWindowUserArea4Mode2_i();
            this._RoomWindow_RoomWindowUserArea4Mode3_i();
            this._RoomWindow_RoomWindowUserArea4Mode4_i();
            this.addEventListener("initialize", this.___RoomWindow_Group1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():RoomWindow{
            return (TCGClient.getInstance().roomWindow);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoomWindow._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            super.moduleFactory = _arg1;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
        }
        override public function initialize():void{
            super.initialize();
        }
        private function init():void{
            mouseChildren = false;
        }
        public function set roomType(_arg1:String):void{
            var _local2:RoomWindowUserArea;
            if (_arg1 != this._roomType){
                this._roomType = _arg1;
                if (this.userAreaList){
                    for each (_local2 in this.userAreaList) {
                        _local2.removeSelf();
                    };
                };
                if (RoomUtil.isTwoPlayerModeRoom(this._roomType)){
                    this.upUserAreaList = [this.user1Info2Mode];
                    this.downUserAreaList = [this.user2Info2Mode];
                    this.userAreaList = [this.user1Info2Mode, this.user2Info2Mode];
                } else {
                    this.upUserAreaList = [this.user1Info4Mode, this.user2Info4Mode];
                    this.downUserAreaList = [this.user3Info4Mode, this.user4Info4Mode];
                    this.userAreaList = [this.user1Info4Mode, this.user2Info4Mode, this.user3Info4Mode, this.user4Info4Mode];
                };
                for each (_local2 in this.userAreaList) {
                    addElement(_local2);
                };
            };
        }
        public function get roomType():String{
            return (this._roomType);
        }
        private function loadingStart():void{
            if (((this.isLoading) || (!((TCGClient.getInstance().customCurrentState == "roomWindow"))))){
                return;
            };
            this.isLoading = true;
            if (!RoomUtil.isCompetitionModeRoom(this.roomType)){
                LuaAgent.getInstance().run("u.hall_room_mgr:get_room_info()");
            } else {
                LuaAgent.getInstance().run("u.competition_mgr:get_room_info()");
            };
        }
        public function setRoomDetailInfo(_arg1:Object, _arg2:String):void{
            var _local3:int;
            var _local4:Object;
            this.acceptServerMsgFlag = true;
            this.isLoading = false;
            this.isMeRoomOwner = (_arg2 == _arg1["owner_name"]);
            this.roomNumberLabel.text = ("房间编号：" + RoomUtil.getRoomIndexByInfo(_arg1));
            this.roomNameLabel.text = ("房间名称：" + RoomUtil.getRoomNameByInfo(_arg1));
            _local3 = 1;
            while (_local3 <= this.userAreaList.length) {
                _local4 = _arg1["player_infos"][_local3.toString()];
                if (_local4){
                    this.addPlayerInfo(_local4, _local3, (_local4.name == _arg2), (_local4.name == _arg1["owner_name"]));
                };
                _local3++;
            };
            _local3 = 1;
            while ((_local4 = _arg1["viewer_infos"][_local3.toString()])) {
                _local3++;
                this.addViewerInfo(_local4, (_local4.name == _arg2), (_local4.name == _arg1["owner_name"]));
            };
            if (_arg1["count_down_left_time"]){
                this.addRemoveCountClock(true, _arg1["count_down_left_time"]);
            };
            this.tryAddRemoveNpcTrainArea();
        }
        public function addRemoveCountClock(_arg1:Boolean, _arg2:int=0):void{
            if (((this.clock) && (this.clockDesc))){
                if (_arg1){
                    this.clock.startClock(_arg2);
                    this.clockDesc.visible = true;
                } else {
                    this.clock.clearClock();
                    this.clockDesc.visible = false;
                };
            };
        }
        private function getUserAreaWindowByPos(_arg1:int):RoomWindowUserArea{
            if (RoomUtil.isTwoPlayerModeRoom(this.roomType)){
                return (this[(("user" + _arg1) + "Info2Mode")]);
            };
            return (this[(("user" + _arg1) + "Info4Mode")]);
        }
        public function setRoomOwner(_arg1:String=null, _arg2:Boolean=false):void{
            var _local3:RoomWindowUserArea;
            if (!this.acceptServerMsgFlag){
                return;
            };
            for each (_local3 in this.userAreaList) {
                if (((!(_local3.isEmpty)) && ((_arg1 == _local3.userInfo.name)))){
                    _local3.isMainUserWindow = true;
                    break;
                };
            };
            this.isMeRoomOwner = _arg2;
        }
        public function newUserEnterRoom(_arg1:Object, _arg2:int, _arg3:Boolean=false):void{
            this.showEnterNotice(_arg1);
            this.addPlayerInfo(_arg1, _arg2, _arg3);
            this.tryAddRemoveNpcTrainArea();
        }
        public function newViewerEnterRoom(_arg1:Object, _arg2:Boolean=false):void{
            this.showEnterNotice(_arg1);
            this.addViewerInfo(_arg1, _arg2);
        }
        private function addPlayerInfo(_arg1:Object, _arg2:int, _arg3:Boolean=false, _arg4:Boolean=false):RoomWindowUserArea{
            if (!this.acceptServerMsgFlag){
                return (null);
            };
            var _local5:RoomWindowUserArea = this.getUserAreaWindowByPos(_arg2);
            _local5.isMeFlag = _arg3;
            _local5.userInfo = _arg1;
            _local5.isMainUserWindow = _arg4;
            if (((_arg3) && (!(RoomUtil.isCompetitionModeRoom(this.roomType))))){
                this.viewerAreaWindow.setBeViewerBtnEnabled(true);
            };
            return (_local5);
        }
        private function addViewerInfo(_arg1:Object, _arg2:Boolean=false, _arg3:Boolean=false):RoomWindowViewerAreaItem{
            if (!this.acceptServerMsgFlag){
                return (null);
            };
            if (_arg2){
                this.viewerAreaWindow.setBeViewerBtnEnabled(false);
            };
            return (this.viewerAreaWindow.addViewer(_arg1, _arg2, _arg3));
        }
        private function showEnterNotice(_arg1:Object):void{
            ChatWindowMgr.getInstance().addSystemContent((("【" + _arg1.name) + ((((_arg1.state == "viewer")) || ((_arg1.state == "competition_viewer")))) ? "】作为观战者加入房间。" : "】作为决斗者加入房间。"));
        }
        private function tryAddRemoveNpcTrainArea():void{
            if (((RoomUtil.isRoomAllowTrain(this.roomType)) && (this.acceptServerMsgFlag))){
                if (((this.user1Info2Mode.isEmpty) && (((!(this.user2Info2Mode.isEmpty)) && (this.user2Info2Mode.isMeFlag))))){
                    this.addNpcTrainArea(313, 93);
                    return;
                };
                if (((this.user2Info2Mode.isEmpty) && (((!(this.user1Info2Mode.isEmpty)) && (this.user1Info2Mode.isMeFlag))))){
                    this.addNpcTrainArea(313, 443);
                    return;
                };
            };
            this.removeNpcTrainArea();
        }
        private function addNpcTrainArea(_arg1:Number, _arg2:Number):void{
            if (!this.npcTrainArea){
                this.npcTrainArea = new RoomWindowNpcTrainArea();
            };
            if (this.npcTrainArea.parent != this){
                addElement(this.npcTrainArea);
            };
            this.npcTrainArea.x = _arg1;
            this.npcTrainArea.y = _arg2;
        }
        private function removeNpcTrainArea():void{
            if (this.npcTrainArea){
                this.npcTrainArea.removeSelf();
            };
        }
        public function userLeaveRoom(_arg1:String):void{
            ChatWindowMgr.getInstance().addSystemContent((("【" + _arg1) + "】离开了房间。"));
            this.removeUserInfo(_arg1);
            this.tryAddRemoveNpcTrainArea();
        }
        private function removeUserInfo(_arg1:String):Object{
            var _local2:RoomWindowUserArea;
            var _local3:Object;
            if (!this.acceptServerMsgFlag){
                return (null);
            };
            for each (_local2 in this.userAreaList) {
                if (((!(_local2.isEmpty)) && ((_arg1 == _local2.userInfo.name)))){
                    _local3 = {
                        info:_local2.userInfo,
                        isMeFlag:_local2.isMeFlag,
                        isMainUserWindow:_local2.isMainUserWindow
                    };
                    _local2.clearUserInfo();
                    return (_local3);
                };
            };
            return (this.viewerAreaWindow.removeViewer(_arg1));
        }
        public function reset():void{
            var _local1:RoomWindowUserArea;
            if (this.viewerAreaWindow){
                this.viewerAreaWindow.reset();
            };
            if (this.userAreaList){
                for each (_local1 in this.userAreaList) {
                    _local1.clearUserInfo();
                };
            };
            this.isMeRoomOwner = false;
            this.isLoading = false;
            this.addRemoveCountClock(false);
        }
        public function roomUserStateChange(_arg1:String, _arg2:String, _arg3:String=null):void{
            var _local4:RoomWindowUserArea;
            if (!this.acceptServerMsgFlag){
                return;
            };
            for each (_local4 in this.userAreaList) {
                if (((!(_local4.isEmpty)) && ((_local4.userInfo.name == _arg1)))){
                    _local4.changeUserState(_arg2, _arg3);
                    return;
                };
            };
            this.viewerAreaWindow.changeViewerState(_arg1, _arg2, _arg3);
        }
        public function tryStartRoomTrain(_arg1:int):void{
            var _local2:String = (this.user1Info2Mode.isMeFlag) ? this.user1Info2Mode.getSelectCardName() : this.user2Info2Mode.getSelectCardName();
            if (!_local2){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提醒：", "请正确选择所用卡组！");
                return;
            };
            var _local3 = (((("return u.train_mgr:check_start_train(" + _arg1) + ", \"") + _local2) + "\", true)");
            var _local4:Array = LuaAgent.getInstance().run(_local3);
            if (_local4[1]){
                _local3 = (((("u.hall_room_mgr:start_room_train(" + _arg1) + ", \"") + _local2) + "\")");
                LuaAgent.getInstance().run(_local3);
            } else {
                MessageBox.showMessageBox(MessageBox.NOTICE, "提醒：", _local4[2]);
            };
        }
        public function startRoomTrain(_arg1:int):void{
            TrainSystem.getInstance().currentTrainSection = _arg1;
            ChatWindowMgr.getInstance().addSystemContent("开始房间训练。");
            CombatStage.getInstance().cleanStage();
            CombatConsole.getInstance().addActionList([1300, [TCGClient.getInstance().enterCombatStage]]);
            CombatConsole.getInstance().addActionList([1500, [CombatStageCommonEffectMgr.showTrainBeginEffect]]);
        }
        public function stopRoomTrain():void{
            ChatWindowMgr.getInstance().addSystemContent("退出训练。");
            CombatConsole.getInstance().enableActionList = false;
            TCGClient.getInstance().enterRoom();
            CombatConsole.getInstance().clearConsole();
        }
        public function roomOwnerTryChangeSeat(_arg1:int, _arg2:int):void{
            var _local3:RoomWindowUserArea = this.getUserAreaWindowByPos(_arg1);
            var _local4:RoomWindowUserArea = this.getUserAreaWindowByPos(_arg2);
            if (((!(_local3.isEmpty)) || (!(_local4.isEmpty)))){
                LuaAgent.getInstance().run((((("u.hall_room_mgr:room_owner_swap_seat(" + _arg1) + " , ") + _arg2) + ")"));
            };
        }
        public function playerChangeSeat(_arg1:String, _arg2:Boolean, _arg3:int):void{
            if (!this.acceptServerMsgFlag){
                return;
            };
            var _local4:Object = this.removeUserInfo(_arg1);
            if (_arg2){
                this.addPlayerInfo(_local4.info, _arg3, _local4.isMeFlag, _local4.isMainUserWindow);
            } else {
                this.addViewerInfo(_local4.info, _local4.isMeFlag);
            };
            this.tryAddRemoveNpcTrainArea();
        }
        public function roomOwnerSwapSeat(_arg1:int, _arg2:int):void{
            if (!this.acceptServerMsgFlag){
                return;
            };
            var _local3:RoomWindowUserArea = this.getUserAreaWindowByPos(_arg1);
            var _local4:RoomWindowUserArea = this.getUserAreaWindowByPos(_arg2);
            var _local5:Object = (_local3.isEmpty) ? null : {
    userInfo:_local3.userInfo,
    isMeFlag:_local3.isMeFlag,
    isMainUserWindow:_local3.isMainUserWindow
};
            _local3.clearUserInfo();
            if (!_local4.isEmpty){
                this.addPlayerInfo(_local4.userInfo, _arg1, _local4.isMeFlag, _local4.isMainUserWindow);
                _local4.clearUserInfo();
            };
            if (_local5){
                this.addPlayerInfo(_local5["userInfo"], _arg2, _local5["isMeFlag"], _local5["isMainUserWindow"]);
            };
            this.tryAddRemoveNpcTrainArea();
        }
        private function leaveFunc():void{
            if (!parent){
                return;
            };
            if (!RoomUtil.isCompetitionModeRoom(this.roomType)){
                LuaAgent.getInstance().run("u.hall_room_mgr:leave_room()");
            } else {
                LuaAgent.getInstance().run("u.competition_mgr:leave_room()");
            };
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            this.mouseChildren = true;
            BasicOperationBar.getInstance().registerLeaveFunc(this.leaveFunc);
        }
        protected function removeEffect_effectStartHandler(_arg1:EffectEvent):void{
            BasicOperationBar.getInstance().clearLeaveFunc(this.leaveFunc);
            this.acceptServerMsgFlag = false;
            mouseChildren = false;
            this.removeNpcTrainArea();
        }
        protected function kickBtn_clickHandler(_arg1:MouseEvent):void{
            var _local2:RoomWindowUserArea;
            if (RoomUtil.isCompetitionModeRoom(this.roomType)){
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "竞赛房禁止请离。");
                return;
            };
            if (((this.isMeRoomOwner) && (UserObject.isVip))){
                for each (_local2 in this.userAreaList) {
                    if (((!(_local2.isEmpty)) && (!((UserObject.name == _local2.userInfo.name))))){
                        LuaAgent.getInstance().run((("u.hall_room_mgr:room_owner_kick_player(\"" + _local2.userInfo.name) + "\")"));
                        return;
                    };
                };
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "你没有对手玩家可以请离。");
            } else {
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提示：", "只有VIP房主才能使用本功能。");
            };
        }
        private function _RoomWindow_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 500;
            _local1.children = [this._RoomWindow_Move1_i(), this._RoomWindow_Move2_i(), this._RoomWindow_Move3_i(), this._RoomWindow_Move4_i()];
            _local1.addEventListener("effectStart", this.__addEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _RoomWindow_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.yFrom = -321;
            _local1.yTo = 93;
            _local1.duration = 800;
            this._RoomWindow_Move1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move1", this._RoomWindow_Move1);
            return (_local1);
        }
        private function _RoomWindow_Move2_i():Move{
            var _local1:Move = new Move();
            _local1.yFrom = 800;
            _local1.yTo = 443;
            _local1.duration = 800;
            _local1.addEventListener("effectEnd", this.___RoomWindow_Move2_effectEnd);
            this._RoomWindow_Move2 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move2", this._RoomWindow_Move2);
            return (_local1);
        }
        public function ___RoomWindow_Move2_effectEnd(_arg1:EffectEvent):void{
            this.loadingStart();
        }
        private function _RoomWindow_Move3_i():Move{
            var _local1:Move = new Move();
            _local1.startDelay = 600;
            _local1.yFrom = -70;
            _local1.yTo = 0;
            _local1.duration = 500;
            this._RoomWindow_Move3 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move3", this._RoomWindow_Move3);
            return (_local1);
        }
        private function _RoomWindow_Move4_i():Move{
            var _local1:Move = new Move();
            _local1.startDelay = 800;
            _local1.xFrom = -197;
            _local1.xTo = 0;
            _local1.duration = 500;
            this._RoomWindow_Move4 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move4", this._RoomWindow_Move4);
            return (_local1);
        }
        public function __addEffect_effectStart(_arg1:EffectEvent):void{
            this.reset();
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _RoomWindow_Bounce1_i():Bounce{
            var _local1:Bounce = new Bounce();
            this.bounceEasing = _local1;
            BindingManager.executeBindings(this, "bounceEasing", this.bounceEasing);
            return (_local1);
        }
        private function _RoomWindow_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._RoomWindow_Move5_i(), this._RoomWindow_Move6_i(), this._RoomWindow_Move7_i(), this._RoomWindow_Move8_i()];
            _local1.addEventListener("effectStart", this.__removeEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _RoomWindow_Move5_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = -321;
            _local1.yFrom = 93;
            _local1.duration = 500;
            this._RoomWindow_Move5 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move5", this._RoomWindow_Move5);
            return (_local1);
        }
        private function _RoomWindow_Move6_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = 800;
            _local1.yFrom = 443;
            _local1.duration = 500;
            this._RoomWindow_Move6 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move6", this._RoomWindow_Move6);
            return (_local1);
        }
        private function _RoomWindow_Move7_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = -70;
            _local1.yFrom = 0;
            _local1.duration = 500;
            this._RoomWindow_Move7 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move7", this._RoomWindow_Move7);
            return (_local1);
        }
        private function _RoomWindow_Move8_i():Move{
            var _local1:Move = new Move();
            _local1.xTo = -197;
            _local1.xFrom = 0;
            _local1.duration = 500;
            this._RoomWindow_Move8 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_Move8", this._RoomWindow_Move8);
            return (_local1);
        }
        public function __removeEffect_effectStart(_arg1:EffectEvent):void{
            this.removeEffect_effectStartHandler(_arg1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.reset();
        }
        private function _RoomWindow_RoomWindowUserArea2Mode1_i():RoomWindowUserArea2Mode{
            var _local1:RoomWindowUserArea2Mode = new RoomWindowUserArea2Mode();
            _local1.x = 313;
            _local1.y = -321;
            _local1.posIndex = 1;
            _local1.id = "user1Info2Mode";
            if (!_local1.document){
                _local1.document = this;
            };
            this.user1Info2Mode = _local1;
            BindingManager.executeBindings(this, "user1Info2Mode", this.user1Info2Mode);
            return (_local1);
        }
        private function _RoomWindow_RoomWindowUserArea4Mode1_i():RoomWindowUserArea4Mode{
            var _local1:RoomWindowUserArea4Mode = new RoomWindowUserArea4Mode();
            _local1.x = 288;
            _local1.y = -321;
            _local1.posIndex = 1;
            _local1.id = "user1Info4Mode";
            if (!_local1.document){
                _local1.document = this;
            };
            this.user1Info4Mode = _local1;
            BindingManager.executeBindings(this, "user1Info4Mode", this.user1Info4Mode);
            return (_local1);
        }
        private function _RoomWindow_RoomWindowUserArea2Mode2_i():RoomWindowUserArea2Mode{
            var _local1:RoomWindowUserArea2Mode = new RoomWindowUserArea2Mode();
            _local1.x = 313;
            _local1.y = 800;
            _local1.posIndex = 2;
            _local1.id = "user2Info2Mode";
            if (!_local1.document){
                _local1.document = this;
            };
            this.user2Info2Mode = _local1;
            BindingManager.executeBindings(this, "user2Info2Mode", this.user2Info2Mode);
            return (_local1);
        }
        private function _RoomWindow_RoomWindowUserArea4Mode2_i():RoomWindowUserArea4Mode{
            var _local1:RoomWindowUserArea4Mode = new RoomWindowUserArea4Mode();
            _local1.x = 642;
            _local1.y = 800;
            _local1.posIndex = 2;
            _local1.id = "user2Info4Mode";
            if (!_local1.document){
                _local1.document = this;
            };
            this.user2Info4Mode = _local1;
            BindingManager.executeBindings(this, "user2Info4Mode", this.user2Info4Mode);
            return (_local1);
        }
        private function _RoomWindow_RoomWindowUserArea4Mode3_i():RoomWindowUserArea4Mode{
            var _local1:RoomWindowUserArea4Mode = new RoomWindowUserArea4Mode();
            _local1.x = 288;
            _local1.y = -321;
            _local1.posIndex = 3;
            _local1.id = "user3Info4Mode";
            if (!_local1.document){
                _local1.document = this;
            };
            this.user3Info4Mode = _local1;
            BindingManager.executeBindings(this, "user3Info4Mode", this.user3Info4Mode);
            return (_local1);
        }
        private function _RoomWindow_RoomWindowUserArea4Mode4_i():RoomWindowUserArea4Mode{
            var _local1:RoomWindowUserArea4Mode = new RoomWindowUserArea4Mode();
            _local1.x = 642;
            _local1.y = 800;
            _local1.posIndex = 4;
            _local1.id = "user4Info4Mode";
            if (!_local1.document){
                _local1.document = this;
            };
            this.user4Info4Mode = _local1;
            BindingManager.executeBindings(this, "user4Info4Mode", this.user4Info4Mode);
            return (_local1);
        }
        private function _RoomWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.y = -70;
            _local1.mxmlContent = [this._RoomWindow_CommonOuterFrame1_i(), this._RoomWindow_CommonMiddleFrame1_i(), this._RoomWindow_Label1_i(), this._RoomWindow_Label2_i(), this._RoomWindow_Label3_i(), this._RoomWindow_CountdownClock1_i(), this._RoomWindow_HGroup1_c()];
            _local1.id = "topGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.topGroup = _local1;
            BindingManager.executeBindings(this, "topGroup", this.topGroup);
            return (_local1);
        }
        private function _RoomWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.x = -10;
            _local1.y = -10;
            _local1.filters = [this._RoomWindow_DropShadowFilter1_c()];
            _local1.id = "_RoomWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_CommonOuterFrame1", this._RoomWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _RoomWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 10;
            _local1.alpha = 0.4;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = -10;
            _local1.y = -10;
            _local1.alpha = 0.5;
            _local1.id = "_RoomWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoomWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_RoomWindow_CommonMiddleFrame1", this._RoomWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _RoomWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 14;
            _local1.y = 13;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 14466179);
            _local1.id = "roomNameLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomNameLabel = _local1;
            BindingManager.executeBindings(this, "roomNameLabel", this.roomNameLabel);
            return (_local1);
        }
        private function _RoomWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 14;
            _local1.y = 33;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 14466179);
            _local1.id = "roomNumberLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.roomNumberLabel = _local1;
            BindingManager.executeBindings(this, "roomNumberLabel", this.roomNumberLabel);
            return (_local1);
        }
        private function _RoomWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 290;
            _local1.y = 15;
            _local1.text = "开赛倒计时：";
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("color", 0xE4FF00);
            _local1.id = "clockDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.clockDesc = _local1;
            BindingManager.executeBindings(this, "clockDesc", this.clockDesc);
            return (_local1);
        }
        private function _RoomWindow_CountdownClock1_i():CountdownClock{
            var _local1:CountdownClock = new CountdownClock();
            _local1.x = 480;
            _local1.y = 21;
            _local1.setStyle("fontSize", 30);
            _local1.id = "clock";
            if (!_local1.document){
                _local1.document = this;
            };
            this.clock = _local1;
            BindingManager.executeBindings(this, "clock", this.clock);
            return (_local1);
        }
        private function _RoomWindow_HGroup1_c():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.x = 610;
            _local1.y = 12;
            _local1.gap = 10;
            _local1.mxmlContent = [this._RoomWindow_RoomWindowFunctionButton1_i(), this._RoomWindow_RoomWindowFunctionButton2_i(), this._RoomWindow_RoomWindowFunctionButton3_i()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoomWindow_RoomWindowFunctionButton1_i():RoomWindowFunctionButton{
            var _local1:RoomWindowFunctionButton = new RoomWindowFunctionButton();
            _local1.toolTip = "可以邀请其他大厅玩家加入该房间";
            _local1.addEventListener("initialize", this.__inviteBtn_initialize);
            _local1.addEventListener("click", this.__inviteBtn_click);
            _local1.id = "inviteBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inviteBtn = _local1;
            BindingManager.executeBindings(this, "inviteBtn", this.inviteBtn);
            return (_local1);
        }
        public function __inviteBtn_initialize(_arg1:FlexEvent):void{
            this.inviteBtn.labelImage = RoomWindowSourceMgr.getInstance().getSourceClass("inviteText");
        }
        public function __inviteBtn_click(_arg1:MouseEvent):void{
            PlayViewMgr.getInstance().autoShowHideAllHallPlayerWindow();
        }
        private function _RoomWindow_RoomWindowFunctionButton2_i():RoomWindowFunctionButton{
            var _local1:RoomWindowFunctionButton = new RoomWindowFunctionButton();
            _local1.toolTip = "VIP房主可以将对手请离房间。";
            _local1.addEventListener("initialize", this.__kickBtn_initialize);
            _local1.addEventListener("click", this.__kickBtn_click);
            _local1.id = "kickBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.kickBtn = _local1;
            BindingManager.executeBindings(this, "kickBtn", this.kickBtn);
            return (_local1);
        }
        public function __kickBtn_initialize(_arg1:FlexEvent):void{
            this.kickBtn.labelImage = RoomWindowSourceMgr.getInstance().getSourceClass("kickText");
        }
        public function __kickBtn_click(_arg1:MouseEvent):void{
            this.kickBtn_clickHandler(_arg1);
        }
        private function _RoomWindow_RoomWindowFunctionButton3_i():RoomWindowFunctionButton{
            var _local1:RoomWindowFunctionButton = new RoomWindowFunctionButton();
            _local1.toolTip = "功能未开放";
            _local1.addEventListener("initialize", this.__lockBtn_initialize);
            _local1.id = "lockBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.lockBtn = _local1;
            BindingManager.executeBindings(this, "lockBtn", this.lockBtn);
            return (_local1);
        }
        public function __lockBtn_initialize(_arg1:FlexEvent):void{
            this.lockBtn.labelImage = RoomWindowSourceMgr.getInstance().getSourceClass("lockText");
        }
        private function _RoomWindow_RoomWindowViewerArea1_i():RoomWindowViewerArea{
            var _local1:RoomWindowViewerArea = new RoomWindowViewerArea();
            _local1.x = -197;
            _local1.y = 110;
            _local1.id = "viewerAreaWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.viewerAreaWindow = _local1;
            BindingManager.executeBindings(this, "viewerAreaWindow", this.viewerAreaWindow);
            return (_local1);
        }
        public function ___RoomWindow_Group1_initialize(_arg1:FlexEvent):void{
            this.init();
        }
        private function _RoomWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = upUserAreaList;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindow_Move1.targets");
            result[3] = new Binding(this, null, null, "_RoomWindow_Move1.easer", "bounceEasing");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = downUserAreaList;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindow_Move2.targets");
            result[5] = new Binding(this, null, null, "_RoomWindow_Move2.easer", "bounceEasing");
            result[6] = new Binding(this, null, null, "_RoomWindow_Move3.target", "topGroup");
            result[7] = new Binding(this, null, null, "_RoomWindow_Move4.target", "viewerAreaWindow");
            result[8] = new Binding(this, function ():Array{
                var _local1:* = upUserAreaList;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindow_Move5.targets");
            result[9] = new Binding(this, function ():Array{
                var _local1:* = downUserAreaList;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindow_Move6.targets");
            result[10] = new Binding(this, null, null, "_RoomWindow_Move7.target", "topGroup");
            result[11] = new Binding(this, null, null, "_RoomWindow_Move8.target", "viewerAreaWindow");
            result[12] = new Binding(this, function ():Array{
                var _local1:* = [977, 80];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindow_CommonOuterFrame1.size");
            result[13] = new Binding(this, function ():Array{
                var _local1:* = [966, 68];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RoomWindow_CommonMiddleFrame1.size");
            return (result);
        }
        public function get addEffect():Parallel{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Parallel):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get bounceEasing():Bounce{
            return (this._1649940947bounceEasing);
        }
        public function set bounceEasing(_arg1:Bounce):void{
            var _local2:Object = this._1649940947bounceEasing;
            if (_local2 !== _arg1){
                this._1649940947bounceEasing = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bounceEasing", _local2, _arg1));
                };
            };
        }
        public function get clock():CountdownClock{
            return (this._94755854clock);
        }
        public function set clock(_arg1:CountdownClock):void{
            var _local2:Object = this._94755854clock;
            if (_local2 !== _arg1){
                this._94755854clock = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clock", _local2, _arg1));
                };
            };
        }
        public function get clockDesc():Label{
            return (this._935487553clockDesc);
        }
        public function set clockDesc(_arg1:Label):void{
            var _local2:Object = this._935487553clockDesc;
            if (_local2 !== _arg1){
                this._935487553clockDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clockDesc", _local2, _arg1));
                };
            };
        }
        public function get inviteBtn():RoomWindowFunctionButton{
            return (this._1901031789inviteBtn);
        }
        public function set inviteBtn(_arg1:RoomWindowFunctionButton):void{
            var _local2:Object = this._1901031789inviteBtn;
            if (_local2 !== _arg1){
                this._1901031789inviteBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inviteBtn", _local2, _arg1));
                };
            };
        }
        public function get kickBtn():RoomWindowFunctionButton{
            return (this._720609738kickBtn);
        }
        public function set kickBtn(_arg1:RoomWindowFunctionButton):void{
            var _local2:Object = this._720609738kickBtn;
            if (_local2 !== _arg1){
                this._720609738kickBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "kickBtn", _local2, _arg1));
                };
            };
        }
        public function get lockBtn():RoomWindowFunctionButton{
            return (this._338668849lockBtn);
        }
        public function set lockBtn(_arg1:RoomWindowFunctionButton):void{
            var _local2:Object = this._338668849lockBtn;
            if (_local2 !== _arg1){
                this._338668849lockBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lockBtn", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Parallel{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Parallel):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }
        public function get roomNameLabel():Label{
            return (this._558409586roomNameLabel);
        }
        public function set roomNameLabel(_arg1:Label):void{
            var _local2:Object = this._558409586roomNameLabel;
            if (_local2 !== _arg1){
                this._558409586roomNameLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomNameLabel", _local2, _arg1));
                };
            };
        }
        public function get roomNumberLabel():Label{
            return (this._849541456roomNumberLabel);
        }
        public function set roomNumberLabel(_arg1:Label):void{
            var _local2:Object = this._849541456roomNumberLabel;
            if (_local2 !== _arg1){
                this._849541456roomNumberLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "roomNumberLabel", _local2, _arg1));
                };
            };
        }
        public function get topGroup():Group{
            return (this._988229078topGroup);
        }
        public function set topGroup(_arg1:Group):void{
            var _local2:Object = this._988229078topGroup;
            if (_local2 !== _arg1){
                this._988229078topGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topGroup", _local2, _arg1));
                };
            };
        }
        public function get user1Info2Mode():RoomWindowUserArea2Mode{
            return (this._914705889user1Info2Mode);
        }
        public function set user1Info2Mode(_arg1:RoomWindowUserArea2Mode):void{
            var _local2:Object = this._914705889user1Info2Mode;
            if (_local2 !== _arg1){
                this._914705889user1Info2Mode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "user1Info2Mode", _local2, _arg1));
                };
            };
        }
        public function get user1Info4Mode():RoomWindowUserArea4Mode{
            return (this._916552931user1Info4Mode);
        }
        public function set user1Info4Mode(_arg1:RoomWindowUserArea4Mode):void{
            var _local2:Object = this._916552931user1Info4Mode;
            if (_local2 !== _arg1){
                this._916552931user1Info4Mode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "user1Info4Mode", _local2, _arg1));
                };
            };
        }
        public function get user2Info2Mode():RoomWindowUserArea2Mode{
            return (this._718192384user2Info2Mode);
        }
        public function set user2Info2Mode(_arg1:RoomWindowUserArea2Mode):void{
            var _local2:Object = this._718192384user2Info2Mode;
            if (_local2 !== _arg1){
                this._718192384user2Info2Mode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "user2Info2Mode", _local2, _arg1));
                };
            };
        }
        public function get user2Info4Mode():RoomWindowUserArea4Mode{
            return (this._720039426user2Info4Mode);
        }
        public function set user2Info4Mode(_arg1:RoomWindowUserArea4Mode):void{
            var _local2:Object = this._720039426user2Info4Mode;
            if (_local2 !== _arg1){
                this._720039426user2Info4Mode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "user2Info4Mode", _local2, _arg1));
                };
            };
        }
        public function get user3Info4Mode():RoomWindowUserArea4Mode{
            return (this._523525921user3Info4Mode);
        }
        public function set user3Info4Mode(_arg1:RoomWindowUserArea4Mode):void{
            var _local2:Object = this._523525921user3Info4Mode;
            if (_local2 !== _arg1){
                this._523525921user3Info4Mode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "user3Info4Mode", _local2, _arg1));
                };
            };
        }
        public function get user4Info4Mode():RoomWindowUserArea4Mode{
            return (this._327012416user4Info4Mode);
        }
        public function set user4Info4Mode(_arg1:RoomWindowUserArea4Mode):void{
            var _local2:Object = this._327012416user4Info4Mode;
            if (_local2 !== _arg1){
                this._327012416user4Info4Mode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "user4Info4Mode", _local2, _arg1));
                };
            };
        }
        public function get viewerAreaWindow():RoomWindowViewerArea{
            return (this._717989233viewerAreaWindow);
        }
        public function set viewerAreaWindow(_arg1:RoomWindowViewerArea):void{
            var _local2:Object = this._717989233viewerAreaWindow;
            if (_local2 !== _arg1){
                this._717989233viewerAreaWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "viewerAreaWindow", _local2, _arg1));
                };
            };
        }
        private function get upUserAreaList():Array{
            return (this._207785457upUserAreaList);
        }
        private function set upUserAreaList(_arg1:Array):void{
            var _local2:Object = this._207785457upUserAreaList;
            if (_local2 !== _arg1){
                this._207785457upUserAreaList = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "upUserAreaList", _local2, _arg1));
                };
            };
        }
        private function get downUserAreaList():Array{
            return (this._104190328downUserAreaList);
        }
        private function set downUserAreaList(_arg1:Array):void{
            var _local2:Object = this._104190328downUserAreaList;
            if (_local2 !== _arg1){
                this._104190328downUserAreaList = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "downUserAreaList", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

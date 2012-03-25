//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import spark.events.*;
    import mx.binding.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.filters.*;
    import task_guide.*;
    import mx.collections.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CompetitionHallCompete extends CompetitionHallStateWindow implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _2105905052enterBtn:UniversalImageButton;
        private var _1483468368groupDesc:Label;
        private var _745274459groupSelect:ComboBox;
        private var _836483952mapLine:GuideMapLine;
        private var _108698294room1:CompetitionRoom;
        private var _108698295room2:CompetitionRoom;
        private var _108698296room3:CompetitionRoom;
        private var _108698297room4:CompetitionRoom;
        private var _108698298room5:CompetitionRoom;
        private var _108698299room6:CompetitionRoom;
        private var _108698300room7:CompetitionRoom;
        private var _480533029userGroupDesc:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _2115122061competitionGroups:ArrayCollection;
        private var creationHasComplete:Boolean = false;
        private var addEffectEndFlag:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CompetitionHallCompete(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._2115122061competitionGroups = new ArrayCollection();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CompetitionHallCompete_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_competition_CompetitionHallCompeteWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.mxmlContent = [this._CompetitionHallCompete_GuideMapLine1_i(), this._CompetitionHallCompete_CompetitionRoom1_i(), this._CompetitionHallCompete_CompetitionRoom2_i(), this._CompetitionHallCompete_CompetitionRoom3_i(), this._CompetitionHallCompete_CompetitionRoom4_i(), this._CompetitionHallCompete_CompetitionRoom5_i(), this._CompetitionHallCompete_CompetitionRoom6_i(), this._CompetitionHallCompete_CompetitionRoom7_i(), this._CompetitionHallCompete_CommonOuterFrame1_c(), this._CompetitionHallCompete_CommonMiddleFrame1_c(), this._CompetitionHallCompete_Label1_i(), this._CompetitionHallCompete_ComboBox1_i(), this._CompetitionHallCompete_CommonOuterFrame2_c(), this._CompetitionHallCompete_CommonMiddleFrame2_c(), this._CompetitionHallCompete_Label2_i(), this._CompetitionHallCompete_UniversalImageButton1_i()];
            this.addEventListener("creationComplete", this.___CompetitionHallCompete_CompetitionHallStateWindow1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CompetitionHallCompete._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.drawMapLine();
            this.displayCompetitionInfo();
        }
        override protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            this.addEffectEndFlag = true;
            this.displayCompetitionInfo();
        }
        override public function setCompetitionInfo(_arg1:Object):void{
            super.setCompetitionInfo(_arg1);
            this.displayCompetitionInfo();
        }
        override public function get windowType():String{
            return ("compete");
        }
        private function displayCompetitionInfo():void{
            var _local1:Object;
            var _local2:Object;
            var _local3:int;
            if (((((this.creationHasComplete) && (competitionInfo))) && (this.addEffectEndFlag))){
                _local1 = competitionInfo.group_info;
                this.groupDesc.text = (("第 " + _local1.group_index) + " 分组对阵图");
                this.addGroupSelectComponent(competitionInfo.group_num, _local1.group_index);
                _local2 = _local1.room_info;
                _local3 = 1;
                while (_local3 <= 7) {
                    (this[("room" + _local3)] as CompetitionRoom).setCompetitionRoomInfo(_local2[_local3.toString()]);
                    _local3++;
                };
                this.setUserGroupInfo(competitionInfo.user_group_index);
            };
        }
        private function addGroupSelectComponent(_arg1:int, _arg2:int):void{
            this.competitionGroups.removeAll();
            var _local3 = 1;
            while (_local3 <= _arg1) {
                this.competitionGroups.addItem({
                    label:(("第 " + _local3) + " 组"),
                    index:_local3
                });
                _local3++;
            };
            this.groupSelect.selectedIndex = (_arg2 - 1);
        }
        private function setUserGroupInfo(_arg1):void{
            if (_arg1){
                this.userGroupDesc.text = (("你属于第 " + _arg1) + " 分组");
                this.enterBtn.enabled = true;
            } else {
                this.userGroupDesc.text = "你没有参加本次竞赛。";
                this.enterBtn.enabled = false;
            };
        }
        protected function enterUserCompetitionRoom():void{
            LuaAgent.getInstance().run("u.competition_mgr:enter_user_competition_room()");
        }
        protected function groupSelect_changeHandler(_arg1:IndexChangeEvent):void{
            if (((this.groupSelect.selectedItem) && (this.competitionGroups.contains(this.groupSelect.selectedItem)))){
                LuaAgent.getInstance().run((("u.competition_mgr:get_competition_hall_info(" + this.groupSelect.selectedItem.index) + ")"));
            };
        }
        private function drawMapLine():void{
            var _local1:Array = new Array();
            _local1.push({
                item1:this.room4.player_a.getRect(this),
                item2:this.room2.player_a.getRect(this)
            });
            _local1.push({
                item1:this.room4.player_b.getRect(this),
                item2:this.room2.player_a.getRect(this),
                isCornerUp:true
            });
            _local1.push({
                item1:this.room5.player_a.getRect(this),
                item2:this.room2.player_b.getRect(this)
            });
            _local1.push({
                item1:this.room5.player_b.getRect(this),
                item2:this.room2.player_b.getRect(this),
                isCornerUp:true
            });
            _local1.push({
                item1:this.room6.player_a.getRect(this),
                item2:this.room3.player_a.getRect(this)
            });
            _local1.push({
                item1:this.room6.player_b.getRect(this),
                item2:this.room3.player_a.getRect(this),
                isCornerUp:true
            });
            _local1.push({
                item1:this.room7.player_a.getRect(this),
                item2:this.room3.player_b.getRect(this)
            });
            _local1.push({
                item1:this.room7.player_b.getRect(this),
                item2:this.room3.player_b.getRect(this),
                isCornerUp:true
            });
            _local1.push({
                item1:this.room2.player_a.getRect(this),
                item2:this.room1.player_a.getRect(this)
            });
            _local1.push({
                item1:this.room2.player_b.getRect(this),
                item2:this.room1.player_a.getRect(this),
                isCornerUp:true
            });
            _local1.push({
                item1:this.room3.player_a.getRect(this),
                item2:this.room1.player_b.getRect(this)
            });
            _local1.push({
                item1:this.room3.player_b.getRect(this),
                item2:this.room1.player_b.getRect(this),
                isCornerUp:true
            });
            _local1.push({
                item1:this.room1.player_a.getRect(this),
                item2:this.room1.player_b.getRect(this)
            });
            this.mapLine.drawLines(_local1);
        }
        private function _CompetitionHallCompete_GuideMapLine1_i():GuideMapLine{
            var _local1:GuideMapLine = new GuideMapLine();
            _local1.id = "mapLine";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mapLine = _local1;
            BindingManager.executeBindings(this, "mapLine", this.mapLine);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom1_i():CompetitionRoom{
            var _local1:CompetitionRoom = new CompetitionRoom();
            _local1.x = 80;
            _local1.y = 95;
            _local1.height = 250;
            _local1.id = "room4";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room4 = _local1;
            BindingManager.executeBindings(this, "room4", this.room4);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom2_i():CompetitionRoom{
            var _local1:CompetitionRoom;
            _local1 = new CompetitionRoom();
            _local1.x = 80;
            _local1.y = 415;
            _local1.height = 250;
            _local1.id = "room5";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room5 = _local1;
            BindingManager.executeBindings(this, "room5", this.room5);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom3_i():CompetitionRoom{
            var _local1:CompetitionRoom;
            _local1 = new CompetitionRoom();
            _local1.x = 310;
            _local1.y = 175;
            _local1.height = 400;
            _local1.id = "room2";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room2 = _local1;
            BindingManager.executeBindings(this, "room2", this.room2);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom4_i():CompetitionRoom{
            var _local1:CompetitionRoom = new CompetitionRoom();
            _local1.x = 540;
            _local1.y = 250;
            _local1.height = 250;
            _local1.id = "room1";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room1 = _local1;
            BindingManager.executeBindings(this, "room1", this.room1);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom5_i():CompetitionRoom{
            var _local1:CompetitionRoom = new CompetitionRoom();
            _local1.x = 770;
            _local1.y = 175;
            _local1.height = 400;
            _local1.id = "room3";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room3 = _local1;
            BindingManager.executeBindings(this, "room3", this.room3);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom6_i():CompetitionRoom{
            var _local1:CompetitionRoom;
            _local1 = new CompetitionRoom();
            _local1.x = 1000;
            _local1.y = 95;
            _local1.height = 250;
            _local1.id = "room6";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room6 = _local1;
            BindingManager.executeBindings(this, "room6", this.room6);
            return (_local1);
        }
        private function _CompetitionHallCompete_CompetitionRoom7_i():CompetitionRoom{
            var _local1:CompetitionRoom = new CompetitionRoom();
            _local1.x = 1000;
            _local1.y = 415;
            _local1.height = 250;
            _local1.id = "room7";
            if (!_local1.document){
                _local1.document = this;
            };
            this.room7 = _local1;
            BindingManager.executeBindings(this, "room7", this.room7);
            return (_local1);
        }
        private function _CompetitionHallCompete_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.x = 495;
            _local1.y = 40;
            _local1.width = 280;
            _local1.height = 120;
            _local1.filters = [this._CompetitionHallCompete_DropShadowFilter1_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallCompete_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallCompete_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 510;
            _local1.y = 58;
            _local1.width = 250;
            _local1.height = 90;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallCompete_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 73;
            _local1.horizontalCenter = -5;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "groupDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.groupDesc = _local1;
            BindingManager.executeBindings(this, "groupDesc", this.groupDesc);
            return (_local1);
        }
        private function _CompetitionHallCompete_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.y = 113;
            _local1.horizontalCenter = -5;
            _local1.setStyle("fontSize", 14);
            _local1.addEventListener("focusIn", this.__groupSelect_focusIn);
            _local1.addEventListener("change", this.__groupSelect_change);
            _local1.id = "groupSelect";
            if (!_local1.document){
                _local1.document = this;
            };
            this.groupSelect = _local1;
            BindingManager.executeBindings(this, "groupSelect", this.groupSelect);
            return (_local1);
        }
        public function __groupSelect_focusIn(_arg1:FocusEvent):void{
            IME.enabled = true;
        }
        public function __groupSelect_change(_arg1:IndexChangeEvent):void{
            this.groupSelect_changeHandler(_arg1);
        }
        private function _CompetitionHallCompete_CommonOuterFrame2_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.x = 445;
            _local1.y = 612;
            _local1.width = 380;
            _local1.height = 150;
            _local1.filters = [this._CompetitionHallCompete_DropShadowFilter2_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallCompete_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallCompete_CommonMiddleFrame2_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 460;
            _local1.y = 630;
            _local1.width = 350;
            _local1.height = 120;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallCompete_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.y = 650;
            _local1.horizontalCenter = -5;
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "userGroupDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userGroupDesc = _local1;
            BindingManager.executeBindings(this, "userGroupDesc", this.userGroupDesc);
            return (_local1);
        }
        private function _CompetitionHallCompete_UniversalImageButton1_i():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.y = 695;
            _local1.horizontalCenter = -5;
            _local1.label = "进 入 比 赛";
            _local1.btnScale = 1.4;
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontWeight", "bold");
            _local1.addEventListener("click", this.__enterBtn_click);
            _local1.id = "enterBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.enterBtn = _local1;
            BindingManager.executeBindings(this, "enterBtn", this.enterBtn);
            return (_local1);
        }
        public function __enterBtn_click(_arg1:MouseEvent):void{
            this.enterUserCompetitionRoom();
        }
        public function ___CompetitionHallCompete_CompetitionHallStateWindow1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CompetitionHallCompete_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():IList{
                return (competitionGroups);
            }, null, "groupSelect.dataProvider");
            return (result);
        }
        public function get enterBtn():UniversalImageButton{
            return (this._2105905052enterBtn);
        }
        public function set enterBtn(_arg1:UniversalImageButton):void{
            var _local2:Object = this._2105905052enterBtn;
            if (_local2 !== _arg1){
                this._2105905052enterBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "enterBtn", _local2, _arg1));
                };
            };
        }
        public function get groupDesc():Label{
            return (this._1483468368groupDesc);
        }
        public function set groupDesc(_arg1:Label):void{
            var _local2:Object = this._1483468368groupDesc;
            if (_local2 !== _arg1){
                this._1483468368groupDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupDesc", _local2, _arg1));
                };
            };
        }
        public function get groupSelect():ComboBox{
            return (this._745274459groupSelect);
        }
        public function set groupSelect(_arg1:ComboBox):void{
            var _local2:Object = this._745274459groupSelect;
            if (_local2 !== _arg1){
                this._745274459groupSelect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "groupSelect", _local2, _arg1));
                };
            };
        }
        public function get mapLine():GuideMapLine{
            return (this._836483952mapLine);
        }
        public function set mapLine(_arg1:GuideMapLine):void{
            var _local2:Object = this._836483952mapLine;
            if (_local2 !== _arg1){
                this._836483952mapLine = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mapLine", _local2, _arg1));
                };
            };
        }
        public function get room1():CompetitionRoom{
            return (this._108698294room1);
        }
        public function set room1(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698294room1;
            if (_local2 !== _arg1){
                this._108698294room1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room1", _local2, _arg1));
                };
            };
        }
        public function get room2():CompetitionRoom{
            return (this._108698295room2);
        }
        public function set room2(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698295room2;
            if (_local2 !== _arg1){
                this._108698295room2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room2", _local2, _arg1));
                };
            };
        }
        public function get room3():CompetitionRoom{
            return (this._108698296room3);
        }
        public function set room3(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698296room3;
            if (_local2 !== _arg1){
                this._108698296room3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room3", _local2, _arg1));
                };
            };
        }
        public function get room4():CompetitionRoom{
            return (this._108698297room4);
        }
        public function set room4(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698297room4;
            if (_local2 !== _arg1){
                this._108698297room4 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room4", _local2, _arg1));
                };
            };
        }
        public function get room5():CompetitionRoom{
            return (this._108698298room5);
        }
        public function set room5(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698298room5;
            if (_local2 !== _arg1){
                this._108698298room5 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room5", _local2, _arg1));
                };
            };
        }
        public function get room6():CompetitionRoom{
            return (this._108698299room6);
        }
        public function set room6(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698299room6;
            if (_local2 !== _arg1){
                this._108698299room6 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room6", _local2, _arg1));
                };
            };
        }
        public function get room7():CompetitionRoom{
            return (this._108698300room7);
        }
        public function set room7(_arg1:CompetitionRoom):void{
            var _local2:Object = this._108698300room7;
            if (_local2 !== _arg1){
                this._108698300room7 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "room7", _local2, _arg1));
                };
            };
        }
        public function get userGroupDesc():Label{
            return (this._480533029userGroupDesc);
        }
        public function set userGroupDesc(_arg1:Label):void{
            var _local2:Object = this._480533029userGroupDesc;
            if (_local2 !== _arg1){
                this._480533029userGroupDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userGroupDesc", _local2, _arg1));
                };
            };
        }
        private function get competitionGroups():ArrayCollection{
            return (this._2115122061competitionGroups);
        }
        private function set competitionGroups(_arg1:ArrayCollection):void{
            var _local2:Object = this._2115122061competitionGroups;
            if (_local2 !== _arg1){
                this._2115122061competitionGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "competitionGroups", _local2, _arg1));
                };
            };
        }

    }
}//package competition 

//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
//    import mx.effects.*;
    import mx.states.*;
    import spark.components.*;
    import spark.events.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import custom_effect.*;
    import mx.collections.*;
    import flash.utils.*;
    import combat_element_script.*;
    import beginner_guide.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;
	import mx.effects.Parallel;
    public class JudgeCards extends Group implements IBindingClient, IStateClient2 {
		use namespace mx_internal;
        public static var lastCustomCurrentState:String;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _JudgeCards_Fade2:Fade;
        public var _JudgeCards_Fade3:Fade;
        private var _413245038addEffect:Fade;
        private var _250520503addJudgeWindowEffect:Parallel;
        private var _912539513allGrid:JudgeCardDataGrid;
        private var _304919812cardGroups:ComboBox;
        private var _1691273874cardInfoWindow:JudgeCardsCardInfoWindow;
        private var _1939602526duelGrid:JudgeCardDataGrid;
        private var _2078099943judgeWindow:Group;
        private var _408144183loadingBar:CommonLoadingBar;
        private var __moduleFactoryInitialized:Boolean = false;
        public var currentUserLevel:int = 1;
        private var _1626016740duelCardGroups:ArrayCollection;
        private var isDisplaying:Boolean = false;
        private var allCardsInfo:Object;
        private var newCardsInfo:Object;
        private var isCardEdited:Boolean = false;
        private var changeCardNameWindow:JudgeCardsNewNameInputWindow;
        private var _embed_mxml_source_buttonImages______png_66895728:Class;
        private var _embed_mxml_source_buttonImages____png_187764546:Class;
        private var _embed_mxml_source_buttonImages______png_1612279932:Class;
        private var _embed_mxml_source_buttonImages______png_341922204:Class;
        private var _embed_mxml_source_buttonImages______png_48152174:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function JudgeCards(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._1626016740duelCardGroups = new ArrayCollection();
            this.allCardsInfo = new Object();
            this.newCardsInfo = new Object();
            this._embed_mxml_source_buttonImages______png_66895728 = JudgeCards__embed_mxml_source_buttonImages______png_66895728;
            this._embed_mxml_source_buttonImages____png_187764546 = JudgeCards__embed_mxml_source_buttonImages____png_187764546;
            this._embed_mxml_source_buttonImages______png_1612279932 = JudgeCards__embed_mxml_source_buttonImages______png_1612279932;
            this._embed_mxml_source_buttonImages______png_341922204 = JudgeCards__embed_mxml_source_buttonImages______png_341922204;
            this._embed_mxml_source_buttonImages______png_48152174 = JudgeCards__embed_mxml_source_buttonImages______png_48152174;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._JudgeCards_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_JudgeCardsWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (JudgeCards[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._JudgeCards_BasicLayout1_c();
            this.mxmlContent = [this._JudgeCards_CommonLoadingBar1_i()];
            this.currentState = "loadingState";
            this._JudgeCards_Fade1_i();
            this._JudgeCards_Parallel1_i();
            this.addEventListener("initialize", this.___JudgeCards_Group1_initialize);
            this.addEventListener("remove", this.___JudgeCards_Group1_remove);
            var _JudgeCards_Group2_factory:* = new DeferredInstanceFromFunction(this._JudgeCards_Group2_i);
            states = [new State({
                name:"loadingState",
                overrides:[]
            }), new State({
                name:"normalState",
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_JudgeCards_Group2_factory,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"after",
                    relativeTo:["loadingBar"]
                })]
            })];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():JudgeCards{
            return (TCGClient.getInstance().judgeCard);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            JudgeCards._watcherSetupUtil = _arg1;
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
            alpha = 0;
        }
        private function reset():void{
            setCurrentState("loadingState", true);
            alpha = 0;
            this.loadingBar.alpha = 1;
            this.loadingBar.reset();
            if (this.duelGrid){
                this.duelGrid.cleanWindow();
            };
            if (this.allGrid){
                this.allGrid.cleanWindow();
            };
        }
        public function setLoadingPercent(_arg1:Number):void{
            if (((this.loadingBar) && (!((this.loadingBar.alpha == 0))))){
                this.loadingBar.loadingPercent = _arg1;
            };
        }
        private function removeHandler():void{
            var f:* = null;
            var fakeFadeEffectEnd:* = null;
            fakeFadeEffectEnd = function (_arg1:CustomEffectEvent):void{
                f.removeEventListener(CustomEffectEvent.END, fakeFadeEffectEnd);
                reset();
            };
            this.isDisplaying = false;
            mouseChildren = false;
            f = new FakeFadeEffect(this, 500, 1, 0);
            f.play();
            f.addEventListener(CustomEffectEvent.END, fakeFadeEffectEnd);
        }
        private function loadingStart():void{
            setCurrentState("normalState", true);
            this.judgeWindow.alpha = 0;
            this.askCardsData();
            this.isCardEdited = false;
        }
        private function askCardsData():void{
            this.allCardsInfo = UserObject.allCardsInfo;
            this.newCardsInfo = UserObject.newCardsInfo;
            this.currentUserLevel = UserObject.level;
            this.setDuelCardInfo(UserObject.groupCardsInfo);
        }
        public function refreshAllCardInfo(_arg1:Object, _arg2:Object):void{
            var _local3:String;
            if (this.isDisplaying){
                this.allCardsInfo = _arg1;
                for (_local3 in this.newCardsInfo) {
                    if (this.newCardsInfo[_local3] == "edit"){
                        _arg2[_local3] = "edit";
                    };
                };
                this.newCardsInfo = _arg2;
                this.refreshAllCardDataGrid((this.cardGroups.selectedItem.data as Array));
            };
        }
        public function buildCardInfo(_arg1:String, _arg2:int):Object{
            var _local3:Object = {
                id:_arg1,
                num:_arg2,
                isNew:this.isNewCard(_arg1)
            };
            CardsInfo.addAttribById(_local3);
            return (_local3);
        }
        private function setDuelCardInfo(_arg1:Object):void{
            var _local3:String;
            var _local4:Object;
            var _local5:Array;
            var _local6:String;
            this.duelCardGroups.disableAutoUpdate();
            this.duelCardGroups.removeAll();
            var _local2:int;
            for (_local3 in _arg1) {
                _local4 = _arg1[_local3];
                _local5 = new Array();
                for (_local6 in _local4) {
                    _local5.push(this.buildCardInfo(_local6, _local4[_local6]));
                };
                this.duelCardGroups.addItem({
                    label:_local3,
                    data:_local5
                });
                if (UserObject.selectCardGroup == _local3){
                    _local2 = (this.duelCardGroups.length - 1);
                };
            };
            this.duelCardGroups.enableAutoUpdate();
            this.cardGroups.selectedIndex = _local2;
            this.cardGroupsChangeHandler();
            this.loadingBar.addEventListener(CommonLoadingBar.BAR_DISPLAY_COMPLETE, this.showJudgeWindow);
            this.isDisplaying = true;
        }
        private function cardGroupsChangeHandler():void{
            if ((this.cardGroups.selectedItem is String)){
                return;
            };
            var _local1:Array = (this.cardGroups.selectedItem.data as Array);
            this.duelGrid.setDataSource(_local1);
            this.refreshAllCardDataGrid(_local1);
        }
        private function refreshAllCardDataGrid(_arg1:Array):void{
            var _local3:String;
            var _local4:int;
            var _local5:Object;
            var _local2:Array = new Array();
            for (_local3 in this.allCardsInfo) {
                _local4 = this.allCardsInfo[_local3];
                for each (_local5 in _arg1) {
                    if (_local5["id"] == _local3){
                        _local4 = (_local4 - _local5["num"]);
                    };
                };
                if (_local4 > 0){
                    _local2.push(this.buildCardInfo(_local3, _local4));
                };
            };
            this.allGrid.setDataSource(_local2);
        }
        private function showJudgeWindow(_arg1:Event):void{
            this.loadingBar.removeEventListener(CommonLoadingBar.BAR_DISPLAY_COMPLETE, this.showJudgeWindow);
            this.addJudgeWindowEffect.play();
        }
        private function checkCardName(_arg1:String){
            var _local3:Object;
            var _local2:* = HeXie.hasSensitiveWord(_arg1);
            if (_local2){
                return (_local2[2]);
            };
            if (_arg1.length == 0){
                return ("请输入新卡组的名称");
            };
            for each (_local3 in this.duelCardGroups.source) {
                if (_local3["label"] == _arg1){
                    return ("卡组重名");
                };
            };
            return (true);
        }
        private function buildNewCardGroup():void{
            var _local1:*;
            var _local2:String;
            if (this.duelCardGroups.length >= 20){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "最多建立 20 个卡组！");
                return;
            };
            var _local3 = 1;
            do  {
                var _temp1 = _local3;
                _local3 = (_local3 + 1);
                _local2 = ("新卡组" + _temp1.toString());
                _local1 = this.checkCardName(_local2);
            } while (_local1 != true);
            this.duelCardGroups.addItem({
                label:_local2,
                data:new Array()
            });
            this.cardGroups.selectedIndex = (this.duelCardGroups.length - 1);
            this.cardGroupsChangeHandler();
            this.isCardEdited = true;
        }
        private function changeCardGroupName(_arg1:String){
            var _local2:* = this.checkCardName(_arg1);
            if (_local2 == true){
                this.cardGroups.selectedItem["label"] = _arg1;
                this.cardGroups.textInput.text = _arg1;
                this.isCardEdited = true;
            };
            return (_local2);
        }
        private function deleteCardGroup():void{
            if (this.duelCardGroups.length == 1){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "你至少需要保留一个卡组");
            } else {
                if (this.cardGroups.selectedIndex == -1){
                    MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "请先选择一个卡组");
                } else {
                    var deleteCG:* = function (_arg1:Array):Boolean{
                        if (_arg1[0] == true){
                            duelCardGroups.removeItemAt(cardGroups.selectedIndex);
                            cardGroups.selectedIndex = 0;
                            cardGroupsChangeHandler();
                            isCardEdited = true;
                        };
                        return (true);
                    };
                    MessageBox.showMessageBox(MessageBox.SELECT, "操作提醒：", "你确定要删除该卡组吗？", deleteCG);
                };
            };
        }
        private function saveEdit():void{
            var _local1:Array = LuaAgent.getInstance().run("return u.user_card_mgr:check_submit_new_group_card()");
            if ((((_local1.length > 1)) && ((_local1[1] == true)))){
                LuaAgent.getInstance().run("u.user_card_mgr:submit_new_group_card()");
                this.isCardEdited = false;
                MessageBox.showMessageBox(MessageBox.EASY_NOTICE, "提醒：", "卡组设置保存成功。");
            };
        }
        public function changeNewCardInfo(_arg1:String):void{
            if (this.newCardsInfo[_arg1]){
                this.newCardsInfo[_arg1] = "edit";
            };
        }
        public function isNewCard(_arg1:String):Boolean{
            return ((((this.newCardsInfo[_arg1]) && (!((this.newCardsInfo[_arg1] == "edit"))))) ? true : false);
        }
        public function buildDuelCardsString():String{
            var _local2:Object;
            var _local3:Object;
            var _local4:Object;
            var _local1:Object = new Object();
            for each (_local2 in this.duelCardGroups.source) {
                _local3 = new Object();
                for each (_local4 in _local2["data"]) {
                    _local3[int(_local4["id"])] = _local4["num"];
                };
                _local1[_local2["label"]] = LuaAgent.objectToLuaString(_local3);
            };
            return (LuaAgent.objectToLuaString(_local1));
        }
        public function buildNewCardsString():String{
            var _local2:String;
            var _local1:Object = new Object();
            for (_local2 in this.newCardsInfo) {
                if (this.newCardsInfo[_local2] != "edit"){
                    _local1[int(_local2)] = this.newCardsInfo[_local2];
                };
            };
            return (LuaAgent.objectToLuaString(_local1));
        }
        public function doOperation(_arg1:String, _arg2:JudgeCardDataGrid, _arg3:Object){
            var _local4:JudgeCardDataGrid = this.getAnotherGrid(_arg2);
            var _local5:String = ((_arg1 == "add")) ? "remove" : "add";
            var _local6:* = _arg2.checkOperation(_arg1, _arg3);
            if (_local6 != true){
                return (_local6);
            };
            _local6 = _local4.checkOperation(_local5, _arg3);
            if (_local6 != true){
                return (_local6);
            };
            _arg2.doOperation(_arg1, _arg3);
            _local4.doOperation(_local5, _arg3);
            this.isCardEdited = true;
            return (true);
        }
        private function getAnotherGrid(_arg1:JudgeCardDataGrid):JudgeCardDataGrid{
            if (_arg1 == this.duelGrid){
                return (this.allGrid);
            };
            return (this.duelGrid);
        }
        private function existFunc():void{
            var _saveSelectFunc:* = null;
            var _warningFunc:* = null;
            var checkResult:* = null;
            _saveSelectFunc = function (_arg1:Array):Boolean{
                if (_arg1[0] == true){
                    LuaAgent.getInstance().run("u.user_card_mgr:submit_new_group_card()");
                };
                leaveThisWindow();
                return (true);
            };
            _warningFunc = function (_arg1:Array):Boolean{
                if (_arg1[0] == true){
                    leaveThisWindow();
                };
                return (true);
            };
            if (!parent){
                return;
            };
            if (this.isCardEdited){
                checkResult = LuaAgent.getInstance().run("return u.user_card_mgr:check_submit_new_group_card(nil, true)");
                if ((((checkResult.length > 1)) && ((checkResult[1] == true)))){
                    MessageBox.showMessageBox(MessageBox.SELECT, "提示", "退出前是否保存卡组设置？", _saveSelectFunc);
                } else {
                    MessageBox.showMessageBox(MessageBox.SELECT, "提示", "现在退出将无法保存设置，是否仍然退出？", _warningFunc);
                };
            } else {
                this.leaveThisWindow();
            };
        }
        private function leaveThisWindow():void{
            LuaAgent.getInstance().run("u.user_card_mgr:change_new_card_info()");
            TCGClient.getInstance().enterWindowByCustomCurrentState(lastCustomCurrentState);
            BasicOperationBar.getInstance().clearLeaveFunc(this.existFunc);
        }
        protected function changeNameBtn_clickHandler():void{
            if (!this.changeCardNameWindow){
                this.changeCardNameWindow = new JudgeCardsNewNameInputWindow(this.changeCardGroupName);
            };
            this.judgeWindow.addElement(this.changeCardNameWindow);
            this.changeCardNameWindow.x = 400;
            this.changeCardNameWindow.y = 600;
        }
        protected function cardGroups_removedFromStageHandler(_arg1:Event):void{
            var name:* = null;
            var event:* = _arg1;
            if (((this.cardGroups.selectedItem) && (this.duelCardGroups.contains(this.cardGroups.selectedItem)))){
                var setSelectCardGroup:* = function ():void{
                    UserObject.selectCardGroup = name;
                };
                name = this.cardGroups.selectedItem.label;
                callLater(setSelectCardGroup);
            };
        }
        protected function addJudgeWindowEffect_effectEndHandler(_arg1:EffectEvent):void{
            mouseChildren = true;
            BasicOperationBar.getInstance().registerLeaveFunc(this.existFunc);
            BeginnerGuideUtil.dispatchLuaEvent("judgeCardWindowAdd");
        }
        public function setDisplayCardId(_arg1:String):void{
            if (!this.cardInfoWindow){
                return;
            };
            if (_arg1){
                this.cardInfoWindow.cardId = _arg1;
                this.cardInfoWindow.showWindow();
            } else {
                this.cardInfoWindow.hideWindow();
            };
        }
        protected function goSmelt_clickHandler(_arg1:MouseEvent):void{
            var _saveSelectFunc:* = null;
            var _warningFunc:* = null;
            var checkResult:* = null;
            var event:* = _arg1;
            _saveSelectFunc = function (_arg1:Array):Boolean{
                if (_arg1[0] == true){
                    LuaAgent.getInstance().run("u.user_card_mgr:submit_new_group_card()");
                };
                TCGClient.getInstance().showSmeltWindow();
                return (true);
            };
            _warningFunc = function (_arg1:Array):Boolean{
                if (_arg1[0] == true){
                    TCGClient.getInstance().showSmeltWindow();
                };
                return (true);
            };
            if (this.isCardEdited){
                checkResult = LuaAgent.getInstance().run("return u.user_card_mgr:check_submit_new_group_card(nil, true)");
                if ((((checkResult.length > 1)) && ((checkResult[1] == true)))){
                    MessageBox.showMessageBox(MessageBox.SELECT, "提示", "进入熔炼前是否保存卡组设置？", _saveSelectFunc);
                } else {
                    MessageBox.showMessageBox(MessageBox.SELECT, "提示", "现在进入熔炼将无法保存设置，是否仍然进入？", _warningFunc);
                };
            } else {
                TCGClient.getInstance().showSmeltWindow();
            };
        }
        private function _JudgeCards_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            _local1.startDelay = 500;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.loadingStart();
        }
        private function _JudgeCards_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 500;
            _local1.children = [this._JudgeCards_Fade2_i(), this._JudgeCards_Fade3_i()];
            _local1.addEventListener("effectEnd", this.__addJudgeWindowEffect_effectEnd);
            this.addJudgeWindowEffect = _local1;
            BindingManager.executeBindings(this, "addJudgeWindowEffect", this.addJudgeWindowEffect);
            return (_local1);
        }
        private function _JudgeCards_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 1;
            this._JudgeCards_Fade2 = _local1;
            BindingManager.executeBindings(this, "_JudgeCards_Fade2", this._JudgeCards_Fade2);
            return (_local1);
        }
        private function _JudgeCards_Fade3_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            this._JudgeCards_Fade3 = _local1;
            BindingManager.executeBindings(this, "_JudgeCards_Fade3", this._JudgeCards_Fade3);
            return (_local1);
        }
        public function __addJudgeWindowEffect_effectEnd(_arg1:EffectEvent):void{
            this.addJudgeWindowEffect_effectEndHandler(_arg1);
        }
        private function _JudgeCards_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCards_CommonLoadingBar1_i():CommonLoadingBar{
            var _local1:CommonLoadingBar = new CommonLoadingBar();
            _local1.x = 370;
            _local1.y = 150;
            _local1.loadingTitle = "载入卡片资源...";
            _local1.id = "loadingBar";
            if (!_local1.document){
                _local1.document = this;
            };
            this.loadingBar = _local1;
            BindingManager.executeBindings(this, "loadingBar", this.loadingBar);
            return (_local1);
        }
        private function _JudgeCards_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.width = 0x0500;
            _local1.height = 800;
            _local1.mxmlContent = [this._JudgeCards_JudgeCardDataGrid1_i(), this._JudgeCards_Label1_c(), this._JudgeCards_ComboBox1_i(), this._JudgeCards_JudgeCardDataGrid2_i(), this._JudgeCards_HGroup1_c(), this._JudgeCards_JudgeCardsCardInfoWindow1_i()];
            _local1.id = "judgeWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.judgeWindow = _local1;
            BindingManager.executeBindings(this, "judgeWindow", this.judgeWindow);
            return (_local1);
        }
        private function _JudgeCards_JudgeCardDataGrid1_i():JudgeCardDataGrid{
            var _local1:JudgeCardDataGrid = new JudgeCardDataGrid();
            _local1.x = 3;
            _local1.y = 16;
            _local1.isDuelGrid = true;
            _local1.id = "duelGrid";
            if (!_local1.document){
                _local1.document = this;
            };
            this.duelGrid = _local1;
            BindingManager.executeBindings(this, "duelGrid", this.duelGrid);
            return (_local1);
        }
        private function _JudgeCards_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 274;
            _local1.y = 42;
            _local1.width = 80;
            _local1.text = "卡组选择：";
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 14268546);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCards_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 347;
            _local1.y = 35;
            _local1.setStyle("fontSize", 14);
            _local1.addEventListener("focusIn", this.__cardGroups_focusIn);
            _local1.addEventListener("change", this.__cardGroups_change);
            _local1.addEventListener("removedFromStage", this.__cardGroups_removedFromStage);
            _local1.id = "cardGroups";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardGroups = _local1;
            BindingManager.executeBindings(this, "cardGroups", this.cardGroups);
            return (_local1);
        }
        public function __cardGroups_focusIn(_arg1:FocusEvent):void{
            IME.enabled = true;
        }
        public function __cardGroups_change(_arg1:IndexChangeEvent):void{
            this.cardGroupsChangeHandler();
        }
        public function __cardGroups_removedFromStage(_arg1:Event):void{
            this.cardGroups_removedFromStageHandler(_arg1);
        }
        private function _JudgeCards_JudgeCardDataGrid2_i():JudgeCardDataGrid{
            var _local1:JudgeCardDataGrid = new JudgeCardDataGrid();
            _local1.x = 525;
            _local1.y = 16;
            _local1.id = "allGrid";
            if (!_local1.document){
                _local1.document = this;
            };
            this.allGrid = _local1;
            BindingManager.executeBindings(this, "allGrid", this.allGrid);
            return (_local1);
        }
        private function _JudgeCards_HGroup1_c():HGroup{
            var _local1:HGroup = new HGroup();
            _local1.bottom = 25;
            _local1.x = 50;
            _local1.gap = 20;
            _local1.mxmlContent = [this._JudgeCards_UniversalImageButton1_c(), this._JudgeCards_UniversalImageButton2_c(), this._JudgeCards_UniversalImageButton3_c(), this._JudgeCards_UniversalImageButton4_c(), this._JudgeCards_UniversalImageButton5_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _JudgeCards_UniversalImageButton1_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_66895728;
            _local1.addEventListener("click", this.___JudgeCards_UniversalImageButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCards_UniversalImageButton1_click(_arg1:MouseEvent):void{
            this.buildNewCardGroup();
        }
        private function _JudgeCards_UniversalImageButton2_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_48152174;
            _local1.addEventListener("click", this.___JudgeCards_UniversalImageButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCards_UniversalImageButton2_click(_arg1:MouseEvent):void{
            this.changeNameBtn_clickHandler();
        }
        private function _JudgeCards_UniversalImageButton3_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_1612279932;
            _local1.addEventListener("click", this.___JudgeCards_UniversalImageButton3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCards_UniversalImageButton3_click(_arg1:MouseEvent):void{
            this.deleteCardGroup();
        }
        private function _JudgeCards_UniversalImageButton4_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages______png_341922204;
            _local1.addEventListener("click", this.___JudgeCards_UniversalImageButton4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCards_UniversalImageButton4_click(_arg1:MouseEvent):void{
            this.saveEdit();
        }
        private function _JudgeCards_UniversalImageButton5_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.labelImage = this._embed_mxml_source_buttonImages____png_187764546;
            _local1.addEventListener("click", this.___JudgeCards_UniversalImageButton5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___JudgeCards_UniversalImageButton5_click(_arg1:MouseEvent):void{
            this.goSmelt_clickHandler(_arg1);
        }
        private function _JudgeCards_JudgeCardsCardInfoWindow1_i():JudgeCardsCardInfoWindow{
            var _local1:JudgeCardsCardInfoWindow = new JudgeCardsCardInfoWindow();
            _local1.x = 1050;
            _local1.y = 80;
            _local1.visible = false;
            _local1.id = "cardInfoWindow";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardInfoWindow = _local1;
            BindingManager.executeBindings(this, "cardInfoWindow", this.cardInfoWindow);
            return (_local1);
        }
        public function ___JudgeCards_Group1_initialize(_arg1:FlexEvent):void{
            this.init();
        }
        public function ___JudgeCards_Group1_remove(_arg1:FlexEvent):void{
            this.removeHandler();
        }
        private function _JudgeCards_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "_JudgeCards_Fade2.target", "judgeWindow");
            result[2] = new Binding(this, null, null, "_JudgeCards_Fade3.target", "loadingBar");
            result[3] = new Binding(this, function ():JudgeCards{
                return (this);
            }, null, "duelGrid.parentJudgeCard");
            result[4] = new Binding(this, function ():IList{
                return (duelCardGroups);
            }, null, "cardGroups.dataProvider");
            result[5] = new Binding(this, function ():JudgeCards{
                return (this);
            }, null, "allGrid.parentJudgeCard");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get addJudgeWindowEffect():Parallel{
            return (this._250520503addJudgeWindowEffect);
        }
        public function set addJudgeWindowEffect(_arg1:Parallel):void{
            var _local2:Object = this._250520503addJudgeWindowEffect;
            if (_local2 !== _arg1){
                this._250520503addJudgeWindowEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addJudgeWindowEffect", _local2, _arg1));
                };
            };
        }
        public function get allGrid():JudgeCardDataGrid{
            return (this._912539513allGrid);
        }
        public function set allGrid(_arg1:JudgeCardDataGrid):void{
            var _local2:Object = this._912539513allGrid;
            if (_local2 !== _arg1){
                this._912539513allGrid = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "allGrid", _local2, _arg1));
                };
            };
        }
        public function get cardGroups():ComboBox{
            return (this._304919812cardGroups);
        }
        public function set cardGroups(_arg1:ComboBox):void{
            var _local2:Object = this._304919812cardGroups;
            if (_local2 !== _arg1){
                this._304919812cardGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardGroups", _local2, _arg1));
                };
            };
        }
        public function get cardInfoWindow():JudgeCardsCardInfoWindow{
            return (this._1691273874cardInfoWindow);
        }
        public function set cardInfoWindow(_arg1:JudgeCardsCardInfoWindow):void{
            var _local2:Object = this._1691273874cardInfoWindow;
            if (_local2 !== _arg1){
                this._1691273874cardInfoWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardInfoWindow", _local2, _arg1));
                };
            };
        }
        public function get duelGrid():JudgeCardDataGrid{
            return (this._1939602526duelGrid);
        }
        public function set duelGrid(_arg1:JudgeCardDataGrid):void{
            var _local2:Object = this._1939602526duelGrid;
            if (_local2 !== _arg1){
                this._1939602526duelGrid = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "duelGrid", _local2, _arg1));
                };
            };
        }
        public function get judgeWindow():Group{
            return (this._2078099943judgeWindow);
        }
        public function set judgeWindow(_arg1:Group):void{
            var _local2:Object = this._2078099943judgeWindow;
            if (_local2 !== _arg1){
                this._2078099943judgeWindow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "judgeWindow", _local2, _arg1));
                };
            };
        }
        public function get loadingBar():CommonLoadingBar{
            return (this._408144183loadingBar);
        }
        public function set loadingBar(_arg1:CommonLoadingBar):void{
            var _local2:Object = this._408144183loadingBar;
            if (_local2 !== _arg1){
                this._408144183loadingBar = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadingBar", _local2, _arg1));
                };
            };
        }
        private function get duelCardGroups():ArrayCollection{
            return (this._1626016740duelCardGroups);
        }
        private function set duelCardGroups(_arg1:ArrayCollection):void{
            var _local2:Object = this._1626016740duelCardGroups;
            if (_local2 !== _arg1){
                this._1626016740duelCardGroups = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "duelCardGroups", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

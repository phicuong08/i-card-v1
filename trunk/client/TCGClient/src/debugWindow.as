//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import achievement_system.*;
    
    import baggage.*;
    
    import card_ui.*;
    
    import combat_element.*;
    
    import combat_element_script.*;
    
    import custom_control1.*;
    
    import custom_effect.*;
    
    import debug1.*;
    
    import file_read.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
    import flash.filters.*;
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
    import mx.collections.*;
//    import mx.controls.*;
	import mx.controls.HRule;
    import mx.core.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import normal_window.*;
    
    import player_view.*;
    
    import shop_system.*;
    
    import skins.*;
    
    import social_contact.*;
    
    import spark.components.*;
    import spark.layouts.*;
    
    import swf_effect.*;
    
    import task.*;
    
    import task_guide.*;
    
    import tool.*;
    
    import trade_system.*;
    
    import ui_element.*;
    
    import web_service.*;

    public class debugWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        public static var firstDuelName:String = new String();
        private static var _instance:debugWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1823308485clickSkipSwitch:CheckBox;
        private var _1932411214guideStartStep:TextInput;
        private var _1185745021in2Txt:TextArea;
        private var _1911220700inAngel:TextInput;
        private var _100331275inTxt:TextArea;
        private var _1844662951newBack:CheckBox;
        private var _1048871355newDef:CheckBox;
        private var _104712923newId:TextInput;
        private var _1362338139newPName:ComboBox;
        private var _1845180350newSlot:ComboBox;
        private var _2086389966stateComb:ComboBox;
        private var _1147793947test3Num:TextInput;
        private var _1147764156test4Num:TextInput;
        private var _1270283260traceMsg:TextArea;
        private var _227396825traceSwitch:CheckBox;
        private var _3570944tttt:Label;
        private var _222501598updateOneLuaFileName:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var frameDetectedWindow:UIComponent;
        private var _2060854647statesArray:ArrayCollection;
        private var _772046402newPNameArray:ArrayCollection;
        private var _963735867newSlotArray:ArrayCollection;
        private var card1:GameCard;
        private var card2:GameCard;
        private var card3:GameCard;
        private var card4:GameCard;
        private var card5:GameCard;
        private var card6:GameCard;
        private var card7:GameCard;
        private var card8:GameCard;
        private var frames:int = 0;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function debugWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._2060854647statesArray = new ArrayCollection();
            this._772046402newPNameArray = new ArrayCollection(new Array("a", "b"));
            this._963735867newSlotArray = new ArrayCollection(new Array("monster", "magic", "hand", "grave", "deck"));
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._debugWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_debugWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (debugWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 470;
            this.height = 0x0300;
            this.depth = 500;
            this.layout = this._debugWindow_BasicLayout1_c();
            this.mxmlContent = [this._debugWindow_Button1_c(), this._debugWindow_TextArea1_i(), this._debugWindow_Button2_c(), this._debugWindow_Button3_c(), this._debugWindow_TextArea2_i(), this._debugWindow_Button4_c(), this._debugWindow_TextArea3_i(), this._debugWindow_TextInput1_i(), this._debugWindow_Button5_c(), this._debugWindow_Button6_c(), this._debugWindow_Button7_c(), this._debugWindow_Button8_c(), this._debugWindow_TextInput2_i(), this._debugWindow_ComboBox1_i(), this._debugWindow_Button9_c(), this._debugWindow_Button10_c(), this._debugWindow_Button11_c(), this._debugWindow_Button12_c(), this._debugWindow_Button13_c(), this._debugWindow_Button14_c(), this._debugWindow_Button15_c(), this._debugWindow_TextInput3_i(), this._debugWindow_Button16_c(), this._debugWindow_Label1_i(), this._debugWindow_CheckBox1_i(), this._debugWindow_TextInput4_i(), this._debugWindow_TextInput5_i(), this._debugWindow_Button17_c(), this._debugWindow_Button18_c(), this._debugWindow_Button19_c(), this._debugWindow_Button20_c(), this._debugWindow_Button21_c(), this._debugWindow_CheckBox2_i(), this._debugWindow_CheckBox3_i(), this._debugWindow_ComboBox2_i(), this._debugWindow_ComboBox3_i(), this._debugWindow_TextInput6_i(), this._debugWindow_HRule1_c(), this._debugWindow_HRule2_c(), this._debugWindow_CheckBox4_i(), this._debugWindow_Button22_c(), this._debugWindow_Button23_c(), this._debugWindow_Button24_c()];
            this.addEventListener("creationComplete", this.___debugWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():debugWindow{
            return (_instance);
        }
        public static function myTrace(_arg1:String):void{
            if (_instance != null){
                if (_instance.traceSwitch.selected){
                    trace(_arg1);
                    if (_instance.visible != false){
                        _instance.traceMsg.text = ((_instance.traceMsg.text + "\r\n") + _arg1);
                    };
                };
            };
        }
        public static function myTraceEx(_arg1:String):void{
            if (_instance != null){
                trace(_arg1);
                if (_instance.visible != false){
                    _instance.traceMsg.text = ((_instance.traceMsg.text + "\r\n") + _arg1);
                };
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            debugWindow._watcherSetupUtil = _arg1;
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
            var _local1:String;
            _instance = this;
            for (_local1 in TCGClient.getInstance().stateWindowInfo) {
                this.statesArray.addItem({label:_local1});
            };
            this.stateComb.selectedIndex = 0;
            this.newPName.selectedIndex = 0;
            this.newSlot.selectedIndex = 0;
            if (TCGClient.isDebugMode){
                this.showHideFrameWindow();
            };
        }
        protected function inTxt_keyDownHandler(_arg1:KeyboardEvent):void{
            var _local2:RegExp;
            if ((((_arg1.keyCode == 13)) && (_arg1.ctrlKey))){
                _local2 = /^\s*$/;
                if (_local2.test(this.inTxt.text)){
                    return;
                };
                LuaAgent.getInstance().run(this.inTxt.text);
            };
        }
        public function createCards():void{
            if (TCGClient.getInstance().customCurrentState != "combatStage"){
                return;
            };
            this.card1 = CombatConsole.getInstance().createCard("player", "11");
            CombatConsole.getInstance().addCard(this.card1, "hand");
            this.card2 = CombatConsole.getInstance().createCard("player", "12");
            CombatConsole.getInstance().addCard(this.card2, "hand");
            this.card3 = CombatConsole.getInstance().createCard("player", "13");
            CombatConsole.getInstance().addCard(this.card3, "hand");
            this.card4 = CombatConsole.getInstance().createCard("player", "14", 4);
            CombatConsole.getInstance().addCard(this.card4, "hand");
            this.card5 = CombatConsole.getInstance().createCard("enemy", "15");
            CombatConsole.getInstance().addCard(this.card5, "hand");
            this.card6 = CombatConsole.getInstance().createCard("enemy", "16");
            CombatConsole.getInstance().addCard(this.card6, "hand");
            this.card7 = CombatConsole.getInstance().createCard("enemy", "11", 7);
            CombatConsole.getInstance().addCard(this.card7, "hand");
            this.card8 = CombatConsole.getInstance().createCard("enemy", "12");
            CombatConsole.getInstance().addCard(this.card8, "hand");
        }
        public function dispatchCards():void{
            if (TCGClient.getInstance().customCurrentState != "combatStage"){
                return;
            };
            CombatConsole.getInstance().addCard(this.card1, "grave", false, false);
            CombatConsole.getInstance().addCard(this.card2, "monster", false, false);
            CombatConsole.getInstance().addCard(this.card3, "magic", false, false);
            CombatConsole.getInstance().addCard(this.card4, "food", true, false);
            CombatConsole.getInstance().addCard(this.card5, "grave", false, false);
            CombatConsole.getInstance().addCard(this.card6, "monster", false, false);
            CombatConsole.getInstance().addCard(this.card7, "magic", false, false);
            CombatConsole.getInstance().addCard(this.card8, "food", true, false);
        }
        public function test2():void{
            myTraceEx(JavaScriptUtil.getScreenData());
            myTraceEx(JavaScriptUtil.getOsData());
            myTraceEx(JavaScriptUtil.getBrowserData().name);
            myTraceEx(JavaScriptUtil.getBrowserData().version);
        }
        public function test3():void{
            addElement(new JudgeCombat3DActor());
        }
        public function test4():void{
            CombatConsole.getInstance().showCardArousal(402, 42);
        }
        public function testRotate():void{
            CombatStage.getInstance().groupWith3D.rotationX = int(this.inAngel.text);
        }
        protected function showHideFrameWindow():void{
            if (!this.frameDetectedWindow){
                this.frameDetectedWindow = new UIComponent();
                this.frameDetectedWindow.addChild(new Stats());
                this.frameDetectedWindow.mouseChildren = false;
                this.frameDetectedWindow.mouseEnabled = false;
                TCGClient.getInstance().addElement(this.frameDetectedWindow);
            } else {
                TCGClient.getInstance().removeElement(this.frameDetectedWindow);
                this.frameDetectedWindow = null;
            };
        }
        protected function stopDragHandler(_arg1:MouseEvent):void{
            this.stopDrag();
            var _local2:Point = parent.globalToLocal(localToGlobal(new Point(0, 0)));
            x = _local2.x;
            y = _local2.y;
        }
        protected function updateOneLuaFile():void{
            LuaAgent.getInstance().run((("update \"" + this.updateOneLuaFileName.text) + "\""));
        }
        private function _debugWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _debugWindow_Button1_c():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.label = "清理舞台";
            _local1.x = 0;
            _local1.y = -19;
            _local1.addEventListener("click", this.___debugWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button1_click(_arg1:MouseEvent):void{
            if (CombatStage.getInstance()){
                CombatStage.getInstance().cleanStage();
            };
        }
        private function _debugWindow_TextArea1_i():TextArea{
            var _local1:TextArea = new TextArea();
            _local1.x = 2;
            _local1.y = 10;
            _local1.width = 266;
            _local1.height = 415;
            _local1.id = "traceMsg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.traceMsg = _local1;
            BindingManager.executeBindings(this, "traceMsg", this.traceMsg);
            return (_local1);
        }
        private function _debugWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.x = 293;
            _local1.y = 345;
            _local1.label = "滚动条置底";
            _local1.rotation = 90;
            _local1.addEventListener("click", this.___debugWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button2_click(_arg1:MouseEvent):void{
            this.traceMsg.validateNow();
            this.traceMsg.scroller.verticalScrollBar.value = this.traceMsg.scroller.verticalScrollBar.maximum;
        }
        private function _debugWindow_Button3_c():Button{
            var _local1:Button = new Button();
            _local1.x = 293;
            _local1.y = 245;
            _local1.label = "清空";
            _local1.rotation = 90;
            _local1.addEventListener("click", this.___debugWindow_Button3_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button3_click(_arg1:MouseEvent):void{
            this.traceMsg.text = "";
        }
        private function _debugWindow_TextArea2_i():TextArea{
            var _local1:TextArea = new TextArea();
            _local1.x = 2;
            _local1.width = 266;
            _local1.height = 111;
            _local1.y = 433;
            _local1.setStyle("fontSize", 16);
            _local1.addEventListener("keyDown", this.__inTxt_keyDown);
            _local1.id = "inTxt";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inTxt = _local1;
            BindingManager.executeBindings(this, "inTxt", this.inTxt);
            return (_local1);
        }
        public function __inTxt_keyDown(_arg1:KeyboardEvent):void{
            this.inTxt_keyDownHandler(_arg1);
        }
        private function _debugWindow_Button4_c():Button{
            var _local1:Button = new Button();
            _local1.label = "调试lua";
            _local1.x = 194;
            _local1.y = 551;
            _local1.height = 23;
            _local1.width = 74;
            _local1.addEventListener("click", this.___debugWindow_Button4_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button4_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run(this.inTxt.text);
        }
        private function _debugWindow_TextArea3_i():TextArea{
            var _local1:TextArea = new TextArea();
            _local1.width = 183;
            _local1.height = 111;
            _local1.x = 276;
            _local1.y = 433;
            _local1.setStyle("fontSize", 16);
            _local1.id = "in2Txt";
            if (!_local1.document){
                _local1.document = this;
            };
            this.in2Txt = _local1;
            BindingManager.executeBindings(this, "in2Txt", this.in2Txt);
            return (_local1);
        }
        private function _debugWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.width = 46;
            _local1.height = 25;
            _local1.x = 388;
            _local1.y = 244;
            _local1.text = "0";
            _local1.setStyle("fontSize", 16);
            _local1.id = "inAngel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.inAngel = _local1;
            BindingManager.executeBindings(this, "inAngel", this.inAngel);
            return (_local1);
        }
        private function _debugWindow_Button5_c():Button{
            var _local1:Button = new Button();
            _local1.label = "发送服务器消息";
            _local1.x = 356;
            _local1.y = 552;
            _local1.addEventListener("click", this.___debugWindow_Button5_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button5_click(_arg1:MouseEvent):void{
            MySocket.getInstance().sendMsgToServer(this.in2Txt.text);
        }
        private function _debugWindow_Button6_c():Button{
            var _local1:Button = new Button();
            _local1.label = "重载所有lua";
            _local1.width = 90;
            _local1.x = 2;
            _local1.y = 551;
            _local1.height = 23;
            _local1.addEventListener("click", this.___debugWindow_Button6_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button6_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().updateFiles();
        }
        private function _debugWindow_Button7_c():Button{
            var _local1:Button = new Button();
            _local1.label = "显示战场";
            _local1.width = 90;
            _local1.x = 2;
            _local1.y = 607;
            _local1.height = 23;
            _local1.addEventListener("click", this.___debugWindow_Button7_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button7_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("show(d)");
        }
        private function _debugWindow_Button8_c():Button{
            var _local1:Button = new Button();
            _local1.x = 2;
            _local1.y = 579;
            _local1.height = 23;
            _local1.label = "重载单个lua";
            _local1.width = 90;
            _local1.addEventListener("click", this.___debugWindow_Button8_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button8_click(_arg1:MouseEvent):void{
            this.updateOneLuaFile();
        }
        private function _debugWindow_TextInput2_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 100;
            _local1.y = 579;
            _local1.width = 80;
            _local1.text = "effect/121";
            _local1.id = "updateOneLuaFileName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.updateOneLuaFileName = _local1;
            BindingManager.executeBindings(this, "updateOneLuaFileName", this.updateOneLuaFileName);
            return (_local1);
        }
        private function _debugWindow_ComboBox1_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 276;
            _local1.y = 45;
            _local1.width = 178;
            _local1.height = 31;
            _local1.id = "stateComb";
            if (!_local1.document){
                _local1.document = this;
            };
            this.stateComb = _local1;
            BindingManager.executeBindings(this, "stateComb", this.stateComb);
            return (_local1);
        }
        private function _debugWindow_Button9_c():Button{
            var _local1:Button = new Button();
            _local1.label = "切换舞台状态";
            _local1.x = 275;
            _local1.y = 80;
            _local1.height = 24;
            _local1.width = 178;
            _local1.addEventListener("click", this.___debugWindow_Button9_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button9_click(_arg1:MouseEvent):void{
            TCGClient.getInstance().enterWindowByCustomCurrentState(this.stateComb.selectedItem.label);
        }
        private function _debugWindow_Button10_c():Button{
            var _local1:Button = new Button();
            _local1.x = 100;
            _local1.y = 551;
            _local1.label = "重新决斗";
            _local1.width = 80;
            _local1.height = 23;
            _local1.addEventListener("click", this.___debugWindow_Button10_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button10_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("u.duel_mgr:duel_begin(u.duel_mgr.first_player_info, u.duel_mgr.second_player_info)");
            CombatStage.getInstance().alpha = 1;
        }
        private function _debugWindow_Button11_c():Button{
            var _local1:Button = new Button();
            _local1.x = 276;
            _local1.y = 108;
            _local1.label = "生成手牌";
            _local1.width = 79;
            _local1.height = 24;
            _local1.addEventListener("click", this.___debugWindow_Button11_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button11_click(_arg1:MouseEvent):void{
            this.createCards();
        }
        private function _debugWindow_Button12_c():Button{
            var _local1:Button = new Button();
            _local1.x = 363;
            _local1.y = 108;
            _local1.label = "手牌分发";
            _local1.width = 79;
            _local1.height = 23;
            _local1.addEventListener("click", this.___debugWindow_Button12_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button12_click(_arg1:MouseEvent):void{
            this.dispatchCards();
        }
        private function _debugWindow_Button13_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 179;
            _local1.label = "test3";
            _local1.width = 79;
            _local1.height = 22;
            _local1.addEventListener("click", this.___debugWindow_Button13_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button13_click(_arg1:MouseEvent):void{
            this.test3();
        }
        private function _debugWindow_Button14_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 209;
            _local1.label = "test4";
            _local1.width = 79;
            _local1.height = 24;
            _local1.addEventListener("click", this.___debugWindow_Button14_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button14_click(_arg1:MouseEvent):void{
            this.test4();
        }
        private function _debugWindow_Button15_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 244;
            _local1.label = "rotate";
            _local1.width = 79;
            _local1.height = 26;
            _local1.addEventListener("click", this.___debugWindow_Button15_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button15_click(_arg1:MouseEvent):void{
            this.testRotate();
        }
        private function _debugWindow_TextInput3_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.width = 40;
            _local1.height = 28;
            _local1.x = 414;
            _local1.y = 281;
            _local1.text = "0";
            _local1.setStyle("fontSize", 16);
            _local1.id = "guideStartStep";
            if (!_local1.document){
                _local1.document = this;
            };
            this.guideStartStep = _local1;
            BindingManager.executeBindings(this, "guideStartStep", this.guideStartStep);
            return (_local1);
        }
        private function _debugWindow_Button16_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 280;
            _local1.width = 104;
            _local1.height = 30;
            _local1.label = "战役起始步骤";
            _local1.addEventListener("click", this.___debugWindow_Button16_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button16_click(_arg1:MouseEvent):void{
            GuideSystem.getInstance().startStep = int(this.guideStartStep.text);
        }
        private function _debugWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.x = 10;
            _local1.y = 729;
            _local1.text = "点此处拖拽本窗口";
            _local1.width = 117;
            _local1.height = 21;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 0xFFFFFF);
            _local1.addEventListener("mouseDown", this.__tttt_mouseDown);
            _local1.addEventListener("mouseUp", this.__tttt_mouseUp);
            _local1.id = "tttt";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tttt = _local1;
            BindingManager.executeBindings(this, "tttt", this.tttt);
            return (_local1);
        }
        public function __tttt_mouseDown(_arg1:MouseEvent):void{
            this.startDrag();
        }
        public function __tttt_mouseUp(_arg1:MouseEvent):void{
            this.stopDragHandler(_arg1);
        }
        private function _debugWindow_CheckBox1_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.selected = false;
            _local1.x = 188;
            _local1.y = 591;
            _local1.label = "trace 开关";
            _local1.setStyle("color", 0xFFFFFF);
            _local1.addEventListener("change", this.__traceSwitch_change);
            _local1.id = "traceSwitch";
            if (!_local1.document){
                _local1.document = this;
            };
            this.traceSwitch = _local1;
            BindingManager.executeBindings(this, "traceSwitch", this.traceSwitch);
            return (_local1);
        }
        public function __traceSwitch_change(_arg1:Event):void{
            LuaAgent.getInstance().enableTrace(this.traceSwitch.selected);
        }
        private function _debugWindow_TextInput4_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 388;
            _local1.y = 179;
            _local1.width = 46;
            _local1.id = "test3Num";
            if (!_local1.document){
                _local1.document = this;
            };
            this.test3Num = _local1;
            BindingManager.executeBindings(this, "test3Num", this.test3Num);
            return (_local1);
        }
        private function _debugWindow_TextInput5_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 388;
            _local1.y = 211;
            _local1.width = 46;
            _local1.id = "test4Num";
            if (!_local1.document){
                _local1.document = this;
            };
            this.test4Num = _local1;
            BindingManager.executeBindings(this, "test4Num", this.test4Num);
            return (_local1);
        }
        private function _debugWindow_Button17_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 149;
            _local1.label = "test2";
            _local1.width = 79;
            _local1.height = 22;
            _local1.addEventListener("click", this.___debugWindow_Button17_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button17_click(_arg1:MouseEvent):void{
            this.test2();
        }
        private function _debugWindow_Button18_c():Button{
            var _local1:Button = new Button();
            _local1.x = 100;
            _local1.y = 607;
            _local1.label = "全屏";
            _local1.toolTip = "全屏后将不响应键盘！！！";
            _local1.height = 23;
            _local1.width = 80;
            _local1.addEventListener("click", this.___debugWindow_Button18_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button18_click(_arg1:MouseEvent):void{
            stage.displayState = ((stage.displayState == StageDisplayState.NORMAL)) ? StageDisplayState.FULL_SCREEN : StageDisplayState.NORMAL;
        }
        private function _debugWindow_Button19_c():Button{
            var _local1:Button = new Button();
            _local1.x = 276;
            _local1.y = 10;
            _local1.label = "性能窗口";
            _local1.width = 79;
            _local1.addEventListener("click", this.___debugWindow_Button19_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button19_click(_arg1:MouseEvent):void{
            this.showHideFrameWindow();
        }
        private function _debugWindow_Button20_c():Button{
            var _local1:Button = new Button();
            _local1.x = 364;
            _local1.y = 10;
            _local1.label = "EmbedLua";
            _local1.toolTip = "输出需要Embed的 lua 文件";
            _local1.addEventListener("click", this.___debugWindow_Button20_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button20_click(_arg1:MouseEvent):void{
            BuildEmbedLuaFileList.build();
        }
        private function _debugWindow_Button21_c():Button{
            var _local1:Button = new Button();
            _local1.x = 107;
            _local1.y = 674;
            _local1.label = "生成";
            _local1.width = 56;
            _local1.height = 41;
            _local1.addEventListener("click", this.___debugWindow_Button21_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button21_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run((((((((((("d:do_operation('', 'debug_add_card', '" + this.newPName.selectedItem) + "', ") + this.newId.text) + ", '") + this.newSlot.selectedItem) + "', 1, ") + this.newBack.selected) + ", ") + this.newDef.selected) + ")"));
        }
        private function _debugWindow_CheckBox2_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 11;
            _local1.y = 697;
            _local1.label = "def";
            _local1.selected = false;
            _local1.id = "newDef";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newDef = _local1;
            BindingManager.executeBindings(this, "newDef", this.newDef);
            return (_local1);
        }
        private function _debugWindow_CheckBox3_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.x = 11;
            _local1.y = 675;
            _local1.label = "back";
            _local1.selected = false;
            _local1.id = "newBack";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newBack = _local1;
            BindingManager.executeBindings(this, "newBack", this.newBack);
            return (_local1);
        }
        private function _debugWindow_ComboBox2_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 56;
            _local1.y = 644;
            _local1.width = 38;
            _local1.id = "newPName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newPName = _local1;
            BindingManager.executeBindings(this, "newPName", this.newPName);
            return (_local1);
        }
        private function _debugWindow_ComboBox3_i():ComboBox{
            var _local1:ComboBox = new ComboBox();
            _local1.x = 97;
            _local1.y = 644;
            _local1.width = 67;
            _local1.id = "newSlot";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newSlot = _local1;
            BindingManager.executeBindings(this, "newSlot", this.newSlot);
            return (_local1);
        }
        private function _debugWindow_TextInput6_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 11;
            _local1.y = 645;
            _local1.width = 42;
            _local1.id = "newId";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newId = _local1;
            BindingManager.executeBindings(this, "newId", this.newId);
            return (_local1);
        }
        private function _debugWindow_HRule1_c():HRule{
            var _local1:HRule = new HRule();
            _local1.x = 10;
            _local1.y = 637;
            _local1.width = 154;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _debugWindow_HRule2_c():HRule{
            var _local1:HRule = new HRule();
            _local1.x = 11;
            _local1.y = 720;
            _local1.width = 154;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _debugWindow_CheckBox4_i():CheckBox{
            var _local1:CheckBox = new CheckBox();
            _local1.selected = false;
            _local1.x = 302;
            _local1.y = 319;
            _local1.label = "点击快进";
            _local1.id = "clickSkipSwitch";
            if (!_local1.document){
                _local1.document = this;
            };
            this.clickSkipSwitch = _local1;
            BindingManager.executeBindings(this, "clickSkipSwitch", this.clickSkipSwitch);
            return (_local1);
        }
        private function _debugWindow_Button22_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 345;
            _local1.label = "注册账户";
            _local1.width = 153;
            _local1.height = 36;
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 30);
            _local1.addEventListener("click", this.___debugWindow_Button22_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button22_click(_arg1:MouseEvent):void{
            RegisterWindow.showRegisterWindow();
        }
        private function _debugWindow_Button23_c():Button{
            var _local1:Button = new Button();
            _local1.x = 301;
            _local1.y = 389;
            _local1.label = "显示鼠标位置";
            _local1.width = 153;
            _local1.height = 36;
            _local1.addEventListener("click", this.___debugWindow_Button23_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button23_click(_arg1:MouseEvent):void{
            MousePos.autoShowHideMousePos();
        }
        private function _debugWindow_Button24_c():Button{
            var _local1:Button = new Button();
            _local1.x = 280;
            _local1.y = 678;
            _local1.label = "显示GM窗口";
            _local1.width = 153;
            _local1.height = 36;
            _local1.addEventListener("click", this.___debugWindow_Button24_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___debugWindow_Button24_click(_arg1:MouseEvent):void{
            TCGClient.getInstance().mainGroup.addElement(new GmWindow());
        }
        public function ___debugWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.init();
        }
        private function _debugWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():IList{
                return (statesArray);
            }, null, "stateComb.dataProvider");
            result[1] = new Binding(this, function ():IList{
                return (newPNameArray);
            }, null, "newPName.dataProvider");
            result[2] = new Binding(this, function ():IList{
                return (newSlotArray);
            }, null, "newSlot.dataProvider");
            return (result);
        }
        public function get clickSkipSwitch():CheckBox{
            return (this._1823308485clickSkipSwitch);
        }
        public function set clickSkipSwitch(_arg1:CheckBox):void{
            var _local2:Object = this._1823308485clickSkipSwitch;
            if (_local2 !== _arg1){
                this._1823308485clickSkipSwitch = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickSkipSwitch", _local2, _arg1));
                };
            };
        }
        public function get guideStartStep():TextInput{
            return (this._1932411214guideStartStep);
        }
        public function set guideStartStep(_arg1:TextInput):void{
            var _local2:Object = this._1932411214guideStartStep;
            if (_local2 !== _arg1){
                this._1932411214guideStartStep = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guideStartStep", _local2, _arg1));
                };
            };
        }
        public function get in2Txt():TextArea{
            return (this._1185745021in2Txt);
        }
        public function set in2Txt(_arg1:TextArea):void{
            var _local2:Object = this._1185745021in2Txt;
            if (_local2 !== _arg1){
                this._1185745021in2Txt = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "in2Txt", _local2, _arg1));
                };
            };
        }
        public function get inAngel():TextInput{
            return (this._1911220700inAngel);
        }
        public function set inAngel(_arg1:TextInput):void{
            var _local2:Object = this._1911220700inAngel;
            if (_local2 !== _arg1){
                this._1911220700inAngel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inAngel", _local2, _arg1));
                };
            };
        }
        public function get inTxt():TextArea{
            return (this._100331275inTxt);
        }
        public function set inTxt(_arg1:TextArea):void{
            var _local2:Object = this._100331275inTxt;
            if (_local2 !== _arg1){
                this._100331275inTxt = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "inTxt", _local2, _arg1));
                };
            };
        }
        public function get newBack():CheckBox{
            return (this._1844662951newBack);
        }
        public function set newBack(_arg1:CheckBox):void{
            var _local2:Object = this._1844662951newBack;
            if (_local2 !== _arg1){
                this._1844662951newBack = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newBack", _local2, _arg1));
                };
            };
        }
        public function get newDef():CheckBox{
            return (this._1048871355newDef);
        }
        public function set newDef(_arg1:CheckBox):void{
            var _local2:Object = this._1048871355newDef;
            if (_local2 !== _arg1){
                this._1048871355newDef = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newDef", _local2, _arg1));
                };
            };
        }
        public function get newId():TextInput{
            return (this._104712923newId);
        }
        public function set newId(_arg1:TextInput):void{
            var _local2:Object = this._104712923newId;
            if (_local2 !== _arg1){
                this._104712923newId = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newId", _local2, _arg1));
                };
            };
        }
        public function get newPName():ComboBox{
            return (this._1362338139newPName);
        }
        public function set newPName(_arg1:ComboBox):void{
            var _local2:Object = this._1362338139newPName;
            if (_local2 !== _arg1){
                this._1362338139newPName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newPName", _local2, _arg1));
                };
            };
        }
        public function get newSlot():ComboBox{
            return (this._1845180350newSlot);
        }
        public function set newSlot(_arg1:ComboBox):void{
            var _local2:Object = this._1845180350newSlot;
            if (_local2 !== _arg1){
                this._1845180350newSlot = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newSlot", _local2, _arg1));
                };
            };
        }
        public function get stateComb():ComboBox{
            return (this._2086389966stateComb);
        }
        public function set stateComb(_arg1:ComboBox):void{
            var _local2:Object = this._2086389966stateComb;
            if (_local2 !== _arg1){
                this._2086389966stateComb = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "stateComb", _local2, _arg1));
                };
            };
        }
        public function get test3Num():TextInput{
            return (this._1147793947test3Num);
        }
        public function set test3Num(_arg1:TextInput):void{
            var _local2:Object = this._1147793947test3Num;
            if (_local2 !== _arg1){
                this._1147793947test3Num = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "test3Num", _local2, _arg1));
                };
            };
        }
        public function get test4Num():TextInput{
            return (this._1147764156test4Num);
        }
        public function set test4Num(_arg1:TextInput):void{
            var _local2:Object = this._1147764156test4Num;
            if (_local2 !== _arg1){
                this._1147764156test4Num = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "test4Num", _local2, _arg1));
                };
            };
        }
        public function get traceMsg():TextArea{
            return (this._1270283260traceMsg);
        }
        public function set traceMsg(_arg1:TextArea):void{
            var _local2:Object = this._1270283260traceMsg;
            if (_local2 !== _arg1){
                this._1270283260traceMsg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "traceMsg", _local2, _arg1));
                };
            };
        }
        public function get traceSwitch():CheckBox{
            return (this._227396825traceSwitch);
        }
        public function set traceSwitch(_arg1:CheckBox):void{
            var _local2:Object = this._227396825traceSwitch;
            if (_local2 !== _arg1){
                this._227396825traceSwitch = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "traceSwitch", _local2, _arg1));
                };
            };
        }
        public function get tttt():Label{
            return (this._3570944tttt);
        }
        public function set tttt(_arg1:Label):void{
            var _local2:Object = this._3570944tttt;
            if (_local2 !== _arg1){
                this._3570944tttt = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tttt", _local2, _arg1));
                };
            };
        }
        public function get updateOneLuaFileName():TextInput{
            return (this._222501598updateOneLuaFileName);
        }
        public function set updateOneLuaFileName(_arg1:TextInput):void{
            var _local2:Object = this._222501598updateOneLuaFileName;
            if (_local2 !== _arg1){
                this._222501598updateOneLuaFileName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "updateOneLuaFileName", _local2, _arg1));
                };
            };
        }
        private function get statesArray():ArrayCollection{
            return (this._2060854647statesArray);
        }
        private function set statesArray(_arg1:ArrayCollection):void{
            var _local2:Object = this._2060854647statesArray;
            if (_local2 !== _arg1){
                this._2060854647statesArray = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "statesArray", _local2, _arg1));
                };
            };
        }
        private function get newPNameArray():ArrayCollection{
            return (this._772046402newPNameArray);
        }
        private function set newPNameArray(_arg1:ArrayCollection):void{
            var _local2:Object = this._772046402newPNameArray;
            if (_local2 !== _arg1){
                this._772046402newPNameArray = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newPNameArray", _local2, _arg1));
                };
            };
        }
        private function get newSlotArray():ArrayCollection{
            return (this._963735867newSlotArray);
        }
        private function set newSlotArray(_arg1:ArrayCollection):void{
            var _local2:Object = this._963735867newSlotArray;
            if (_local2 !== _arg1){
                this._963735867newSlotArray = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newSlotArray", _local2, _arg1));
                };
            };
        }

    }
}//package 

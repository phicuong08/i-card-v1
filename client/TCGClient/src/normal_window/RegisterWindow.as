//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import flash.display.*;
    
    import flash.geom.*;
    
    import flash.events.*;
    import flash.text.*;
    
    import spark.components.*;
   
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import web_service.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
    
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;
	
	import mx.binding.*;
	import mx.events.*;
	import mx.effects.Parallel;
	import mx.filters.*;
	import mx.styles.*;
	
    public class RegisterWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _RegisterWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _RegisterWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _RegisterWindow_Scale1:Scale;
        public var _RegisterWindow_Scale2:Scale;
        private var _1177318867account:TextInput;
        private var _413245038addEffect:Parallel;
        private var _842377084confirmBtn:Button;
        private var _273241018mainGroup:Group;
        private var _1216032443passWord:TextInput;
        private var _983193477passWordConfirm:TextInput;
        private var _1267520715removeEffect:Parallel;
        private var _481019159warningText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var isRegistering:Boolean = false;
        private var _embed_mxml_source_commonUI____png_1538356188:Class;
        private var _embed_mxml_source_commonUI_______png_425445134:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function RegisterWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI____png_1538356188 = RegisterWindow__embed_mxml_source_commonUI____png_1538356188;
            this._embed_mxml_source_commonUI_______png_425445134 = RegisterWindow__embed_mxml_source_commonUI_______png_425445134;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RegisterWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_RegisterWindowWatcherSetupUtil");
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
            this.depth = 10;
            this.layout = this._RegisterWindow_BasicLayout1_c();
            this.mxmlContent = [this._RegisterWindow_Group2_i()];
            this._RegisterWindow_Parallel1_i();
            this._RegisterWindow_Parallel2_i();
            this.addEventListener("initialize", this.___RegisterWindow_Group1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function showRegisterWindow():void{
            TCGClient.getInstance().mainGroup.addElement(new (RegisterWindow)());
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RegisterWindow._watcherSetupUtil = _arg1;
        }

        override public function set moduleFactory(_arg1:IFlexModuleFactory):void{
            var factory:* = _arg1;
            super.moduleFactory = factory;
            if (this.__moduleFactoryInitialized){
                return;
            };
            this.__moduleFactoryInitialized = true;
            if (!this.styleDeclaration){
                this.styleDeclaration = new CSSStyleDeclaration(null, styleManager);
            };
            this.styleDeclaration.defaultFactory = function ():void{
                this.color = 14532255;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        private function drawBackGround():void{
            this.graphics.beginFill(0, 0.7);
            this.graphics.drawRect(0, 0, width, height);
            this.graphics.endFill();
        }
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function doRegister():void{
            var arr:* = null;
            var resetTimer:* = null;
            var feedBackHandler:* = null;
            if (this.isRegistering){
                return;
            };
            this.hideTooltip();
            if (this.account.text.toString().length == 0){
                this.confirmBtn.toolTip = "请输入账号";
            } else {
                if (this.passWord.text.toString().length == 0){
                    this.confirmBtn.toolTip = "请输入密码";
                } else {
                    if (this.passWordConfirm.text.toString().length == 0){
                        this.confirmBtn.toolTip = "请输入确认密码";
                    } else {
                        if (this.passWord.text != this.passWordConfirm.text){
                            this.confirmBtn.toolTip = "两次输入的密码不一致！";
                        } else {
                            if (((!((this.account.text.indexOf(",") == -1))) || (!((this.passWord.text.indexOf(",") == -1))))){
                                this.confirmBtn.toolTip = "不允许使用半角逗号“,”";
                            } else {
                                feedBackHandler = function (_arg1):void{
                                    isRegistering = false;
                                    MySocket.getInstance().removeEventListener(MySocket.SOCKET_FAILED, feedBackHandler);
                                    MySocket.getInstance().removeEventListener("register_ok", feedBackHandler);
                                    MySocket.getInstance().removeEventListener("register_failed", feedBackHandler);
                                    resetTimer.removeEventListener(TimerEvent.TIMER, feedBackHandler);
                                    resetTimer.stop();
                                    if ((_arg1 is MySocketEvent)){
                                        if (_arg1.type == "register_ok"){
                                            warningText.setStyle("color", 0xFF00);
                                            warningText.text = "注册成功！";
                                            removeSelf();
                                        } else {
                                            if (_arg1.message == "versionError"){
                                                warningText.setStyle("color", 0xFF0000);
                                                warningText.text = "游戏版本过低！";
                                                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "游戏版本过低！请刷新浏览器页面。");
                                            } else {
                                                if (_arg1.message == "accountExist"){
                                                    warningText.setStyle("color", 0xFF0000);
                                                    warningText.text = "已存在的账号名！";
                                                };
                                            };
                                        };
                                    } else {
                                        warningText.setStyle("color", 0xFF0000);
                                        warningText.text = "无法连接服务器！";
                                    };
                                };
                                this.isRegistering = true;
                                this.warningText.setStyle("color", 0xFF00);
                                this.warningText.text = "注册中，请稍候...";
                                arr = LuaAgent.getInstance().run("return g_version_str");
                                MySocket.getInstance().sendMsgToServer(((((("register:" + this.account.text) + ",") + this.passWord.text) + ",") + arr[1]));
                                MySocket.getInstance().addEventListener(MySocket.SOCKET_FAILED, feedBackHandler);
                                MySocket.getInstance().addEventListener("register_ok", feedBackHandler);
                                MySocket.getInstance().addEventListener("register_failed", feedBackHandler);
                                resetTimer = new Timer(5000, 1);
                                resetTimer.addEventListener(TimerEvent.TIMER, feedBackHandler);
                                resetTimer.start();
                            };
                        };
                    };
                };
            };
        }
        protected function hideTooltip():void{
            this.confirmBtn.toolTip = null;
        }
        private function _RegisterWindow_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 500;
            _local1.children = [this._RegisterWindow_Fade1_c(), this._RegisterWindow_Scale1_i()];
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _RegisterWindow_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.1;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.1;
            _local1.scaleYTo = 1;
            this._RegisterWindow_Scale1 = _local1;
            BindingManager.executeBindings(this, "_RegisterWindow_Scale1", this._RegisterWindow_Scale1);
            return (_local1);
        }
        private function _RegisterWindow_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 500;
            _local1.children = [this._RegisterWindow_Fade2_c(), this._RegisterWindow_Scale2_i()];
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _RegisterWindow_Fade2_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_Scale2_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 1;
            _local1.scaleXTo = 0.1;
            _local1.scaleYFrom = 1;
            _local1.scaleYTo = 0.1;
            this._RegisterWindow_Scale2 = _local1;
            BindingManager.executeBindings(this, "_RegisterWindow_Scale2", this._RegisterWindow_Scale2);
            return (_local1);
        }
        private function _RegisterWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.x = 487;
            _local1.y = 270;
            _local1.width = 306;
            _local1.height = 260;
            _local1.mxmlContent = [this._RegisterWindow_CommonOuterFrame1_i(), this._RegisterWindow_CommonMiddleFrame1_i(), this._RegisterWindow_SmoothBitmapImage1_c(), this._RegisterWindow_Label1_c(), this._RegisterWindow_Label2_i(), this._RegisterWindow_Label3_c(), this._RegisterWindow_SmoothBitmapImage2_c(), this._RegisterWindow_TextInput1_i(), this._RegisterWindow_Label4_c(), this._RegisterWindow_SmoothBitmapImage3_c(), this._RegisterWindow_TextInput2_i(), this._RegisterWindow_Label5_c(), this._RegisterWindow_SmoothBitmapImage4_c(), this._RegisterWindow_TextInput3_i(), this._RegisterWindow_Button1_i(), this._RegisterWindow_Button2_c()];
            _local1.id = "mainGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mainGroup = _local1;
            BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
            return (_local1);
        }
        private function _RegisterWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._RegisterWindow_DropShadowFilter1_c()];
            _local1.id = "_RegisterWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RegisterWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_RegisterWindow_CommonOuterFrame1", this._RegisterWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _RegisterWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 14;
            _local1.y = 43;
            _local1.alpha = 0.4;
            _local1.id = "_RegisterWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RegisterWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_RegisterWindow_CommonMiddleFrame1", this._RegisterWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _RegisterWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 84;
            _local1.y = 16;
            _local1.source = this._embed_mxml_source_commonUI____png_1538356188;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.text = "注 册";
            _local1.x = 131;
            _local1.y = 9;
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("color", 14995578);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 134;
            _local1.y = 54;
            _local1.setStyle("fontSize", 14);
            _local1.id = "warningText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.warningText = _local1;
            BindingManager.executeBindings(this, "warningText", this.warningText);
            return (_local1);
        }
        private function _RegisterWindow_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.text = "账    号：";
            _local1.x = 60;
            _local1.y = 82;
            _local1.setStyle("fontSize", 14);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 130;
            _local1.y = 77;
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 135;
            _local1.y = 77;
            _local1.width = 126;
            _local1.height = 23;
            _local1.maxChars = 20;
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "account";
            if (!_local1.document){
                _local1.document = this;
            };
            this.account = _local1;
            BindingManager.executeBindings(this, "account", this.account);
            return (_local1);
        }
        private function _RegisterWindow_Label4_c():Label{
            var _local1:Label = new Label();
            _local1.text = "密    码：";
            _local1.x = 60;
            _local1.y = 121;
            _local1.setStyle("fontSize", 14);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_SmoothBitmapImage3_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 130;
            _local1.y = 116;
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_TextInput2_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 135;
            _local1.y = 116;
            _local1.width = 126;
            _local1.height = 23;
            _local1.maxChars = 20;
            _local1.displayAsPassword = true;
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "passWord";
            if (!_local1.document){
                _local1.document = this;
            };
            this.passWord = _local1;
            BindingManager.executeBindings(this, "passWord", this.passWord);
            return (_local1);
        }
        private function _RegisterWindow_Label5_c():Label{
            var _local1:Label = new Label();
            _local1.text = "确认密码：";
            _local1.x = 60;
            _local1.y = 160;
            _local1.setStyle("fontSize", 14);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_SmoothBitmapImage4_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 130;
            _local1.y = 155;
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RegisterWindow_TextInput3_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 135;
            _local1.y = 155;
            _local1.width = 126;
            _local1.height = 23;
            _local1.maxChars = 20;
            _local1.displayAsPassword = true;
            _local1.setStyle("skinClass", textInputSkin);
            _local1.id = "passWordConfirm";
            if (!_local1.document){
                _local1.document = this;
            };
            this.passWordConfirm = _local1;
            BindingManager.executeBindings(this, "passWordConfirm", this.passWordConfirm);
            return (_local1);
        }
        private function _RegisterWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.x = 55;
            _local1.y = 218;
            _local1.label = "注 册";
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__confirmBtn_click);
            _local1.addEventListener("rollOut", this.__confirmBtn_rollOut);
            _local1.id = "confirmBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.confirmBtn = _local1;
            BindingManager.executeBindings(this, "confirmBtn", this.confirmBtn);
            return (_local1);
        }
        public function __confirmBtn_click(_arg1:MouseEvent):void{
            this.doRegister();
        }
        public function __confirmBtn_rollOut(_arg1:MouseEvent):void{
            this.hideTooltip();
        }
        private function _RegisterWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.x = 176;
            _local1.y = 218;
            _local1.label = "关 闭";
            _local1.width = 75;
            _local1.height = 27;
            _local1.buttonMode = true;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___RegisterWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___RegisterWindow_Button2_click(_arg1:MouseEvent):void{
            this.removeSelf();
        }
        public function ___RegisterWindow_Group1_initialize(_arg1:FlexEvent):void{
            this.drawBackGround();
        }
        private function _RegisterWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, null, null, "_RegisterWindow_Scale1.target", "mainGroup");
            result[3] = new Binding(this, null, null, "_RegisterWindow_Scale2.target", "mainGroup");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [306, 260];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RegisterWindow_CommonOuterFrame1.size");
            result[5] = new Binding(this, function ():Array{
                var _local1:* = [278, 167];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_RegisterWindow_CommonMiddleFrame1.size");
            return (result);
        }
        public function get account():TextInput{
            return (this._1177318867account);
        }
        public function set account(_arg1:TextInput):void{
            var _local2:Object = this._1177318867account;
            if (_local2 !== _arg1){
                this._1177318867account = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "account", _local2, _arg1));
                };
            };
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
        public function get confirmBtn():Button{
            return (this._842377084confirmBtn);
        }
        public function set confirmBtn(_arg1:Button):void{
            var _local2:Object = this._842377084confirmBtn;
            if (_local2 !== _arg1){
                this._842377084confirmBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "confirmBtn", _local2, _arg1));
                };
            };
        }
        public function get mainGroup():Group{
            return (this._273241018mainGroup);
        }
        public function set mainGroup(_arg1:Group):void{
            var _local2:Object = this._273241018mainGroup;
            if (_local2 !== _arg1){
                this._273241018mainGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainGroup", _local2, _arg1));
                };
            };
        }
        public function get passWord():TextInput{
            return (this._1216032443passWord);
        }
        public function set passWord(_arg1:TextInput):void{
            var _local2:Object = this._1216032443passWord;
            if (_local2 !== _arg1){
                this._1216032443passWord = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "passWord", _local2, _arg1));
                };
            };
        }
        public function get passWordConfirm():TextInput{
            return (this._983193477passWordConfirm);
        }
        public function set passWordConfirm(_arg1:TextInput):void{
            var _local2:Object = this._983193477passWordConfirm;
            if (_local2 !== _arg1){
                this._983193477passWordConfirm = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "passWordConfirm", _local2, _arg1));
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
        public function get warningText():Label{
            return (this._481019159warningText);
        }
        public function set warningText(_arg1:Label):void{
            var _local2:Object = this._481019159warningText;
            if (_local2 !== _arg1){
                this._481019159warningText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "warningText", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

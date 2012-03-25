//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import SoundSystem.*;
    
    import combat_element_script.*;
    
    import custom_control1.*;
    
    import custom_effect.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
 //   import flash.filters.*;
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
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import skins.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.layouts.*;
    
    import tool.*;
    
    import web_service.*;
	use namespace mx_internal;
    public class LoginWindowSimple extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _2022732339loginBtn:Button;
        private var _2133315399registerBtn:Button;
        private var _1617936797txtAccount:TextInput;
        private var _878648671txtPass:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var hasCreationComplete:Boolean = false;
        private var isLogin:Boolean = false;
        private var _embed_mxml_source_loginWindowUI____png_1320646074:Class;
        private var _embed_mxml_source_loginWindowUI____png_1450273914:Class;
        private var _embed_mxml_source_backgroundImages______png_463724178:Class;
        private var _embed_mxml_source_loginWindowUI____png_1324575930:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function LoginWindowSimple(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_loginWindowUI____png_1320646074 = LoginWindowSimple__embed_mxml_source_loginWindowUI____png_1320646074;
            this._embed_mxml_source_loginWindowUI____png_1450273914 = LoginWindowSimple__embed_mxml_source_loginWindowUI____png_1450273914;
            this._embed_mxml_source_backgroundImages______png_463724178 = LoginWindowSimple__embed_mxml_source_backgroundImages______png_463724178;
            this._embed_mxml_source_loginWindowUI____png_1324575930 = LoginWindowSimple__embed_mxml_source_loginWindowUI____png_1324575930;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._LoginWindowSimple_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_LoginWindowSimpleWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (LoginWindowSimple[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.mouseChildren = false;
            this.layout = this._LoginWindowSimple_BasicLayout1_c();
            this.mxmlContent = [this._LoginWindowSimple_SmoothBitmapImage1_c(), this._LoginWindowSimple_SmoothBitmapImage2_c(), this._LoginWindowSimple_SmoothBitmapImage3_c(), this._LoginWindowSimple_SmoothBitmapImage4_c(), this._LoginWindowSimple_SmoothBitmapImage5_c(), this._LoginWindowSimple_Button1_i(), this._LoginWindowSimple_Button2_i(), this._LoginWindowSimple_TextInput1_i(), this._LoginWindowSimple_TextInput2_i(), this._LoginWindowSimple_Label1_c()];
            this._LoginWindowSimple_Fade1_i();
            this.addEventListener("creationComplete", this.___LoginWindowSimple_Group1_creationComplete);
            this.addEventListener("remove", this.___LoginWindowSimple_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            LoginWindowSimple._watcherSetupUtil = _arg1;
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
        protected function login():void{
            var w:* = null;
            var resetTimer:* = null;
            var hideWindowAndResetState:* = null;
            var resetLoginState:* = null;
            hideWindowAndResetState = function (_arg1):void{
                w.hideWindow();
                resetLoginState();
            };
            resetLoginState = function (_arg1=null):void{
                resetTimer.removeEventListener(TimerEvent.TIMER, resetLoginState);
                resetTimer.stop();
                MySocket.getInstance().removeEventListener(MySocket.SOCKET_FAILED, resetLoginState);
                MySocket.getInstance().removeEventListener("login_failed", hideWindowAndResetState);
                TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, hideWindowAndResetState);
                isLogin = false;
            };
            if ((((((this.txtAccount.text.length == 0)) || ((this.txtPass.text.length == 0)))) || (this.isLogin))){
                return;
            };
            if (((!((this.txtAccount.text.indexOf(",") == -1))) || (!((this.txtPass.text.indexOf(",") == -1))))){
                MessageBox.showMessageBox(MessageBox.NOTICE, "提示", "不允许使用半角逗号“,”");
                return;
            };
            this.isLogin = true;
            var arr:* = LuaAgent.getInstance().run("return g_version_str");
            w = NoticeWindow.showNotice("登录中，请稍候...", 8000, false);
            MySocket.getInstance().sendMsgToServer(((((("login:" + this.txtAccount.text) + ",") + this.txtPass.text) + ",") + arr[1]));
            MySocket.getInstance().addEventListener(MySocket.SOCKET_FAILED, resetLoginState);
            MySocket.getInstance().addEventListener("login_failed", hideWindowAndResetState);
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, hideWindowAndResetState);
            resetTimer = new Timer(8000, 1);
            resetTimer.addEventListener(TimerEvent.TIMER, resetLoginState);
            resetTimer.start();
        }
        private function playRemoveEffect():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local1.play();
            mouseChildren = false;
            this.txtPass.text = "";
        }
        protected function txtInput_keyDownHandler(_arg1:KeyboardEvent):void{
            if (_arg1.charCode == 13){
                if (MessageBox.isMessageBoxShow){
                    return;
                };
                SoundMgr.getInstance().playEffectSound("click_3");
                this.login();
            };
        }
        private function gotoWebsite():void{
            navigateToURL(new URLRequest((("http://" + UrlTool.getIp()) + "/bbs/register.php")));
        }
        protected function addEffect_effectEndHandler(_arg1:EffectEvent):void{
            mouseChildren = true;
            SoundMgr.getInstance().playBgSound("bg_main");
        }
        private function _LoginWindowSimple_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 1000;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            this.addEffect_effectEndHandler(_arg1);
        }
        private function _LoginWindowSimple_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_backgroundImages______png_463724178;
            _local1.horizontalCenter = 0;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loginWindowUI____png_1324575930;
            _local1.x = 382;
            _local1.y = 454;
            _local1.scaleX = 1.34;
            _local1.scaleY = 1.34;
            _local1.alpha = 0.7;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_SmoothBitmapImage3_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loginWindowUI____png_1324575930;
            _local1.x = 592;
            _local1.y = 556;
            _local1.alpha = 0.7;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_SmoothBitmapImage4_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loginWindowUI____png_1320646074;
            _local1.x = 479;
            _local1.y = 488;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_SmoothBitmapImage5_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loginWindowUI____png_1450273914;
            _local1.x = 672;
            _local1.y = 488;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.x = 618;
            _local1.y = 569;
            _local1.setStyle("skinClass", loginWindowRegisterBtnSkin);
            _local1.addEventListener("mouseDown", this.__registerBtn_mouseDown);
            _local1.addEventListener("click", this.__registerBtn_click);
            _local1.id = "registerBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.registerBtn = _local1;
            BindingManager.executeBindings(this, "registerBtn", this.registerBtn);
            return (_local1);
        }
        public function __registerBtn_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("click_2");
        }
        public function __registerBtn_click(_arg1:MouseEvent):void{
            this.gotoWebsite();
        }
        private function _LoginWindowSimple_Button2_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.x = 760;
            _local1.y = 564;
            _local1.setStyle("skinClass", loginWindowLoginBtnSkin);
            _local1.addEventListener("mouseDown", this.__loginBtn_mouseDown);
            _local1.addEventListener("click", this.__loginBtn_click);
            _local1.id = "loginBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.loginBtn = _local1;
            BindingManager.executeBindings(this, "loginBtn", this.loginBtn);
            return (_local1);
        }
        public function __loginBtn_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("click_3");
        }
        public function __loginBtn_click(_arg1:MouseEvent):void{
            this.login();
        }
        private function _LoginWindowSimple_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 530;
            _local1.y = 446;
            _local1.width = 134;
            _local1.height = 104;
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("skinClass", textInputSkin);
            _local1.addEventListener("keyDown", this.__txtAccount_keyDown);
            _local1.id = "txtAccount";
            if (!_local1.document){
                _local1.document = this;
            };
            this.txtAccount = _local1;
            BindingManager.executeBindings(this, "txtAccount", this.txtAccount);
            return (_local1);
        }
        public function __txtAccount_keyDown(_arg1:KeyboardEvent):void{
            this.txtInput_keyDownHandler(_arg1);
        }
        private function _LoginWindowSimple_TextInput2_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.displayAsPassword = true;
            _local1.x = 726;
            _local1.y = 446;
            _local1.width = 214;
            _local1.height = 104;
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("skinClass", textInputSkin);
            _local1.addEventListener("keyDown", this.__txtPass_keyDown);
            _local1.id = "txtPass";
            if (!_local1.document){
                _local1.document = this;
            };
            this.txtPass = _local1;
            BindingManager.executeBindings(this, "txtPass", this.txtPass);
            return (_local1);
        }
        public function __txtPass_keyDown(_arg1:KeyboardEvent):void{
            this.txtInput_keyDownHandler(_arg1);
        }
        private function _LoginWindowSimple_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.text = "抵制不良游戏，拒绝盗版游戏。注意自我保护，谨防受骗上当。适度游戏宜脑，沉迷游戏伤身。合理安排时间，享受健康生活。";
            _local1.horizontalCenter = 0;
            _local1.bottom = 26;
            _local1.filters = [this._LoginWindowSimple_GlowFilter1_c()];
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 16767396);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _LoginWindowSimple_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___LoginWindowSimple_Group1_creationComplete(_arg1:FlexEvent):void{
            this.hasCreationComplete = true;
        }
        public function ___LoginWindowSimple_Group1_remove(_arg1:FlexEvent):void{
            this.playRemoveEffect();
        }
        private function _LoginWindowSimple_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get loginBtn():Button{
            return (this._2022732339loginBtn);
        }
        public function set loginBtn(_arg1:Button):void{
            var _local2:Object = this._2022732339loginBtn;
            if (_local2 !== _arg1){
                this._2022732339loginBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loginBtn", _local2, _arg1));
                };
            };
        }
        public function get registerBtn():Button{
            return (this._2133315399registerBtn);
        }
        public function set registerBtn(_arg1:Button):void{
            var _local2:Object = this._2133315399registerBtn;
            if (_local2 !== _arg1){
                this._2133315399registerBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "registerBtn", _local2, _arg1));
                };
            };
        }
        public function get txtAccount():TextInput{
            return (this._1617936797txtAccount);
        }
        public function set txtAccount(_arg1:TextInput):void{
            var _local2:Object = this._1617936797txtAccount;
            if (_local2 !== _arg1){
                this._1617936797txtAccount = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtAccount", _local2, _arg1));
                };
            };
        }
        public function get txtPass():TextInput{
            return (this._878648671txtPass);
        }
        public function set txtPass(_arg1:TextInput):void{
            var _local2:Object = this._878648671txtPass;
            if (_local2 !== _arg1){
                this._878648671txtPass = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "txtPass", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

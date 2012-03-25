//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import web_service.*;
    import spark.effects.*;
    import spark.layouts.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class CreateUserWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CreateUserWindow_CommonHeadImageFrame1:CommonHeadImageFrame;
        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var _266842037userHead:MyImage;
        private var _1117580172userNameInput:TextInput;
        private var __moduleFactoryInitialized:Boolean = false;
        private var headNum:int = 20;
        private var hearGroupRadius:Number = 500;
        private var xEexcursion:Number;
        private var zEexcursion:Number;
        private var cosAngle:Number;
        private var sinAngle:Number;
        private var headItemArray:Array;
        private var lastMouseXPos:Number;
        private var needChangeSpeed:Boolean = false;
        private var lastSpeedArg:Number = 0;
        private var currentSelectHeadItem:CreateUserWindowHeadItem;
        private var _embed_mxml_source_createUserWindowUI______png_1122428782:Class;
        private var _embed_mxml_source_buttonImages____png_221451730:Class;
        private var _embed_mxml_source_commonUI_______png_425445134:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CreateUserWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.headItemArray = new Array();
            this._embed_mxml_source_createUserWindowUI______png_1122428782 = CreateUserWindow__embed_mxml_source_createUserWindowUI______png_1122428782;
            this._embed_mxml_source_buttonImages____png_221451730 = CreateUserWindow__embed_mxml_source_buttonImages____png_221451730;
            this._embed_mxml_source_commonUI_______png_425445134 = CreateUserWindow__embed_mxml_source_commonUI_______png_425445134;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CreateUserWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_CreateUserWindowWatcherSetupUtil");
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
            this.mouseChildren = false;
            this.depth = 6;
            this.layout = this._CreateUserWindow_BasicLayout1_c();
            this.mxmlContent = [this._CreateUserWindow_MyImage1_i(), this._CreateUserWindow_CommonHeadImageFrame1_i(), this._CreateUserWindow_SmoothBitmapImage1_c(), this._CreateUserWindow_Label1_c(), this._CreateUserWindow_SmoothBitmapImage2_c(), this._CreateUserWindow_TextInput1_i(), this._CreateUserWindow_UniversalImageButton1_c(), this._CreateUserWindow_Label2_c(), this._CreateUserWindow_Button1_c(), this._CreateUserWindow_Button2_c()];
            this._CreateUserWindow_Fade1_i();
            this._CreateUserWindow_Fade2_i();
            this.addEventListener("initialize", this.___CreateUserWindow_Group1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CreateUserWindow._watcherSetupUtil = _arg1;
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
        protected function effectEndHandler():void{
            var _local2:CreateUserWindowHeadItem;
            var _local1:int;
            while (_local1 < this.headNum) {
                _local2 = new CreateUserWindowHeadItem();
                _local2.y = 480;
                addElement(_local2);
                _local2.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
                this.headItemArray.push(_local2);
                _local1++;
            };
            this.xEexcursion = ((this.width - this.headItemArray[0].width) / 2);
            this.zEexcursion = this.hearGroupRadius;
            this.cosAngle = Math.cos(0.01);
            this.sinAngle = -(Math.sin(0.01));
            this.setAllItemIcon();
            this.initAllItemPos();
            addEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            MySocket.getInstance().addEventListener("name_exist", this.nameExistHandler);
            MySocket.getInstance().addEventListener("login_ok", this.loginOkHandler);
        }
        private function nameExistHandler(_arg1:Event):void{
            this.createTooltip("该昵称已存在。");
        }
        private function loginOkHandler(_arg1:Event):void{
            var _local2:CreateUserWindowHeadItem;
            var _local3:*;
            MySocket.getInstance().removeEventListener("name_exist", this.nameExistHandler);
            MySocket.getInstance().removeEventListener("login_ok", this.loginOkHandler);
            this.clearTooltip();
            removeEventListener(Event.ENTER_FRAME, this.enterFrameHandler);
            for each (_local2 in this.headItemArray) {
                _local2.removeEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
            };
            _local3 = parent;
            if (_local3){
                _local3.removeElement(this);
            };
        }
        private function setAllItemIcon(_arg1:Boolean=true):void{
            var _local3:CreateUserWindowHeadItem;
            var _local2 = 1;
            while (_local2 <= this.headNum) {
                _local3 = (this.headItemArray[(_local2 - 1)] as CreateUserWindowHeadItem);
                _local3.headIconId = (_arg1) ? _local2 : (_local2 + 100);
                _local3.source = (("source/userHead/" + _local3.headIconId) + ".jpg");
                _local2++;
            };
            this.currentSelectHeadItem = this.headItemArray[Math.floor((Math.random() * this.headNum))];
            this.userHead.source = (("source/userHead/" + this.currentSelectHeadItem.headIconId) + ".jpg");
        }
        private function initAllItemPos():void{
            var _local5:CreateUserWindowHeadItem;
            var _local6:CreateUserWindowHeadItem;
            var _local7:Number;
            var _local8:Number;
            var _local9:Number;
            var _local10:Number;
            var _local1:Number = ((Math.PI * 2) / this.headNum);
            var _local2:Number = Math.cos(_local1);
            var _local3:Number = Math.sin(_local1);
            (this.headItemArray[0] as CreateUserWindowHeadItem).setPos(this.xEexcursion, (this.zEexcursion - this.hearGroupRadius));
            var _local4 = 1;
            while (_local4 < this.headNum) {
                _local5 = (this.headItemArray[_local4] as CreateUserWindowHeadItem);
                _local6 = (this.headItemArray[(_local4 - 1)] as CreateUserWindowHeadItem);
                _local7 = (_local6.x - this.xEexcursion);
                _local8 = (_local6.z - this.zEexcursion);
                _local9 = ((_local7 * _local2) - (_local8 * _local3));
                _local10 = ((_local8 * _local2) + (_local7 * _local3));
                _local5.setPos((_local9 + this.xEexcursion), (this.zEexcursion + _local10));
                _local4++;
            };
        }
        private function enterFrameHandler(_arg1:Event):void{
            var _local2:CreateUserWindowHeadItem;
            var _local3:Number;
            var _local4:Number;
            var _local5:Number;
            var _local6:Number;
            if (this.needChangeSpeed){
                this.changeSpeedByMousePos();
            } else {
                this.sinAngle = (this.sinAngle * 0.95);
                this.cosAngle = Math.sqrt((1 - (this.sinAngle * this.sinAngle)));
            };
            if (Math.abs(this.sinAngle) > 0.0001){
                for each (_local2 in this.headItemArray) {
                    _local3 = (_local2.x - this.xEexcursion);
                    _local4 = (_local2.z - this.zEexcursion);
                    _local5 = ((_local3 * this.cosAngle) - (_local4 * this.sinAngle));
                    _local6 = ((_local4 * this.cosAngle) + (_local3 * this.sinAngle));
                    _local2.setPos((_local5 + this.xEexcursion), (this.zEexcursion + _local6));
                };
            } else {
                this.changeArgToStopMove();
            };
            this.lastMouseXPos = mouseX;
        }
        private function changeArgToStopMove():void{
            this.sinAngle = 0;
            this.cosAngle = 1;
        }
        private function mouseDownHandler(_arg1:MouseEvent):void{
            var currentHeadItem:* = null;
            var xPos:* = NaN;
            var yPos:* = NaN;
            var mouseUpHandler:* = null;
            var event:* = _arg1;
            mouseUpHandler = function (_arg1:MouseEvent):void{
                if ((((currentHeadItem.mouseX == xPos)) && ((yPos == currentHeadItem.mouseY)))){
                    currentSelectHeadItem = currentHeadItem;
                    userHead.source = (("source/userHead/" + currentSelectHeadItem.headIconId) + ".jpg");
                };
                lastSpeedArg = 0;
                needChangeSpeed = false;
                removeEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
            };
            currentHeadItem = (event.currentTarget as CreateUserWindowHeadItem);
            xPos = currentHeadItem.mouseX;
            yPos = currentHeadItem.mouseY;
            this.changeArgToStopMove();
            this.needChangeSpeed = true;
            addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
        }
        private function changeSpeedByMousePos():void{
            var _local1:Number = (mouseX - this.lastMouseXPos);
            this.sinAngle = (((_local1 + this.lastSpeedArg) / 2) / this.hearGroupRadius);
            this.sinAngle = (this.sinAngle % 1);
            this.cosAngle = Math.sqrt((1 - (this.sinAngle * this.sinAngle)));
            this.lastSpeedArg = _local1;
        }
        private function confirmHandler():void{
            var _local1:* = UserObject.checkUserName(this.userNameInput.text);
            if (_local1 != true){
                this.createTooltip(_local1);
                return;
            };
            if (!this.currentSelectHeadItem){
                this.createTooltip("请选择头像。");
                return;
            };
            MySocket.getInstance().sendMsgToServer(((("create_user:" + this.userNameInput.text) + ",") + this.currentSelectHeadItem.headIconId));
        }
        private function createTooltip(_arg1:String):void{
            this.clearTooltip();
            toolTip = _arg1;
        }
        protected function clearTooltip():void{
            toolTip = null;
        }
        protected function userNameInput_keyDownHandler(_arg1:KeyboardEvent):void{
            if (this.userNameInput.text.length > 12){
                this.userNameInput.text = this.userNameInput.text.substring(0, 12);
            };
            if (_arg1.charCode == 13){
                this.confirmHandler();
            };
        }
        protected function group1_initializeHandler(_arg1:FlexEvent):void{
            alpha = 0;
            var _local2:PerspectiveProjection = new PerspectiveProjection();
            _local2.fieldOfView = 30;
            _local2.projectionCenter = new Point(640, 350);
            this.transform.perspectiveProjection = _local2;
        }
        private function _CreateUserWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__fadeInEffect_effectEnd);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
            this.effectEndHandler();
        }
        private function _CreateUserWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
            _local1.alphaTo = 0;
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        private function _CreateUserWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CreateUserWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 370;
            _local1.y = 120;
            _local1.width = 240;
            _local1.height = 240;
            _local1.id = "userHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userHead = _local1;
            BindingManager.executeBindings(this, "userHead", this.userHead);
            return (_local1);
        }
        private function _CreateUserWindow_CommonHeadImageFrame1_i():CommonHeadImageFrame{
            var _local1:CommonHeadImageFrame = new CommonHeadImageFrame();
            _local1.x = 368;
            _local1.y = 118;
            _local1.id = "_CreateUserWindow_CommonHeadImageFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CreateUserWindow_CommonHeadImageFrame1 = _local1;
            BindingManager.executeBindings(this, "_CreateUserWindow_CommonHeadImageFrame1", this._CreateUserWindow_CommonHeadImageFrame1);
            return (_local1);
        }
        private function _CreateUserWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.y = 29;
            _local1.source = this._embed_mxml_source_createUserWindowUI______png_1122428782;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CreateUserWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 686;
            _local1.y = 201;
            _local1.text = "请输入昵称：";
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("color", 16760412);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CreateUserWindow_SmoothBitmapImage2_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 681;
            _local1.y = 229;
            _local1.source = this._embed_mxml_source_commonUI_______png_425445134;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CreateUserWindow_TextInput1_i():TextInput{
            var _local1:TextInput = new TextInput();
            _local1.x = 686;
            _local1.y = 231;
            _local1.width = 126;
            _local1.height = 20;
            _local1.maxChars = 12;
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 0xFFFFFF);
            _local1.setStyle("skinClass", textInputSkin);
            _local1.addEventListener("keyDown", this.__userNameInput_keyDown);
            _local1.id = "userNameInput";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userNameInput = _local1;
            BindingManager.executeBindings(this, "userNameInput", this.userNameInput);
            return (_local1);
        }
        public function __userNameInput_keyDown(_arg1:KeyboardEvent):void{
            this.userNameInput_keyDownHandler(_arg1);
        }
        private function _CreateUserWindow_UniversalImageButton1_c():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.horizontalCenter = 0;
            _local1.y = 641;
            _local1.labelImage = this._embed_mxml_source_buttonImages____png_221451730;
            _local1.addEventListener("rollOut", this.___CreateUserWindow_UniversalImageButton1_rollOut);
            _local1.addEventListener("click", this.___CreateUserWindow_UniversalImageButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CreateUserWindow_UniversalImageButton1_rollOut(_arg1:MouseEvent):void{
            this.clearTooltip();
        }
        public function ___CreateUserWindow_UniversalImageButton1_click(_arg1:MouseEvent):void{
            this.confirmHandler();
        }
        private function _CreateUserWindow_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 686;
            _local1.y = 289;
            _local1.text = "请选择性别：";
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("color", 16760412);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CreateUserWindow_Button1_c():Button{
            var _local1:Button = new Button();
            _local1.label = "男";
            _local1.x = 680;
            _local1.y = 325;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CreateUserWindow_Button1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CreateUserWindow_Button1_click(_arg1:MouseEvent):void{
            this.setAllItemIcon(true);
        }
        private function _CreateUserWindow_Button2_c():Button{
            var _local1:Button = new Button();
            _local1.label = "女";
            _local1.x = 761;
            _local1.y = 325;
            _local1.width = 77;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___CreateUserWindow_Button2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___CreateUserWindow_Button2_click(_arg1:MouseEvent):void{
            this.setAllItemIcon(false);
        }
        public function ___CreateUserWindow_Group1_initialize(_arg1:FlexEvent):void{
            this.group1_initializeHandler(_arg1);
        }
        private function _CreateUserWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "fadeOutEffect");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [244, 243];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_CreateUserWindow_CommonHeadImageFrame1.size");
            return (result);
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get fadeOutEffect():Fade{
            return (this._733607779fadeOutEffect);
        }
        public function set fadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._733607779fadeOutEffect;
            if (_local2 !== _arg1){
                this._733607779fadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutEffect", _local2, _arg1));
                };
            };
        }
        public function get userHead():MyImage{
            return (this._266842037userHead);
        }
        public function set userHead(_arg1:MyImage):void{
            var _local2:Object = this._266842037userHead;
            if (_local2 !== _arg1){
                this._266842037userHead = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userHead", _local2, _arg1));
                };
            };
        }
        public function get userNameInput():TextInput{
            return (this._1117580172userNameInput);
        }
        public function set userNameInput(_arg1:TextInput):void{
            var _local2:Object = this._1117580172userNameInput;
            if (_local2 !== _arg1){
                this._1117580172userNameInput = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userNameInput", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

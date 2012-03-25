//Created by Action Script Viewer - http://www.buraks.com/asv
package social_contact {
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
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import flash.utils.*;
    import player_view.*;
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
	use namespace mx_internal;
    public class SocialContactWindowItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private const brightColor:uint = 15126902;
        private const normalColor:uint = 13156254;

        public var _SocialContactWindowItem_ColorMatrixFilter1:ColorMatrixFilter;
        public var _SocialContactWindowItem_Rect1:Rect;
        public var _SocialContactWindowItem_Rect2:Rect;
        private var _266842037userHead:MyImage;
        private var _321545849userLevel:Label;
        private var _266666762userName:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _714582971grayFilter:Array;
        private var _1486614404_isSelected:Boolean = false;
        private var _1142600528_isMouseOver:Boolean = false;
        private var _userInfo:Object;
        private var creationHasComplete:Boolean = false;
        private var _active:Boolean = true;
        private var _embed_mxml_source_commonUI_____png_1704344224:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function SocialContactWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_____png_1704344224 = SocialContactWindowItem__embed_mxml_source_commonUI_____png_1704344224;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SocialContactWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_social_contact_SocialContactWindowItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (SocialContactWindowItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 170;
            this.height = 70;
            this.layout = this._SocialContactWindowItem_BasicLayout1_c();
            this.filters = [this._SocialContactWindowItem_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._SocialContactWindowItem_Rect1_i(), this._SocialContactWindowItem_Rect2_i(), this._SocialContactWindowItem_MyImage1_i(), this._SocialContactWindowItem_SmoothBitmapImage1_c(), this._SocialContactWindowItem_Label1_i(), this._SocialContactWindowItem_Label2_i()];
            this.addEventListener("creationComplete", this.___SocialContactWindowItem_Group1_creationComplete);
            this.addEventListener("rollOver", this.___SocialContactWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___SocialContactWindowItem_Group1_rollOut);
            this.addEventListener("click", this.___SocialContactWindowItem_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SocialContactWindowItem._watcherSetupUtil = _arg1;
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
            this.refreshDisplay();
        }
        public function set userInfo(_arg1:Object):void{
            this._userInfo = _arg1;
            this.refreshDisplay();
        }
        public function get userInfo():Object{
            return (this._userInfo);
        }
        private function refreshDisplay():void{
            if (((this._userInfo) && (this.creationHasComplete))){
                this.active = (this._userInfo["is_online"]) ? true : false;
                this.userHead.source = (("source/userHead/" + this._userInfo["head_icon"]) + ".jpg");
                this.userName.text = this._userInfo["name"];
                this.userLevel.text = (this._userInfo["level"]) ? ("等级：" + this._userInfo["level"]) : "等级：--";
            };
        }
        public function set active(_arg1:Boolean):void{
            if (this._active == _arg1){
                return;
            };
            this._active = _arg1;
            this.grayFilter = (this._active) ? ColorUtil.getColorMatrixByBrightness(0) : ColorUtil.getGrayColorMatrix();
        }
        public function get active():Boolean{
            return (this._active);
        }
        public function set isSelected(_arg1:Boolean):void{
            if (this._isSelected == _arg1){
                return;
            };
            this._isSelected = _arg1;
            this.setFontColorBySelectState();
        }
        public function get isSelected():Boolean{
            return (this._isSelected);
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            this._isMouseOver = true;
            setStyle("color", this.brightColor);
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this._isMouseOver = false;
            this.setFontColorBySelectState();
        }
        private function setFontColorBySelectState():void{
            var _local1:uint = (this._isSelected) ? this.brightColor : this.normalColor;
            setStyle("color", _local1);
        }
        protected function group1_clickHandler(_arg1:MouseEvent):void{
            if (((this._active) && (this._userInfo))){
                PlayViewMgr.getInstance().showOpMenu(this._userInfo["name"]);
            };
        }
        private function _SocialContactWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindowItem_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._SocialContactWindowItem_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_SocialContactWindowItem_ColorMatrixFilter1", this._SocialContactWindowItem_ColorMatrixFilter1);
            return (_local1);
        }
        private function _SocialContactWindowItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.radiusX = 7;
            _local1.radiusY = 7;
            _local1.fill = this._SocialContactWindowItem_SolidColor1_c();
            _local1.initialized(this, "_SocialContactWindowItem_Rect1");
            this._SocialContactWindowItem_Rect1 = _local1;
            BindingManager.executeBindings(this, "_SocialContactWindowItem_Rect1", this._SocialContactWindowItem_Rect1);
            return (_local1);
        }
        private function _SocialContactWindowItem_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.alpha = 0.1;
            _local1.color = 0xFFC600;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindowItem_Rect2_i():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.radiusX = 7;
            _local1.radiusY = 7;
            _local1.stroke = this._SocialContactWindowItem_SolidColorStroke1_c();
            _local1.initialized(this, "_SocialContactWindowItem_Rect2");
            this._SocialContactWindowItem_Rect2 = _local1;
            BindingManager.executeBindings(this, "_SocialContactWindowItem_Rect2", this._SocialContactWindowItem_Rect2);
            return (_local1);
        }
        private function _SocialContactWindowItem_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 0xFFC600;
            _local1.weight = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindowItem_MyImage1_i():MyImage{
            var _local1:MyImage;
            _local1 = new MyImage();
            _local1.x = 7;
            _local1.y = 5;
            _local1.width = 60;
            _local1.height = 60;
            _local1.id = "userHead";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userHead = _local1;
            BindingManager.executeBindings(this, "userHead", this.userHead);
            return (_local1);
        }
        private function _SocialContactWindowItem_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 5;
            _local1.y = 3;
            _local1.source = this._embed_mxml_source_commonUI_____png_1704344224;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SocialContactWindowItem_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 68;
            _local1.y = 20;
            _local1.width = 100;
            _local1.setStyle("textAlign", "center");
            _local1.id = "userName";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userName = _local1;
            BindingManager.executeBindings(this, "userName", this.userName);
            return (_local1);
        }
        private function _SocialContactWindowItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 68;
            _local1.y = 38;
            _local1.width = 100;
            _local1.setStyle("textAlign", "center");
            _local1.id = "userLevel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userLevel = _local1;
            BindingManager.executeBindings(this, "userLevel", this.userLevel);
            return (_local1);
        }
        public function ___SocialContactWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___SocialContactWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___SocialContactWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        public function ___SocialContactWindowItem_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler(_arg1);
        }
        private function _SocialContactWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():uint{
                return (normalColor);
            }, function (_arg1:uint):void{
                this.setStyle("color", _arg1);
            }, "this.color");
            result[1] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_SocialContactWindowItem_ColorMatrixFilter1.matrix");
            result[2] = new Binding(this, function ():Boolean{
                return (((_isSelected) || (_isMouseOver)));
            }, null, "_SocialContactWindowItem_Rect1.visible");
            result[3] = new Binding(this, function ():Boolean{
                return (_isSelected);
            }, null, "_SocialContactWindowItem_Rect2.visible");
            return (result);
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
        public function get userLevel():Label{
            return (this._321545849userLevel);
        }
        public function set userLevel(_arg1:Label):void{
            var _local2:Object = this._321545849userLevel;
            if (_local2 !== _arg1){
                this._321545849userLevel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userLevel", _local2, _arg1));
                };
            };
        }
        public function get userName():Label{
            return (this._266666762userName);
        }
        public function set userName(_arg1:Label):void{
            var _local2:Object = this._266666762userName;
            if (_local2 !== _arg1){
                this._266666762userName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userName", _local2, _arg1));
                };
            };
        }
        private function get grayFilter():Array{
            return (this._714582971grayFilter);
        }
        private function set grayFilter(_arg1:Array):void{
            var _local2:Object = this._714582971grayFilter;
            if (_local2 !== _arg1){
                this._714582971grayFilter = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "grayFilter", _local2, _arg1));
                };
            };
        }
        private function get _isSelected():Boolean{
            return (this._1486614404_isSelected);
        }
        private function set _isSelected(_arg1:Boolean):void{
            var _local2:Object = this._1486614404_isSelected;
            if (_local2 !== _arg1){
                this._1486614404_isSelected = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isSelected", _local2, _arg1));
                };
            };
        }
        private function get _isMouseOver():Boolean{
            return (this._1142600528_isMouseOver);
        }
        private function set _isMouseOver(_arg1:Boolean):void{
            var _local2:Object = this._1142600528_isMouseOver;
            if (_local2 !== _arg1){
                this._1142600528_isMouseOver = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isMouseOver", _local2, _arg1));
                };
            };
        }

    }
}//package social_contact 

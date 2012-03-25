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
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;
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

    public class CompetitorWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CompetitorWindow_ColorMatrixFilter1:ColorMatrixFilter;
        private var _1933146510loseSign:SmoothBitmapImage;
        private var _266842037userHead:MyImage;
        private var _266666762userName:Label;
        private var _328437638userState:Label;
        private var _1348980665winSign:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1640318585winSignVisible:Boolean = false;
        private var _1195851168loseSignVisible:Boolean = false;
        private var _714582971grayFilter:Array;
        private var _1142600528_isMouseOver:Boolean = false;
        private var _userInfo:Object;
        private var creationHasComplete:Boolean = false;
        private var _active:Boolean = true;
        private var _embed_mxml_source_commonUI_____png_1704344224:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CompetitorWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_____png_1704344224 = CompetitorWindow__embed_mxml_source_commonUI_____png_1704344224;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CompetitorWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_competition_CompetitorWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CompetitorWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 170;
            this.height = 70;
            this.layout = this._CompetitorWindow_BasicLayout1_c();
            this.filters = [this._CompetitorWindow_ColorMatrixFilter1_i(), this._CompetitorWindow_DropShadowFilter1_c()];
            this.mxmlContent = [this._CompetitorWindow_Rect1_c(), this._CompetitorWindow_MyImage1_i(), this._CompetitorWindow_SmoothBitmapImage1_c(), this._CompetitorWindow_Label1_i(), this._CompetitorWindow_Label2_i(), this._CompetitorWindow_SmoothBitmapImage2_i(), this._CompetitorWindow_SmoothBitmapImage3_i()];
            this.addEventListener("creationComplete", this.___CompetitorWindow_Group1_creationComplete);
            this.addEventListener("click", this.___CompetitorWindow_Group1_click);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CompetitorWindow._watcherSetupUtil = _arg1;
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
                this.color = 13156254;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.winSign.source = CompetitionHallSourceMgr.getInstance().getSourceClass("winSign");
            this.loseSign.source = CompetitionHallSourceMgr.getInstance().getSourceClass("loseSign");
            this.refreshDisplay();
        }
        public function set userInfo(_arg1:Object):void{
            this._userInfo = _arg1;
            if (this._userInfo){
                this.refreshDisplay();
            } else {
                this.reset();
            };
        }
        public function get userInfo():Object{
            return (this._userInfo);
        }
        private function refreshDisplay():void{
            if (((this._userInfo) && (this.creationHasComplete))){
                this.userHead.source = (("source/userHead/" + this._userInfo["head_icon"]) + ".jpg");
                this.userName.text = this._userInfo["name"];
                this.userState.text = ((("胜 " + this._userInfo["win_num"]) + " 场") + (this._userInfo["in_room"]) ? "(就位)" : "");
            };
        }
        private function reset():void{
            this.userHead.source = null;
            this.userName.text = null;
            this.userState.text = null;
            this.active = false;
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
        protected function group1_clickHandler(_arg1:MouseEvent):void{
            if (this._userInfo){
                PlayViewMgr.getInstance().showOpMenu(this._userInfo["name"]);
            };
        }
        private function _CompetitorWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitorWindow_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._CompetitorWindow_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_CompetitorWindow_ColorMatrixFilter1", this._CompetitorWindow_ColorMatrixFilter1);
            return (_local1);
        }
        private function _CompetitorWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.color = 0;
            _local1.distance = 5;
            _local1.alpha = 0.7;
            _local1.quality = 4;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitorWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.radiusX = 7;
            _local1.radiusY = 7;
            _local1.stroke = this._CompetitorWindow_SolidColorStroke1_c();
            _local1.fill = this._CompetitorWindow_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitorWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 0xFFC600;
            _local1.weight = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitorWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 2759700;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitorWindow_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
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
        private function _CompetitorWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 5;
            _local1.y = 3;
            _local1.source = this._embed_mxml_source_commonUI_____png_1704344224;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitorWindow_Label1_i():Label{
            var _local1:Label = new Label();
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
        private function _CompetitorWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 68;
            _local1.y = 38;
            _local1.width = 100;
            _local1.setStyle("textAlign", "center");
            _local1.id = "userState";
            if (!_local1.document){
                _local1.document = this;
            };
            this.userState = _local1;
            BindingManager.executeBindings(this, "userState", this.userState);
            return (_local1);
        }
        private function _CompetitorWindow_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 143;
            _local1.y = -41;
            _local1.initialized(this, "winSign");
            this.winSign = _local1;
            BindingManager.executeBindings(this, "winSign", this.winSign);
            return (_local1);
        }
        private function _CompetitorWindow_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 142;
            _local1.y = -34;
            _local1.initialized(this, "loseSign");
            this.loseSign = _local1;
            BindingManager.executeBindings(this, "loseSign", this.loseSign);
            return (_local1);
        }
        public function ___CompetitorWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___CompetitorWindow_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler(_arg1);
        }
        private function _CompetitorWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_CompetitorWindow_ColorMatrixFilter1.matrix");
            result[1] = new Binding(this, null, null, "winSign.visible", "winSignVisible");
            result[2] = new Binding(this, null, null, "loseSign.visible", "loseSignVisible");
            return (result);
        }
        public function get loseSign():SmoothBitmapImage{
            return (this._1933146510loseSign);
        }
        public function set loseSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1933146510loseSign;
            if (_local2 !== _arg1){
                this._1933146510loseSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loseSign", _local2, _arg1));
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
        public function get userState():Label{
            return (this._328437638userState);
        }
        public function set userState(_arg1:Label):void{
            var _local2:Object = this._328437638userState;
            if (_local2 !== _arg1){
                this._328437638userState = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "userState", _local2, _arg1));
                };
            };
        }
        public function get winSign():SmoothBitmapImage{
            return (this._1348980665winSign);
        }
        public function set winSign(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1348980665winSign;
            if (_local2 !== _arg1){
                this._1348980665winSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winSign", _local2, _arg1));
                };
            };
        }
        public function get winSignVisible():Boolean{
            return (this._1640318585winSignVisible);
        }
        public function set winSignVisible(_arg1:Boolean):void{
            var _local2:Object = this._1640318585winSignVisible;
            if (_local2 !== _arg1){
                this._1640318585winSignVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winSignVisible", _local2, _arg1));
                };
            };
        }
        public function get loseSignVisible():Boolean{
            return (this._1195851168loseSignVisible);
        }
        public function set loseSignVisible(_arg1:Boolean):void{
            var _local2:Object = this._1195851168loseSignVisible;
            if (_local2 !== _arg1){
                this._1195851168loseSignVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loseSignVisible", _local2, _arg1));
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
}//package competition 

//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
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
    import source_manager.*;
    import spark.layouts.*;
    import spark.filters.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import SoundSystem.*;
    import flash.utils.*;
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
    public class TrainListWindowItem extends Group implements IBindingClient {

        private static var _currentSelectItem:TrainListWindowItem;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TrainListWindowItem_ColorMatrixFilter1:ColorMatrixFilter;
        public var _TrainListWindowItem_CommonOuterFrame1:CommonOuterFrame;
        public var _TrainListWindowItem_Label1:Label;
        public var _TrainListWindowItem_SmoothBitmapImage3:SmoothBitmapImage;
        private var _1933581907loseDuel:Label;
        private var _1052832720nameBg:SmoothBitmapImage;
        private var _1149221507rollOverMask:Rect;
        private var _1656172024selectMask:SmoothBitmapImage;
        private var _1348545268winDuel:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1141461884_headImg:Class;
        private var _584739020_trainName:String = "？？？？";
        private var _descText:String;
        private var _1285520421_active:Boolean = false;
        private var _714582971grayFilter:Array;
        private var _1802449435_select:Boolean = false;
        private var _trainInfo:Object;
        private var _activeTooltip:String;
        private var _unactiveTooltip:String;
        private var _trainSection:int;
        private var creationHasComplete:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TrainListWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TrainListWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_train_system_TrainListWindowItemWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (TrainListWindowItem[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 171;
            this.height = 165;
            this.layout = this._TrainListWindowItem_BasicLayout1_c();
            this.filters = [this._TrainListWindowItem_ColorMatrixFilter1_i()];
            this.mxmlContent = [this._TrainListWindowItem_CommonOuterFrame1_i(), this._TrainListWindowItem_SmoothBitmapImage1_i(), this._TrainListWindowItem_SmoothBitmapImage2_i(), this._TrainListWindowItem_SmoothBitmapImage3_i(), this._TrainListWindowItem_Label1_i(), this._TrainListWindowItem_Rect1_i(), this._TrainListWindowItem_Label2_i(), this._TrainListWindowItem_Label3_i()];
            this.addEventListener("mouseDown", this.___TrainListWindowItem_Group1_mouseDown);
            this.addEventListener("rollOver", this.___TrainListWindowItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___TrainListWindowItem_Group1_rollOut);
            this.addEventListener("click", this.___TrainListWindowItem_Group1_click);
            this.addEventListener("creationComplete", this.___TrainListWindowItem_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function changeSelectItem(_arg1:TrainListWindowItem):void{
            if (_currentSelectItem != _arg1){
                if (_currentSelectItem){
                    _currentSelectItem.select = false;
                };
                if (_arg1){
                    _arg1.select = true;
                };
                _currentSelectItem = _arg1;
            };
        }
        public static function get currentSelectItem():TrainListWindowItem{
            return (_currentSelectItem);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TrainListWindowItem._watcherSetupUtil = _arg1;
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
        public function set headImg(_arg1:Class):void{
            this._headImg = _arg1;
        }
        public function set activeTooltip(_arg1:String):void{
            this._activeTooltip = _arg1;
        }
        public function set unactiveTooltip(_arg1:String):void{
            this._unactiveTooltip = _arg1;
        }
        public function set descText(_arg1:String):void{
            this._descText = _arg1;
        }
        public function set active(_arg1:Boolean):void{
            this._active = _arg1;
            if (!_arg1){
                this.grayFilter = ColorUtil.getGrayColorMatrix();
                toolTip = this._unactiveTooltip;
                this._trainName = "？？？？";
                this.winDuel.text = "";
                this.loseDuel.text = "";
            } else {
                this.grayFilter = ColorUtil.getColorMatrixByBrightness(0);
                toolTip = this._activeTooltip;
                this._trainName = this._descText;
            };
        }
        public function get active():Boolean{
            return (this._active);
        }
        public function set select(_arg1:Boolean):void{
            this._select = _arg1;
            if (((this._select) && (this.rollOverMask))){
                this.rollOverMask.visible = false;
            };
        }
        public function get select():Boolean{
            return (this._select);
        }
        public function set trainInfo(_arg1:Object):void{
            this._trainInfo = _arg1;
            this.displayTrainInfo();
        }
        protected function group1_rollOverHandler(_arg1:MouseEvent):void{
            if (((this._active) && (!(this._select)))){
                SoundMgr.getInstance().playEffectSound("click_4");
                this.rollOverMask.visible = true;
            };
        }
        protected function group1_rollOutHandler(_arg1:MouseEvent):void{
            this.rollOverMask.visible = false;
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.selectMask.source = TrainListWindowSourceMgr.getInstance().getSourceClass("selectMask");
            this.nameBg.source = TrainListWindowSourceMgr.getInstance().getSourceClass("redNameBg");
            this.displayTrainInfo();
        }
        protected function displayTrainInfo():void{
            if (((this.creationHasComplete) && (this._active))){
                if (!this._trainInfo){
                    this.winDuel.text = "";
                    this.loseDuel.text = "";
                } else {
                    this.winDuel.text = (("胜：" + this._trainInfo["win"]) + " 场");
                    this.loseDuel.text = (("负：" + this._trainInfo["lose"]) + " 场");
                };
            };
        }
        protected function group1_clickHandler(_arg1:MouseEvent):void{
            if (!this.active){
                return;
            };
            changeSelectItem(this);
        }
        public function set trainSection(_arg1:int):void{
            this._trainSection = _arg1;
        }
        public function get trainSection():int{
            return (this._trainSection);
        }
        private function _TrainListWindowItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindowItem_ColorMatrixFilter1_i():ColorMatrixFilter{
            var _local1:ColorMatrixFilter = new ColorMatrixFilter();
            this._TrainListWindowItem_ColorMatrixFilter1 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindowItem_ColorMatrixFilter1", this._TrainListWindowItem_ColorMatrixFilter1);
            return (_local1);
        }
        private function _TrainListWindowItem_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.alpha = 0.9;
            _local1.id = "_TrainListWindowItem_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TrainListWindowItem_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindowItem_CommonOuterFrame1", this._TrainListWindowItem_CommonOuterFrame1);
            return (_local1);
        }
        private function _TrainListWindowItem_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = -4;
            _local1.y = -4;
            _local1.alpha = 0.8;
            _local1.initialized(this, "selectMask");
            this.selectMask = _local1;
            BindingManager.executeBindings(this, "selectMask", this.selectMask);
            return (_local1);
        }
        private function _TrainListWindowItem_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 19;
            _local1.y = 133;
            _local1.initialized(this, "nameBg");
            this.nameBg = _local1;
            BindingManager.executeBindings(this, "nameBg", this.nameBg);
            return (_local1);
        }
        private function _TrainListWindowItem_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.y = 16;
            _local1.initialized(this, "_TrainListWindowItem_SmoothBitmapImage3");
            this._TrainListWindowItem_SmoothBitmapImage3 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindowItem_SmoothBitmapImage3", this._TrainListWindowItem_SmoothBitmapImage3);
            return (_local1);
        }
        private function _TrainListWindowItem_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.y = 132;
            _local1.percentWidth = 100;
            _local1.setStyle("color", 13873789);
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("textAlign", "center");
            _local1.id = "_TrainListWindowItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TrainListWindowItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_TrainListWindowItem_Label1", this._TrainListWindowItem_Label1);
            return (_local1);
        }
        private function _TrainListWindowItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.width = 171;
            _local1.height = 115;
            _local1.fill = this._TrainListWindowItem_LinearGradient1_c();
            _local1.initialized(this, "rollOverMask");
            this.rollOverMask = _local1;
            BindingManager.executeBindings(this, "rollOverMask", this.rollOverMask);
            return (_local1);
        }
        private function _TrainListWindowItem_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.rotation = 90;
            _local1.entries = [this._TrainListWindowItem_GradientEntry1_c(), this._TrainListWindowItem_GradientEntry2_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindowItem_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xFFFFFF;
            _local1.alpha = 0.35;
            _local1.ratio = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindowItem_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0xFFFFFF;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindowItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 90;
            _local1.y = 13;
            _local1.filters = [this._TrainListWindowItem_GlowFilter1_c()];
            _local1.setStyle("color", 13873789);
            _local1.setStyle("fontSize", 14);
            _local1.id = "winDuel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.winDuel = _local1;
            BindingManager.executeBindings(this, "winDuel", this.winDuel);
            return (_local1);
        }
        private function _TrainListWindowItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _TrainListWindowItem_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 90;
            _local1.y = 30;
            _local1.filters = [this._TrainListWindowItem_GlowFilter2_c()];
            _local1.setStyle("color", 0xD3D3D3);
            _local1.setStyle("fontSize", 14);
            _local1.id = "loseDuel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.loseDuel = _local1;
            BindingManager.executeBindings(this, "loseDuel", this.loseDuel);
            return (_local1);
        }
        private function _TrainListWindowItem_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___TrainListWindowItem_Group1_mouseDown(_arg1:MouseEvent):void{
            SoundMgr.getInstance().playEffectSound("click_3");
        }
        public function ___TrainListWindowItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.group1_rollOverHandler(_arg1);
        }
        public function ___TrainListWindowItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.group1_rollOutHandler(_arg1);
        }
        public function ___TrainListWindowItem_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler(_arg1);
        }
        public function ___TrainListWindowItem_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _TrainListWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Boolean{
                return (_active);
            }, null, "this.doubleClickEnabled");
            result[1] = new Binding(this, function ():Object{
                return (grayFilter);
            }, null, "_TrainListWindowItem_ColorMatrixFilter1.matrix");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = [171, 165];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_TrainListWindowItem_CommonOuterFrame1.size");
            result[3] = new Binding(this, function ():Boolean{
                return (_select);
            }, null, "selectMask.visible");
            result[4] = new Binding(this, function ():Object{
                return (_headImg);
            }, null, "_TrainListWindowItem_SmoothBitmapImage3.source");
            result[5] = new Binding(this, function ():String{
                var _local1:* = _trainName;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_TrainListWindowItem_Label1.text");
            return (result);
        }
        public function get loseDuel():Label{
            return (this._1933581907loseDuel);
        }
        public function set loseDuel(_arg1:Label):void{
            var _local2:Object = this._1933581907loseDuel;
            if (_local2 !== _arg1){
                this._1933581907loseDuel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loseDuel", _local2, _arg1));
                };
            };
        }
        public function get nameBg():SmoothBitmapImage{
            return (this._1052832720nameBg);
        }
        public function set nameBg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1052832720nameBg;
            if (_local2 !== _arg1){
                this._1052832720nameBg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "nameBg", _local2, _arg1));
                };
            };
        }
        public function get rollOverMask():Rect{
            return (this._1149221507rollOverMask);
        }
        public function set rollOverMask(_arg1:Rect):void{
            var _local2:Object = this._1149221507rollOverMask;
            if (_local2 !== _arg1){
                this._1149221507rollOverMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverMask", _local2, _arg1));
                };
            };
        }
        public function get selectMask():SmoothBitmapImage{
            return (this._1656172024selectMask);
        }
        public function set selectMask(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1656172024selectMask;
            if (_local2 !== _arg1){
                this._1656172024selectMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selectMask", _local2, _arg1));
                };
            };
        }
        public function get winDuel():Label{
            return (this._1348545268winDuel);
        }
        public function set winDuel(_arg1:Label):void{
            var _local2:Object = this._1348545268winDuel;
            if (_local2 !== _arg1){
                this._1348545268winDuel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "winDuel", _local2, _arg1));
                };
            };
        }
        private function get _headImg():Class{
            return (this._1141461884_headImg);
        }
        private function set _headImg(_arg1:Class):void{
            var _local2:Object = this._1141461884_headImg;
            if (_local2 !== _arg1){
                this._1141461884_headImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_headImg", _local2, _arg1));
                };
            };
        }
        private function get _trainName():String{
            return (this._584739020_trainName);
        }
        private function set _trainName(_arg1:String):void{
            var _local2:Object = this._584739020_trainName;
            if (_local2 !== _arg1){
                this._584739020_trainName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_trainName", _local2, _arg1));
                };
            };
        }
        private function get _active():Boolean{
            return (this._1285520421_active);
        }
        private function set _active(_arg1:Boolean):void{
            var _local2:Object = this._1285520421_active;
            if (_local2 !== _arg1){
                this._1285520421_active = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_active", _local2, _arg1));
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
        private function get _select():Boolean{
            return (this._1802449435_select);
        }
        private function set _select(_arg1:Boolean):void{
            var _local2:Object = this._1802449435_select;
            if (_local2 !== _arg1){
                this._1802449435_select = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_select", _local2, _arg1));
                };
            };
        }

    }
}//package train_system 

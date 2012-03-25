//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
	import mx.events.*;
	import mx.geom.*;
	import mx.styles.*;
	import mx.binding.*;
	import mx.filters.*;
    import flash.display.*;
    
 //   import flash.geom.*;
    
//	import flash.geom.Transform;
	import flash.geom.ColorTransform;
    
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import source_manager.*;

    import flash.utils.*;
    import flash.accessibility.*;

    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

	import spark.effects.*;
	import spark.layouts.*;
	
	use namespace mx_internal;
    public class CombatStageHeadFrame extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;
		public var __slot1;
        private var _378409776food1Img:SmoothBitmapImage;
        private var _378439567food2Img:SmoothBitmapImage;
        private var _378469358food3Img:SmoothBitmapImage;
        private var _1137639552foodBgImg:SmoothBitmapImage;
        private var _926172464foodFadeInEffect:Fade;
        private var _2114757541foodFadeOutEffect:Fade;
        private var _1081661718hpBgImg:SmoothBitmapImage;
        private var _118049417hpChangeEffect:Move;
        private var _99456411hpImg:SmoothBitmapImage;
        private var _1211710444hpMask:Label;
        private var _274178252mainFrame:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CombatStageHeadFrame(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CombatStageHeadFrame_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CombatStageHeadFrameWatcherSetupUtil");
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
            this.width = 217;
            this.height = 183;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.layout = this._CombatStageHeadFrame_BasicLayout1_c();
            this.mxmlContent = [this._CombatStageHeadFrame_SmoothBitmapImage1_i(), this._CombatStageHeadFrame_SmoothBitmapImage2_i(), this._CombatStageHeadFrame_SmoothBitmapImage3_i(), this._CombatStageHeadFrame_SmoothBitmapImage4_i(), this._CombatStageHeadFrame_SmoothBitmapImage5_i(), this._CombatStageHeadFrame_SmoothBitmapImage6_i(), this._CombatStageHeadFrame_SmoothBitmapImage7_i()];
            this._CombatStageHeadFrame_Fade1_i();
            this._CombatStageHeadFrame_Fade2_i();
            this._CombatStageHeadFrame_Move1_i();
            this.addEventListener("creationComplete", this.___CombatStageHeadFrame_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CombatStageHeadFrame._watcherSetupUtil = _arg1;
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
            var setImage:* = null;
            var event:* = _arg1;
            setImage = function (_arg1:Event):void{
                mainFrame.source = CombatStageSourceMgr.getInstance().getSourceClass("playHeadFrame");
                hpBgImg.source = CombatStageSourceMgr.getInstance().getSourceClass("hp_bar");
                hpImg.source = CombatStageSourceMgr.getInstance().getSourceClass("hp_bar");
                foodBgImg.source = CombatStageSourceMgr.getInstance().getSourceClass("food_bar");
                food1Img.source = CombatStageSourceMgr.getInstance().getSourceClass("food_bar");
                food2Img.source = CombatStageSourceMgr.getInstance().getSourceClass("food_bar");
                food3Img.source = CombatStageSourceMgr.getInstance().getSourceClass("food_bar");
            };
            if (CombatStageSourceMgr.getInstance().loadingComplete){
                setImage(null);
            } else {
                CombatStageSourceMgr.getInstance().addEventListener(Event.COMPLETE, setImage);
            };
        }
        public function setHpPercent(_arg1:Number, _arg2:Boolean=true, _arg3:Number=1000):void{
            if (this.hpChangeEffect.isPlaying){
                this.hpChangeEffect.end();
            };
            if (_arg2){
                this.hpChangeEffect.duration = _arg3;
                this.hpChangeEffect.yTo = (this.hpMask.height * (1 - _arg1));
                this.hpChangeEffect.play();
            } else {
                this.hpMask.y = (this.hpMask.height * (1 - _arg1));
            };
        }
        public function setFoodNum(_arg1:int, _arg2:Boolean=true):void{
            var _local3:SmoothBitmapImage;
            if (this.foodFadeInEffect.isPlaying){
                this.foodFadeInEffect.end();
            };
            if (this.foodFadeOutEffect.isPlaying){
                this.foodFadeOutEffect.end();
            };
            var _local4:Array = [this.food1Img, this.food2Img, this.food3Img];
            var _local5:Array = ((_local4.length)<=_arg1) ? new Array() : _local4.splice(_arg1, (_local4.length - _arg1));
            if (_arg2){
                if (_local4.length > 0){
                    this.foodFadeInEffect.targets = _local4;
                    this.foodFadeInEffect.play();
                };
                if (_local5.length > 0){
                    this.foodFadeOutEffect.targets = _local5;
                    this.foodFadeOutEffect.play();
                };
            } else {
                for each (_local3 in _local4) {
                    _local3.alpha = 1;
                };
                for each (_local3 in _local5) {
                    _local3.alpha = 0;
                };
            };
        }
        private function _CombatStageHeadFrame_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaTo = 1;
            this.foodFadeInEffect = _local1;
            BindingManager.executeBindings(this, "foodFadeInEffect", this.foodFadeInEffect);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 300;
            _local1.alphaTo = 0;
            this.foodFadeOutEffect = _local1;
            BindingManager.executeBindings(this, "foodFadeOutEffect", this.foodFadeOutEffect);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Move1_i():Move{
            var _local1:Move = new Move();
            this.hpChangeEffect = _local1;
            BindingManager.executeBindings(this, "hpChangeEffect", this.hpChangeEffect);
            return (_local1);
        }
        private function _CombatStageHeadFrame_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 0;
            _local1.y = 13;
            _local1.transform = this._CombatStageHeadFrame_Transform1_c();
            _local1.initialized(this, "foodBgImg");
            this.foodBgImg = _local1;
            BindingManager.executeBindings(this, "foodBgImg", this.foodBgImg);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Transform1_c():mx.geom.Transform{
            var _local1:Transform = new Transform();
            _local1.colorTransform = this._CombatStageHeadFrame_ColorTransform1_c();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_ColorTransform1_c():ColorTransform{
            var _local1:ColorTransform = new ColorTransform();
            _local1.redMultiplier = 0.2;
            _local1.greenMultiplier = 0.2;
            _local1.blueMultiplier = 0.2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 0;
            _local1.y = 13;
            _local1.mask = this._CombatStageHeadFrame_Label1_c();
            _local1.initialized(this, "food3Img");
            this.food3Img = _local1;
            BindingManager.executeBindings(this, "food3Img", this.food3Img);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 36;
            _local1.y = -11;
            _local1.width = 20;
            _local1.height = 35;
            _local1.rotation = 32;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 0;
            _local1.y = 13;
            _local1.mask = this._CombatStageHeadFrame_Label2_c();
            _local1.initialized(this, "food2Img");
            this.food2Img = _local1;
            BindingManager.executeBindings(this, "food2Img", this.food2Img);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Label2_c():Label{
            var _local1:Label = new Label();
            _local1.x = 14;
            _local1.y = 19;
            _local1.width = 20;
            _local1.height = 30;
            _local1.rotation = 32;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 0;
            _local1.y = 13;
            _local1.mask = this._CombatStageHeadFrame_Label3_c();
            _local1.initialized(this, "food1Img");
            this.food1Img = _local1;
            BindingManager.executeBindings(this, "food1Img", this.food1Img);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Label3_c():Label{
            var _local1:Label = new Label();
            _local1.x = 2;
            _local1.y = 49;
            _local1.width = 20;
            _local1.height = 30;
            _local1.rotation = 25;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage5_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 173;
            _local1.y = 47;
            _local1.transform = this._CombatStageHeadFrame_Transform2_c();
            _local1.initialized(this, "hpBgImg");
            this.hpBgImg = _local1;
            BindingManager.executeBindings(this, "hpBgImg", this.hpBgImg);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Transform2_c():Transform{
            var _local1:Transform = new Transform();
            _local1.colorTransform = this._CombatStageHeadFrame_ColorTransform2_c();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_ColorTransform2_c():ColorTransform{
            var _local1:ColorTransform = new ColorTransform();
            _local1.redMultiplier = 0.2;
            _local1.greenMultiplier = 0.2;
            _local1.blueMultiplier = 0.2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage6_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.x = 173;
            _local1.y = 47;
            _local1.mask = this._CombatStageHeadFrame_Label4_i();
            _local1.initialized(this, "hpImg");
            this.hpImg = _local1;
            BindingManager.executeBindings(this, "hpImg", this.hpImg);
            return (_local1);
        }
        private function _CombatStageHeadFrame_Label4_i():Label{
            var _local1:Label = new Label();
            _local1.width = 26;
            _local1.height = 75;
            _local1.id = "hpMask";
            if (!_local1.document){
                _local1.document = this;
            };
            this.hpMask = _local1;
            BindingManager.executeBindings(this, "hpMask", this.hpMask);
            return (_local1);
        }
        private function _CombatStageHeadFrame_SmoothBitmapImage7_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.initialized(this, "mainFrame");
            this.mainFrame = _local1;
            BindingManager.executeBindings(this, "mainFrame", this.mainFrame);
            return (_local1);
        }
        public function ___CombatStageHeadFrame_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CombatStageHeadFrame_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "hpChangeEffect.target", "hpMask");
            return (_local1);
        }
        public function get food1Img():SmoothBitmapImage{
            return (this._378409776food1Img);
        }
        public function set food1Img(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._378409776food1Img;
            if (_local2 !== _arg1){
                this._378409776food1Img = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "food1Img", _local2, _arg1));
                };
            };
        }
        public function get food2Img():SmoothBitmapImage{
            return (this._378439567food2Img);
        }
        public function set food2Img(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._378439567food2Img;
            if (_local2 !== _arg1){
                this._378439567food2Img = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "food2Img", _local2, _arg1));
                };
            };
        }
        public function get food3Img():SmoothBitmapImage{
            return (this._378469358food3Img);
        }
        public function set food3Img(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._378469358food3Img;
            if (_local2 !== _arg1){
                this._378469358food3Img = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "food3Img", _local2, _arg1));
                };
            };
        }
        public function get foodBgImg():SmoothBitmapImage{
            return (this._1137639552foodBgImg);
        }
        public function set foodBgImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1137639552foodBgImg;
            if (_local2 !== _arg1){
                this._1137639552foodBgImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "foodBgImg", _local2, _arg1));
                };
            };
        }
        public function get foodFadeInEffect():Fade{
            return (this._926172464foodFadeInEffect);
        }
        public function set foodFadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._926172464foodFadeInEffect;
            if (_local2 !== _arg1){
                this._926172464foodFadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "foodFadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get foodFadeOutEffect():Fade{
            return (this._2114757541foodFadeOutEffect);
        }
        public function set foodFadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._2114757541foodFadeOutEffect;
            if (_local2 !== _arg1){
                this._2114757541foodFadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "foodFadeOutEffect", _local2, _arg1));
                };
            };
        }
        public function get hpBgImg():SmoothBitmapImage{
            return (this._1081661718hpBgImg);
        }
        public function set hpBgImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1081661718hpBgImg;
            if (_local2 !== _arg1){
                this._1081661718hpBgImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpBgImg", _local2, _arg1));
                };
            };
        }
        public function get hpChangeEffect():Move{
            return (this._118049417hpChangeEffect);
        }
        public function set hpChangeEffect(_arg1:Move):void{
            var _local2:Object = this._118049417hpChangeEffect;
            if (_local2 !== _arg1){
                this._118049417hpChangeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpChangeEffect", _local2, _arg1));
                };
            };
        }
        public function get hpImg():SmoothBitmapImage{
            return (this._99456411hpImg);
        }
        public function set hpImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._99456411hpImg;
            if (_local2 !== _arg1){
                this._99456411hpImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpImg", _local2, _arg1));
                };
            };
        }
        public function get hpMask():Label{
            return (this._1211710444hpMask);
        }
        public function set hpMask(_arg1:Label):void{
            var _local2:Object = this._1211710444hpMask;
            if (_local2 !== _arg1){
                this._1211710444hpMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpMask", _local2, _arg1));
                };
            };
        }
        public function get mainFrame():SmoothBitmapImage{
            return (this._274178252mainFrame);
        }
        public function set mainFrame(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._274178252mainFrame;
            if (_local2 !== _arg1){
                this._274178252mainFrame = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mainFrame", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

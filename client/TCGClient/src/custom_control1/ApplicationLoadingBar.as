//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
 //   import mx.effects.*;
	import mx.effects.Parallel;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import flash.utils.*;
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
	import mx.effects.Effect;
	use namespace mx_internal;
    public class ApplicationLoadingBar extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _ApplicationLoadingBar_Fade1:Fade;
        public var _ApplicationLoadingBar_Fade2:Fade;
        public var _ApplicationLoadingBar_Move1:Move;
        public var _ApplicationLoadingBar_Move2:Move;
        private var _1802773354divideEffect:Parallel;
        private var _3236046img1:SmoothBitmapImage;
        private var _3236047img2:SmoothBitmapImage;
        private var _3236048img3:SmoothBitmapImage;
        private var _3236049img4:SmoothBitmapImage;
        private var _3236050img5:SmoothBitmapImage;
        private var _3236051img6:SmoothBitmapImage;
        private var _3236052img7:SmoothBitmapImage;
        private var _1389660835loadingGroup:Group;
        private var _1267520715removeEffect:Parallel;
        private var __moduleFactoryInitialized:Boolean = false;
        private var loadingBarImg:Class;
        private var bar:UIComponent;
        private var bd:BitmapData;
        private var percentTxt:TextField;
        private var realPercent:Number = 0.82;
        private var drawPercent:Number = 0.82;
        private var removeHasStart:Boolean = false;
        private var _embed_mxml_source_loadingImages______png_221839174:Class;
        private var _embed_mxml_source_loadingImages_____png_225308518:Class;
        private var _embed_mxml_source_loadingImages____png_1236308876:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ApplicationLoadingBar(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.loadingBarImg = ApplicationLoadingBar_loadingBarImg;
            this.bar = new UIComponent();
            this._embed_mxml_source_loadingImages______png_221839174 = ApplicationLoadingBar__embed_mxml_source_loadingImages______png_221839174;
            this._embed_mxml_source_loadingImages_____png_225308518 = ApplicationLoadingBar__embed_mxml_source_loadingImages_____png_225308518;
            this._embed_mxml_source_loadingImages____png_1236308876 = ApplicationLoadingBar__embed_mxml_source_loadingImages____png_1236308876;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ApplicationLoadingBar_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_ApplicationLoadingBarWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.clipAndEnableScrolling = true;
            this.layout = this._ApplicationLoadingBar_BasicLayout1_c();
            this.mxmlContent = [this._ApplicationLoadingBar_Group2_i(), this._ApplicationLoadingBar_SmoothBitmapImage6_i(), this._ApplicationLoadingBar_SmoothBitmapImage7_i()];
            this._ApplicationLoadingBar_Parallel2_i();
            this._ApplicationLoadingBar_Parallel1_i();
            this.addEventListener("initialize", this.___ApplicationLoadingBar_Group1_initialize);
            this.addEventListener("enterFrame", this.___ApplicationLoadingBar_Group1_enterFrame);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ApplicationLoadingBar._watcherSetupUtil = _arg1;
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
                this.fontSize = 13;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function group1_initializeHandler(_arg1:FlexEvent):void{
            this.bd = (new this.loadingBarImg() as Bitmap).bitmapData;
            this.graphics.beginFill(0);
            this.graphics.drawRect(0, 0, width, height);
            this.graphics.endFill();
            this.bar.depth = 1;
            this.bar.y = 394;
            this.loadingGroup.addElement(this.bar);
            var _local2:UIComponent = new UIComponent();
            this.loadingGroup.addElement(_local2);
            _local2.depth = 3;
            var _local3:LoadingTipWindow = new LoadingTipWindow();
            _local3.x = 320;
            _local3.y = 650;
            _local2.addChild(_local3);
            var _local4:TextField = new TextField();
            _local4.defaultTextFormat = new TextFormat("宋体", 14, 0xFFFFFF);
            _local4.selectable = false;
            _local4.text = "...初始化...";
            _local2.addChild(_local4);
            this.percentTxt = new TextField();
            this.percentTxt.defaultTextFormat = new TextFormat("宋体", 14, 0, null, null, null, null, null, "center");
            this.percentTxt.width = 30;
            this.percentTxt.height = 16;
            this.percentTxt.selectable = false;
            _local2.addChild(this.percentTxt);
            _local4.x = 599;
            _local4.y = 332;
            this.percentTxt.x = 626;
            this.percentTxt.y = 391;
            this.drawLoadingBar();
        }
        public function setLoadingProgress(_arg1:Number):void{
            this.realPercent = _arg1;
            this.tryDoRemove();
        }
        protected function group1_enterFrameHandler(_arg1:Event):void{
            if (this.realPercent > this.drawPercent){
                this.drawPercent = (this.drawPercent + 0.005);
                if (this.drawPercent <= 1){
                    this.drawLoadingBar();
                };
                this.tryDoRemove();
            };
        }
        private function drawLoadingBar():void{
            this.percentTxt.text = (int((this.drawPercent * 100)) + "%");
            this.bar.graphics.beginBitmapFill(this.bd);
            this.bar.graphics.drawRect((640 * (1 - this.drawPercent)), 0, (this.drawPercent * 0x0500), 11);
            this.bar.graphics.endFill();
        }
        private function tryDoRemove():void{
            if ((((((this.drawPercent >= 1)) && ((this.realPercent >= 1)))) && (!(this.removeHasStart)))){
                this.removeHasStart = true;
                this.removeEffect.play();
            };
        }
        protected function removeEffect_effectEndHandler(_arg1:EffectEvent):void{
            var _local2:BitmapData = new BitmapData(0x0500, 800, true, 0);
            _local2.draw(this);
            this.graphics.clear();
            removeElement(this.loadingGroup);
            var _local3:BitmapData = new BitmapData(0x0500, 400, true, 0);
            _local3.copyPixels(_local2, new Rectangle(0, 0, 0x0500, 400), new Point());
            this.img6.source = _local3;
            var _local4:BitmapData = new BitmapData(0x0500, 400, true, 0);
            _local4.copyPixels(_local2, new Rectangle(0, 400, 0x0500, 400), new Point());
            this.img7.source = _local4;
            this.divideEffect.play();
        }
        protected function divideEffect_effectEndHandler(_arg1:EffectEvent):void{
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
        }
        private function _ApplicationLoadingBar_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 1000;
            _local1.children = [this._ApplicationLoadingBar_Move1_i(), this._ApplicationLoadingBar_Move2_i()];
            _local1.addEventListener("effectEnd", this.__divideEffect_effectEnd);
            this.divideEffect = _local1;
            BindingManager.executeBindings(this, "divideEffect", this.divideEffect);
            return (_local1);
        }
        private function _ApplicationLoadingBar_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.yFrom = 0;
            _local1.yTo = -400;
            this._ApplicationLoadingBar_Move1 = _local1;
            BindingManager.executeBindings(this, "_ApplicationLoadingBar_Move1", this._ApplicationLoadingBar_Move1);
            return (_local1);
        }
        private function _ApplicationLoadingBar_Move2_i():Move{
            var _local1:Move = new Move();
            _local1.yFrom = 400;
            _local1.yTo = 800;
            this._ApplicationLoadingBar_Move2 = _local1;
            BindingManager.executeBindings(this, "_ApplicationLoadingBar_Move2", this._ApplicationLoadingBar_Move2);
            return (_local1);
        }
        public function __divideEffect_effectEnd(_arg1:EffectEvent):void{
            this.divideEffect_effectEndHandler(_arg1);
        }
        private function _ApplicationLoadingBar_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 1000;
            _local1.children = [this._ApplicationLoadingBar_Fade1_i(), this._ApplicationLoadingBar_Fade2_i()];
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _ApplicationLoadingBar_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            this._ApplicationLoadingBar_Fade1 = _local1;
            BindingManager.executeBindings(this, "_ApplicationLoadingBar_Fade1", this._ApplicationLoadingBar_Fade1);
            return (_local1);
        }
        private function _ApplicationLoadingBar_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this._ApplicationLoadingBar_Fade2 = _local1;
            BindingManager.executeBindings(this, "_ApplicationLoadingBar_Fade2", this._ApplicationLoadingBar_Fade2);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeEffect_effectEndHandler(_arg1);
        }
        private function _ApplicationLoadingBar_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ApplicationLoadingBar_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.mxmlContent = [this._ApplicationLoadingBar_SmoothBitmapImage1_i(), this._ApplicationLoadingBar_SmoothBitmapImage2_i(), this._ApplicationLoadingBar_SmoothBitmapImage3_i(), this._ApplicationLoadingBar_SmoothBitmapImage4_i(), this._ApplicationLoadingBar_SmoothBitmapImage5_i()];
            _local1.id = "loadingGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.loadingGroup = _local1;
            BindingManager.executeBindings(this, "loadingGroup", this.loadingGroup);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loadingImages____png_1236308876;
            _local1.y = 352;
            _local1.x = 0;
            _local1.initialized(this, "img1");
            this.img1 = _local1;
            BindingManager.executeBindings(this, "img1", this.img1);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loadingImages____png_1236308876;
            _local1.rotation = 180;
            _local1.x = 0x0500;
            _local1.y = 447;
            _local1.initialized(this, "img2");
            this.img2 = _local1;
            BindingManager.executeBindings(this, "img2", this.img2);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loadingImages_____png_225308518;
            _local1.depth = 2;
            _local1.x = 623;
            _local1.y = 383;
            _local1.initialized(this, "img3");
            this.img3 = _local1;
            BindingManager.executeBindings(this, "img3", this.img3);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loadingImages______png_221839174;
            _local1.y = 352;
            _local1.x = 1;
            _local1.alpha = 0;
            _local1.depth = 2;
            _local1.initialized(this, "img4");
            this.img4 = _local1;
            BindingManager.executeBindings(this, "img4", this.img4);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage5_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_loadingImages______png_221839174;
            _local1.rotation = 180;
            _local1.x = 0x0500;
            _local1.y = 447;
            _local1.alpha = 0;
            _local1.depth = 2;
            _local1.initialized(this, "img5");
            this.img5 = _local1;
            BindingManager.executeBindings(this, "img5", this.img5);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage6_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.width = 0x0500;
            _local1.height = 400;
            _local1.initialized(this, "img6");
            this.img6 = _local1;
            BindingManager.executeBindings(this, "img6", this.img6);
            return (_local1);
        }
        private function _ApplicationLoadingBar_SmoothBitmapImage7_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.y = 400;
            _local1.width = 0x0500;
            _local1.height = 400;
            _local1.initialized(this, "img7");
            this.img7 = _local1;
            BindingManager.executeBindings(this, "img7", this.img7);
            return (_local1);
        }
        public function ___ApplicationLoadingBar_Group1_initialize(_arg1:FlexEvent):void{
            this.group1_initializeHandler(_arg1);
        }
        public function ___ApplicationLoadingBar_Group1_enterFrame(_arg1:Event):void{
            this.group1_enterFrameHandler(_arg1);
        }
        private function _ApplicationLoadingBar_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Array{
                var _local1:* = [img1, img2, img3];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_ApplicationLoadingBar_Fade1.targets");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [img4, img5];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_ApplicationLoadingBar_Fade2.targets");
            result[2] = new Binding(this, null, null, "_ApplicationLoadingBar_Move1.target", "img6");
            result[3] = new Binding(this, null, null, "_ApplicationLoadingBar_Move2.target", "img7");
            return (result);
        }
        public function get divideEffect():Parallel{
            return (this._1802773354divideEffect);
        }
        public function set divideEffect(_arg1:Parallel):void{
            var _local2:Object = this._1802773354divideEffect;
            if (_local2 !== _arg1){
                this._1802773354divideEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "divideEffect", _local2, _arg1));
                };
            };
        }
        public function get img1():SmoothBitmapImage{
            return (this._3236046img1);
        }
        public function set img1(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236046img1;
            if (_local2 !== _arg1){
                this._3236046img1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img1", _local2, _arg1));
                };
            };
        }
        public function get img2():SmoothBitmapImage{
            return (this._3236047img2);
        }
        public function set img2(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236047img2;
            if (_local2 !== _arg1){
                this._3236047img2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img2", _local2, _arg1));
                };
            };
        }
        public function get img3():SmoothBitmapImage{
            return (this._3236048img3);
        }
        public function set img3(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236048img3;
            if (_local2 !== _arg1){
                this._3236048img3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img3", _local2, _arg1));
                };
            };
        }
        public function get img4():SmoothBitmapImage{
            return (this._3236049img4);
        }
        public function set img4(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236049img4;
            if (_local2 !== _arg1){
                this._3236049img4 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img4", _local2, _arg1));
                };
            };
        }
        public function get img5():SmoothBitmapImage{
            return (this._3236050img5);
        }
        public function set img5(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236050img5;
            if (_local2 !== _arg1){
                this._3236050img5 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img5", _local2, _arg1));
                };
            };
        }
        public function get img6():SmoothBitmapImage{
            return (this._3236051img6);
        }
        public function set img6(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236051img6;
            if (_local2 !== _arg1){
                this._3236051img6 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img6", _local2, _arg1));
                };
            };
        }
        public function get img7():SmoothBitmapImage{
            return (this._3236052img7);
        }
        public function set img7(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._3236052img7;
            if (_local2 !== _arg1){
                this._3236052img7 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img7", _local2, _arg1));
                };
            };
        }
        public function get loadingGroup():Group{
            return (this._1389660835loadingGroup);
        }
        public function set loadingGroup(_arg1:Group):void{
            var _local2:Object = this._1389660835loadingGroup;
            if (_local2 !== _arg1){
                this._1389660835loadingGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "loadingGroup", _local2, _arg1));
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

    }
}//package custom_control 

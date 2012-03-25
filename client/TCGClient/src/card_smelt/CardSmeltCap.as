//Created by Action Script Viewer - http://www.buraks.com/asv
package card_smelt {
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

    public class CardSmeltCap extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CardSmeltCap_Move1:Move;
        public var _CardSmeltCap_Move2:Move;
        public var _CardSmeltCap_Move3:Move;
        public var _CardSmeltCap_Move4:Move;
        private var _1952667950cardSmeltCapDownImg:SmoothBitmapImage;
        private var _2127617657cardSmeltCapUpImg:SmoothBitmapImage;
        private var _241096279closeEffect:Parallel;
        private var _65508229openEffect:Parallel;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardSmeltCap(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardSmeltCap_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_smelt_CardSmeltCapWatcherSetupUtil");
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
            this.width = 302;
            this.height = 174;
            this.clipAndEnableScrolling = true;
            this.layout = this._CardSmeltCap_BasicLayout1_c();
            this.mxmlContent = [this._CardSmeltCap_SmoothBitmapImage1_i(), this._CardSmeltCap_SmoothBitmapImage2_i()];
            this._CardSmeltCap_Parallel2_i();
            this._CardSmeltCap_Parallel1_i();
            this.addEventListener("creationComplete", this.___CardSmeltCap_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardSmeltCap._watcherSetupUtil = _arg1;
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
            this.cardSmeltCapUpImg.source = JudgeCardsSourceMgr.getInstance().getSourceClass("cardSmeltCapUp");
            this.cardSmeltCapDownImg.source = JudgeCardsSourceMgr.getInstance().getSourceClass("cardSmeltCapDown");
        }
        public function openCap():void{
            this.openEffect.stop();
            this.closeEffect.stop();
            if (this.cardSmeltCapUpImg.y != -87){
                this.openEffect.play();
            };
        }
        public function closeCap():void{
            this.openEffect.stop();
            this.closeEffect.stop();
            if (this.cardSmeltCapUpImg.y != 0){
                this.closeEffect.play();
            };
        }
        private function _CardSmeltCap_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 500;
            _local1.children = [this._CardSmeltCap_Move3_i(), this._CardSmeltCap_Move4_i()];
            this.closeEffect = _local1;
            BindingManager.executeBindings(this, "closeEffect", this.closeEffect);
            return (_local1);
        }
        private function _CardSmeltCap_Move3_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = 0;
            this._CardSmeltCap_Move3 = _local1;
            BindingManager.executeBindings(this, "_CardSmeltCap_Move3", this._CardSmeltCap_Move3);
            return (_local1);
        }
        private function _CardSmeltCap_Move4_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = 87;
            this._CardSmeltCap_Move4 = _local1;
            BindingManager.executeBindings(this, "_CardSmeltCap_Move4", this._CardSmeltCap_Move4);
            return (_local1);
        }
        private function _CardSmeltCap_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 500;
            _local1.children = [this._CardSmeltCap_Move1_i(), this._CardSmeltCap_Move2_i()];
            this.openEffect = _local1;
            BindingManager.executeBindings(this, "openEffect", this.openEffect);
            return (_local1);
        }
        private function _CardSmeltCap_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = -87;
            this._CardSmeltCap_Move1 = _local1;
            BindingManager.executeBindings(this, "_CardSmeltCap_Move1", this._CardSmeltCap_Move1);
            return (_local1);
        }
        private function _CardSmeltCap_Move2_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = 174;
            this._CardSmeltCap_Move2 = _local1;
            BindingManager.executeBindings(this, "_CardSmeltCap_Move2", this._CardSmeltCap_Move2);
            return (_local1);
        }
        private function _CardSmeltCap_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardSmeltCap_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.y = 0;
            _local1.initialized(this, "cardSmeltCapUpImg");
            this.cardSmeltCapUpImg = _local1;
            BindingManager.executeBindings(this, "cardSmeltCapUpImg", this.cardSmeltCapUpImg);
            return (_local1);
        }
        private function _CardSmeltCap_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.y = 87;
            _local1.initialized(this, "cardSmeltCapDownImg");
            this.cardSmeltCapDownImg = _local1;
            BindingManager.executeBindings(this, "cardSmeltCapDownImg", this.cardSmeltCapDownImg);
            return (_local1);
        }
        public function ___CardSmeltCap_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CardSmeltCap_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "_CardSmeltCap_Move1.target", "cardSmeltCapUpImg");
            _local1[1] = new Binding(this, null, null, "_CardSmeltCap_Move2.target", "cardSmeltCapDownImg");
            _local1[2] = new Binding(this, null, null, "_CardSmeltCap_Move3.target", "cardSmeltCapUpImg");
            _local1[3] = new Binding(this, null, null, "_CardSmeltCap_Move4.target", "cardSmeltCapDownImg");
            return (_local1);
        }
        public function get cardSmeltCapDownImg():SmoothBitmapImage{
            return (this._1952667950cardSmeltCapDownImg);
        }
        public function set cardSmeltCapDownImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1952667950cardSmeltCapDownImg;
            if (_local2 !== _arg1){
                this._1952667950cardSmeltCapDownImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardSmeltCapDownImg", _local2, _arg1));
                };
            };
        }
        public function get cardSmeltCapUpImg():SmoothBitmapImage{
            return (this._2127617657cardSmeltCapUpImg);
        }
        public function set cardSmeltCapUpImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._2127617657cardSmeltCapUpImg;
            if (_local2 !== _arg1){
                this._2127617657cardSmeltCapUpImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardSmeltCapUpImg", _local2, _arg1));
                };
            };
        }
        public function get closeEffect():Parallel{
            return (this._241096279closeEffect);
        }
        public function set closeEffect(_arg1:Parallel):void{
            var _local2:Object = this._241096279closeEffect;
            if (_local2 !== _arg1){
                this._241096279closeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "closeEffect", _local2, _arg1));
                };
            };
        }
        public function get openEffect():Parallel{
            return (this._65508229openEffect);
        }
        public function set openEffect(_arg1:Parallel):void{
            var _local2:Object = this._65508229openEffect;
            if (_local2 !== _arg1){
                this._65508229openEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "openEffect", _local2, _arg1));
                };
            };
        }

    }
}//package card_smelt 

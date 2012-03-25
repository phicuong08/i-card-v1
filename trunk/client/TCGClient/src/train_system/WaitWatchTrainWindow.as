//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
    import combat_element_script.*;
    
    import flash.accessibility.*;
    import flash.debugger.*;
    import flash.display.*;
    import flash.errors.*;
    import flash.events.*;
    import flash.external.*;
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
    import mx.effects.Parallel;
    import mx.events.*;
    import mx.filters.*;
    import mx.graphics.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.primitives.*;
    
    import ui_element.*;

    public class WaitWatchTrainWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _WaitWatchTrainWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _WaitWatchTrainWindow_CommonOuterFrame1:CommonOuterFrame;
        public var _WaitWatchTrainWindow_Scale1:Scale;
        public var _WaitWatchTrainWindow_Scale2:Scale;
        private var _413245038addEffect:Parallel;
        private var _476548482cancelBtn:BlueSmallButton;
        private var _389150394contentText:Label;
        private var _273241018mainGroup:Group;
        private var _1267520715removeEffect:Parallel;
        private var _2135756891titleText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function WaitWatchTrainWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._WaitWatchTrainWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_train_system_WaitWatchTrainWindowWatcherSetupUtil");
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
            this.depth = 100;
            this.width = 0x0500;
            this.height = 800;
            this.mxmlContent = [this._WaitWatchTrainWindow_Rect1_c(), this._WaitWatchTrainWindow_Group2_i()];
            this._WaitWatchTrainWindow_Parallel1_i();
            this._WaitWatchTrainWindow_Parallel2_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            WaitWatchTrainWindow._watcherSetupUtil = _arg1;
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
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function cancelBtn_clickHandler(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("u.train_mgr:stop_watch_train()");
        }
        private function _WaitWatchTrainWindow_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._WaitWatchTrainWindow_Scale1_i()];
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.1;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.1;
            _local1.scaleYTo = 1;
            _local1.duration = 200;
            this._WaitWatchTrainWindow_Scale1 = _local1;
            BindingManager.executeBindings(this, "_WaitWatchTrainWindow_Scale1", this._WaitWatchTrainWindow_Scale1);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        private function _WaitWatchTrainWindow_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.children = [this._WaitWatchTrainWindow_Scale2_i()];
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_Scale2_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 1;
            _local1.scaleXTo = 0.1;
            _local1.scaleYFrom = 1;
            _local1.scaleYTo = 0.1;
            _local1.duration = 200;
            this._WaitWatchTrainWindow_Scale2 = _local1;
            BindingManager.executeBindings(this, "_WaitWatchTrainWindow_Scale2", this._WaitWatchTrainWindow_Scale2);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = false;
        }
        private function _WaitWatchTrainWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.fill = this._WaitWatchTrainWindow_SolidColor1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.width = 553;
            _local1.height = 197;
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.mxmlContent = [this._WaitWatchTrainWindow_CommonOuterFrame1_i(), this._WaitWatchTrainWindow_CommonMiddleFrame1_i(), this._WaitWatchTrainWindow_Label1_i(), this._WaitWatchTrainWindow_Label2_i(), this._WaitWatchTrainWindow_BlueSmallButton1_i()];
            _local1.setStyle("color", 16178309);
            _local1.id = "mainGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mainGroup = _local1;
            BindingManager.executeBindings(this, "mainGroup", this.mainGroup);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._WaitWatchTrainWindow_DropShadowFilter1_c()];
            _local1.id = "_WaitWatchTrainWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._WaitWatchTrainWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_WaitWatchTrainWindow_CommonOuterFrame1", this._WaitWatchTrainWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 23;
            _local1.y = 44;
            _local1.alpha = 0.7;
            _local1.id = "_WaitWatchTrainWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._WaitWatchTrainWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_WaitWatchTrainWindow_CommonMiddleFrame1", this._WaitWatchTrainWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 26;
            _local1.y = 19;
            _local1.width = 503;
            _local1.text = "提示：";
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontSize", 18);
            _local1.id = "titleText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.titleText = _local1;
            BindingManager.executeBindings(this, "titleText", this.titleText);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 29;
            _local1.y = 48;
            _local1.height = 96;
            _local1.width = 497;
            _local1.text = "训练处于对战连锁状态，连锁结束后将进入战场，请稍候...";
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.id = "contentText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.contentText = _local1;
            BindingManager.executeBindings(this, "contentText", this.contentText);
            return (_local1);
        }
        private function _WaitWatchTrainWindow_BlueSmallButton1_i():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.x = 472;
            _local1.y = 141;
            _local1.label = "取消";
            _local1.addEventListener("click", this.__cancelBtn_click);
            _local1.id = "cancelBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cancelBtn = _local1;
            BindingManager.executeBindings(this, "cancelBtn", this.cancelBtn);
            return (_local1);
        }
        public function __cancelBtn_click(_arg1:MouseEvent):void{
            this.cancelBtn_clickHandler(_arg1);
        }
        private function _WaitWatchTrainWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[2] = new Binding(this, null, null, "_WaitWatchTrainWindow_Scale1.target", "mainGroup");
            result[3] = new Binding(this, null, null, "_WaitWatchTrainWindow_Scale2.target", "mainGroup");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [553, 197];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_WaitWatchTrainWindow_CommonOuterFrame1.size");
            result[5] = new Binding(this, function ():Array{
                var _local1:* = [507, 125];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_WaitWatchTrainWindow_CommonMiddleFrame1.size");
            return (result);
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
        public function get cancelBtn():BlueSmallButton{
            return (this._476548482cancelBtn);
        }
        public function set cancelBtn(_arg1:BlueSmallButton):void{
            var _local2:Object = this._476548482cancelBtn;
            if (_local2 !== _arg1){
                this._476548482cancelBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtn", _local2, _arg1));
                };
            };
        }
        public function get contentText():Label{
            return (this._389150394contentText);
        }
        public function set contentText(_arg1:Label):void{
            var _local2:Object = this._389150394contentText;
            if (_local2 !== _arg1){
                this._389150394contentText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "contentText", _local2, _arg1));
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
        public function get titleText():Label{
            return (this._2135756891titleText);
        }
        public function set titleText(_arg1:Label):void{
            var _local2:Object = this._2135756891titleText;
            if (_local2 !== _arg1){
                this._2135756891titleText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleText", _local2, _arg1));
                };
            };
        }

    }
}//package train_system 

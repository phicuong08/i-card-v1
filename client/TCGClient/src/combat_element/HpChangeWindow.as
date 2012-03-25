//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
	import mx.effects.Sequence;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
	import mx.effects.Parallel;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
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
	
	
    public class HpChangeWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _HpChangeWindow_Move1:Move;
        public var _HpChangeWindow_Parallel1:Parallel;
        private var _hpChangeEffect:Sequence;
        private var _hpChangeLabel:Label;
        private var _hpMoveEffect:Move;
        private var __moduleFactoryInitialized:Boolean = false;
        public var hpCamp:String;
        public var hpChange:int;
        public var hpPos:int;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function HpChangeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._HpChangeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_HpChangeWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (HpChangeWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.clipAndEnableScrolling = true;
            this.width = 300;
            this.height = 110;
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.layout = this._HpChangeWindow_BasicLayout1_c();
            this.mxmlContent = [this._HpChangeWindow_Label1_i()];
            this._HpChangeWindow_Sequence1_i();
            this.addEventListener("creationComplete", this.___HpChangeWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            HpChangeWindow._watcherSetupUtil = _arg1;
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
        private function doEffect():void{
            x = 442;
            y = 180;
            if (this.hpCamp == "player"){
                this.hpMoveEffect.xTo = 0;
                this.hpMoveEffect.yTo = 660;
            } else {
                this.hpMoveEffect.xTo = 950;
                this.hpMoveEffect.yTo = 0;
            };
            if (this.hpChange > 0){
                this.hpChangeLabel.text = ("+" + this.hpChange.toString());
                this.hpChangeLabel.setStyle("color", 1763856);
            } else {
                this.hpChangeLabel.text = this.hpChange.toString();
                this.hpChangeLabel.setStyle("color", 15534345);
            };
            this.hpChangeEffect.play();
        }
        private function hpChangeEffect_effectEndHandler():void{
            CombatStage.getInstance().playersInfo.changeHp(this.hpCamp, this.hpChange);
            var _local1:* = parent;
            if (_local1 != null){
                _local1.removeElement(this);
            };
        }
        private function _HpChangeWindow_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._HpChangeWindow_Move1_i(), this._HpChangeWindow_Parallel1_i()];
            _local1.addEventListener("effectEnd", this.__hpChangeEffect_effectEnd);
            this.hpChangeEffect = _local1;
            BindingManager.executeBindings(this, "hpChangeEffect", this.hpChangeEffect);
            return (_local1);
        }
        private function _HpChangeWindow_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.yTo = 0;
            _local1.duration = 200;
            _local1.addEventListener("effectStart", this.___HpChangeWindow_Move1_effectStart);
            this._HpChangeWindow_Move1 = _local1;
            BindingManager.executeBindings(this, "_HpChangeWindow_Move1", this._HpChangeWindow_Move1);
            return (_local1);
        }
        public function ___HpChangeWindow_Move1_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound(((this.hpChange > 0)) ? "heal" : "hurt");
        }
        private function _HpChangeWindow_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.startDelay = 400;
            _local1.duration = 300;
            _local1.children = [this._HpChangeWindow_Move2_i(), this._HpChangeWindow_Fade1_c()];
            this._HpChangeWindow_Parallel1 = _local1;
            BindingManager.executeBindings(this, "_HpChangeWindow_Parallel1", this._HpChangeWindow_Parallel1);
            return (_local1);
        }
        private function _HpChangeWindow_Move2_i():Move{
            var _local1:Move = new Move();
            this.hpMoveEffect = _local1;
            BindingManager.executeBindings(this, "hpMoveEffect", this.hpMoveEffect);
            return (_local1);
        }
        private function _HpChangeWindow_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0.3;
            _local1.addEventListener("effectStart", this.___HpChangeWindow_Fade1_effectStart);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___HpChangeWindow_Fade1_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("hp");
        }
        public function __hpChangeEffect_effectEnd(_arg1:EffectEvent):void{
            this.hpChangeEffect_effectEndHandler();
        }
        private function _HpChangeWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _HpChangeWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontFamily", "Georgia");
            _local1.setStyle("fontSize", 100);
            _local1.id = "hpChangeLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.hpChangeLabel = _local1;
            BindingManager.executeBindings(this, "hpChangeLabel", this.hpChangeLabel);
            return (_local1);
        }
        public function ___HpChangeWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.doEffect();
        }
        private function _HpChangeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_HP_CHANGE_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():Number{
                return (hpChangeLabel.height);
            }, null, "_HpChangeWindow_Move1.yFrom");
            result[2] = new Binding(this, function ():Array{
                var _local1:* = hpChangeLabel;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_HpChangeWindow_Move1.targets", "hpChangeLabel");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = this;
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_HpChangeWindow_Parallel1.targets");
            return (result);
        }
		
        public function get hpChangeEffect():Sequence{
            return (this.hpChangeEffect);
        }
        public function set hpChangeEffect(_arg1:Sequence):void{
            var _local2:Object = this.hpChangeEffect;
            if (_local2 !== _arg1){
                this.hpChangeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpChangeEffect", _local2, _arg1));
                };
            };
        }
        public function get hpChangeLabel():Label{
            return (this.hpChangeLabel);
        }
        public function set hpChangeLabel(_arg1:Label):void{
            var _local2:Object = this.hpChangeLabel;
            if (_local2 !== _arg1){
                this.hpChangeLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpChangeLabel", _local2, _arg1));
                };
            };
        }
        public function get hpMoveEffect():Move{
            return (this.hpMoveEffect);
        }
        public function set hpMoveEffect(_arg1:Move):void{
            var _local2:Object = this.hpMoveEffect;
            if (_local2 !== _arg1){
                this.hpMoveEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "hpMoveEffect", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

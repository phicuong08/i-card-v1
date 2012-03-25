//Created by Action Script Viewer - http://www.buraks.com/asv
package baggage {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
//    import mx.effects.*;
	import mx.effects.Parallel;
    import mx.binding.*;
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
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

	use namespace mx_internal;

    public class BaggageWindowRemoveEffect extends UIComponent implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1994587966moveEffect:Move;
        private var _1267520715removeEffect:Parallel;
        private var __moduleFactoryInitialized:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BaggageWindowRemoveEffect(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BaggageWindowRemoveEffect_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_baggage_BaggageWindowRemoveEffectWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (BaggageWindowRemoveEffect[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this._BaggageWindowRemoveEffect_Parallel1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function showEffect(_arg1:BaggageWindow):void{
            var _local2:BaggageWindowRemoveEffect;
            var _local3:*;
            _local2 = new (BaggageWindowRemoveEffect)();
            _local2.drawBaggageWindow(_arg1);
            _local3 = TCGClient.getInstance().mainGroup;
            _local3.addElement(_local2);
            _local2.x = _arg1.x;
            _local2.y = _arg1.y;
            _local2.depth = _arg1.depth;
            var _local4:Rectangle = BasicOperationBar.getInstance().baggageBtn.getRect(_local3);
            _local2.moveEffect.xTo = _local4.x;
            _local2.moveEffect.yTo = _local4.y;
            _local2.removeEffect.play();
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BaggageWindowRemoveEffect._watcherSetupUtil = _arg1;
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
        private function drawBaggageWindow(_arg1:BaggageWindow):void{
            var _local2:BitmapData = new BitmapData(_arg1.width, _arg1.height, true, 0);
            _local2.draw(_arg1);
            addChild(new Bitmap(_local2));
        }
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _BaggageWindowRemoveEffect_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 300;
            _local1.children = [this._BaggageWindowRemoveEffect_Scale1_c(), this._BaggageWindowRemoveEffect_Move1_i()];
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _BaggageWindowRemoveEffect_Scale1_c():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXTo = 0;
            _local1.scaleYTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BaggageWindowRemoveEffect_Move1_i():Move{
            var _local1:Move = new Move();
            this.moveEffect = _local1;
            BindingManager.executeBindings(this, "moveEffect", this.moveEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _BaggageWindowRemoveEffect_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
            return (result);
        }
        public function get moveEffect():Move{
            return (this._1994587966moveEffect);
        }
        public function set moveEffect(_arg1:Move):void{
            var _local2:Object = this._1994587966moveEffect;
            if (_local2 !== _arg1){
                this._1994587966moveEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEffect", _local2, _arg1));
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
}//package baggage 

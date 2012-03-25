//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
//    import mx.effects.*;
	import mx.effects.Sequence;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import __AS3__.vec.*;
    import spark.effects.*;
    import spark.filters.*;
    import custom_effect.*;
    import flash.utils.*;
    import spark.effects.animation.*;
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

//	
    public class CardBuffWindowItem extends WordWithCircle implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Sequence;
        private var _1267520715removeEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var moveEffect:MoveEffect;
        private var _displayText:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardBuffWindowItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.moveEffect = new MoveEffect(this, 300);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardBuffWindowItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CardBuffWindowItemWatcherSetupUtil");
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
            this.wordColor = 0xFF00;
            this.circleWeight = 3;
            this.scaleX = 0.5;
            this.scaleY = 0.5;
            this._CardBuffWindowItem_Sequence1_i();
            this._CardBuffWindowItem_Fade2_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardBuffWindowItem._watcherSetupUtil = _arg1;
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
        public function moveTo(_arg1:Number):void{
            if (((((!(this.moveEffect.isPlaying)) && ((x == _arg1)))) || (((this.moveEffect.isPlaying) && ((this.moveEffect.xTo == _arg1)))))){
                return;
            };
            this.moveEffect.xTo = _arg1;
            this.moveEffect.yTo = y;
            this.moveEffect.play();
        }
        public function set displayText(_arg1:String):void{
            this._displayText = _arg1;
            wordText = this.translateText(this._displayText);
        }
        public function get displayText():String{
            return (this._displayText);
        }
        private function translateText(_arg1:String):String{
            switch (_arg1){
                case "di":
                    return ("敌");
                case "man":
                    return ("瞒");
                default:
                    return (_arg1);
            };
        }
        private function _CardBuffWindowItem_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._CardBuffWindowItem_Fade1_c(), this._CardBuffWindowItem_AnimateFilter1_c()];
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _CardBuffWindowItem_Fade1_c():spark.effects.Fade{
            var _local1:spark.effects.Fade = new spark.effects.Fade();
            _local1.duration = 300;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindowItem_AnimateFilter1_c():AnimateFilter{
            var _local1:AnimateFilter = new AnimateFilter();
            _local1.duration = 1000;
            _local1.bitmapFilter = this._CardBuffWindowItem_GlowFilter1_c();
            new Vector.<MotionPath>(3)[0] = this._CardBuffWindowItem_SimpleMotionPath1_c();
            new Vector.<MotionPath>(3)[1] = this._CardBuffWindowItem_SimpleMotionPath2_c();
            new Vector.<MotionPath>(3)[2] = this._CardBuffWindowItem_SimpleMotionPath3_c();
            _local1.motionPaths = new Vector.<MotionPath>(3);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindowItem_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFF000;
            _local1.strength = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindowItem_SimpleMotionPath1_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "alpha";
            _local1.valueFrom = 1;
            _local1.valueTo = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindowItem_SimpleMotionPath2_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurX";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindowItem_SimpleMotionPath3_c():SimpleMotionPath{
            var _local1:SimpleMotionPath = new SimpleMotionPath();
            _local1.property = "blurY";
            _local1.valueFrom = 0;
            _local1.valueTo = 60;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBuffWindowItem_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 300;
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        private function _CardBuffWindowItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            return (result);
        }
        public function get addEffect():Sequence{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Sequence):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Fade{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Fade):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

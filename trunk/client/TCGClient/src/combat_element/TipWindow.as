//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import custom_effect.*;
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

	use namespace mx_internal;
    public class TipWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _TipWindow_Label1:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        public var hideTimer:Timer;
        private var _1311656856tipText:String;
        private var moveEffect:MoveEffect;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function TipWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.hideTimer = new Timer(5000);
            this.moveEffect = new MoveEffect(this, 300);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._TipWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_TipWindowWatcherSetupUtil");
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
            this.x = 415;
            this.y = -80;
            this.width = 450;
            this.height = 80;
            this.mxmlContent = [this._TipWindow_Label1_i()];
            this.addEventListener("click", this.___TipWindow_Group1_click);
            this.addEventListener("add", this.___TipWindow_Group1_add);
            this.addEventListener("creationComplete", this.___TipWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            TipWindow._watcherSetupUtil = _arg1;
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
            this.graphics.beginFill(0x222222, 0.7);
            this.graphics.drawRect(0, 0, width, height);
            this.graphics.endFill();
            this.graphics.lineStyle(2, 16699961, 0.8);
            this.graphics.drawRect(0, 0, width, height);
        }
        protected function group1_addHandler(_arg1:FlexEvent):void{
            mouseChildren = true;
            mouseEnabled = true;
            this.moveEffect.xTo = x;
            this.moveEffect.yTo = -2;
            this.moveEffect.play();
            this.hideTimer.addEventListener(TimerEvent.TIMER, this.group1_clickHandler);
            this.hideTimer.start();
        }
        public function group1_clickHandler(_arg1:TimerEvent=null):void{
            mouseChildren = false;
            mouseEnabled = false;
            this.hideTimer.stop();
            this.hideTimer.removeEventListener(TimerEvent.TIMER, this.group1_clickHandler);
            this.moveEffect.yTo = -(height);
            this.moveEffect.play();
            this.moveEffect.addEventListener(CustomEffectEvent.END, this.removeSelf);
        }
        private function removeSelf(_arg1):void{
            this.moveEffect.removeEventListener(CustomEffectEvent.END, this.removeSelf);
            var _local2:* = parent;
            if (_local2){
                _local2.removeElement(this);
            };
        }
        private function _TipWindow_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 20;
            _local1.width = 410;
            _local1.height = 80;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("color", 0xFFFFFF);
            _local1.id = "_TipWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._TipWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_TipWindow_Label1", this._TipWindow_Label1);
            return (_local1);
        }
        public function ___TipWindow_Group1_click(_arg1:MouseEvent):void{
            this.group1_clickHandler();
        }
        public function ___TipWindow_Group1_add(_arg1:FlexEvent):void{
            this.group1_addHandler(_arg1);
        }
        public function ___TipWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _TipWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_TIP_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, null, null, "_TipWindow_Label1.text", "tipText");
            return (result);
        }
        public function get tipText():String{
            return (this._1311656856tipText);
        }
        public function set tipText(_arg1:String):void{
            var _local2:Object = this._1311656856tipText;
            if (_local2 !== _arg1){
                this._1311656856tipText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipText", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

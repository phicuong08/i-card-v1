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
    import spark.effects.*;
    import spark.layouts.*;
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

    public class RoundTimeCountDown extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _RoundTimeCountDown_Label2:Label;
        private var _413245038addEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _2077368934timeText:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function RoundTimeCountDown(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._RoundTimeCountDown_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_RoundTimeCountDownWatcherSetupUtil");
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
            this.verticalCenter = -108;
            this.horizontalCenter = 0;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.width = 180;
            this.height = 170;
            this.layout = this._RoundTimeCountDown_BasicLayout1_c();
            this.mxmlContent = [this._RoundTimeCountDown_Label1_c(), this._RoundTimeCountDown_Label2_i()];
            this._RoundTimeCountDown_Fade1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            RoundTimeCountDown._watcherSetupUtil = _arg1;
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
                this.color = 15534345;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function addToStage():void{
            if (!parent){
                CombatStage.getInstance().addElement(this);
            };
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _RoundTimeCountDown_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _RoundTimeCountDown_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoundTimeCountDown_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.text = "操作倒计时：";
            _local1.percentWidth = 100;
            _local1.alpha = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("fontWeight", "bold");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _RoundTimeCountDown_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontFamily", "Georgia");
            _local1.setStyle("fontSize", 100);
            _local1.id = "_RoundTimeCountDown_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._RoundTimeCountDown_Label2 = _local1;
            BindingManager.executeBindings(this, "_RoundTimeCountDown_Label2", this._RoundTimeCountDown_Label2);
            return (_local1);
        }
        private function _RoundTimeCountDown_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_ROUND_COUNT_DOWN);
            }, null, "this.depth");
            result[2] = new Binding(this, null, null, "_RoundTimeCountDown_Label2.text", "timeText");
            return (result);
        }
        public function get addEffect():Fade{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Fade):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get timeText():String{
            return (this._2077368934timeText);
        }
        public function set timeText(_arg1:String):void{
            var _local2:Object = this._2077368934timeText;
            if (_local2 !== _arg1){
                this._2077368934timeText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "timeText", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

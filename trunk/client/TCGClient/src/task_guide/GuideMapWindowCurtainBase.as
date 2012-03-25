//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import flash.utils.*;
    import combat_element_script.*;
    import beginner_guide.*;
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

    public class GuideMapWindowCurtainBase extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1282133823fadeIn:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var signActionArray:Array;
        protected var openInfo:Object;
        protected var completeInfo:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function GuideMapWindowCurtainBase(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.signActionArray = new Array();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideMapWindowCurtainBase_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideMapWindowCurtainBaseWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (GuideMapWindowCurtainBase[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 0x0500;
            this.height = 800;
            this.alpha = 0;
            this.mouseChildren = false;
            this.layout = this._GuideMapWindowCurtainBase_BasicLayout1_c();
            this._GuideMapWindowCurtainBase_Fade1_i();
            this.addEventListener("creationComplete", this.___GuideMapWindowCurtainBase_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideMapWindowCurtainBase._watcherSetupUtil = _arg1;
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
        public function setGuideInfo(_arg1:Object, _arg2:Object):void{
            this.openInfo = _arg1;
            this.completeInfo = _arg2;
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var _local4:int;
            if (((!(this.openInfo)) || (!(this.completeInfo)))){
                return;
            };
            var _local2:Object = this.openInfo["unlock"];
            var _local3:Object = this.openInfo["level_limit"];
            for each (_local4 in this.guideSections) {
                this[("step" + _local4)].text = GuideLib[(("guide" + _local4) + "Name")];
                if (CommonUtil.getObjectKeyByValue(_local2, _local4)){
                    this[("step" + _local4)].unlock = true;
                    if (!_local3[_local4]){
                        this[("step" + _local4)].active = true;
                        if (this.completeInfo[_local4.toString()]){
                            this.signActionArray.push([this[("step" + _local4)].showSign]);
                        };
                    } else {
                        this[("step" + _local4)].active = false;
                        this[("step" + _local4)].disableTooltip = (("#r需求等级：" + _local3[_local4]) + "#n<br>通过完成#g训练#n、#g对战#n或#g战役#n可以获取积分并提升等级。");
                    };
                } else {
                    this[("step" + _local4)].unlock = false;
                    this[("step" + _local4)].active = false;
                };
            };
        }
        public function get guideSections():Array{
            return ([]);
        }
        protected function clickHandler(_arg1:MouseEvent):void{
            var _local2:GuideMapSign;
            var _local3:int;
            _local2 = (_arg1.currentTarget as GuideMapSign);
            if (_local2.active){
                BasicOperationBar.getInstance().clearLeaveFuncInViolence();
                mouseChildren = false;
                mouseEnabled = false;
                _local3 = int(_local2.id.replace("step", ""));
                TCGClient.getInstance().guideBegin(_local3);
            };
        }
        protected function fadeIn_effectEndHandler():void{
            var t:* = null;
            var showSign:* = null;
            showSign = function ():void{
                if (signActionArray.length == 0){
                    t.stop();
                    t.removeEventListener(TimerEvent.TIMER, showSign);
                    mouseChildren = true;
                    return;
                };
                var _local1:Array = signActionArray.shift();
                var _local2:Function = (_local1.shift() as Function);
                _local2.apply(null, _local1);
            };
            t = new Timer(100);
            t.addEventListener(TimerEvent.TIMER, showSign);
            t.start();
            BeginnerGuideUtil.dispatchLuaEvent("guideMapAdd", null, true);
        }
        private function _GuideMapWindowCurtainBase_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__fadeIn_effectEnd);
            this.fadeIn = _local1;
            BindingManager.executeBindings(this, "fadeIn", this.fadeIn);
            return (_local1);
        }
        public function __fadeIn_effectEnd(_arg1:EffectEvent):void{
            this.fadeIn_effectEndHandler();
        }
        private function _GuideMapWindowCurtainBase_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___GuideMapWindowCurtainBase_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _GuideMapWindowCurtainBase_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeIn");
            return (result);
        }
        public function get fadeIn():Fade{
            return (this._1282133823fadeIn);
        }
        public function set fadeIn(_arg1:Fade):void{
            var _local2:Object = this._1282133823fadeIn;
            if (_local2 !== _arg1){
                this._1282133823fadeIn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeIn", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 

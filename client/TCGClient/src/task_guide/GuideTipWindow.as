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
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import combat_element.*;
    import flashx.textLayout.elements.*;
    import SoundSystem.*;
    import flash.utils.*;
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

    public class GuideTipWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var _586331138mouseSign:GuideMouseSign;
        private var _3560248tips:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _stepInfo:Object;
        private var _1312067479tipFlow:TextFlow;
        private var innerVisible:Boolean = true;
        private var _embed_mxml_source_commonUI_________png_1086246204:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function GuideTipWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_________png_1086246204 = GuideTipWindow__embed_mxml_source_commonUI_________png_1086246204;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideTipWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideTipWindowWatcherSetupUtil");
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
            this.width = 599;
            this.height = 129;
            this.layout = this._GuideTipWindow_BasicLayout1_c();
            this.mxmlContent = [this._GuideTipWindow_SmoothBitmapImage1_c(), this._GuideTipWindow_RichText1_i(), this._GuideTipWindow_GuideMouseSign1_i()];
            this._GuideTipWindow_Fade1_i();
            this._GuideTipWindow_Fade2_i();
            this.addEventListener("initialize", this.___GuideTipWindow_Group1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideTipWindow._watcherSetupUtil = _arg1;
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
        public function set stepInfo(_arg1:Object):void{
            var removeHandler:* = null;
            var ob:* = _arg1;
            this._stepInfo = ob;
            this.setTipContent(this._stepInfo["content"]);
            if ((((this._stepInfo["x_position"] == "")) || (!(this._stepInfo["x_position"])))){
                x = 340;
            } else {
                x = GuideSystem.getInstance().getPosById(this._stepInfo["x_position"]);
            };
            if ((((this._stepInfo["y_position"] == "")) || (!(this._stepInfo["y_position"])))){
                y = 325;
            } else {
                y = GuideSystem.getInstance().getPosById(this._stepInfo["y_position"]);
            };
            GuideFunctions.createGuideLine(this);
            if (this._stepInfo["display_func"]){
                var _local3 = GuideFunctions;
                _local3[this._stepInfo["display_func"]](this);
            };
            if (this._stepInfo["click_remove"] != "false"){
                this.mouseSign.visible = true;
                TCGClient.getInstance().addEventListener(MouseEvent.CLICK, this.clickHandler);
            } else {
                this.mouseSign.visible = false;
            };
            if (((((this._stepInfo["tip_type"]) && ((this._stepInfo["tip_type"] == "goal_complete")))) && (GuideGoalWindow.currentDisplayWindow))){
                removeHandler = function (_arg1:Event):void{
                    (_arg1.currentTarget as GuideGoalWindow).removeEventListener(Event.REMOVED_FROM_STAGE, removeHandler);
                    innerVisible = true;
                    visible = true;
                };
                this.innerVisible = false;
                this.visible = false;
                GuideGoalWindow.currentDisplayWindow.moveToCenter(this._stepInfo["content"]);
                GuideGoalWindow.currentDisplayWindow.addEventListener(Event.REMOVED_FROM_STAGE, removeHandler);
            };
        }
        override public function set visible(_arg1:Boolean):void{
            super.visible = ((_arg1) && (this.innerVisible));
        }
        public function get stepInfo():Object{
            return (this._stepInfo);
        }
        public function setTipContent(_arg1:String):void{
            this.tipFlow = StringUtils.createTFByHtmlText(_arg1);
        }
        public function removeSelf():void{
            var _local1:GuideGoalWindow;
            if (((((!(this.fadeOutEffect.isPlaying)) && (parent))) && (!((alpha == 0))))){
                this.fadeOutEffect.play();
                if (((this._stepInfo["tip_type"]) && ((this._stepInfo["tip_type"] == "guide_goal")))){
                    _local1 = new GuideGoalWindow();
                    _local1.setInfo(this._stepInfo, CombatStage.getInstance().globalToLocal(this.tips.localToGlobal(new Point(0, 0))));
                    CombatStage.getInstance().addElement(_local1);
                    this.visible = false;
                };
            };
        }
        private function fadeEffectEnd():void{
            this.visible = false;
            dispatchEvent(new Event("finishTask"));
        }
        protected function clickHandler(_arg1:MouseEvent=null):void{
            if (((this.fadeInEffect.isPlaying) || (this.fadeOutEffect.isPlaying))){
                return;
            };
            TCGClient.getInstance().removeEventListener(MouseEvent.CLICK, this.clickHandler);
            GuideSystem.getInstance().hideAll();
        }
        private function _GuideTipWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectStart", this.__fadeInEffect_effectStart);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("window_show");
        }
        private function _GuideTipWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaTo = 0;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__fadeOutEffect_effectEnd);
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        public function __fadeOutEffect_effectEnd(_arg1:EffectEvent):void{
            this.fadeEffectEnd();
        }
        private function _GuideTipWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideTipWindow_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_1086246204;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideTipWindow_RichText1_i():RichText{
            var _local1:RichText;
            _local1 = new RichText();
            _local1.x = 39;
            _local1.width = 520;
            _local1.height = 130;
            _local1.content = "\n\t";
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _GuideTipWindow_GuideMouseSign1_i():GuideMouseSign{
            var _local1:GuideMouseSign = new GuideMouseSign();
            _local1.x = 538;
            _local1.y = 80;
            _local1.id = "mouseSign";
            if (!_local1.document){
                _local1.document = this;
            };
            this.mouseSign = _local1;
            BindingManager.executeBindings(this, "mouseSign", this.mouseSign);
            return (_local1);
        }
        public function ___GuideTipWindow_Group1_initialize(_arg1:FlexEvent):void{
            alpha = 0;
        }
        private function _GuideTipWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "fadeOutEffect.target");
            result[2] = new Binding(this, function ():uint{
                return (GuideFunctions.GUIDE_FONT_COLOR);
            }, function (_arg1:uint):void{
                tips.setStyle("color", _arg1);
            }, "tips.color");
            result[3] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
            return (result);
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get fadeOutEffect():Fade{
            return (this._733607779fadeOutEffect);
        }
        public function set fadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._733607779fadeOutEffect;
            if (_local2 !== _arg1){
                this._733607779fadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutEffect", _local2, _arg1));
                };
            };
        }
        public function get mouseSign():GuideMouseSign{
            return (this._586331138mouseSign);
        }
        public function set mouseSign(_arg1:GuideMouseSign):void{
            var _local2:Object = this._586331138mouseSign;
            if (_local2 !== _arg1){
                this._586331138mouseSign = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "mouseSign", _local2, _arg1));
                };
            };
        }
        public function get tips():RichText{
            return (this._3560248tips);
        }
        public function set tips(_arg1:RichText):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }
        private function get tipFlow():TextFlow{
            return (this._1312067479tipFlow);
        }
        private function set tipFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1312067479tipFlow;
            if (_local2 !== _arg1){
                this._1312067479tipFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipFlow", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 

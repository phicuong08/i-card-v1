//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
//    import mx.effects.*;
	import mx.effects.Parallel;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import flashx.textLayout.elements.*;
    import flash.utils.*;
    import combat_element_script.*;
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
	
	use namespace mx_internal;
    public class GuideGoalWindow extends Group implements IBindingClient {

		
        public static var currentDisplayWindow:GuideGoalWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _GuideGoalWindow_Fade1:Fade;
        public var _GuideGoalWindow_Fade2:Fade;
        public var _GuideGoalWindow_Move1:Move;
        public var _GuideGoalWindow_Scale1:Scale;
        public var _GuideGoalWindow_Scale2:Scale;
        private var _413245038addEffect:Parallel;
        private var _1644993770frameImg:SmoothBitmapImage;
        private var _1068264366moveEf:Move;
        private var _1906694510moveToCenterEffect:Parallel;
        private var _3560248tips:RichText;
        private var _380948335tipsComplete:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1312067479tipFlow:TextFlow;
        private var _1468828866tipFlowComplete:TextFlow;
        private var initPos:Point;
        private var _embed_mxml_source_commonUI_________png_1086246204:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function GuideGoalWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_________png_1086246204 = GuideGoalWindow__embed_mxml_source_commonUI_________png_1086246204;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._GuideGoalWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_task_guide_GuideGoalWindowWatcherSetupUtil");
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
            this.width = 520;
            this.height = 130;
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.layout = this._GuideGoalWindow_BasicLayout1_c();
            this.mxmlContent = [this._GuideGoalWindow_SmoothBitmapImage1_i(), this._GuideGoalWindow_RichText1_i(), this._GuideGoalWindow_RichText2_i()];
            this._GuideGoalWindow_Parallel1_i();
            this._GuideGoalWindow_Parallel2_i();
            this.addEventListener("remove", this.___GuideGoalWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            GuideGoalWindow._watcherSetupUtil = _arg1;
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
        private function clearInstance():void{
            if (currentDisplayWindow == this){
                currentDisplayWindow = null;
            };
        }
        public function setInfo(_arg1:Object, _arg2:Point):void{
            this.setTipContent(_arg1["content"]);
            this.initPos = _arg2;
            this.move(_arg2.x, _arg2.y);
            if (currentDisplayWindow){
                currentDisplayWindow.removeSelf();
            };
            currentDisplayWindow = this;
        }
        protected function setTipContent(_arg1:String):void{
            this.tipFlow = StringUtils.createTFByHtmlText(_arg1);
        }
        protected function setTipCompleteContent(_arg1:String):void{
            this.tipFlowComplete = StringUtils.createTFByHtmlText(_arg1);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        public function moveToCenter(_arg1:String):void{
            this.moveEf.xTo = this.initPos.x;
            this.moveEf.yTo = this.initPos.y;
            this.moveToCenterEffect.play();
            this.setTipCompleteContent(_arg1);
        }
        private function _GuideGoalWindow_Parallel1_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 1000;
            _local1.children = [this._GuideGoalWindow_Move1_i(), this._GuideGoalWindow_Scale1_i()];
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _GuideGoalWindow_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.xTo = -105;
            _local1.yTo = -30;
            this._GuideGoalWindow_Move1 = _local1;
            BindingManager.executeBindings(this, "_GuideGoalWindow_Move1", this._GuideGoalWindow_Move1);
            return (_local1);
        }
        private function _GuideGoalWindow_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 1;
            _local1.scaleXTo = 0.5;
            _local1.scaleYFrom = 1;
            _local1.scaleYTo = 0.5;
            this._GuideGoalWindow_Scale1 = _local1;
            BindingManager.executeBindings(this, "_GuideGoalWindow_Scale1", this._GuideGoalWindow_Scale1);
            return (_local1);
        }
        private function _GuideGoalWindow_Parallel2_i():Parallel{
            var _local1:Parallel = new Parallel();
            _local1.duration = 500;
            _local1.children = [this._GuideGoalWindow_Move2_i(), this._GuideGoalWindow_Scale2_i(), this._GuideGoalWindow_Fade1_i(), this._GuideGoalWindow_Fade2_i()];
            _local1.addEventListener("effectEnd", this.__moveToCenterEffect_effectEnd);
            this.moveToCenterEffect = _local1;
            BindingManager.executeBindings(this, "moveToCenterEffect", this.moveToCenterEffect);
            return (_local1);
        }
        private function _GuideGoalWindow_Move2_i():Move{
            var _local1:Move = new Move();
            this.moveEf = _local1;
            BindingManager.executeBindings(this, "moveEf", this.moveEf);
            return (_local1);
        }
        private function _GuideGoalWindow_Scale2_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.5;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.5;
            _local1.scaleYTo = 1;
            this._GuideGoalWindow_Scale2 = _local1;
            BindingManager.executeBindings(this, "_GuideGoalWindow_Scale2", this._GuideGoalWindow_Scale2);
            return (_local1);
        }
        private function _GuideGoalWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            this._GuideGoalWindow_Fade1 = _local1;
            BindingManager.executeBindings(this, "_GuideGoalWindow_Fade1", this._GuideGoalWindow_Fade1);
            return (_local1);
        }
        private function _GuideGoalWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this._GuideGoalWindow_Fade2 = _local1;
            BindingManager.executeBindings(this, "_GuideGoalWindow_Fade2", this._GuideGoalWindow_Fade2);
            return (_local1);
        }
        public function __moveToCenterEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _GuideGoalWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _GuideGoalWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.source = this._embed_mxml_source_commonUI_________png_1086246204;
            _local1.horizontalCenter = 0;
            _local1.verticalCenter = 0;
            _local1.initialized(this, "frameImg");
            this.frameImg = _local1;
            BindingManager.executeBindings(this, "frameImg", this.frameImg);
            return (_local1);
        }
        private function _GuideGoalWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
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
        private function _GuideGoalWindow_RichText2_i():RichText{
            var _local1:RichText = new RichText();
            _local1.alpha = 0;
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.id = "tipsComplete";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tipsComplete = _local1;
            BindingManager.executeBindings(this, "tipsComplete", this.tipsComplete);
            return (_local1);
        }
        public function ___GuideGoalWindow_Group1_remove(_arg1:FlexEvent):void{
            this.clearInstance();
        }
        private function _GuideGoalWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_ACHIEVEMENT_WINDOW);
            }, null, "this.depth");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "_GuideGoalWindow_Move1.target");
            result[3] = new Binding(this, null, null, "_GuideGoalWindow_Scale1.target", "frameImg");
            result[4] = new Binding(this, function ():Object{
                return (this);
            }, null, "moveEf.target");
            result[5] = new Binding(this, null, null, "_GuideGoalWindow_Scale2.target", "frameImg");
            result[6] = new Binding(this, null, null, "_GuideGoalWindow_Fade1.target", "tips");
            result[7] = new Binding(this, null, null, "_GuideGoalWindow_Fade2.target", "tipsComplete");
            result[8] = new Binding(this, function ():uint{
                return (GuideFunctions.GUIDE_FONT_COLOR);
            }, function (_arg1:uint):void{
                tips.setStyle("color", _arg1);
            }, "tips.color");
            result[9] = new Binding(this, function ():TextFlow{
                return (tipFlow);
            }, null, "tips.textFlow");
            result[10] = new Binding(this, function ():uint{
                return (GuideFunctions.GUIDE_FONT_COLOR);
            }, function (_arg1:uint):void{
                tipsComplete.setStyle("color", _arg1);
            }, "tipsComplete.color");
            result[11] = new Binding(this, function ():TextFlow{
                return (tipFlowComplete);
            }, null, "tipsComplete.textFlow");
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
        public function get frameImg():SmoothBitmapImage{
            return (this._1644993770frameImg);
        }
        public function set frameImg(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._1644993770frameImg;
            if (_local2 !== _arg1){
                this._1644993770frameImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "frameImg", _local2, _arg1));
                };
            };
        }
        public function get moveEf():Move{
            return (this._1068264366moveEf);
        }
        public function set moveEf(_arg1:Move):void{
            var _local2:Object = this._1068264366moveEf;
            if (_local2 !== _arg1){
                this._1068264366moveEf = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEf", _local2, _arg1));
                };
            };
        }
        public function get moveToCenterEffect():Parallel{
            return (this._1906694510moveToCenterEffect);
        }
        public function set moveToCenterEffect(_arg1:Parallel):void{
            var _local2:Object = this._1906694510moveToCenterEffect;
            if (_local2 !== _arg1){
                this._1906694510moveToCenterEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveToCenterEffect", _local2, _arg1));
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
        public function get tipsComplete():RichText{
            return (this._380948335tipsComplete);
        }
        public function set tipsComplete(_arg1:RichText):void{
            var _local2:Object = this._380948335tipsComplete;
            if (_local2 !== _arg1){
                this._380948335tipsComplete = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipsComplete", _local2, _arg1));
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
        private function get tipFlowComplete():TextFlow{
            return (this._1468828866tipFlowComplete);
        }
        private function set tipFlowComplete(_arg1:TextFlow):void{
            var _local2:Object = this._1468828866tipFlowComplete;
            if (_local2 !== _arg1){
                this._1468828866tipFlowComplete = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipFlowComplete", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 

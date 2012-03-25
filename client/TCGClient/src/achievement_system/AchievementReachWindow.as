//Created by Action Script Viewer - http://www.buraks.com/asv
package achievement_system {
    import combat_element.*;
    
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
 //   import mx.effects.*;
    import mx.events.*;
    import mx.filters.*;
    import mx.graphics.*;
    import mx.styles.*;
    import mx.effects.Sequence;
    import spark.components.*;
    import spark.effects.*;
    import spark.filters.*;
    import spark.layouts.*;
    import spark.primitives.*;
	
	use namespace mx_internal;
    public class AchievementReachWindow extends Group implements IBindingClient {

        private static var currentDisplayWindow:AchievementReachWindow;
        private static var waitWindows:Array = new Array();
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AchievementReachWindow_Label2:Label;
        public var _AchievementReachWindow_Label3:Label;
        private var _413245038addEffect:Sequence;
        private var _1267520715removeEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _621170266achievementName:String;
        private var _2081088675achievementScore:String;
        private var removeTimer:Timer;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AchievementReachWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.removeTimer = new Timer(2000, 1);
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AchievementReachWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_achievement_system_AchievementReachWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (AchievementReachWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 500;
            this.height = 120;
            this.x = 380;
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.layout = this._AchievementReachWindow_BasicLayout1_c();
            this.mxmlContent = [this._AchievementReachWindow_Rect1_c(), this._AchievementReachWindow_Label1_c(), this._AchievementReachWindow_Label2_i(), this._AchievementReachWindow_Label3_i()];
            this._AchievementReachWindow_Sequence1_i();
            this._AchievementReachWindow_Fade2_i();
            this.addEventListener("click", this.___AchievementReachWindow_Group1_click);
            this.addEventListener("creationComplete", this.___AchievementReachWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function reset():void{
            waitWindows = new Array();
            if (currentDisplayWindow){
                currentDisplayWindow.removeSelf();
                currentDisplayWindow = null;
            };
        }
        public static function addAchievementWindow(_arg1):void{
            var _local2:AchievementReachWindow = new (AchievementReachWindow)();
            _local2.achievementId = _arg1;
            waitWindows.push(_local2);
            addWindowToStage();
        }
        private static function addWindowToStage():void{
            var _local1:AchievementReachWindow;
            if (((((CombatStage.getInstance()) && (!(currentDisplayWindow)))) && ((waitWindows.length > 0)))){
                _local1 = waitWindows.shift();
                _local1.y = 200;
                CombatStage.getInstance().addElement(_local1);
                currentDisplayWindow = _local1;
                return;
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AchievementReachWindow._watcherSetupUtil = _arg1;
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
        public function set achievementId(_arg1):void{
            var _local2:Object = AchievementLib.achievementConfig[_arg1.toString()];
            this.achievementName = _local2.name;
            this.achievementScore = _local2.score;
        }
        protected function clickHandler(_arg1:TimerEvent=null):void{
            this.removeTimer.stop();
            this.removeTimer.removeEventListener(TimerEvent.TIMER, this.clickHandler);
            mouseChildren = false;
            mouseEnabled = false;
            this.removeEffect.play();
            currentDisplayWindow = null;
            addWindowToStage();
        }
        protected function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.removeTimer.addEventListener(TimerEvent.TIMER, this.clickHandler);
            this.removeTimer.start();
            var _local2:BitmapData = new BitmapData(width, height, true, 0);
            _local2.draw(this);
            this.removeAllElements();
            var _local3:Bitmap = new Bitmap(_local2);
            var _local4:UIComponent = new UIComponent();
            _local4.addChild(_local3);
            addElement(_local4);
        }
        protected function fade1_effectEndHandler(_arg1:EffectEvent):void{
            mouseChildren = true;
            mouseEnabled = true;
        }
        private function _AchievementReachWindow_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._AchievementReachWindow_Fade1_c(), this._AchievementReachWindow_Move1_c()];
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _AchievementReachWindow_Fade1_c():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.___AchievementReachWindow_Fade1_effectEnd);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AchievementReachWindow_Fade1_effectEnd(_arg1:EffectEvent):void{
            this.fade1_effectEndHandler(_arg1);
        }
        private function _AchievementReachWindow_Move1_c():Move{
            var _local1:Move = new Move();
            _local1.yBy = -200;
            _local1.duration = 3000;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.duration = 1000;
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _AchievementReachWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.radiusX = 5;
            _local1.radiusY = 5;
            _local1.fill = this._AchievementReachWindow_SolidColor1_c();
            _local1.stroke = this._AchievementReachWindow_SolidColorStroke1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_SolidColor1_c():SolidColor{
            var _local1:SolidColor = new SolidColor();
            _local1.color = 0;
            _local1.alpha = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.color = 0xFFD800;
            _local1.weight = 2;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.x = 94;
            _local1.y = 25;
            _local1.text = "成就达成：";
            _local1.filters = [this._AchievementReachWindow_GlowFilter1_c()];
            _local1.setStyle("color", 0xFF6600);
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("fontWeight", "bold");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF0000;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.y = 57;
            _local1.horizontalCenter = 0;
            _local1.filters = [this._AchievementReachWindow_GlowFilter2_c()];
            _local1.setStyle("color", 16699961);
            _local1.setStyle("fontSize", 40);
            _local1.id = "_AchievementReachWindow_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AchievementReachWindow_Label2 = _local1;
            BindingManager.executeBindings(this, "_AchievementReachWindow_Label2", this._AchievementReachWindow_Label2);
            return (_local1);
        }
        private function _AchievementReachWindow_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0x323232;
            _local1.quality = 2;
            _local1.strength = 5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AchievementReachWindow_Label3_i():Label{
            var _local1:Label = new Label();
            _local1.x = 330;
            _local1.y = 39;
            _local1.rotation = -20;
            _local1.filters = [this._AchievementReachWindow_GlowFilter3_c()];
            _local1.setStyle("color", 0xFF00);
            _local1.setStyle("fontFamily", "Georgia");
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "_AchievementReachWindow_Label3";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AchievementReachWindow_Label3 = _local1;
            BindingManager.executeBindings(this, "_AchievementReachWindow_Label3", this._AchievementReachWindow_Label3);
            return (_local1);
        }
        private function _AchievementReachWindow_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFF00;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AchievementReachWindow_Group1_click(_arg1:MouseEvent):void{
            this.clickHandler();
        }
        public function ___AchievementReachWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _AchievementReachWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_ACHIEVEMENT_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[2] = new Binding(this, function ():Object{
                return (this);
            }, null, "removeEffect.target");
            result[3] = new Binding(this, function ():String{
                var _local1:* = achievementName;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_AchievementReachWindow_Label2.text");
            result[4] = new Binding(this, function ():String{
                var _local1:* = ("+" + achievementScore);
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_AchievementReachWindow_Label3.text");
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
        private function get achievementName():String{
            return (this._621170266achievementName);
        }
        private function set achievementName(_arg1:String):void{
            var _local2:Object = this._621170266achievementName;
            if (_local2 !== _arg1){
                this._621170266achievementName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievementName", _local2, _arg1));
                };
            };
        }
        private function get achievementScore():String{
            return (this._2081088675achievementScore);
        }
        private function set achievementScore(_arg1:String):void{
            var _local2:Object = this._2081088675achievementScore;
            if (_local2 !== _arg1){
                this._2081088675achievementScore = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "achievementScore", _local2, _arg1));
                };
            };
        }

    }
}//package achievement_system 

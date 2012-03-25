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
    import normal_window.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
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

    public class DuelEndLuckyDrawWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _DuelEndLuckyDrawWindow_Label1:Label;
        private var _413245038addEffect:Fade;
        private var _267258545cardGroup:Group;
        private var _447956343noticeEffect:Fade;
        private var _1269291995noticeText:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _2135756891titleText:String = "你获得了一次抽卡机会";
        private var allCardIdArr:Array;
        private var targetCardIdArr:Array;
        private var allCardItemArr:Array;
        private var allowRemove:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function DuelEndLuckyDrawWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._DuelEndLuckyDrawWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_DuelEndLuckyDrawWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (DuelEndLuckyDrawWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 600;
            this.height = 350;
            this.horizontalCenter = 0;
            this.verticalCenter = 0;
            this.layout = this._DuelEndLuckyDrawWindow_BasicLayout1_c();
            this.mxmlContent = [this._DuelEndLuckyDrawWindow_Rect1_c(), this._DuelEndLuckyDrawWindow_Rect2_c(), this._DuelEndLuckyDrawWindow_Label1_i(), this._DuelEndLuckyDrawWindow_Group2_i(), this._DuelEndLuckyDrawWindow_Label2_i()];
            this._DuelEndLuckyDrawWindow_Fade1_i();
            this._DuelEndLuckyDrawWindow_Fade2_i();
            this.addEventListener("creationComplete", this.___DuelEndLuckyDrawWindow_Group1_creationComplete);
            this.addEventListener("remove", this.___DuelEndLuckyDrawWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            DuelEndLuckyDrawWindow._watcherSetupUtil = _arg1;
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
        public function setBonusInfo(_arg1:Array, _arg2:Array):void{
            this.targetCardIdArr = _arg1;
            this.allCardIdArr = _arg2;
        }
        protected function group1_creationCompleteHandler():void{
            if (((!(this.allCardIdArr)) || (!(this.targetCardIdArr)))){
                this.removeSelf();
                throw (new Error("需要在创建窗口时,传入所有卡以及奖品卡信息数据。"));
            };
            this.allCardItemArr = new Array();
            var _local1:int;
            while (_local1 < this.allCardIdArr.length) {
                this.createCardItem();
                _local1++;
            };
            CombatStage.getInstance().addEventListener(MouseEvent.CLICK, this.group1_clickHandler);
            BasicOperationBar.getInstance().addEventListener(BasicOperationBar.CLICK_LEAVE_BTN, this.group1_clickHandler);
        }
        private function createCardItem():void{
            var _local1:DuelEndLuckyDrawWindowItem = new DuelEndLuckyDrawWindowItem();
            _local1.addEventListener(MouseEvent.CLICK, this.clickCardHandler);
            this.cardGroup.addElement(_local1);
            this.allCardItemArr.push(_local1);
        }
        private function clickCardHandler(_arg1:MouseEvent):void{
            if (this.targetCardIdArr.length == 0){
                return;
            };
            var _local2:DuelEndLuckyDrawWindowItem = (_arg1.currentTarget as DuelEndLuckyDrawWindowItem);
            this.allCardItemArr.splice(this.allCardItemArr.indexOf(_local2), 1);
            var _local3:int = this.targetCardIdArr.pop();
            this.allCardIdArr.splice(this.allCardIdArr.indexOf(_local3), 1);
            _local2.setCardById(_local3);
            _local2.changeToPositive(true);
            _local2.addEventListener("rotationEnd", this.checkShowAll);
        }
        private function checkShowAll(_arg1:Event):void{
            (_arg1.target as DuelEndLuckyDrawWindowItem).removeEventListener("rotationEnd", this.checkShowAll);
            if (this.targetCardIdArr.length == 0){
                this.showAllCard();
            };
        }
        private function showAllCard():void{
            var card:* = null;
            var lastCardRotationEnd:* = null;
            var i:* = 0;
            while (i < this.allCardIdArr.length) {
                card = (this.allCardItemArr[i] as DuelEndLuckyDrawWindowItem);
                card.setCardById(this.allCardIdArr[i]);
                card.changeToPositive(false);
                if (i == (this.allCardIdArr.length - 1)){
                    lastCardRotationEnd = function (_arg1:Event):void{
                        card.removeEventListener("rotationEnd", lastCardRotationEnd);
                        allowRemove = true;
                        noticeEffect.play();
                    };
                    card.addEventListener("rotationEnd", lastCardRotationEnd);
                };
                i = (i + 1);
            };
        }
        protected function group1_clickHandler(_arg1):void{
            var f:* = null;
            var effectEndHander:* = null;
            var event:* = _arg1;
            if (this.allowRemove){
                effectEndHander = function (_arg1:CustomEffectEvent):void{
                    f.removeEventListener(CustomEffectEvent.END, effectEndHander);
                    removeSelf();
                };
                CombatStage.getInstance().removeEventListener(MouseEvent.CLICK, this.group1_clickHandler);
                BasicOperationBar.getInstance().removeEventListener(BasicOperationBar.CLICK_LEAVE_BTN, this.group1_clickHandler);
                f = new FakeFadeEffect(this, 500, 1, 0);
                f.play();
                f.addEventListener(CustomEffectEvent.END, effectEndHander);
                this.visible = false;
            };
        }
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function _DuelEndLuckyDrawWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 1000;
            _local1.repeatCount = 0;
            _local1.repeatBehavior = "reverse";
            this.noticeEffect = _local1;
            BindingManager.executeBindings(this, "noticeEffect", this.noticeEffect);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 5;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.fill = this._DuelEndLuckyDrawWindow_LinearGradient1_c();
            _local1.filters = [this._DuelEndLuckyDrawWindow_GlowFilter1_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._DuelEndLuckyDrawWindow_GradientEntry1_c(), this._DuelEndLuckyDrawWindow_GradientEntry2_c(), this._DuelEndLuckyDrawWindow_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 14141559;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 14141559;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 14141559;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.bottom = 5;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.fill = this._DuelEndLuckyDrawWindow_LinearGradient2_c();
            _local1.filters = [this._DuelEndLuckyDrawWindow_GlowFilter2_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_LinearGradient2_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._DuelEndLuckyDrawWindow_GradientEntry4_c(), this._DuelEndLuckyDrawWindow_GradientEntry5_c(), this._DuelEndLuckyDrawWindow_GradientEntry6_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 14141559;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GradientEntry5_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 14141559;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GradientEntry6_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 14141559;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 42;
            _local1.horizontalCenter = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("color", 12949096);
            _local1.setStyle("fontSize", 25);
            _local1.id = "_DuelEndLuckyDrawWindow_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._DuelEndLuckyDrawWindow_Label1 = _local1;
            BindingManager.executeBindings(this, "_DuelEndLuckyDrawWindow_Label1", this._DuelEndLuckyDrawWindow_Label1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_Group2_i():Group{
            var _local1:Group = new Group();
            _local1.horizontalCenter = 0;
            _local1.y = 105;
            _local1.layout = this._DuelEndLuckyDrawWindow_TileLayout1_c();
            _local1.filters = [this._DuelEndLuckyDrawWindow_DropShadowFilter1_c()];
            _local1.id = "cardGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardGroup = _local1;
            BindingManager.executeBindings(this, "cardGroup", this.cardGroup);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_TileLayout1_c():TileLayout{
            var _local1:TileLayout = new TileLayout();
            _local1.requestedRowCount = 1;
            _local1.horizontalGap = 30;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.y = 305;
            _local1.horizontalCenter = 0;
            _local1.text = "点击任意位置继续";
            _local1.alpha = 0;
            _local1.filters = [this._DuelEndLuckyDrawWindow_GlowFilter3_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("color", 12949096);
            _local1.setStyle("fontSize", 25);
            _local1.id = "noticeText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.noticeText = _local1;
            BindingManager.executeBindings(this, "noticeText", this.noticeText);
            return (_local1);
        }
        private function _DuelEndLuckyDrawWindow_GlowFilter3_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___DuelEndLuckyDrawWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function ___DuelEndLuckyDrawWindow_Group1_remove(_arg1:FlexEvent):void{
            this.noticeEffect.stop();
        }
        private function _DuelEndLuckyDrawWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, null, null, "noticeEffect.target", "noticeText");
            result[2] = new Binding(this, null, null, "_DuelEndLuckyDrawWindow_Label1.text", "titleText");
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
        public function get cardGroup():Group{
            return (this._267258545cardGroup);
        }
        public function set cardGroup(_arg1:Group):void{
            var _local2:Object = this._267258545cardGroup;
            if (_local2 !== _arg1){
                this._267258545cardGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardGroup", _local2, _arg1));
                };
            };
        }
        public function get noticeEffect():Fade{
            return (this._447956343noticeEffect);
        }
        public function set noticeEffect(_arg1:Fade):void{
            var _local2:Object = this._447956343noticeEffect;
            if (_local2 !== _arg1){
                this._447956343noticeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noticeEffect", _local2, _arg1));
                };
            };
        }
        public function get noticeText():Label{
            return (this._1269291995noticeText);
        }
        public function set noticeText(_arg1:Label):void{
            var _local2:Object = this._1269291995noticeText;
            if (_local2 !== _arg1){
                this._1269291995noticeText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "noticeText", _local2, _arg1));
                };
            };
        }
        public function get titleText():String{
            return (this._2135756891titleText);
        }
        public function set titleText(_arg1:String):void{
            var _local2:Object = this._2135756891titleText;
            if (_local2 !== _arg1){
                this._2135756891titleText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "titleText", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

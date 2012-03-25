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
    import spark.filters.*;
    import card_ui.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
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

    public class CardDetailInfoWindow extends Group implements IBindingClient {

        private static var currenDisplayWindow:CardDetailInfoWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _8723007cardDesc:Label;
        private var _265574357cardImage:CardImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var hasCreationComplete:Boolean = false;
        private var cardMes;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardDetailInfoWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardDetailInfoWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CardDetailInfoWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardDetailInfoWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 400;
            this.height = 300;
            this.x = 440;
            this.y = 250;
            this.mouseChildren = false;
            this.mouseEnabled = false;
            this.layout = this._CardDetailInfoWindow_BasicLayout1_c();
            this.mxmlContent = [this._CardDetailInfoWindow_Rect1_c(), this._CardDetailInfoWindow_Rect2_c(), this._CardDetailInfoWindow_Rect3_c(), this._CardDetailInfoWindow_CardImage1_i(), this._CardDetailInfoWindow_Label1_i()];
            this._CardDetailInfoWindow_Fade1_i();
            this.addEventListener("remove", this.___CardDetailInfoWindow_Group1_remove);
            this.addEventListener("creationComplete", this.___CardDetailInfoWindow_Group1_creationComplete);
            this.addEventListener("mouseWheel", this.___CardDetailInfoWindow_Group1_mouseWheel);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function showCardDetailWindow(_arg1):void{
            if (!currenDisplayWindow){
                currenDisplayWindow = new (CardDetailInfoWindow)();
            };
            if (CombatStage.getInstance() != currenDisplayWindow.parent){
                CombatStage.getInstance().addElement(currenDisplayWindow);
            };
            currenDisplayWindow.setCardInfo(_arg1);
        }
        public static function hideCardDetailWindow():void{
            if (currenDisplayWindow){
                currenDisplayWindow.removeSelf();
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardDetailInfoWindow._watcherSetupUtil = _arg1;
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
        private function setCardInfo(_arg1):void{
            this.cardMes = _arg1;
            this.buildCardInfo();
        }
        private function buildCardInfo():void{
            if (((!(this.cardMes)) || (!(this.hasCreationComplete)))){
                return;
            };
            this.cardImage.removeMark();
            if ((this.cardMes is String)){
                this.cardImage.setCardById(this.cardMes);
            } else {
                this.cardImage.setCardById(this.cardMes.cardId);
                if ((((((this.cardImage.cardInfo["color"] == "gold")) || ((this.cardImage.cardInfo["color"] == "silver")))) && (this.cardMes.currentStr))){
                    this.cardImage.setAttribInfo(this.cardMes.currentStr, this.cardMes.currentInt);
                };
                if (this.cardMes.markWindow != null){
                    this.cardImage.setMark(this.cardMes.markWindow.toNum);
                };
            };
            switch (this.cardImage.cardInfo["color"]){
                case "silver":
                    this.cardDesc.text = this.cardImage.cardInfo["info"];
                    this.cardDesc.setStyle("color", 0xDDDDDD);
                    break;
                case "gold":
                case "green":
                case "red":
                default:
                    this.cardDesc.text = this.cardImage.cardInfo["skill_info"];
                    switch (this.cardImage.cardInfo["misc"]){
                        case "changbing":
                            this.cardDesc.text = ("【长兵】" + this.cardDesc.text);
                            break;
                        case "duanbing":
                            this.cardDesc.text = ("【短兵】" + this.cardDesc.text);
                            break;
                        case "zuoji":
                            this.cardDesc.text = ("【坐骑】" + this.cardDesc.text);
                            break;
                        case "gongnu":
                            this.cardDesc.text = ("【弓弩】" + this.cardDesc.text);
                            break;
                    };
                    this.cardDesc.setStyle("color", 11730772);
            };
        }
        protected function group1_creationCompleteHandler():void{
            this.hasCreationComplete = true;
            this.buildCardInfo();
        }
        protected function group1_mouseWheelHandler(_arg1:MouseEvent):void{
            if ((((_arg1.delta < 0)) && ((currenDisplayWindow == this)))){
                this.removeSelf();
            };
        }
        public function removeSelf():void{
            currenDisplayWindow = null;
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        protected function group1_removeHandler():void{
            var _local1:FakeFadeEffect = new FakeFadeEffect(this, 500, 1, 0);
            _local1.play();
        }
        private function _CardDetailInfoWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
            mouseEnabled = true;
        }
        private function _CardDetailInfoWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 5;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.fill = this._CardDetailInfoWindow_LinearGradient1_c();
            _local1.filters = [this._CardDetailInfoWindow_GlowFilter1_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._CardDetailInfoWindow_GradientEntry1_c(), this._CardDetailInfoWindow_GradientEntry2_c(), this._CardDetailInfoWindow_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0x74E000;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0x74E000;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0x74E000;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_Rect2_c():Rect{
            var _local1:Rect = new Rect();
            _local1.bottom = 5;
            _local1.percentWidth = 100;
            _local1.height = 3;
            _local1.fill = this._CardDetailInfoWindow_LinearGradient2_c();
            _local1.filters = [this._CardDetailInfoWindow_GlowFilter2_c()];
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_LinearGradient2_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._CardDetailInfoWindow_GradientEntry4_c(), this._CardDetailInfoWindow_GradientEntry5_c(), this._CardDetailInfoWindow_GradientEntry6_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0x74E000;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry5_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0x74E000;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry6_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0x74E000;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GlowFilter2_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_Rect3_c():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 8;
            _local1.bottom = 8;
            _local1.percentWidth = 100;
            _local1.fill = this._CardDetailInfoWindow_LinearGradient3_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_LinearGradient3_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._CardDetailInfoWindow_GradientEntry7_c(), this._CardDetailInfoWindow_GradientEntry8_c(), this._CardDetailInfoWindow_GradientEntry9_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry7_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry8_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0.5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_GradientEntry9_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 0;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_CardImage1_i():CardImage{
            var _local1:CardImage = new CardImage();
            _local1.scaleX = 1.8;
            _local1.scaleY = 1.8;
            _local1.x = 43;
            _local1.y = 50;
            _local1.filters = [this._CardDetailInfoWindow_DropShadowFilter1_c()];
            _local1.id = "cardImage";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardImage = _local1;
            BindingManager.executeBindings(this, "cardImage", this.cardImage);
            return (_local1);
        }
        private function _CardDetailInfoWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.angle = 40;
            _local1.distance = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardDetailInfoWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.width = 160;
            _local1.height = 202;
            _local1.y = 50;
            _local1.x = 210;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("color", 0xFFFFFF);
            _local1.id = "cardDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.cardDesc = _local1;
            BindingManager.executeBindings(this, "cardDesc", this.cardDesc);
            return (_local1);
        }
        public function ___CardDetailInfoWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler();
        }
        public function ___CardDetailInfoWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        public function ___CardDetailInfoWindow_Group1_mouseWheel(_arg1:MouseEvent):void{
            this.group1_mouseWheelHandler(_arg1);
        }
        private function _CardDetailInfoWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_CARD_DETAIL_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
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
        public function get cardDesc():Label{
            return (this._8723007cardDesc);
        }
        public function set cardDesc(_arg1:Label):void{
            var _local2:Object = this._8723007cardDesc;
            if (_local2 !== _arg1){
                this._8723007cardDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardDesc", _local2, _arg1));
                };
            };
        }
        public function get cardImage():CardImage{
            return (this._265574357cardImage);
        }
        public function set cardImage(_arg1:CardImage):void{
            var _local2:Object = this._265574357cardImage;
            if (_local2 !== _arg1){
                this._265574357cardImage = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cardImage", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

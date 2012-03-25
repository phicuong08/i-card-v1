//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
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
    import source_manager.*;
    import web_service.*;
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import task_guide.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
    import beginner_guide.*;
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

    public class BasicCardSelectWindow extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _413245038addEffect:Fade;
        private var _1367694752caocao:BasicCardSelectItem;
        private var _928589113clickEffect:Move;
        private var _1017317214descText:Label;
        private var _544654255frameDown:SmoothBitmapImage;
        private var _607253272frameUp:SmoothBitmapImage;
        private var _1102466322liubei:BasicCardSelectItem;
        private var _1856579171sunquan:BasicCardSelectItem;
        private var __moduleFactoryInitialized:Boolean = false;
        private var selectedItem:BasicCardSelectItem;
        private var fakeImgBd:BitmapData;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function BasicCardSelectWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._BasicCardSelectWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_BasicCardSelectWindowWatcherSetupUtil");
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
            this.width = 0x0500;
            this.height = 800;
            this.depth = 1;
            this.mouseChildren = false;
            this.layout = this._BasicCardSelectWindow_BasicLayout1_c();
            this.mxmlContent = [this._BasicCardSelectWindow_BasicCardSelectItem1_i(), this._BasicCardSelectWindow_BasicCardSelectItem2_i(), this._BasicCardSelectWindow_BasicCardSelectItem3_i(), this._BasicCardSelectWindow_SmoothBitmapImage1_i(), this._BasicCardSelectWindow_SmoothBitmapImage2_i(), this._BasicCardSelectWindow_Label1_c(), this._BasicCardSelectWindow_Label2_i()];
            this._BasicCardSelectWindow_Fade1_i();
            this._BasicCardSelectWindow_Move1_i();
            this.addEventListener("initialize", this.___BasicCardSelectWindow_Group1_initialize);
            this.addEventListener("creationComplete", this.___BasicCardSelectWindow_Group1_creationComplete);
            this.addEventListener("remove", this.___BasicCardSelectWindow_Group1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            BasicCardSelectWindow._watcherSetupUtil = _arg1;
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
        public function selectCardsOk():void{
            var _local2:BasicCardSelectItem;
            this.selectedItem.isSelected = true;
            var _local1:Array = [this.caocao, this.liubei, this.sunquan];
            _local1.splice(_local1.indexOf(this.selectedItem), 1);
            for each (_local2 in _local1) {
                _local2.depth = -1;
                _local2.removeEffect.play();
            };
            this.clickEffect.target = this.selectedItem;
            if (this.selectedItem.id == "liubei"){
                this.clickEffect.xTo = 866;
            } else {
                this.clickEffect.xTo = 0;
            };
            mouseChildren = false;
            mouseEnabled = false;
            this.clickEffect.play();
        }
        private function clickHandler(_arg1:MouseEvent):void{
            if (this.selectedItem){
                return;
            };
            this.selectedItem = (_arg1.currentTarget as BasicCardSelectItem);
            var _local2:String = UserObject.transUserCardName(this.selectedItem.id);
            LuaAgent.getInstance().run((((("u.user_card_mgr:select_basic_cards(\"" + this.selectedItem.id) + "\", \"") + _local2) + "\")"));
            this.selectCardsOk();
        }
        protected function drawBackGround():void{
            alpha = 0;
            this.graphics.beginFill(0, 1);
            this.graphics.drawRect(0, 0, width, height);
            this.graphics.endFill();
        }
        protected function clickEffect_effectEndHandler(_arg1:EffectEvent):void{
            this.fakeImgBd = new BitmapData(width, height, true, 0);
            this.fakeImgBd.draw(this);
            var _local2:UIComponent = new UIComponent();
            _local2.addChild(new Bitmap(this.fakeImgBd));
            this.removeAllElements();
            this.addElement(_local2);
            BeginnerGuideUtil.dispatchLuaEvent("select_camp_ok");
        }
        protected function group1_removeHandler(_arg1:FlexEvent):void{
            var _local2:FakeFadeEffect;
            if (!GuideSystem.getInstance().isGuiding){
                _local2 = new FakeFadeEffect(this, 500, 1, 0, this.fakeImgBd);
                _local2.play();
            };
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.liubei.imageSource = BasicCardSelectWindowSourceMgr.getInstance().getSourceClass("shuBg");
            this.caocao.imageSource = BasicCardSelectWindowSourceMgr.getInstance().getSourceClass("weiBg");
            this.sunquan.imageSource = BasicCardSelectWindowSourceMgr.getInstance().getSourceClass("wuBg");
            this.frameUp.source = BasicCardSelectWindowSourceMgr.getInstance().getSourceClass("frame");
            this.frameDown.source = BasicCardSelectWindowSourceMgr.getInstance().getSourceClass("frame");
        }
        private function _BasicCardSelectWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.startDelay = 500;
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        private function _BasicCardSelectWindow_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.duration = 500;
            _local1.addEventListener("effectEnd", this.__clickEffect_effectEnd);
            this.clickEffect = _local1;
            BindingManager.executeBindings(this, "clickEffect", this.clickEffect);
            return (_local1);
        }
        public function __clickEffect_effectEnd(_arg1:EffectEvent):void{
            this.clickEffect_effectEndHandler(_arg1);
        }
        private function _BasicCardSelectWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicCardSelectWindow_BasicCardSelectItem1_i():BasicCardSelectItem{
            var _local1:BasicCardSelectItem = new BasicCardSelectItem();
            _local1.addEventListener("click", this.__liubei_click);
            _local1.addEventListener("rollOver", this.__liubei_rollOver);
            _local1.id = "liubei";
            if (!_local1.document){
                _local1.document = this;
            };
            this.liubei = _local1;
            BindingManager.executeBindings(this, "liubei", this.liubei);
            return (_local1);
        }
        public function __liubei_click(_arg1:MouseEvent):void{
            this.clickHandler(_arg1);
        }
        public function __liubei_rollOver(_arg1:MouseEvent):void{
            this.descText.text = "蜀：单兵作战能力强，配有强大的装备和防护性计策。";
        }
        private function _BasicCardSelectWindow_BasicCardSelectItem2_i():BasicCardSelectItem{
            var _local1:BasicCardSelectItem = new BasicCardSelectItem();
            _local1.x = 433;
            _local1.addEventListener("click", this.__caocao_click);
            _local1.addEventListener("rollOver", this.__caocao_rollOver);
            _local1.id = "caocao";
            if (!_local1.document){
                _local1.document = this;
            };
            this.caocao = _local1;
            BindingManager.executeBindings(this, "caocao", this.caocao);
            return (_local1);
        }
        public function __caocao_click(_arg1:MouseEvent):void{
            this.clickHandler(_arg1);
        }
        public function __caocao_rollOver(_arg1:MouseEvent):void{
            this.descText.text = "魏：善于运用计策和陷阱，以策略性见长。";
        }
        private function _BasicCardSelectWindow_BasicCardSelectItem3_i():BasicCardSelectItem{
            var _local1:BasicCardSelectItem = new BasicCardSelectItem();
            _local1.x = 866;
            _local1.addEventListener("click", this.__sunquan_click);
            _local1.addEventListener("rollOver", this.__sunquan_rollOver);
            _local1.id = "sunquan";
            if (!_local1.document){
                _local1.document = this;
            };
            this.sunquan = _local1;
            BindingManager.executeBindings(this, "sunquan", this.sunquan);
            return (_local1);
        }
        public function __sunquan_click(_arg1:MouseEvent):void{
            this.clickHandler(_arg1);
        }
        public function __sunquan_rollOver(_arg1:MouseEvent):void{
            this.descText.text = "吴：善于防守，借助地形优势，可以有效干扰对手。";
        }
        private function _BasicCardSelectWindow_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.initialized(this, "frameUp");
            this.frameUp = _local1;
            BindingManager.executeBindings(this, "frameUp", this.frameUp);
            return (_local1);
        }
        private function _BasicCardSelectWindow_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.bottom = 0;
            _local1.rotation = 180;
            _local1.initialized(this, "frameDown");
            this.frameDown = _local1;
            BindingManager.executeBindings(this, "frameDown", this.frameDown);
            return (_local1);
        }
        private function _BasicCardSelectWindow_Label1_c():Label{
            var _local1:Label = new Label();
            _local1.text = "选择阵营";
            _local1.horizontalCenter = 0;
            _local1.top = 5;
            _local1.filters = [this._BasicCardSelectWindow_GlowFilter1_c()];
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontFamily", "黑体");
            _local1.setStyle("color", 16506810);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicCardSelectWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 16506810;
            _local1.blurX = 10;
            _local1.blurY = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _BasicCardSelectWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 381;
            _local1.y = 772;
            _local1.width = 518;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 14);
            _local1.setStyle("color", 16776959);
            _local1.id = "descText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.descText = _local1;
            BindingManager.executeBindings(this, "descText", this.descText);
            return (_local1);
        }
        public function ___BasicCardSelectWindow_Group1_initialize(_arg1:FlexEvent):void{
            this.drawBackGround();
        }
        public function ___BasicCardSelectWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___BasicCardSelectWindow_Group1_remove(_arg1:FlexEvent):void{
            this.group1_removeHandler(_arg1);
        }
        private function _BasicCardSelectWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
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
        public function get caocao():BasicCardSelectItem{
            return (this._1367694752caocao);
        }
        public function set caocao(_arg1:BasicCardSelectItem):void{
            var _local2:Object = this._1367694752caocao;
            if (_local2 !== _arg1){
                this._1367694752caocao = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "caocao", _local2, _arg1));
                };
            };
        }
        public function get clickEffect():Move{
            return (this._928589113clickEffect);
        }
        public function set clickEffect(_arg1:Move):void{
            var _local2:Object = this._928589113clickEffect;
            if (_local2 !== _arg1){
                this._928589113clickEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "clickEffect", _local2, _arg1));
                };
            };
        }
        public function get descText():Label{
            return (this._1017317214descText);
        }
        public function set descText(_arg1:Label):void{
            var _local2:Object = this._1017317214descText;
            if (_local2 !== _arg1){
                this._1017317214descText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descText", _local2, _arg1));
                };
            };
        }
        public function get frameDown():SmoothBitmapImage{
            return (this._544654255frameDown);
        }
        public function set frameDown(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._544654255frameDown;
            if (_local2 !== _arg1){
                this._544654255frameDown = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "frameDown", _local2, _arg1));
                };
            };
        }
        public function get frameUp():SmoothBitmapImage{
            return (this._607253272frameUp);
        }
        public function set frameUp(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._607253272frameUp;
            if (_local2 !== _arg1){
                this._607253272frameUp = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "frameUp", _local2, _arg1));
                };
            };
        }
        public function get liubei():BasicCardSelectItem{
            return (this._1102466322liubei);
        }
        public function set liubei(_arg1:BasicCardSelectItem):void{
            var _local2:Object = this._1102466322liubei;
            if (_local2 !== _arg1){
                this._1102466322liubei = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "liubei", _local2, _arg1));
                };
            };
        }
        public function get sunquan():BasicCardSelectItem{
            return (this._1856579171sunquan);
        }
        public function set sunquan(_arg1:BasicCardSelectItem):void{
            var _local2:Object = this._1856579171sunquan;
            if (_local2 !== _arg1){
                this._1856579171sunquan = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "sunquan", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

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
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
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
	use namespace mx_internal;
    public class SelectCardOptionItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _SelectCardOptionItem_Label1:Label;
        public var _SelectCardOptionItem_Rect2:Rect;
        private var _1149221507rollOverMask:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
        public var optionIndex:int;
        private var _1017317214descText:String;
        private var _1678735111glowFilterAlpha:Number;
        private var _1191572123selected:Boolean = false;
        private var _embed_mxml_source_commonUI______png_298371472:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function SelectCardOptionItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI______png_298371472 = SelectCardOptionItem__embed_mxml_source_commonUI______png_298371472;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._SelectCardOptionItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_SelectCardOptionItemWatcherSetupUtil");
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
            this.width = 200;
            this.height = 24;
            this.horizontalCenter = 0;
            this.buttonMode = true;
            this.mxmlContent = [this._SelectCardOptionItem_Label1_i(), this._SelectCardOptionItem_Rect1_i(), this._SelectCardOptionItem_Rect2_i(), this._SelectCardOptionItem_SmoothBitmapImage1_c()];
            this.addEventListener("rollOver", this.___SelectCardOptionItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___SelectCardOptionItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            SelectCardOptionItem._watcherSetupUtil = _arg1;
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
                this.fontSize = 14;
                this.color = 0xFFFFFF;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function setOptionInfo(_arg1:String, _arg2:int):void{
            this.optionIndex = _arg2;
            this.setOptionText(_arg1);
        }
        private function setOptionText(_arg1:String):void{
            switch (_arg1){
                case "deck":
                    this.descText = "卡组";
                    break;
                case "hand":
                    this.descText = "手牌";
                    break;
                case "remove ling 1":
                    this.descText = "去除1面令旗，增加武力";
                    break;
                case "remove ling 3":
                    this.descText = "去除3面令旗，选取卡片";
                    break;
                case "select equip card to hand":
                    this.descText = "【戟舞】选择一张装备卡";
                    break;
                case "select bjj card to hand":
                    this.descText = "【龙行】从墓地回收八健将";
                    break;
                case "recruit bjj":
                    this.descText = "【荒雷】从手牌出战八健将";
                    break;
                case "jinggong":
                    this.descText = "【惊弓】破坏对方卡组";
                    break;
                case "gongxin":
                    this.descText = "【攻心】控制对方部队";
                    break;
                case "jiqiao":
                    this.descText = "【机巧】放置木牛流马和诸葛弩";
                    break;
                case "muniuliuma":
                    this.descText = "【木牛流马】一回合一次粮草+1";
                    break;
                case "zhugenu":
                    this.descText = "【诸葛弩】装备者一回合攻击两次";
                    break;
                case "cancel":
                    this.descText = "取消";
                    break;
                default:
                    this.descText = _arg1;
            };
        }
        private function _SelectCardOptionItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.top = 0;
            _local1.left = 0;
            _local1.bottom = 1;
            _local1.right = 0;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "_SelectCardOptionItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._SelectCardOptionItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_SelectCardOptionItem_Label1", this._SelectCardOptionItem_Label1);
            return (_local1);
        }
        private function _SelectCardOptionItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.visible = false;
            _local1.top = 0;
            _local1.left = 0;
            _local1.bottom = 1;
            _local1.right = 0;
            _local1.fill = this._SelectCardOptionItem_LinearGradient1_c();
            _local1.initialized(this, "rollOverMask");
            this.rollOverMask = _local1;
            BindingManager.executeBindings(this, "rollOverMask", this.rollOverMask);
            return (_local1);
        }
        private function _SelectCardOptionItem_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._SelectCardOptionItem_GradientEntry1_c(), this._SelectCardOptionItem_GradientEntry2_c(), this._SelectCardOptionItem_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0.3;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_Rect2_i():Rect{
            var _local1:Rect = new Rect();
            _local1.top = 0;
            _local1.left = 0;
            _local1.bottom = 1;
            _local1.right = 0;
            _local1.fill = this._SelectCardOptionItem_LinearGradient2_c();
            _local1.initialized(this, "_SelectCardOptionItem_Rect2");
            this._SelectCardOptionItem_Rect2 = _local1;
            BindingManager.executeBindings(this, "_SelectCardOptionItem_Rect2", this._SelectCardOptionItem_Rect2);
            return (_local1);
        }
        private function _SelectCardOptionItem_LinearGradient2_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._SelectCardOptionItem_GradientEntry4_c(), this._SelectCardOptionItem_GradientEntry5_c(), this._SelectCardOptionItem_GradientEntry6_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_GradientEntry4_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_GradientEntry5_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0.6;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_GradientEntry6_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 15388793;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _SelectCardOptionItem_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.bottom = 0;
            _local1.horizontalCenter = 0;
            _local1.source = this._embed_mxml_source_commonUI______png_298371472;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___SelectCardOptionItem_Group1_rollOver(_arg1:MouseEvent):void{
            this.rollOverMask.visible = true;
        }
        public function ___SelectCardOptionItem_Group1_rollOut(_arg1:MouseEvent):void{
            this.rollOverMask.visible = false;
        }
        private function _SelectCardOptionItem_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "_SelectCardOptionItem_Label1.text", "descText");
            _local1[1] = new Binding(this, null, null, "_SelectCardOptionItem_Rect2.visible", "selected");
            return (_local1);
        }
        public function get rollOverMask():Rect{
            return (this._1149221507rollOverMask);
        }
        public function set rollOverMask(_arg1:Rect):void{
            var _local2:Object = this._1149221507rollOverMask;
            if (_local2 !== _arg1){
                this._1149221507rollOverMask = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rollOverMask", _local2, _arg1));
                };
            };
        }
        public function get descText():String{
            return (this._1017317214descText);
        }
        public function set descText(_arg1:String):void{
            var _local2:Object = this._1017317214descText;
            if (_local2 !== _arg1){
                this._1017317214descText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descText", _local2, _arg1));
                };
            };
        }
        public function get glowFilterAlpha():Number{
            return (this._1678735111glowFilterAlpha);
        }
        public function set glowFilterAlpha(_arg1:Number):void{
            var _local2:Object = this._1678735111glowFilterAlpha;
            if (_local2 !== _arg1){
                this._1678735111glowFilterAlpha = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "glowFilterAlpha", _local2, _arg1));
                };
            };
        }
        public function get selected():Boolean{
            return (this._1191572123selected);
        }
        public function set selected(_arg1:Boolean):void{
            var _local2:Object = this._1191572123selected;
            if (_local2 !== _arg1){
                this._1191572123selected = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "selected", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

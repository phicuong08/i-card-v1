//Created by Action Script Viewer - http://www.buraks.com/asv
package auction_system {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
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
    public class AuctionConfigBuyTypeListItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AuctionConfigBuyTypeListItem_CommonInnerFrame1:CommonInnerFrame;
        public var _AuctionConfigBuyTypeListItem_Label1:Label;
        public var _AuctionConfigBuyTypeListItem_Rect1:Rect;
        public var _AuctionConfigBuyTypeListItem_Rect2:Rect;
        private var __moduleFactoryInitialized:Boolean = false;
		public var __slot1;
        protected var _1107835069_descText:String;
        protected var _141469659_isSelect:Boolean = false;
        protected var _902689382_mouseOver:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AuctionConfigBuyTypeListItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AuctionConfigBuyTypeListItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_auction_system_AuctionConfigBuyTypeListItemWatcherSetupUtil");
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
            this.width = 150;
            this.height = 25;
            this.layout = this._AuctionConfigBuyTypeListItem_BasicLayout1_c();
            this.mxmlContent = [this._AuctionConfigBuyTypeListItem_CommonInnerFrame1_i(), this._AuctionConfigBuyTypeListItem_Label1_i(), this._AuctionConfigBuyTypeListItem_Rect1_i(), this._AuctionConfigBuyTypeListItem_Rect2_i()];
            this.addEventListener("rollOver", this.___AuctionConfigBuyTypeListItem_Group1_rollOver);
            this.addEventListener("rollOut", this.___AuctionConfigBuyTypeListItem_Group1_rollOut);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AuctionConfigBuyTypeListItem._watcherSetupUtil = _arg1;
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
        public function set descText(_arg1:String):void{
            this._descText = _arg1;
        }
        public function get descText():String{
            return (this._descText);
        }
        public function get isSelect():Boolean{
            return (this._isSelect);
        }
        public function set isSelect(_arg1:Boolean):void{
            this._isSelect = _arg1;
        }
        private function _AuctionConfigBuyTypeListItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyTypeListItem_CommonInnerFrame1_i():CommonInnerFrame{
            var _local1:CommonInnerFrame = new CommonInnerFrame();
            _local1.alpha = 0.9;
            _local1.id = "_AuctionConfigBuyTypeListItem_CommonInnerFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AuctionConfigBuyTypeListItem_CommonInnerFrame1 = _local1;
            BindingManager.executeBindings(this, "_AuctionConfigBuyTypeListItem_CommonInnerFrame1", this._AuctionConfigBuyTypeListItem_CommonInnerFrame1);
            return (_local1);
        }
        private function _AuctionConfigBuyTypeListItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.id = "_AuctionConfigBuyTypeListItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AuctionConfigBuyTypeListItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_AuctionConfigBuyTypeListItem_Label1", this._AuctionConfigBuyTypeListItem_Label1);
            return (_local1);
        }
        private function _AuctionConfigBuyTypeListItem_Rect1_i():Rect{
            var _local1:Rect = new Rect();
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.stroke = this._AuctionConfigBuyTypeListItem_SolidColorStroke1_c();
            _local1.initialized(this, "_AuctionConfigBuyTypeListItem_Rect1");
            this._AuctionConfigBuyTypeListItem_Rect1 = _local1;
            BindingManager.executeBindings(this, "_AuctionConfigBuyTypeListItem_Rect1", this._AuctionConfigBuyTypeListItem_Rect1);
            return (_local1);
        }
        private function _AuctionConfigBuyTypeListItem_SolidColorStroke1_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.weight = 2;
            _local1.color = 8376063;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AuctionConfigBuyTypeListItem_Rect2_i():Rect{
            var _local1:Rect = new Rect();
            _local1.left = 0;
            _local1.top = 0;
            _local1.right = 0;
            _local1.bottom = 0;
            _local1.stroke = this._AuctionConfigBuyTypeListItem_SolidColorStroke2_c();
            _local1.initialized(this, "_AuctionConfigBuyTypeListItem_Rect2");
            this._AuctionConfigBuyTypeListItem_Rect2 = _local1;
            BindingManager.executeBindings(this, "_AuctionConfigBuyTypeListItem_Rect2", this._AuctionConfigBuyTypeListItem_Rect2);
            return (_local1);
        }
        private function _AuctionConfigBuyTypeListItem_SolidColorStroke2_c():SolidColorStroke{
            var _local1:SolidColorStroke = new SolidColorStroke();
            _local1.weight = 2;
            _local1.color = 2398201;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AuctionConfigBuyTypeListItem_Group1_rollOver(_arg1:MouseEvent):void{
            this._mouseOver = true;
        }
        public function ___AuctionConfigBuyTypeListItem_Group1_rollOut(_arg1:MouseEvent):void{
            this._mouseOver = false;
        }
        private function _AuctionConfigBuyTypeListItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, null, "_AuctionConfigBuyTypeListItem_CommonInnerFrame1.width", "width");
            result[1] = new Binding(this, null, null, "_AuctionConfigBuyTypeListItem_CommonInnerFrame1.height", "height");
            result[2] = new Binding(this, function ():String{
                var _local1:* = _descText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_AuctionConfigBuyTypeListItem_Label1.text");
            result[3] = new Binding(this, null, null, "_AuctionConfigBuyTypeListItem_Label1.width", "width");
            result[4] = new Binding(this, null, null, "_AuctionConfigBuyTypeListItem_Label1.height", "height");
            result[5] = new Binding(this, function ():Boolean{
                return (_mouseOver);
            }, null, "_AuctionConfigBuyTypeListItem_Rect1.visible");
            result[6] = new Binding(this, function ():Boolean{
                return (_isSelect);
            }, null, "_AuctionConfigBuyTypeListItem_Rect2.visible");
            return (result);
        }
        protected function get _descText():String{
            return (this._1107835069_descText);
        }
        protected function set _descText(_arg1:String):void{
            var _local2:Object = this._1107835069_descText;
            if (_local2 !== _arg1){
                this._1107835069_descText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_descText", _local2, _arg1));
                };
            };
        }
        protected function get _isSelect():Boolean{
            return (this._141469659_isSelect);
        }
        protected function set _isSelect(_arg1:Boolean):void{
            var _local2:Object = this._141469659_isSelect;
            if (_local2 !== _arg1){
                this._141469659_isSelect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_isSelect", _local2, _arg1));
                };
            };
        }
        protected function get _mouseOver():Boolean{
            return (this._902689382_mouseOver);
        }
        protected function set _mouseOver(_arg1:Boolean):void{
            var _local2:Object = this._902689382_mouseOver;
            if (_local2 !== _arg1){
                this._902689382_mouseOver = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_mouseOver", _local2, _arg1));
                };
            };
        }

    }
}//package auction_system 

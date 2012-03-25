//Created by Action Script Viewer - http://www.buraks.com/asv
package item_system {
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
	use namespace mx_internal;
    public class CardBaggageImage extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _CardBaggageImage_Label1:Label;
        public var _CardBaggageImage_Label2:Label;
        public var _CardBaggageImage_MyImage1:MyImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1916786312imgPath:String;
        private var _1268032575_itemText:String;
        private var _1242944789collectionRateText:String;
        private var _108003685collectionRateColor:uint;
        public var itemId;
        private var _embed_mxml_source_itemUI_card_baggage_1_png_56306370:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardBaggageImage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_itemUI_card_baggage_1_png_56306370 = CardBaggageImage__embed_mxml_source_itemUI_card_baggage_1_png_56306370;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardBaggageImage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_item_system_CardBaggageImageWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardBaggageImage[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 84;
            this.height = 112;
            this.layout = this._CardBaggageImage_BasicLayout1_c();
            this.mxmlContent = [this._CardBaggageImage_SmoothBitmapImage1_c(), this._CardBaggageImage_Label1_i(), this._CardBaggageImage_MyImage1_i(), this._CardBaggageImage_Label2_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardBaggageImage._watcherSetupUtil = _arg1;
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
        public function setItemById(_arg1):void{
            this.itemId = _arg1;
            this.imgPath = (("source/cardImages/" + ItemCardLib.getItemInfoById(this.itemId).image) + ".jpg");
            this._itemText = ItemCardLib.getItemInfoById(this.itemId).name;
            this.setCollectionRateInfo();
        }
        public function setCollectionRateInfo():void{
            var _local1:Array;
            var _local2:Number;
            if (this.itemId){
                _local1 = LuaAgent.getInstance().run((("return u.item_mgr:get_card_baggage_collection_rate(" + this.itemId) + ")"));
                _local2 = ((_local1.length > 1)) ? _local1[1] : -1;
                this.collectionRateColor = ((_local2 >= 1)) ? 15126902 : 16710646;
                this.collectionRateText = (("收集率：" + int((_local2 * 100)).toString()) + "%");
            };
        }
        private function _CardBaggageImage_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageImage_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.source = this._embed_mxml_source_itemUI_card_baggage_1_png_56306370;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardBaggageImage_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 8;
            _local1.horizontalCenter = 0;
            _local1.setStyle("fontSize", 10);
            _local1.id = "_CardBaggageImage_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardBaggageImage_Label1 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageImage_Label1", this._CardBaggageImage_Label1);
            return (_local1);
        }
        private function _CardBaggageImage_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.x = 8;
            _local1.y = 20;
            _local1.width = 68;
            _local1.height = 68;
            _local1.id = "_CardBaggageImage_MyImage1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardBaggageImage_MyImage1 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageImage_MyImage1", this._CardBaggageImage_MyImage1);
            return (_local1);
        }
        private function _CardBaggageImage_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.y = 91;
            _local1.horizontalCenter = 0;
            _local1.setStyle("fontSize", 10);
            _local1.setStyle("color", 16710646);
            _local1.id = "_CardBaggageImage_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._CardBaggageImage_Label2 = _local1;
            BindingManager.executeBindings(this, "_CardBaggageImage_Label2", this._CardBaggageImage_Label2);
            return (_local1);
        }
        private function _CardBaggageImage_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():String{
                var _local1:* = collectionRateText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_CardBaggageImage_Label1.text");
            result[1] = new Binding(this, function ():uint{
                return (collectionRateColor);
            }, function (_arg1:uint):void{
                _CardBaggageImage_Label1.setStyle("color", _arg1);
            }, "_CardBaggageImage_Label1.color");
            result[2] = new Binding(this, function ():Object{
                return (imgPath);
            }, null, "_CardBaggageImage_MyImage1.source");
            result[3] = new Binding(this, function ():String{
                var _local1:* = _itemText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_CardBaggageImage_Label2.text");
            return (result);
        }
        private function get imgPath():String{
            return (this._1916786312imgPath);
        }
        private function set imgPath(_arg1:String):void{
            var _local2:Object = this._1916786312imgPath;
            if (_local2 !== _arg1){
                this._1916786312imgPath = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "imgPath", _local2, _arg1));
                };
            };
        }
        private function get _itemText():String{
            return (this._1268032575_itemText);
        }
        private function set _itemText(_arg1:String):void{
            var _local2:Object = this._1268032575_itemText;
            if (_local2 !== _arg1){
                this._1268032575_itemText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_itemText", _local2, _arg1));
                };
            };
        }
        private function get collectionRateText():String{
            return (this._1242944789collectionRateText);
        }
        private function set collectionRateText(_arg1:String):void{
            var _local2:Object = this._1242944789collectionRateText;
            if (_local2 !== _arg1){
                this._1242944789collectionRateText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "collectionRateText", _local2, _arg1));
                };
            };
        }
        private function get collectionRateColor():uint{
            return (this._108003685collectionRateColor);
        }
        private function set collectionRateColor(_arg1:uint):void{
            var _local2:Object = this._108003685collectionRateColor;
            if (_local2 !== _arg1){
                this._108003685collectionRateColor = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "collectionRateColor", _local2, _arg1));
                };
            };
        }

    }
}//package item_system 

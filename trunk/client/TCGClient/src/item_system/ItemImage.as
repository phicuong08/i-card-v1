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
    public class ItemImage extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _ItemImage_Label1:Label;
        public var _ItemImage_MyImage1:MyImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1916786312imgPath:String;
        private var _1268032575_itemText:String;
        public var itemId;
        private var _embed_mxml_source_cardUI_back_ground_by_color_green_png_145890295:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ItemImage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_cardUI_back_ground_by_color_green_png_145890295 = ItemImage__embed_mxml_source_cardUI_back_ground_by_color_green_png_145890295;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ItemImage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_item_system_ItemImageWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (ItemImage[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 84;
            this.height = 112;
            this.layout = this._ItemImage_BasicLayout1_c();
            this.mxmlContent = [this._ItemImage_MyImage1_i(), this._ItemImage_SmoothBitmapImage1_c(), this._ItemImage_Label1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ItemImage._watcherSetupUtil = _arg1;
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
        }
        private function _ItemImage_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ItemImage_MyImage1_i():MyImage{
            var _local1:MyImage;
            _local1 = new MyImage();
            _local1.x = 5;
            _local1.y = 16;
            _local1.width = 74;
            _local1.height = 74;
            _local1.id = "_ItemImage_MyImage1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ItemImage_MyImage1 = _local1;
            BindingManager.executeBindings(this, "_ItemImage_MyImage1", this._ItemImage_MyImage1);
            return (_local1);
        }
        private function _ItemImage_SmoothBitmapImage1_c():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.source = this._embed_mxml_source_cardUI_back_ground_by_color_green_png_145890295;
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ItemImage_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.y = 93;
            _local1.horizontalCenter = 0;
            _local1.setStyle("fontSize", 10);
            _local1.setStyle("color", 16710646);
            _local1.id = "_ItemImage_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ItemImage_Label1 = _local1;
            BindingManager.executeBindings(this, "_ItemImage_Label1", this._ItemImage_Label1);
            return (_local1);
        }
        private function _ItemImage_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (imgPath);
            }, null, "_ItemImage_MyImage1.source");
            result[1] = new Binding(this, function ():String{
                var _local1:* = _itemText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "_ItemImage_Label1.text");
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

    }
}//package item_system 

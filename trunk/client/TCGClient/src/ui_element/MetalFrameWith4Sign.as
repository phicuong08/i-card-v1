//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
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

	
    public class MetalFrameWith4Sign extends Group implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _MetalFrameWith4Sign_MetalFrame1:MetalFrame;
        public var _MetalFrameWith4Sign_SmoothBitmapImage1:SmoothBitmapImage;
        public var _MetalFrameWith4Sign_SmoothBitmapImage2:SmoothBitmapImage;
        public var _MetalFrameWith4Sign_SmoothBitmapImage3:SmoothBitmapImage;
        public var _MetalFrameWith4Sign_SmoothBitmapImage4:SmoothBitmapImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1064547688_rightSignVisible:Boolean = true;
        private var _2139091153_leftSignVisible:Boolean = true;
        private var _1537103285_bottomSignVisible:Boolean = true;
        private var _1156724353_topSignVisible:Boolean = true;
        private var _embed_mxml_source_commonUI_____png_1636973184:Class;
        private var _embed_mxml_source_commonUI_____png_1617836784:Class;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function MetalFrameWith4Sign(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._embed_mxml_source_commonUI_____png_1636973184 = MetalFrameWith4Sign__embed_mxml_source_commonUI_____png_1636973184;
            this._embed_mxml_source_commonUI_____png_1617836784 = MetalFrameWith4Sign__embed_mxml_source_commonUI_____png_1617836784;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._MetalFrameWith4Sign_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_ui_element_MetalFrameWith4SignWatcherSetupUtil");
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
            this.mxmlContent = [this._MetalFrameWith4Sign_MetalFrame1_i(), this._MetalFrameWith4Sign_SmoothBitmapImage1_i(), this._MetalFrameWith4Sign_SmoothBitmapImage2_i(), this._MetalFrameWith4Sign_SmoothBitmapImage3_i(), this._MetalFrameWith4Sign_SmoothBitmapImage4_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            MetalFrameWith4Sign._watcherSetupUtil = _arg1;
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
        public function set rightSignVisible(_arg1:Boolean):void{
            this._rightSignVisible = _arg1;
        }
        public function set leftSignVisible(_arg1:Boolean):void{
            this._leftSignVisible = _arg1;
        }
        public function set bottomSignVisible(_arg1:Boolean):void{
            this._bottomSignVisible = _arg1;
        }
        public function set topSignVisible(_arg1:Boolean):void{
            this._topSignVisible = _arg1;
        }
        private function _MetalFrameWith4Sign_MetalFrame1_i():MetalFrame{
            var _local1:MetalFrame;
            _local1 = new MetalFrame();
            _local1.x = -34;
            _local1.y = -34;
            _local1.id = "_MetalFrameWith4Sign_MetalFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._MetalFrameWith4Sign_MetalFrame1 = _local1;
            BindingManager.executeBindings(this, "_MetalFrameWith4Sign_MetalFrame1", this._MetalFrameWith4Sign_MetalFrame1);
            return (_local1);
        }
        private function _MetalFrameWith4Sign_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.right = -27;
            _local1.verticalCenter = 3;
            _local1.source = this._embed_mxml_source_commonUI_____png_1636973184;
            _local1.initialized(this, "_MetalFrameWith4Sign_SmoothBitmapImage1");
            this._MetalFrameWith4Sign_SmoothBitmapImage1 = _local1;
            BindingManager.executeBindings(this, "_MetalFrameWith4Sign_SmoothBitmapImage1", this._MetalFrameWith4Sign_SmoothBitmapImage1);
            return (_local1);
        }
        private function _MetalFrameWith4Sign_SmoothBitmapImage2_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.left = -27;
            _local1.verticalCenter = 0;
            _local1.rotation = 180;
            _local1.source = this._embed_mxml_source_commonUI_____png_1636973184;
            _local1.initialized(this, "_MetalFrameWith4Sign_SmoothBitmapImage2");
            this._MetalFrameWith4Sign_SmoothBitmapImage2 = _local1;
            BindingManager.executeBindings(this, "_MetalFrameWith4Sign_SmoothBitmapImage2", this._MetalFrameWith4Sign_SmoothBitmapImage2);
            return (_local1);
        }
        private function _MetalFrameWith4Sign_SmoothBitmapImage3_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.bottom = -29;
            _local1.horizontalCenter = 2;
            _local1.source = this._embed_mxml_source_commonUI_____png_1617836784;
            _local1.initialized(this, "_MetalFrameWith4Sign_SmoothBitmapImage3");
            this._MetalFrameWith4Sign_SmoothBitmapImage3 = _local1;
            BindingManager.executeBindings(this, "_MetalFrameWith4Sign_SmoothBitmapImage3", this._MetalFrameWith4Sign_SmoothBitmapImage3);
            return (_local1);
        }
        private function _MetalFrameWith4Sign_SmoothBitmapImage4_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.top = -29;
            _local1.horizontalCenter = -2;
            _local1.rotation = 180;
            _local1.source = this._embed_mxml_source_commonUI_____png_1617836784;
            _local1.initialized(this, "_MetalFrameWith4Sign_SmoothBitmapImage4");
            this._MetalFrameWith4Sign_SmoothBitmapImage4 = _local1;
            BindingManager.executeBindings(this, "_MetalFrameWith4Sign_SmoothBitmapImage4", this._MetalFrameWith4Sign_SmoothBitmapImage4);
            return (_local1);
        }
        private function _MetalFrameWith4Sign_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return ((width + 68));
            }, null, "_MetalFrameWith4Sign_MetalFrame1.width");
            result[1] = new Binding(this, function ():Number{
                return ((height + 69));
            }, null, "_MetalFrameWith4Sign_MetalFrame1.height");
            result[2] = new Binding(this, function ():Boolean{
                return (_rightSignVisible);
            }, null, "_MetalFrameWith4Sign_SmoothBitmapImage1.visible");
            result[3] = new Binding(this, function ():Boolean{
                return (_leftSignVisible);
            }, null, "_MetalFrameWith4Sign_SmoothBitmapImage2.visible");
            result[4] = new Binding(this, function ():Boolean{
                return (_bottomSignVisible);
            }, null, "_MetalFrameWith4Sign_SmoothBitmapImage3.visible");
            result[5] = new Binding(this, function ():Boolean{
                return (_topSignVisible);
            }, null, "_MetalFrameWith4Sign_SmoothBitmapImage4.visible");
            return (result);
        }
        private function get _rightSignVisible():Boolean{
            return (this._1064547688_rightSignVisible);
        }
        private function set _rightSignVisible(_arg1:Boolean):void{
            var _local2:Object = this._1064547688_rightSignVisible;
            if (_local2 !== _arg1){
                this._1064547688_rightSignVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_rightSignVisible", _local2, _arg1));
                };
            };
        }
        private function get _leftSignVisible():Boolean{
            return (this._2139091153_leftSignVisible);
        }
        private function set _leftSignVisible(_arg1:Boolean):void{
            var _local2:Object = this._2139091153_leftSignVisible;
            if (_local2 !== _arg1){
                this._2139091153_leftSignVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_leftSignVisible", _local2, _arg1));
                };
            };
        }
        private function get _bottomSignVisible():Boolean{
            return (this._1537103285_bottomSignVisible);
        }
        private function set _bottomSignVisible(_arg1:Boolean):void{
            var _local2:Object = this._1537103285_bottomSignVisible;
            if (_local2 !== _arg1){
                this._1537103285_bottomSignVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_bottomSignVisible", _local2, _arg1));
                };
            };
        }
        private function get _topSignVisible():Boolean{
            return (this._1156724353_topSignVisible);
        }
        private function set _topSignVisible(_arg1:Boolean):void{
            var _local2:Object = this._1156724353_topSignVisible;
            if (_local2 !== _arg1){
                this._1156724353_topSignVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "_topSignVisible", _local2, _arg1));
                };
            };
        }

    }
}//package ui_element 

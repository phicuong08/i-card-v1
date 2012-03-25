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
    import flash.utils.*;
    import org.gonta.filters.*;
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

    public class CreateUserWindowHeadItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _104387img:MyImage;
        private var __moduleFactoryInitialized:Boolean = false;
        public var headIconId:int;
        private var _896505829source:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CreateUserWindowHeadItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CreateUserWindowHeadItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_normal_window_CreateUserWindowHeadItemWatcherSetupUtil");
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
            this.width = 120;
            this.height = 120;
            this.filters = [this._CreateUserWindowHeadItem_WetFloorFilter1_c()];
            this.mxmlContent = [this._CreateUserWindowHeadItem_MyImage1_i()];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CreateUserWindowHeadItem._watcherSetupUtil = _arg1;
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
        public function setPos(_arg1:Number, _arg2:Number):void{
            x = _arg1;
            z = _arg2;
            depth = -(z);
        }
        private function _CreateUserWindowHeadItem_WetFloorFilter1_c():WetFloorFilter{
            var _local1:WetFloorFilter = new WetFloorFilter();
            _local1.alpha = 0.6;
            _local1.y = 125;
            _local1.height = 30;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CreateUserWindowHeadItem_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.width = 120;
            _local1.height = 120;
            _local1.id = "img";
            if (!_local1.document){
                _local1.document = this;
            };
            this.img = _local1;
            BindingManager.executeBindings(this, "img", this.img);
            return (_local1);
        }
        private function _CreateUserWindowHeadItem_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "img.source", "source");
            return (_local1);
        }
        public function get img():MyImage{
            return (this._104387img);
        }
        public function set img(_arg1:MyImage):void{
            var _local2:Object = this._104387img;
            if (_local2 !== _arg1){
                this._104387img = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local2, _arg1));
                };
            };
        }
        public function get source():String{
            return (this._896505829source);
        }
        public function set source(_arg1:String):void{
            var _local2:Object = this._896505829source;
            if (_local2 !== _arg1){
                this._896505829source = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "source", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

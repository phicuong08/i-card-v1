//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
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
    import mx.events.*;
    import mx.filters.*;
    import mx.styles.*;
    
    import spark.components.*;
    import spark.effects.*;
    import spark.layouts.*;

	use namespace mx_internal;
    public class OneRollNum extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1671708693labelGroup:VGroup;
        private var _1994587966moveEffect:Move;
        private var __moduleFactoryInitialized:Boolean = false;
        private var hasCreationComplete:Boolean = false;
        private var labelArr:Array;
        public var currentNum:int = 0;
        public var rollWay:Boolean;
        private var dura:Number = 100;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function OneRollNum(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this.labelArr = new Array();
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._OneRollNum_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_custom_control_OneRollNumWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (OneRollNum[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.clipAndEnableScrolling = true;
            this.layout = this._OneRollNum_BasicLayout1_c();
            this.mxmlContent = [this._OneRollNum_VGroup1_i()];
            this._OneRollNum_Move1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            OneRollNum._watcherSetupUtil = _arg1;
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
        private function init():void{
            var _local1:Label;
            var _local2:int;
            while (_local2 < 6) {
                _local1 = new Label();
                _local1.text = this.currentNum.toString();
                _local1.width = this.width;
                _local1.height = this.height;
                _local1.setStyle("textAlign", "center");
                _local1.setStyle("verticalAlign", "middle");
                this.labelGroup.addElement(_local1);
                this.labelArr.push(_local1);
                _local2++;
            };
        }
        public function set rollDura(_arg1:Number):void{
            this.dura = _arg1;
        }
        public function set originalNum(_arg1:int):void{
            var _local2:Label;
            this.currentNum = _arg1;
            for each (_local2 in this.labelArr) {
                _local2.text = this.currentNum.toString();
            };
        }
        public function set num(_arg1:int):void{
            var _local2:int;
            _arg1 = (_arg1 % 10);
            if (_arg1 == this.currentNum){
                return;
            };
            if (!this.hasCreationComplete){
                this.currentNum = _arg1;
                return;
            };
            this.moveEffect.end();
            var _local3:int = Math.abs((_arg1 - this.currentNum));
            if (_local3 >= 5){
                this.rollWay = ((_arg1 > this.currentNum)) ? true : false;
                _local3 = (10 - _local3);
            } else {
                this.rollWay = ((_arg1 > this.currentNum)) ? false : true;
            };
            if (this.rollWay){
                this.moveEffect.yFrom = -(this.labelArr[5].y);
                this.moveEffect.yTo = (this.moveEffect.yFrom + this.labelArr[_local3].y);
                _local2 = 5;
                while (_local2 >= 0) {
                    this.labelArr[_local2].text = this.currentNum.toString();
                    this.currentNum = ((this.currentNum)==0) ? 9 : --this.currentNum;
                    _local2--;
                };
            } else {
                this.moveEffect.yFrom = 0;
                this.moveEffect.yTo = -(this.labelArr[_local3].y);
                _local2 = 0;
                while (_local2 < 6) {
                    this.labelArr[_local2].text = this.currentNum.toString();
                    this.currentNum = ((this.currentNum)==9) ? 0 : ++this.currentNum;
                    _local2++;
                };
            };
            this.moveEffect.duration = (this.dura * _local3);
            this.moveEffect.play();
            this.currentNum = _arg1;
        }
        private function _OneRollNum_Move1_i():Move{
            var _local1:Move = new Move();
            _local1.addEventListener("effectEnd", this.__moveEffect_effectEnd);
            this.moveEffect = _local1;
            BindingManager.executeBindings(this, "moveEffect", this.moveEffect);
            return (_local1);
        }
        public function __moveEffect_effectEnd(_arg1:EffectEvent):void{
            dispatchEvent(new Event("rollEffectEnd"));
        }
        private function _OneRollNum_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _OneRollNum_VGroup1_i():VGroup{
            var _local1:VGroup = new VGroup();
            _local1.percentWidth = 100;
            _local1.percentHeight = 100;
            _local1.addEventListener("creationComplete", this.__labelGroup_creationComplete);
            _local1.id = "labelGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.labelGroup = _local1;
            BindingManager.executeBindings(this, "labelGroup", this.labelGroup);
            return (_local1);
        }
        public function __labelGroup_creationComplete(_arg1:FlexEvent):void{
            this.hasCreationComplete = true;
            this.init();
        }
        private function _OneRollNum_bindingsSetup():Array{
            var _local1:Array = [];
            _local1[0] = new Binding(this, null, null, "moveEffect.target", "labelGroup");
            return (_local1);
        }
        public function get labelGroup():VGroup{
            return (this._1671708693labelGroup);
        }
        public function set labelGroup(_arg1:VGroup):void{
            var _local2:Object = this._1671708693labelGroup;
            if (_local2 !== _arg1){
                this._1671708693labelGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "labelGroup", _local2, _arg1));
                };
            };
        }
        public function get moveEffect():Move{
            return (this._1994587966moveEffect);
        }
        public function set moveEffect(_arg1:Move):void{
            var _local2:Object = this._1994587966moveEffect;
            if (_local2 !== _arg1){
                this._1994587966moveEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "moveEffect", _local2, _arg1));
                };
            };
        }

    }
}//package custom_control 

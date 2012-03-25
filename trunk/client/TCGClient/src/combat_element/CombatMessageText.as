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
    import source_manager.*;
    import spark.effects.*;
    import spark.filters.*;
    import SoundSystem.*;
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
	import mx.effects.Sequence;
	use namespace mx_internal;
    public class CombatMessageText extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _104387img:SmoothBitmapImage;
        private var _413800941lableText:Label;
        private var _369004270showEffect:Sequence;
        private var __moduleFactoryInitialized:Boolean = false;
        private var str:String;
        private var param = null;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CombatMessageText(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CombatMessageText_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CombatMessageTextWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                //return (__slot1[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.x = 0x0500;
            this.verticalCenter = 0;
            this.width = 500;
            this.mouseEnabled = false;
            this.mxmlContent = [this._CombatMessageText_Label1_i(), this._CombatMessageText_SmoothBitmapImage1_i()];
            this._CombatMessageText_Sequence1_i();
            this.addEventListener("creationComplete", this.___CombatMessageText_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CombatMessageText._watcherSetupUtil = _arg1;
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
        public function setInfo(_arg1:String, _arg2=null):void{
            this.str = _arg1;
            this.param = _arg2;
        }
        protected function group_creationCompleteHandler():void{
            var _local1:String;
            this.showEffect.play();
            var _local2 = "step";
            var _local3:Boolean;
            switch (this.str){
                case "firstPlayer":
                case "secondPlayer":
                case "enemyEscape":
                    this.img.source = CombatStageSourceMgr.getInstance().getSourceClass((this.str + "Text"));
                    _local3 = true;
                    break;
                case "roundNumber":
                    _local1 = (("第" + this.getNumberChar((this.param as int))) + "回合");
                    break;
                case "recruit_point":
                    _local1 = ("剩余出战次数：" + (this.param as int).toString());
                    break;
                case "chain_push":
                    _local1 = "发动连锁";
                    _local2 = "chain";
                    break;
                case "chain_pop":
                    _local1 = "执行连锁";
                    _local2 = "chain";
                    break;
                default:
                    _local1 = this.str;
            };
            if (!_local3){
                this.lableText.text = _local1;
            };
            SoundMgr.getInstance().playEffectSound(_local2);
        }
        private function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        public function getNumberCharSingle(_arg1:int):String{
            switch (_arg1){
                case 1:
                    return ("一");
                case 2:
                    return ("二");
                case 3:
                    return ("三");
                case 4:
                    return ("四");
                case 5:
                    return ("五");
                case 6:
                    return ("六");
                case 7:
                    return ("七");
                case 8:
                    return ("八");
                case 9:
                    return ("九");
                case 0:
                    return ("零");
                default:
                    return ("?");
            };
        }
        public function getNumberChar(_arg1:int):String{
            var _local2:int;
            var _local3:int;
            var _local4:int;
            if (_arg1 > 100){
                _local2 = (_arg1 / 100);
                _arg1 = (_arg1 - (100 * _local2));
                _local2 = (_local2 - (10 * (_local2 / 10)));
            };
            if (_arg1 > 10){
                _local3 = (_arg1 / 10);
                _arg1 = (_arg1 - (10 * _local3));
            };
            _local4 = _arg1;
            var _local5 = "";
            if (_local2 > 0){
                _local5 = (_local5 + (this.getNumberCharSingle(_local2) + "百"));
                if (_local3 > 0){
                    _local5 = (_local5 + (this.getNumberCharSingle(_local3) + "十"));
                } else {
                    if (_local4 > 0){
                        _local5 = (_local5 + "零");
                    };
                };
                if (_local4 > 0){
                    _local5 = (_local5 + this.getNumberCharSingle(_local4));
                };
            } else {
                if (_local3 > 0){
                    if (_local3 > 1){
                        _local5 = (_local5 + this.getNumberCharSingle(_local3));
                    };
                    _local5 = (_local5 + "十");
                };
                if (_local4 > 0){
                    _local5 = (_local5 + this.getNumberCharSingle(_local4));
                };
                if ((((_local3 == 0)) && ((_local4 == 0)))){
                    _local5 = (_local5 + "零");
                };
            };
            return (_local5);
        }
        private function _CombatMessageText_Sequence1_i():Sequence{
            var _local1:Sequence = new Sequence();
            _local1.children = [this._CombatMessageText_Move1_c(), this._CombatMessageText_Move2_c()];
            _local1.addEventListener("effectEnd", this.__showEffect_effectEnd);
            this.showEffect = _local1;
            BindingManager.executeBindings(this, "showEffect", this.showEffect);
            return (_local1);
        }
        private function _CombatMessageText_Move1_c():Move{
            var _local1:Move = new Move();
            _local1.xFrom = 0x0500;
            _local1.xTo = 390;
            _local1.duration = 300;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatMessageText_Move2_c():Move{
            var _local1:Move = new Move();
            _local1.startDelay = 600;
            _local1.xTo = -500;
            _local1.duration = 300;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function __showEffect_effectEnd(_arg1:EffectEvent):void{
            this.removeSelf();
        }
        private function _CombatMessageText_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.percentWidth = 100;
            _local1.filters = [this._CombatMessageText_GlowFilter1_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 50);
            _local1.setStyle("color", 0);
            _local1.id = "lableText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.lableText = _local1;
            BindingManager.executeBindings(this, "lableText", this.lableText);
            return (_local1);
        }
        private function _CombatMessageText_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 30;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CombatMessageText_SmoothBitmapImage1_i():SmoothBitmapImage{
            var _local1:SmoothBitmapImage = new SmoothBitmapImage();
            _local1.horizontalCenter = 0;
            _local1.initialized(this, "img");
            this.img = _local1;
            BindingManager.executeBindings(this, "img", this.img);
            return (_local1);
        }
        public function ___CombatMessageText_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group_creationCompleteHandler();
        }
        private function _CombatMessageText_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_MESSAGE_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():Object{
                return (this);
            }, null, "showEffect.target");
            return (result);
        }
        public function get img():SmoothBitmapImage{
            return (this._104387img);
        }
        public function set img(_arg1:SmoothBitmapImage):void{
            var _local2:Object = this._104387img;
            if (_local2 !== _arg1){
                this._104387img = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "img", _local2, _arg1));
                };
            };
        }
        public function get lableText():Label{
            return (this._413800941lableText);
        }
        public function set lableText(_arg1:Label):void{
            var _local2:Object = this._413800941lableText;
            if (_local2 !== _arg1){
                this._413800941lableText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "lableText", _local2, _arg1));
                };
            };
        }
        public function get showEffect():Sequence{
            return (this._369004270showEffect);
        }
        public function set showEffect(_arg1:Sequence):void{
            var _local2:Object = this._369004270showEffect;
            if (_local2 !== _arg1){
                this._369004270showEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "showEffect", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

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
    import ui_element.*;
    import flash.system.*;
    import flash.media.*;
    import spark.effects.*;
    import spark.filters.*;
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

    public class AttackDirectlyConfirmWindow extends StageSelectWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AttackDirectlyConfirmWindow_CommonMiddleFrame1:CommonMiddleFrame;
        public var _AttackDirectlyConfirmWindow_CommonOuterFrame1:CommonOuterFrame;
        private var _413245038addEffect:Scale;
        private var _1267520715removeEffect:Scale;
        private var __moduleFactoryInitialized:Boolean = false;
        private var belongCard:GameCard;
        private var creationHasComplete:Boolean = false;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AttackDirectlyConfirmWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AttackDirectlyConfirmWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_AttackDirectlyConfirmWindowWatcherSetupUtil");
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
            this.width = 0xFF;
            this.height = 102;
            this.transformX = 127.5;
            this.transformY = 51;
            this.mxmlContent = [this._AttackDirectlyConfirmWindow_CommonOuterFrame1_i(), this._AttackDirectlyConfirmWindow_CommonMiddleFrame1_i(), this._AttackDirectlyConfirmWindow_Label1_c(), this._AttackDirectlyConfirmWindow_BlueSmallButton1_c(), this._AttackDirectlyConfirmWindow_BlueSmallButton2_c()];
            this._AttackDirectlyConfirmWindow_Scale1_i();
            this._AttackDirectlyConfirmWindow_Scale2_i();
            this.addEventListener("creationComplete", this.___AttackDirectlyConfirmWindow_StageSelectWindowBase1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AttackDirectlyConfirmWindow._watcherSetupUtil = _arg1;
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
        public function setInfo(_arg1:GameCard):void{
            this.belongCard = _arg1;
            this.setMainGroupPos();
        }
        protected function creationCompleteHandler():void{
            this.creationHasComplete = true;
            this.setMainGroupPos();
        }
        private function setMainGroupPos():void{
            if (((((this.creationHasComplete) && (this.belongCard))) && (parent))){
                x = (parent.mouseX - (width / 2));
                y = (parent.mouseY - height);
            };
        }
        private function clickYseBtn():void{
            var _local1 = (("return d:do_operation('', 'attack'," + CombatStage.getInstance().getCardPos(this.belongCard).toString()) + ", 0);");
            LuaAgent.getInstance().run(_local1);
            removeSelf();
        }
        private function clickNoBtn():void{
            CombatConsole.getInstance().showAttackWindow(this.belongCard);
            removeSelf();
        }
        private function _AttackDirectlyConfirmWindow_Scale1_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 0.1;
            _local1.scaleXTo = 1;
            _local1.scaleYFrom = 0.1;
            _local1.scaleYTo = 1;
            _local1.duration = 200;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        private function _AttackDirectlyConfirmWindow_Scale2_i():Scale{
            var _local1:Scale = new Scale();
            _local1.scaleXFrom = 1;
            _local1.scaleXTo = 0.1;
            _local1.scaleYFrom = 1;
            _local1.scaleYTo = 0.1;
            _local1.duration = 200;
            _local1.addEventListener("effectEnd", this.__removeEffect_effectEnd);
            this.removeEffect = _local1;
            BindingManager.executeBindings(this, "removeEffect", this.removeEffect);
            return (_local1);
        }
        public function __removeEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = false;
        }
        private function _AttackDirectlyConfirmWindow_CommonOuterFrame1_i():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.filters = [this._AttackDirectlyConfirmWindow_DropShadowFilter1_c()];
            _local1.id = "_AttackDirectlyConfirmWindow_CommonOuterFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AttackDirectlyConfirmWindow_CommonOuterFrame1 = _local1;
            BindingManager.executeBindings(this, "_AttackDirectlyConfirmWindow_CommonOuterFrame1", this._AttackDirectlyConfirmWindow_CommonOuterFrame1);
            return (_local1);
        }
        private function _AttackDirectlyConfirmWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackDirectlyConfirmWindow_CommonMiddleFrame1_i():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 16;
            _local1.y = 13;
            _local1.id = "_AttackDirectlyConfirmWindow_CommonMiddleFrame1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AttackDirectlyConfirmWindow_CommonMiddleFrame1 = _local1;
            BindingManager.executeBindings(this, "_AttackDirectlyConfirmWindow_CommonMiddleFrame1", this._AttackDirectlyConfirmWindow_CommonMiddleFrame1);
            return (_local1);
        }
        private function _AttackDirectlyConfirmWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.y = 27;
            _local1.horizontalCenter = 0;
            _local1.text = "是否直接攻击对方玩家？";
            _local1.setStyle("color", 16178309);
            _local1.setStyle("fontSize", 16);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackDirectlyConfirmWindow_BlueSmallButton1_c():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.left = 50;
            _local1.bottom = 20;
            _local1.label = "是";
            _local1.addEventListener("click", this.___AttackDirectlyConfirmWindow_BlueSmallButton1_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AttackDirectlyConfirmWindow_BlueSmallButton1_click(_arg1:MouseEvent):void{
            this.clickYseBtn();
        }
        private function _AttackDirectlyConfirmWindow_BlueSmallButton2_c():BlueSmallButton{
            var _local1:BlueSmallButton = new BlueSmallButton();
            _local1.right = 50;
            _local1.bottom = 20;
            _local1.label = "否";
            _local1.addEventListener("click", this.___AttackDirectlyConfirmWindow_BlueSmallButton2_click);
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        public function ___AttackDirectlyConfirmWindow_BlueSmallButton2_click(_arg1:MouseEvent):void{
            this.clickNoBtn();
        }
        public function ___AttackDirectlyConfirmWindow_StageSelectWindowBase1_creationComplete(_arg1:FlexEvent):void{
            this.creationCompleteHandler();
        }
        private function _AttackDirectlyConfirmWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_SELECT_CARD_WITH_OPTIONS);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[2] = new Binding(this, null, function (_arg1):void{
                this.setStyle("removedEffect", _arg1);
            }, "this.removedEffect", "removeEffect");
            result[3] = new Binding(this, function ():Array{
                var _local1:* = [0xFF, 102];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_AttackDirectlyConfirmWindow_CommonOuterFrame1.size");
            result[4] = new Binding(this, function ():Array{
                var _local1:* = [223, 74];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "_AttackDirectlyConfirmWindow_CommonMiddleFrame1.size");
            return (result);
        }
        public function get addEffect():Scale{
            return (this._413245038addEffect);
        }
        public function set addEffect(_arg1:Scale):void{
            var _local2:Object = this._413245038addEffect;
            if (_local2 !== _arg1){
                this._413245038addEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addEffect", _local2, _arg1));
                };
            };
        }
        public function get removeEffect():Scale{
            return (this._1267520715removeEffect);
        }
        public function set removeEffect(_arg1:Scale):void{
            var _local2:Object = this._1267520715removeEffect;
            if (_local2 !== _arg1){
                this._1267520715removeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "removeEffect", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

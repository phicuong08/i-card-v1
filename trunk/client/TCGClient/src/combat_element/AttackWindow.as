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
    import spark.effects.*;
    import spark.filters.*;
    import task_guide.*;
    import custom_effect.*;
    import spark.primitives.*;
    import mx.graphics.*;
    import mouse_keyboard_mgr.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import skins.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class AttackWindow extends StageSelectWindowBase implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _AttackWindow_Button1:Button;
        private var _413245038addEffect:Fade;
        private var _3560248tips:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        public var belongCard:GameCard;
        private var _1227676528cancelBtnVisible:Boolean = true;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function AttackWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._AttackWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_AttackWindowWatcherSetupUtil");
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
            this.width = 1040;
            this.height = 800;
            this.mouseEnabled = false;
            this.mxmlContent = [this._AttackWindow_Rect1_c(), this._AttackWindow_Label1_i(), this._AttackWindow_Button1_i()];
            this._AttackWindow_Fade1_i();
            this.addEventListener("initialize", this.___AttackWindow_StageSelectWindowBase1_initialize);
            this.addEventListener("creationComplete", this.___AttackWindow_StageSelectWindowBase1_creationComplete);
            this.addEventListener("remove", this.___AttackWindow_StageSelectWindowBase1_remove);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            AttackWindow._watcherSetupUtil = _arg1;
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
        private function doAttack():void{
            var _local1:*;
            GuideFunctions.addMaskWindow();
            ArcLineWindow.showArcLineWindow(CombatStage.getInstance().groupWith3D, 0xFF6C00, 0xFF0000, 0xFF6C00, (this.belongCard.x + (this.belongCard.width / 2)), (this.belongCard.y + (this.belongCard.height / 2)));
            MouseMgr.getInstance().setCursor("sword");
            CombatStage.getInstance().addEventListener(MyEvent.MOUSE_CLICK_CARD, this.mouseClickCard);
            for each (_local1 in CombatStage.getInstance().enemyMonsterCards) {
                if ((_local1 is GameCard)){
                    (_local1 as GameCard).playSurroundEffect();
                    (_local1 as GameCard).depth = 350;
                };
            };
        }
        private function mouseClickCard(_arg1:MyEvent):void{
            var _local4:int;
            var _local5:String;
            var _local6:Array;
            var _local2:GameCard = (_arg1.message.card as GameCard);
            var _local3:int = CombatStage.getInstance().enemyMonsterCards.indexOf(_local2);
            var _temp1 = _local3;
            _local3 = (_local3 + 1);
            if (_temp1 != -1){
                SoundMgr.getInstance().playEffectSound("click_4");
                _local4 = CombatStage.getInstance().getCardPos(this.belongCard);
                _local5 = (((("return d:do_operation('', 'attack'," + _local4.toString()) + ",") + _local3.toString()) + ");");
                _local6 = LuaAgent.getInstance().run(_local5);
                if ((((_local6.length > 1)) && ((_local6[1] == true)))){
                    dispatchEvent(new MyEvent(MyEvent.DO_ATTACK, {attackWindow:this}));
                    ArcLineWindow.hideArcLineWindow(false);
                    this.removeSelf();
                };
            } else {
                this.cancelAttack();
            };
        }
        private function stopListen():void{
            CombatStage.getInstance().removeEventListener(MyEvent.MOUSE_CLICK_CARD, this.mouseClickCard);
        }
        override public function removeSelf():void{
            var _local1:*;
            var _local2:FakeFadeEffect;
            GuideFunctions.removeMaskWindow();
            if (parent){
                _local2 = new FakeFadeEffect(this, 300, 1, 0);
                _local2.play();
            };
            MouseMgr.getInstance().clearCursor("sword");
            super.removeSelf();
            CombatConsole.getInstance().setOperationMenuFlag("attack", false);
            for each (_local1 in CombatStage.getInstance().enemyMonsterCards) {
                if ((_local1 is GameCard)){
                    (_local1 as GameCard).playSurroundEffect(false);
                    (_local1 as GameCard).depth = (_local1 as GameCard)._depth;
                };
            };
        }
        private function cancelAttack():void{
            dispatchEvent(new MyEvent(MyEvent.CANCEL_ATTACK, {attackWindow:this}));
            this.removeSelf();
            ArcLineWindow.hideArcLineWindow(true);
        }
        private function _AttackWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        private function _AttackWindow_Rect1_c():Rect{
            var _local1:Rect = new Rect();
            _local1.width = 675;
            _local1.height = 40;
            _local1.x = 270;
            _local1.y = 145;
            _local1.fill = this._AttackWindow_LinearGradient1_c();
            _local1.initialized(this, null);
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackWindow_LinearGradient1_c():LinearGradient{
            var _local1:LinearGradient = new LinearGradient();
            _local1.entries = [this._AttackWindow_GradientEntry1_c(), this._AttackWindow_GradientEntry2_c(), this._AttackWindow_GradientEntry3_c()];
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackWindow_GradientEntry1_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 2241348;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackWindow_GradientEntry2_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 2241348;
            _local1.alpha = 0.5;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackWindow_GradientEntry3_c():GradientEntry{
            var _local1:GradientEntry = new GradientEntry();
            _local1.color = 2241348;
            _local1.alpha = 0;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackWindow_Label1_i():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.mouseEnabled = false;
            _local1.x = 365;
            _local1.y = 115;
            _local1.text = "请选择攻击对象";
            _local1.filters = [this._AttackWindow_GlowFilter1_c()];
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 50);
            _local1.setStyle("color", 0);
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _AttackWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 30;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _AttackWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "取消攻击";
            _local1.x = 745;
            _local1.y = 150;
            _local1.width = 77;
            _local1.height = 27;
            _local1.scaleX = 1.3;
            _local1.scaleY = 1.3;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___AttackWindow_Button1_click);
            _local1.id = "_AttackWindow_Button1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._AttackWindow_Button1 = _local1;
            BindingManager.executeBindings(this, "_AttackWindow_Button1", this._AttackWindow_Button1);
            return (_local1);
        }
        public function ___AttackWindow_Button1_click(_arg1:MouseEvent):void{
            this.cancelAttack();
        }
        public function ___AttackWindow_StageSelectWindowBase1_initialize(_arg1:FlexEvent):void{
            CombatConsole.getInstance().setOperationMenuFlag("attack", true);
        }
        public function ___AttackWindow_StageSelectWindowBase1_creationComplete(_arg1:FlexEvent):void{
            this.doAttack();
        }
        public function ___AttackWindow_StageSelectWindowBase1_remove(_arg1:FlexEvent):void{
            this.stopListen();
        }
        private function _AttackWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "addEffect");
            result[1] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_ATTACK_WINDOW);
            }, null, "this.depth");
            result[2] = new Binding(this, function ():Boolean{
                return (cancelBtnVisible);
            }, null, "_AttackWindow_Button1.visible");
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
        public function get tips():Label{
            return (this._3560248tips);
        }
        public function set tips(_arg1:Label):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }
        private function get cancelBtnVisible():Boolean{
            return (this._1227676528cancelBtnVisible);
        }
        private function set cancelBtnVisible(_arg1:Boolean):void{
            var _local2:Object = this._1227676528cancelBtnVisible;
            if (_local2 !== _arg1){
                this._1227676528cancelBtnVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "cancelBtnVisible", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

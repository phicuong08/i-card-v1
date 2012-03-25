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
    import flash.system.*;
    import flash.media.*;
    import spark.filters.*;
    import task_guide.*;
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

    public class ChainNoticeWindow extends VGroup implements IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _ChainNoticeWindow_Button1:Button;
        private var _1301516301msgLabel:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var noticeActive:Boolean = false;
        private var _786766278chainNoticeText:String;
        private var _1448503104isBtnVisible:Boolean = false;
        private var actionTimer:Timer;
        private var maskByMe:Boolean = false;
        private var waitChainList:Array;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function ChainNoticeWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._ChainNoticeWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_ChainNoticeWindowWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (ChainNoticeWindow[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.visible = true;
            this.mouseEnabled = false;
            this.height = 200;
            this.width = 600;
            this.horizontalAlign = "center";
            this.horizontalCenter = 0;
            this.verticalCenter = 0;
            this.mxmlContent = [this._ChainNoticeWindow_Label1_i(), this._ChainNoticeWindow_Button1_i()];
            this.addEventListener("initialize", this.___ChainNoticeWindow_VGroup1_initialize);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            ChainNoticeWindow._watcherSetupUtil = _arg1;
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
                this.contentBackgroundColor = 0xA0A0A0;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function chainRemind(_arg1:Boolean, _arg2:Boolean=false, _arg3:Boolean=false, _arg4:Boolean=false, _arg5:String="", _arg6:Boolean=false, _arg7:Array=null):void{
            this.noticeActive = _arg1;
            this.isBtnVisible = false;
            if (_arg1){
                if (_arg3){
                    if (_arg2){
                        if (_arg6){
                            this.chainNoticeText = "我方";
                        } else {
                            this.chainNoticeText = "对方";
                        };
                        switch (_arg5){
                            case "recruit":
                            case "flip_recruit":
                            case "search_deck_to_recruit":
                                this.chainNoticeText = (this.chainNoticeText + "部队出战，我方有可以连锁发动的卡片：");
                                break;
                            case "cast":
                                this.chainNoticeText = (this.chainNoticeText + "发动了卡片效果，我方有可以连锁发动的卡片：");
                                break;
                            case "attack":
                                this.chainNoticeText = (this.chainNoticeText + "发动了进攻，我方有可以连锁发动的卡片：");
                                break;
                            default:
                                this.chainNoticeText = (this.chainNoticeText + "做出了操作，我方有可以连锁发动的卡片：");
                        };
                        this.isBtnVisible = true;
                        CombatConsole.getInstance().setOperationMenuFlag("chain", false);
                        this.verticalCenter = -120;
                        this.msgLabel.setStyle("fontSize", 40);
                        this.waitChainList = _arg7;
                        CombatConsole.getInstance().addActionList([0, [this.addChainMask]]);
                        return;
                    };
                    this.chainNoticeText = "  等待对方连锁...";
                } else {
                    if (_arg4){
                        if (_arg2){
                            this.chainNoticeText = "请选择...";
                        } else {
                            this.chainNoticeText = "  等待对方选择...";
                        };
                    } else {
                        this.chainNoticeText = "请稍候...";
                    };
                };
                this.verticalCenter = 0;
                this.msgLabel.setStyle("fontSize", 50);
            } else {
                this.showWindow(false);
            };
            CombatConsole.getInstance().setOperationMenuFlag("chain", this.noticeActive);
            this.removeChainMask();
        }
        public function showNotice(_arg1:Boolean):void{
            this.showWindow(((_arg1) && (this.noticeActive)));
        }
        public function reset():void{
            this.showWindow(false);
            this.noticeActive = false;
        }
        private function addChainMask():void{
            var _local1:GameCard;
            this.maskByMe = true;
            GuideFunctions.addMaskWindow();
            var _local2:int;
            while (_local2 < this.waitChainList.length) {
                _local1 = CombatStage.getInstance().cardTableBySn[this.waitChainList[_local2]];
                _local1.depth = 350;
                _local1.playSurroundEffect();
                _local2++;
            };
        }
        private function removeChainMask():void{
            var _local1:GameCard;
            var _local2:int;
            if (this.maskByMe){
                this.maskByMe = false;
                GuideFunctions.removeMaskWindow();
                _local2 = 0;
                while (_local2 < this.waitChainList.length) {
                    _local1 = CombatStage.getInstance().cardTableBySn[this.waitChainList[_local2]];
                    _local1.depth = _local1._depth;
                    _local1.playSurroundEffect(false);
                    _local2++;
                };
            };
        }
        private function showWindow(_arg1:Boolean):void{
            this.visible = _arg1;
            if (_arg1){
                this.actionTimer.start();
            } else {
                this.actionTimer.stop();
            };
        }
        protected function vgroup1_creationCompleteHandler(_arg1:FlexEvent):void{
            this.actionTimer = new Timer(500);
            this.actionTimer.addEventListener(TimerEvent.TIMER, this.changeText);
        }
        private function changeText(_arg1:TimerEvent):void{
            if ((((this.chainNoticeText.indexOf("等待对方连锁") == -1)) && ((this.chainNoticeText.indexOf("等待对方选择") == -1)))){
                return;
            };
            if (this.chainNoticeText.indexOf("...") != -1){
                this.chainNoticeText = this.chainNoticeText.replace("...", ".");
                this.chainNoticeText = this.chainNoticeText.replace("  ", "");
            } else {
                if (this.chainNoticeText.indexOf("..") != -1){
                    this.chainNoticeText = this.chainNoticeText.replace("..", "...");
                    this.chainNoticeText = this.chainNoticeText.replace(" ", "  ");
                } else {
                    if (this.chainNoticeText.indexOf(".") != -1){
                        this.chainNoticeText = this.chainNoticeText.replace(".", "..");
                        this.chainNoticeText = (" " + this.chainNoticeText);
                    };
                };
            };
        }
        private function _ChainNoticeWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.mouseEnabled = false;
            _local1.width = 600;
            _local1.filters = [this._ChainNoticeWindow_GlowFilter1_c()];
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("fontWeight", "bold");
            _local1.setStyle("fontSize", 50);
            _local1.setStyle("color", 0);
            _local1.id = "msgLabel";
            if (!_local1.document){
                _local1.document = this;
            };
            this.msgLabel = _local1;
            BindingManager.executeBindings(this, "msgLabel", this.msgLabel);
            return (_local1);
        }
        private function _ChainNoticeWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 0xFFFFFF;
            _local1.strength = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _ChainNoticeWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.x = 211;
            _local1.label = "取消连锁";
            _local1.width = 77;
            _local1.height = 27;
            _local1.scaleX = 1.5;
            _local1.scaleY = 1.5;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.___ChainNoticeWindow_Button1_click);
            _local1.id = "_ChainNoticeWindow_Button1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._ChainNoticeWindow_Button1 = _local1;
            BindingManager.executeBindings(this, "_ChainNoticeWindow_Button1", this._ChainNoticeWindow_Button1);
            return (_local1);
        }
        public function ___ChainNoticeWindow_Button1_click(_arg1:MouseEvent):void{
            LuaAgent.getInstance().run("d:skip_chain();");
        }
        public function ___ChainNoticeWindow_VGroup1_initialize(_arg1:FlexEvent):void{
            this.vgroup1_creationCompleteHandler(_arg1);
        }
        private function _ChainNoticeWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_CHAIN_GROUP);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():String{
                var _local1:* = chainNoticeText;
                return (((_local1 == undefined)) ? null : String(_local1));
            }, null, "msgLabel.text");
            result[2] = new Binding(this, function ():Boolean{
                return (isBtnVisible);
            }, null, "_ChainNoticeWindow_Button1.visible");
            return (result);
        }
        public function get msgLabel():Label{
            return (this._1301516301msgLabel);
        }
        public function set msgLabel(_arg1:Label):void{
            var _local2:Object = this._1301516301msgLabel;
            if (_local2 !== _arg1){
                this._1301516301msgLabel = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "msgLabel", _local2, _arg1));
                };
            };
        }
        private function get chainNoticeText():String{
            return (this._786766278chainNoticeText);
        }
        private function set chainNoticeText(_arg1:String):void{
            var _local2:Object = this._786766278chainNoticeText;
            if (_local2 !== _arg1){
                this._786766278chainNoticeText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "chainNoticeText", _local2, _arg1));
                };
            };
        }
        private function get isBtnVisible():Boolean{
            return (this._1448503104isBtnVisible);
        }
        private function set isBtnVisible(_arg1:Boolean):void{
            var _local2:Object = this._1448503104isBtnVisible;
            if (_local2 !== _arg1){
                this._1448503104isBtnVisible = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "isBtnVisible", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

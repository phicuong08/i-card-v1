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
    import spark.effects.*;
    import spark.layouts.*;
    import spark.filters.*;
    import custom_effect.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
    import notice_system.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import achievement_system.*;
    import swf_effect.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class DuelEndWindow extends Group implements IBindingClient {
		use namespace mx_internal;
        public static const FINISH_TASK:String = "finishTask";

        private static var _instance:DuelEndWindow;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1683030180bottomDesc:Label;
        private var _1173112990descFadeEffect:Fade;
        private var _1140358778topDesc:Label;
        private var __moduleFactoryInitialized:Boolean = false;
        private var creationHasComplete:Boolean = false;
        private var param:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function DuelEndWindow(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._DuelEndWindow_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_DuelEndWindowWatcherSetupUtil");
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
            this.width = 0x0500;
            this.height = 800;
            this.layout = this._DuelEndWindow_BasicLayout1_c();
            this.mxmlContent = [this._DuelEndWindow_Label1_i(), this._DuelEndWindow_Label2_i()];
            this._DuelEndWindow_Fade1_i();
            this.addEventListener("initialize", this.___DuelEndWindow_Group1_initialize);
            this.addEventListener("creationComplete", this.___DuelEndWindow_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function getInstance():DuelEndWindow{
            return (_instance);
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            DuelEndWindow._watcherSetupUtil = _arg1;
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
        protected function group1_creationCompleteHandler():void{
            this.creationHasComplete = true;
            this.showDuelEndResultEffect();
        }
        public function setInfo(_arg1:Object):void{
            this.param = _arg1;
            this.showDuelEndResultEffect();
        }
        public function showDuelEndResultEffect():void{
            var effectEndhandler:* = null;
            var w:* = null;
            var l:* = null;
            if (((this.creationHasComplete) && (this.param))){
                effectEndhandler = function (_arg1:Event):void{
                    (_arg1.currentTarget as SwfEffectBase).removeEventListener(SwfEffectBase.SWF_EFFECT_END, effectEndhandler);
                    askRandomCardBonusInfo();
                    descFadeEffect.play();
                };
                if (this.param.duel_result){
                    SoundMgr.getInstance().playEffectSound("success");
                    w = new WinDuelEffect();
                    addElement(w);
                    w.addEventListener(SwfEffectBase.SWF_EFFECT_END, effectEndhandler);
                } else {
                    SoundMgr.getInstance().playEffectSound("fail");
                    l = new LoseDuelEffect();
                    addElement(l);
                    l.addEventListener(SwfEffectBase.SWF_EFFECT_END, effectEndhandler);
                };
            };
        }
        private function askRandomCardBonusInfo():void{
            LuaAgent.getInstance().run("u:get_random_card_bonus()");
        }
        public function showRandomCardBonusWindow(_arg1:Array=null, _arg2:Array=null):void{
            var w:* = null;
            var wRemovedHandler:* = null;
            var bonus = _arg1;
            var allCardInfo = _arg2;
            if (((bonus) && ((bonus.length > 0)))){
                wRemovedHandler = function (_arg1:FlexEvent):void{
                    w.removeEventListener(FlexEvent.REMOVE, wRemovedHandler);
                    showDuelScoreWindow();
                };
                w = new DuelEndLuckyDrawWindow();
                w.setBonusInfo(bonus, allCardInfo);
                addElement(w);
                w.addEventListener(FlexEvent.REMOVE, wRemovedHandler);
                return;
            };
            this.showDuelScoreWindow();
        }
        private function showDuelScoreWindow():void{
            var w:* = null;
            var windowRemoveHandler:* = null;
            windowRemoveHandler = function (_arg1:FlexEvent):void{
                w.removeEventListener(FlexEvent.REMOVE, windowRemoveHandler);
                showLevelUpInfo();
            };
            callLater(LuaAgent.getInstance().run, ["u:flash_dispatch_do_duel_bonus_event()"]);
            w = new DuelEndWindowScoreWindow();
            w.setInfo(this.param);
            addElement(w);
            w.addEventListener(FlexEvent.REMOVE, windowRemoveHandler);
        }
        private function showLevelUpInfo():void{
            var l:* = null;
            var lRemovedHandler:* = null;
            if (this.param["last_level"] != this.param["level"]){
                lRemovedHandler = function (_arg1:FlexEvent):void{
                    l.removeEventListener(FlexEvent.REMOVE, lRemovedHandler);
                    NoticeMgr.getInstance().showLevelUpUnlockNotice(param["level"], 1000);
                    removeSelf();
                };
                l = new LevelUpWindow();
                l.levelText = UserObject.level.toString();
                addElement(l);
                l.addEventListener(FlexEvent.REMOVE, lRemovedHandler);
            } else {
                this.removeSelf();
            };
        }
        private function removeSelf():void{
            _instance = null;
            var _local1:Event = new Event(FINISH_TASK);
            callLater(dispatchEvent, [_local1]);
        }
        private function _DuelEndWindow_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.duration = 500;
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            this.descFadeEffect = _local1;
            BindingManager.executeBindings(this, "descFadeEffect", this.descFadeEffect);
            return (_local1);
        }
        private function _DuelEndWindow_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindow_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.alpha = 0;
            _local1.depth = 5;
            _local1.text = "战 斗 结 算";
            _local1.horizontalCenter = 0;
            _local1.top = 22;
            _local1.filters = [this._DuelEndWindow_GlowFilter1_c()];
            _local1.setStyle("fontSize", 38);
            _local1.setStyle("fontFamily", "黑体");
            _local1.setStyle("color", 16506810);
            _local1.id = "topDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.topDesc = _local1;
            BindingManager.executeBindings(this, "topDesc", this.topDesc);
            return (_local1);
        }
        private function _DuelEndWindow_GlowFilter1_c():GlowFilter{
            var _local1:GlowFilter = new GlowFilter();
            _local1.color = 16506810;
            _local1.blurX = 10;
            _local1.blurY = 10;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindow_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.alpha = 0;
            _local1.depth = 5;
            _local1.text = "单击屏幕任意处以继续";
            _local1.horizontalCenter = 0;
            _local1.bottom = 50;
            _local1.setStyle("fontSize", 31);
            _local1.setStyle("fontFamily", "黑体");
            _local1.setStyle("color", 7893582);
            _local1.id = "bottomDesc";
            if (!_local1.document){
                _local1.document = this;
            };
            this.bottomDesc = _local1;
            BindingManager.executeBindings(this, "bottomDesc", this.bottomDesc);
            return (_local1);
        }
        public function ___DuelEndWindow_Group1_initialize(_arg1:FlexEvent):void{
            _instance = this;
        }
        public function ___DuelEndWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler();
        }
        private function _DuelEndWindow_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_DUEL_END_WINDOW);
            }, null, "this.depth");
            result[1] = new Binding(this, function ():Array{
                var _local1:* = [topDesc, bottomDesc];
                return (((((((_local1 == null)) || ((_local1 is Array)))) || ((_local1 is Proxy)))) ? _local1 : [_local1]);
            }, null, "descFadeEffect.targets");
            return (result);
        }
        public function get bottomDesc():Label{
            return (this._1683030180bottomDesc);
        }
        public function set bottomDesc(_arg1:Label):void{
            var _local2:Object = this._1683030180bottomDesc;
            if (_local2 !== _arg1){
                this._1683030180bottomDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "bottomDesc", _local2, _arg1));
                };
            };
        }
        public function get descFadeEffect():Fade{
            return (this._1173112990descFadeEffect);
        }
        public function set descFadeEffect(_arg1:Fade):void{
            var _local2:Object = this._1173112990descFadeEffect;
            if (_local2 !== _arg1){
                this._1173112990descFadeEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descFadeEffect", _local2, _arg1));
                };
            };
        }
        public function get topDesc():Label{
            return (this._1140358778topDesc);
        }
        public function set topDesc(_arg1:Label):void{
            var _local2:Object = this._1140358778topDesc;
            if (_local2 !== _arg1){
                this._1140358778topDesc = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "topDesc", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

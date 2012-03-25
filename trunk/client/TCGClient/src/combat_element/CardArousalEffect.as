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
    import card_ui.*;
    import custom_effect.*;
    import flash.utils.*;
    import combat_element_script.*;
    import item_system.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import swf_effect.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;
	use namespace mx_internal;
    public class CardArousalEffect extends Group implements IBindingClient {

        private static const FADE_IN_DURATION:Number = 400;
        private static const FADE_OUT_DURATION:Number = 300;
        private static const AROUSAL_SWF_EFFECT_DURATION:Number = 2800;
        private static const IMAGE_CROSS_FADE_DURATION:Number = 700;
        private static const ATTRIB_CHANGE_DURATION:Number = 800;
        private static const STAR_CHANGE_DURATION:Number = 600;
        private static const AGNAME_HIDE_DURATION:Number = 600;
        private static const AGNAME_SHOW_DURATION:Number = 800;
		public var __slot1;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var _733607779fadeOutEffect:Fade;
        private var _1844693200newCard:MonsterCardImage;
        private var _1379913257oldCard:MonsterCardImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var oldCardInfo:Object;
        private var newCardInfo:Object;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;

        public function CardArousalEffect(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardArousalEffect_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_CardArousalEffectWatcherSetupUtil");
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
            this.layout = this._CardArousalEffect_BasicLayout1_c();
            this.mxmlContent = [this._CardArousalEffect_MonsterCardImage1_i(), this._CardArousalEffect_MonsterCardImage2_i()];
            this._CardArousalEffect_Fade1_i();
            this._CardArousalEffect_Fade2_i();
            this.addEventListener("creationComplete", this.___CardArousalEffect_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardArousalEffect._watcherSetupUtil = _arg1;
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
        public function setCardId(_arg1, _arg2):int{
            this.oldCardInfo = ItemCardLib.getItemInfoById(_arg1);
            this.newCardInfo = ItemCardLib.getItemInfoById(_arg2);
            var _local3:int = (((FADE_IN_DURATION + AROUSAL_SWF_EFFECT_DURATION) + IMAGE_CROSS_FADE_DURATION) + FADE_OUT_DURATION);
            _local3 = (_local3 + this.getAttribChangeDuration());
            _local3 = (_local3 + this.getStarChangeDuration());
            _local3 = (_local3 + this.getAgnameChangeDuration());
            return (_local3);
        }
        private function getAttribChangeDuration():int{
            return ((((!((this.oldCardInfo["str"] == this.newCardInfo["str"]))) || (!((this.oldCardInfo["int"] == this.newCardInfo["int"]))))) ? ATTRIB_CHANGE_DURATION : 0);
        }
        private function getStarChangeDuration():int{
            return (((this.oldCardInfo["star"])!=this.newCardInfo["star"]) ? STAR_CHANGE_DURATION : 0);
        }
        private function getAgnameChangeDuration():int{
            return ((((this.oldCardInfo["agname"])!="") ? AGNAME_HIDE_DURATION : 0 + ((this.newCardInfo["agname"])!="") ? AGNAME_SHOW_DURATION : 0));
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var _local3:String;
            this.oldCard.setCardInfo(this.oldCardInfo);
            var _local2:Object = new Object();
            for (_local3 in this.newCardInfo) {
                if ((((_local3 == "star")) || ((_local3 == "agname")))){
                    _local2[_local3] = this.oldCardInfo[_local3];
                } else {
                    _local2[_local3] = this.newCardInfo[_local3];
                };
            };
            this.newCard.setCardInfo(_local2);
            this.fadeInEffect.play();
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
        }
        private function showArousalSwfEffect():void{
            var _local1:ArousalEffect;
            _local1 = new ArousalEffect();
            addElement(_local1);
            _local1.x = -33;
            _local1.y = -18;
            CommonUtil.addTimerLaterCall(AROUSAL_SWF_EFFECT_DURATION, this.showAttribChangeEffect);
        }
        protected function showAttribChangeEffect():void{
            var _local1:int = this.getAttribChangeDuration();
            if (_local1 > 0){
                this.oldCard.setAttribInfo(this.newCardInfo["str"], this.newCardInfo["int"]);
                CommonUtil.addTimerLaterCall(_local1, this.showCrossFadeEffect);
            } else {
                this.showCrossFadeEffect();
            };
        }
        private function showCrossFadeEffect():void{
            this.newCard.visible = true;
            var _local1:BreakPiecesEffect = new BreakPiecesEffect(this.oldCard, (IMAGE_CROSS_FADE_DURATION + 300), 8, 6);
            _local1.initSpeedArg = 30;
            _local1.ySpeedArg = 1;
            _local1.rotateArg = 10;
            _local1.play();
            removeElement(this.oldCard);
            CommonUtil.addTimerLaterCall(IMAGE_CROSS_FADE_DURATION, this.showStarChangeEffect);
        }
        protected function showStarChangeEffect():void{
            var _local1:int = this.getStarChangeDuration();
            if (_local1 > 0){
                this.newCard.showStarChangeEffect(this.newCardInfo["star"]);
                CommonUtil.addTimerLaterCall(_local1, this.showAgnameChangeEffect);
            } else {
                this.showAgnameChangeEffect();
            };
        }
        protected function showAgnameChangeEffect():void{
            var _local1:int = this.getAgnameChangeDuration();
            if (_local1 > 0){
                this.newCard.showAgnameChangeEffect(this.newCardInfo["agname"]);
                CommonUtil.addTimerLaterCall(_local1, this.showFadeOutEffect);
            } else {
                this.showFadeOutEffect();
            };
        }
        private function showFadeOutEffect():void{
            CommonUtil.addTimerLaterCall(300, this.fadeOutEffect.play);
        }
        private function _CardArousalEffect_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectEnd", this.__fadeInEffect_effectEnd);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectEnd(_arg1:EffectEvent):void{
            this.showArousalSwfEffect();
        }
        private function _CardArousalEffect_Fade2_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 1;
            _local1.alphaTo = 0;
            _local1.addEventListener("effectEnd", this.__fadeOutEffect_effectEnd);
            this.fadeOutEffect = _local1;
            BindingManager.executeBindings(this, "fadeOutEffect", this.fadeOutEffect);
            return (_local1);
        }
        public function __fadeOutEffect_effectEnd(_arg1:EffectEvent):void{
            callLater(this.removeSelf);
        }
        private function _CardArousalEffect_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardArousalEffect_MonsterCardImage1_i():MonsterCardImage{
            var _local1:MonsterCardImage = new MonsterCardImage();
            _local1.visible = false;
            _local1.x = 0x0202;
            _local1.y = 232;
            _local1.scaleX = 3;
            _local1.scaleY = 3;
            _local1.id = "newCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newCard = _local1;
            BindingManager.executeBindings(this, "newCard", this.newCard);
            return (_local1);
        }
        private function _CardArousalEffect_MonsterCardImage2_i():MonsterCardImage{
            var _local1:MonsterCardImage = new MonsterCardImage();
            _local1.x = 0x0202;
            _local1.y = 232;
            _local1.scaleX = 3;
            _local1.scaleY = 3;
            _local1.id = "oldCard";
            if (!_local1.document){
                _local1.document = this;
            };
            this.oldCard = _local1;
            BindingManager.executeBindings(this, "oldCard", this.oldCard);
            return (_local1);
        }
        public function ___CardArousalEffect_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        private function _CardArousalEffect_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (CombatStageDepthInfo.DEPTH_OF_CARD_AROUSAL);
            }, null, "this.depth");
            result[1] = new Binding(this, null, null, "fadeInEffect.target", "oldCard");
            result[2] = new Binding(this, function ():Number{
                return (FADE_IN_DURATION);
            }, null, "fadeInEffect.duration");
            result[3] = new Binding(this, null, null, "fadeOutEffect.target", "newCard");
            result[4] = new Binding(this, function ():Number{
                return (FADE_OUT_DURATION);
            }, null, "fadeOutEffect.duration");
            return (result);
        }
        public function get fadeInEffect():Fade{
            return (this._1020166578fadeInEffect);
        }
        public function set fadeInEffect(_arg1:Fade):void{
            var _local2:Object = this._1020166578fadeInEffect;
            if (_local2 !== _arg1){
                this._1020166578fadeInEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeInEffect", _local2, _arg1));
                };
            };
        }
        public function get fadeOutEffect():Fade{
            return (this._733607779fadeOutEffect);
        }
        public function set fadeOutEffect(_arg1:Fade):void{
            var _local2:Object = this._733607779fadeOutEffect;
            if (_local2 !== _arg1){
                this._733607779fadeOutEffect = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutEffect", _local2, _arg1));
                };
            };
        }
        public function get newCard():MonsterCardImage{
            return (this._1844693200newCard);
        }
        public function set newCard(_arg1:MonsterCardImage):void{
            var _local2:Object = this._1844693200newCard;
            if (_local2 !== _arg1){
                this._1844693200newCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newCard", _local2, _arg1));
                };
            };
        }
        public function get oldCard():MonsterCardImage{
            return (this._1379913257oldCard);
        }
        public function set oldCard(_arg1:MonsterCardImage):void{
            var _local2:Object = this._1379913257oldCard;
            if (_local2 !== _arg1){
                this._1379913257oldCard = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "oldCard", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

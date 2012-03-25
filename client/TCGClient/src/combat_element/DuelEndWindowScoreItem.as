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
    import flash.utils.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import flash.net.*;
    import achievement_system.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;
	use namespace mx_internal;
    public class DuelEndWindowScoreItem extends Group implements IBindingClient {

        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        public var _DuelEndWindowScoreItem_Label1:Label;
        public var _DuelEndWindowScoreItem_Label2:Label;
        private var _413245038addEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _1017317214descText:String;
        private var _2128961247scoreText:String;
        private var _1456649042descColor:uint = 12949096;
        private var _1557875697scoreColor:uint = 0xFCFC00;
        public var detailInfo:String;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function DuelEndWindowScoreItem(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._DuelEndWindowScoreItem_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_combat_element_DuelEndWindowScoreItemWatcherSetupUtil");
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
            this.width = 400;
            this.height = 50;
            this.layout = this._DuelEndWindowScoreItem_BasicLayout1_c();
            this.mxmlContent = [this._DuelEndWindowScoreItem_Label1_i(), this._DuelEndWindowScoreItem_Label2_i()];
            this._DuelEndWindowScoreItem_Fade1_i();
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            DuelEndWindowScoreItem._watcherSetupUtil = _arg1;
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
                this.fontSize = 25;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        public function setTextByAchievement(_arg1:int, _arg2:Object, _arg3:Boolean):void{
            var _local5:int;
            var _local4:Object = AchievementLib.achievementConfig[_arg1.toString()];
            this.descText = _local4.name;
            for each (_local5 in _arg2) {
                if (_local5 == _arg1){
                    this.descText = (this.descText + "(首次达成)");
                    break;
                };
            };
            this.scoreText = ("+" + (_arg3) ? _local4.score : (_local4.score / 5).toString());
            this.detailInfo = _local4["reach_desc"];
        }
        public function setTextByScoreArg(_arg1:String, _arg2:Number):void{
            switch (_arg1){
                case "buff_10100":
                    this.descText = "双倍积分：";
                    this.scoreText = ("×" + _arg2);
                    this.detailInfo = "双倍积分状态，获取积分翻倍。";
                    break;
                case "below_20":
                    this.descText = "前20次对战加成：";
                    this.scoreText = ("×" + _arg2);
                    this.detailInfo = "每一天的前20次对战有积分加成。";
                    break;
                case "over_40":
                    this.descText = "超40次对战积分扣减：";
                    this.scoreText = ("×" + _arg2);
                    this.detailInfo = "每天对战超过40次则开始扣减得分。";
                    break;
                default:
                    this.descText = _arg1;
                    this.scoreText = ("×" + _arg2);
                    this.detailInfo = "未知状态。";
            };
        }
        private function _DuelEndWindowScoreItem_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.duration = 300;
            _local1.addEventListener("effectEnd", this.__addEffect_effectEnd);
            this.addEffect = _local1;
            BindingManager.executeBindings(this, "addEffect", this.addEffect);
            return (_local1);
        }
        public function __addEffect_effectEnd(_arg1:EffectEvent):void{
            toolTip = this.detailInfo;
            dispatchEvent(new Event("addEffectEnd"));
        }
        private function _DuelEndWindowScoreItem_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _DuelEndWindowScoreItem_Label1_i():Label{
            var _local1:Label = new Label();
            _local1.percentHeight = 100;
            _local1.width = 280;
            _local1.setStyle("textAlign", "center");
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontFamily", "黑体");
            _local1.id = "_DuelEndWindowScoreItem_Label1";
            if (!_local1.document){
                _local1.document = this;
            };
            this._DuelEndWindowScoreItem_Label1 = _local1;
            BindingManager.executeBindings(this, "_DuelEndWindowScoreItem_Label1", this._DuelEndWindowScoreItem_Label1);
            return (_local1);
        }
        private function _DuelEndWindowScoreItem_Label2_i():Label{
            var _local1:Label = new Label();
            _local1.x = 280;
            _local1.percentHeight = 100;
            _local1.setStyle("verticalAlign", "middle");
            _local1.setStyle("fontSize", 30);
            _local1.setStyle("fontFamily", "Georgia");
            _local1.setStyle("fontWeight", "bold");
            _local1.id = "_DuelEndWindowScoreItem_Label2";
            if (!_local1.document){
                _local1.document = this;
            };
            this._DuelEndWindowScoreItem_Label2 = _local1;
            BindingManager.executeBindings(this, "_DuelEndWindowScoreItem_Label2", this._DuelEndWindowScoreItem_Label2);
            return (_local1);
        }
        private function _DuelEndWindowScoreItem_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (this);
            }, null, "addEffect.target");
            result[1] = new Binding(this, null, null, "_DuelEndWindowScoreItem_Label1.text", "descText");
            result[2] = new Binding(this, null, function (_arg1:uint):void{
                _DuelEndWindowScoreItem_Label1.setStyle("color", _arg1);
            }, "_DuelEndWindowScoreItem_Label1.color", "descColor");
            result[3] = new Binding(this, null, null, "_DuelEndWindowScoreItem_Label2.text", "scoreText");
            result[4] = new Binding(this, null, function (_arg1:uint):void{
                _DuelEndWindowScoreItem_Label2.setStyle("color", _arg1);
            }, "_DuelEndWindowScoreItem_Label2.color", "scoreColor");
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
        public function get descText():String{
            return (this._1017317214descText);
        }
        public function set descText(_arg1:String):void{
            var _local2:Object = this._1017317214descText;
            if (_local2 !== _arg1){
                this._1017317214descText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descText", _local2, _arg1));
                };
            };
        }
        public function get scoreText():String{
            return (this._2128961247scoreText);
        }
        public function set scoreText(_arg1:String):void{
            var _local2:Object = this._2128961247scoreText;
            if (_local2 !== _arg1){
                this._2128961247scoreText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreText", _local2, _arg1));
                };
            };
        }
        public function get descColor():uint{
            return (this._1456649042descColor);
        }
        public function set descColor(_arg1:uint):void{
            var _local2:Object = this._1456649042descColor;
            if (_local2 !== _arg1){
                this._1456649042descColor = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "descColor", _local2, _arg1));
                };
            };
        }
        public function get scoreColor():uint{
            return (this._1557875697scoreColor);
        }
        public function set scoreColor(_arg1:uint):void{
            var _local2:Object = this._1557875697scoreColor;
            if (_local2 !== _arg1){
                this._1557875697scoreColor = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "scoreColor", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

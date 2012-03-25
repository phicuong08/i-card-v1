//Created by Action Script Viewer - http://www.buraks.com/asv
package beginner_guide {
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
    import task_guide.*;
    import custom_effect.*;
    import flashx.textLayout.elements.*;
    import SoundSystem.*;
    import flash.utils.*;
    import combat_element_script.*;
    import flash.accessibility.*;
    import mx.filters.*;
    import flash.ui.*;
    import tool.*;
    import flash.net.*;
    import flash.external.*;
    import flash.debugger.*;
    import flash.errors.*;
    import flash.printing.*;
    import flash.profiler.*;
    import flash.xml.*;

    public class NoticeWindowBase extends Group implements IBeginnerGuideOperation, IBindingClient {
		use namespace mx_internal;
        private static var _watcherSetupUtil:IWatcherSetupUtil2;

        private var _1020166578fadeInEffect:Fade;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var noticeInfo:Object;
        protected var gl:GuideLineWindow;
        protected var _1312067479tipFlow:TextFlow;
        protected var _206020127btnMode:int = 1;
        protected var _110371416title:String;
        protected var _2097843112btnText1:String = "确认";
        protected var _2097843113btnText2:String = "是";
        protected var _2097843114btnText3:String = "否";
        protected var _352362778fadeOutDuration:int = 300;
        protected var _1328675157addDuration:int = 500;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		public var __slot1;
        public function NoticeWindowBase(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._NoticeWindowBase_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_beginner_guide_NoticeWindowBaseWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (NoticeWindowBase[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.mouseChildren = false;
            this._NoticeWindowBase_Fade1_i();
            this.addEventListener("creationComplete", this.___NoticeWindowBase_Group1_creationComplete);
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            NoticeWindowBase._watcherSetupUtil = _arg1;
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
                this.color = 16767396;
            };
        }
        override public function initialize():void{
            super.initialize();
        }
        protected function setGuideLine():void{
            var _local4:int;
            var _local7:Number;
            var _local9:MouseFlashSign;
            var _local10:ArrowFlashSign;
            if (((!(this.noticeInfo)) || (!(this.noticeInfo["guideLineX"])))){
                return;
            };
            var _local1:Point = TCGClient.getInstance().mainGroup.localToGlobal(new Point(this.noticeInfo["guideLineX"], this.noticeInfo["guideLineY"]));
            var _local2:Point = globalToLocal(_local1);
            if (!this.gl){
                this.gl = new GuideLineWindow();
                addElement(this.gl);
            };
            var _local3:int = this.getGuideLineStartPoint().x;
            _local4 = this.getGuideLineStartPoint().y;
            var _local5:int = _local2.x;
            var _local6:int = _local2.y;
            _local7 = (_local5 - _local3);
            var _local8:Number = (_local6 - _local4);
            this.gl.depth = -1;
            this.gl.x = _local3;
            this.gl.y = _local4;
            this.gl.width = Math.sqrt(((_local7 * _local7) + (_local8 * _local8)));
            this.gl.rotation = ((Math.atan2(_local8, _local7) * 180) / Math.PI);
            if (this.noticeInfo["mouseSign"]){
                _local9 = new MouseFlashSign();
                _local9.x = _local2.x;
                _local9.y = _local2.y;
                addElement(_local9);
            } else {
                if (this.noticeInfo["arrowSign"]){
                    _local10 = new ArrowFlashSign();
                    _local10.x = (_local2.x - 22);
                    _local10.y = (_local2.y - 44);
                    addElement(_local10);
                };
            };
        }
        protected function getGuideLineStartPoint():Point{
            return (new Point(270, 60));
        }
        protected function setTipContent(_arg1:String):void{
            this.tipFlow = StringUtils.createTFByHtmlText(_arg1);
        }
        public function removeSelf():void{
            var _local1:* = parent;
            if (_local1){
                _local1.removeElement(this);
            };
            if (this.noticeInfo["disableActionList"]){
                CombatConsole.getInstance().enableActionList = true;
            };
        }
        protected function confirmBtn_clickHandler(_arg1:MouseEvent):void{
            this.btnRemoveCheck();
            BeginnerGuideUtil.dispatchLuaEvent(this.noticeInfo["eventName"], {message:"yes"});
        }
        protected function yesBtn_clickHandler(_arg1:MouseEvent):void{
            this.btnRemoveCheck();
            BeginnerGuideUtil.dispatchLuaEvent(this.noticeInfo["eventName"], {message:"yes"});
        }
        protected function noBtn_clickHandler(_arg1:MouseEvent):void{
            this.btnRemoveCheck();
            BeginnerGuideUtil.dispatchLuaEvent(this.noticeInfo["eventName"], {message:"no"});
        }
        protected function btnRemoveCheck():void{
            if (!this.noticeInfo["no_btn_remove"]){
                BeginnerGuideUtil.removeOperationByOp(this);
            };
        }
        public function setInfo(_arg1:Object):void{
            this.noticeInfo = _arg1;
            this.title = this.noticeInfo["title"];
            if (this.noticeInfo["content"]){
                this.setTipContent(this.noticeInfo["content"]);
            };
            this.btnMode = this.noticeInfo["btnMode"];
            if (this.noticeInfo["x"]){
                x = this.noticeInfo["x"];
            };
            if (this.noticeInfo["y"]){
                y = this.noticeInfo["y"];
            };
            if (this.noticeInfo["width"]){
                width = this.noticeInfo["width"];
            };
            if (this.noticeInfo["height"]){
                height = this.noticeInfo["height"];
            };
            if (this.noticeInfo["btnText1"]){
                this.btnText1 = this.noticeInfo["btnText1"];
            };
            if (this.noticeInfo["btnText2"]){
                this.btnText2 = this.noticeInfo["btnText2"];
            };
            if (this.noticeInfo["btnText3"]){
                this.btnText3 = this.noticeInfo["btnText3"];
            };
            if (this.noticeInfo["fadeOutDuration"]){
                this.fadeOutDuration = this.noticeInfo["fadeOutDuration"];
            };
            if (this.noticeInfo["addDuration"]){
                this.addDuration = this.noticeInfo["addDuration"];
            };
            if (this.noticeInfo["disableActionList"]){
                CombatConsole.getInstance().enableActionList = false;
            };
        }
        protected function addEffectStartHandler():void{
            var _local1:Scale;
            var _local2:Move;
            if (this.noticeInfo["fromX"] != null){
                _local1 = new Scale(this);
                _local1.scaleXFrom = 0;
                _local1.scaleYFrom = 0;
                _local1.scaleXTo = 1;
                _local1.scaleYTo = 1;
                _local1.duration = this.noticeInfo["addDuration"];
                _local1.play();
                _local2 = new Move(this);
                _local2.xFrom = this.noticeInfo["fromX"];
                _local2.yFrom = this.noticeInfo["fromY"];
                _local2.xTo = x;
                _local2.yTo = y;
                _local2.duration = this.noticeInfo["addDuration"];
                x = _local2.xFrom;
                y = _local2.yFrom;
                _local2.play();
            };
        }
        public function removeOperation(_arg1:Object=null):void{
            var fadeOutEffect:* = null;
            var endHandler:* = null;
            var param = _arg1;
            endHandler = function (_arg1:CustomEffectEvent):void{
                fadeOutEffect.removeEventListener(CustomEffectEvent.END, endHandler);
                removeSelf();
            };
            var fakeImgBd:* = new BitmapData(width, height, true, 0);
            fakeImgBd.draw(this);
            var u:* = new UIComponent();
            u.addChild(new Bitmap(fakeImgBd));
            this.removeAllElements();
            this.addElement(u);
            fadeOutEffect = new FadeEffect(this, this.fadeOutDuration, 1, 0);
            fadeOutEffect.play();
            fadeOutEffect.addEventListener(CustomEffectEvent.END, endHandler);
        }
        public function doCmd(_arg1:Object=null){
            var _local2:Scale;
            var _local3:Move;
            if (_arg1.type == "scale"){
                _local2 = new Scale(this);
                _local2.duration = _arg1.duration;
                _local2.scaleXTo = _arg1.scaleX;
                _local2.scaleYTo = _arg1.scaleY;
                _local2.play();
            } else {
                if (_arg1.type == "move"){
                    _local3 = new Move(this);
                    _local3.duration = _arg1.duration;
                    _local3.xTo = _arg1.xTo;
                    _local3.yTo = _arg1.yTo;
                    _local3.play();
                };
            };
        }
        private function _NoticeWindowBase_Fade1_i():Fade{
            var _local1:Fade = new Fade();
            _local1.alphaFrom = 0;
            _local1.alphaTo = 1;
            _local1.addEventListener("effectStart", this.__fadeInEffect_effectStart);
            _local1.addEventListener("effectEnd", this.__fadeInEffect_effectEnd);
            this.fadeInEffect = _local1;
            BindingManager.executeBindings(this, "fadeInEffect", this.fadeInEffect);
            return (_local1);
        }
        public function __fadeInEffect_effectStart(_arg1:EffectEvent):void{
            SoundMgr.getInstance().playEffectSound("window_show");
            this.addEffectStartHandler();
        }
        public function __fadeInEffect_effectEnd(_arg1:EffectEvent):void{
            mouseChildren = true;
        }
        public function ___NoticeWindowBase_Group1_creationComplete(_arg1:FlexEvent):void{
            this.setGuideLine();
        }
        private function _NoticeWindowBase_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Number{
                return (BeginnerGuideUtil.NOTICE_WINDOW_DEPTH);
            }, null, "this.depth");
            result[1] = new Binding(this, null, function (_arg1):void{
                this.setStyle("addedEffect", _arg1);
            }, "this.addedEffect", "fadeInEffect");
            result[2] = new Binding(this, function ():Number{
                return (addDuration);
            }, null, "fadeInEffect.duration");
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
        protected function get tipFlow():TextFlow{
            return (this._1312067479tipFlow);
        }
        protected function set tipFlow(_arg1:TextFlow):void{
            var _local2:Object = this._1312067479tipFlow;
            if (_local2 !== _arg1){
                this._1312067479tipFlow = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tipFlow", _local2, _arg1));
                };
            };
        }
        protected function get btnMode():int{
            return (this._206020127btnMode);
        }
        protected function set btnMode(_arg1:int):void{
            var _local2:Object = this._206020127btnMode;
            if (_local2 !== _arg1){
                this._206020127btnMode = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnMode", _local2, _arg1));
                };
            };
        }
        protected function get title():String{
            return (this._110371416title);
        }
        protected function set title(_arg1:String):void{
            var _local2:Object = this._110371416title;
            if (_local2 !== _arg1){
                this._110371416title = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "title", _local2, _arg1));
                };
            };
        }
        protected function get btnText1():String{
            return (this._2097843112btnText1);
        }
        protected function set btnText1(_arg1:String):void{
            var _local2:Object = this._2097843112btnText1;
            if (_local2 !== _arg1){
                this._2097843112btnText1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnText1", _local2, _arg1));
                };
            };
        }
        protected function get btnText2():String{
            return (this._2097843113btnText2);
        }
        protected function set btnText2(_arg1:String):void{
            var _local2:Object = this._2097843113btnText2;
            if (_local2 !== _arg1){
                this._2097843113btnText2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnText2", _local2, _arg1));
                };
            };
        }
        protected function get btnText3():String{
            return (this._2097843114btnText3);
        }
        protected function set btnText3(_arg1:String):void{
            var _local2:Object = this._2097843114btnText3;
            if (_local2 !== _arg1){
                this._2097843114btnText3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "btnText3", _local2, _arg1));
                };
            };
        }
        protected function get fadeOutDuration():int{
            return (this._352362778fadeOutDuration);
        }
        protected function set fadeOutDuration(_arg1:int):void{
            var _local2:Object = this._352362778fadeOutDuration;
            if (_local2 !== _arg1){
                this._352362778fadeOutDuration = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "fadeOutDuration", _local2, _arg1));
                };
            };
        }
        protected function get addDuration():int{
            return (this._1328675157addDuration);
        }
        protected function set addDuration(_arg1:int):void{
            var _local2:Object = this._1328675157addDuration;
            if (_local2 !== _arg1){
                this._1328675157addDuration = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "addDuration", _local2, _arg1));
                };
            };
        }

    }
}//package beginner_guide 

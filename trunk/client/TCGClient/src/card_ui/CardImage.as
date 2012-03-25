//Created by Action Script Viewer - http://www.buraks.com/asv
package card_ui {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import mx.states.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import flash.system.*;
    import flash.media.*;
    import spark.layouts.*;
    import combat_element.*;
    import flash.utils.*;
    import item_system.*;
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

    public class CardImage extends Group implements IBindingClient, IStateClient2 {

		use namespace mx_internal;
        public static const CREATION_COMPLETE:String = "creation_complete";

        private static var _watcherSetupUtil:IWatcherSetupUtil2;
		public var __slot1;
        private var _1591099386positiveGroup:Group;
        private var _1521788577reversedImg:MyImage;
        private var __moduleFactoryInitialized:Boolean = false;
        private var _3469809rImg;
        public var alwaysUseSmallFontSize:Boolean = false;
        public var cardId:String = "0";
        public var cardInfo:Object;
        public var creationHasComplete:Boolean = false;
        public var markWindow:MarksWindow;
        public var buffWindow:CardBuffWindow;
        public var markType:String = "令";
        public var monsterImage:MonsterCardImage;
        public var magicImage:MagicCardImage;
        private var _attribInfo:Array;
        public var currentStr:int;
        public var currentInt:int;
        mx_internal var _bindings:Array;
        mx_internal var _watchers:Array;
        mx_internal var _bindingsByDestination:Object;
        mx_internal var _bindingsBeginWithWord:Object;
		
        public function CardImage(){
            var target:* = null;
            var watcherSetupUtilClass:* = null;
            this._bindings = [];
            this._watchers = [];
            this._bindingsByDestination = {};
            this._bindingsBeginWithWord = {};
            super();
            var bindings:* = this._CardImage_bindingsSetup();
            var watchers:* = [];
            target = this;
            if (_watcherSetupUtil == null){
                watcherSetupUtilClass = getDefinitionByName("_card_ui_CardImageWatcherSetupUtil");
                var _local2 = watcherSetupUtilClass;
                _local2["init"](null);
            };
            _watcherSetupUtil.setup(this, function (_arg1:String){
                return (target[_arg1]);
            }, function (_arg1:String){
                return (CardImage[_arg1]);
            }, bindings, watchers);
            mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
            mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
            this.width = 84;
            this.height = 112;
            this.layout = this._CardImage_BasicLayout1_c();
            this.mxmlContent = [];
            this.currentState = "positive";
            var _CardImage_Group2_factory:* = new DeferredInstanceFromFunction(this._CardImage_Group2_i);
            var _CardImage_MyImage1_factory:* = new DeferredInstanceFromFunction(this._CardImage_MyImage1_i);
            states = [new State({
                name:"positive",
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_CardImage_Group2_factory,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"first"
                })]
            }), new State({
                name:"reversed",
                overrides:[new AddItems().initializeFromObject({
                    itemsFactory:_CardImage_MyImage1_factory,
                    destination:null,
                    propertyName:"mxmlContent",
                    position:"first"
                })]
            })];
            var i:* = 0;
            while (i < bindings.length) {
                Binding(bindings[i]).execute();
                i = (i + 1);
            };
        }
        public static function set watcherSetupUtil(_arg1:IWatcherSetupUtil2):void{
            CardImage._watcherSetupUtil = _arg1;
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
        public function set reversedSource(_arg1):void{
            this.rImg = _arg1;
        }
        public function setCardById(_arg1):void{
            if (this.cardId == _arg1.toString()){
                return;
            };
            this.cardId = _arg1;
            if (this.creationHasComplete){
                this.createCardInfo();
            };
        }
        protected function createCardInfo():void{
            var _local1:*;
            var _local2:*;
            if (this.cardId != "0"){
                this.cardInfo = ItemCardLib.getItemInfoById(this.cardId);
                if (this.cardInfo == null){
                    throw (new Error("id 异常，无法取得相关数据！！"));
                };
                if ((((this.cardInfo["color"] == "silver")) || ((this.cardInfo["color"] == "gold")))){
                    if (!this.monsterImage){
                        this.monsterImage = new MonsterCardImage();
                    };
                    _local1 = this.monsterImage;
                    _local2 = this.magicImage;
                } else {
                    if (!this.magicImage){
                        this.magicImage = new MagicCardImage();
                    };
                    _local1 = this.magicImage;
                    _local2 = this.monsterImage;
                };
                _local1.setCardInfo(this.cardInfo);
                if (this.positiveGroup != _local1.parent){
                    this.positiveGroup.addElement(_local1);
                };
                if (((_local2) && ((this.positiveGroup == _local2.parent)))){
                    this.positiveGroup.removeElement(_local2);
                };
                this.relayoutByScale();
            };
            if (this._attribInfo){
                this.setAttribInfo(this._attribInfo[0], this._attribInfo[1], this._attribInfo[2]);
                this._attribInfo = null;
            };
        }
        public function setAttribInfo(_arg1:int, _arg2:int, _arg3:Boolean=true):void{
            this.currentStr = _arg1;
            this.currentInt = _arg2;
            if (this.creationHasComplete){
                this.monsterImage.setAttribInfo(_arg1, _arg2, _arg3);
            } else {
                this._attribInfo = [_arg1, _arg2, _arg3];
            };
        }
        public function set isPositive(_arg1:Boolean):void{
            if (_arg1 == this.isPositive){
                return;
            };
            if (_arg1){
                setCurrentState("positive", true);
            } else {
                setCurrentState("reversed", true);
            };
        }
        public function get isPositive():Boolean{
            return ((currentState == "positive"));
        }
        public function setMark(_arg1:int):void{
            if (this.markWindow == null){
                this.markWindow = new MarksWindow();
                this.markWindow.wordCircle.wordText = this.markType;
                this.markWindow.scaleX = 0.5;
                this.markWindow.scaleY = 0.5;
                this.markWindow.x = 8;
                this.markWindow.y = 69;
                this.markWindow.addEventListener("rollToZero", this.removeMark);
                this.positiveGroup.addElement(this.markWindow);
            };
            this.markWindow.toNum = _arg1;
        }
        public function setMarkType(_arg1:String):void{
            switch (_arg1){
                case "ling":
                    this.markType = "令";
                    break;
                case "hun":
                    this.markType = "魂";
                    break;
                case "yu":
                    this.markType = "羽";
                    break;
                case "shang":
                    this.markType = "伤";
                    break;
                default:
                    this.markType = _arg1;
            };
        }
        public function removeMark(_arg1:Event=null):void{
            if (this.markWindow != null){
                this.markWindow.removeEventListener("rollToZero", this.removeMark);
                this.positiveGroup.removeElement(this.markWindow);
                this.markWindow = null;
            };
        }
        public function addBuff(_arg1):void{
            if (this.buffWindow == null){
                this.buffWindow = new CardBuffWindow();
                this.buffWindow.x = 15;
                this.buffWindow.y = 20;
                this.positiveGroup.addElement(this.buffWindow);
            };
            this.buffWindow.addBuff(_arg1);
        }
        public function removeAllBuff():void{
            if (this.buffWindow != null){
                this.buffWindow.removeAllBuff();
            };
        }
        public function removeBuff(_arg1:String):void{
            if (this.buffWindow != null){
                this.buffWindow.removeBuff(_arg1);
            };
        }
        public function relayoutByScale():void{
            var _local1:int;
            if ((((scaleY > 1)) || (this.alwaysUseSmallFontSize))){
                _local1 = 10;
            } else {
                _local1 = 12;
            };
            if (this.monsterImage){
                this.monsterImage.setStyle("fontSize", _local1);
                this.monsterImage.strInfo.setStyle("fontSize", (_local1 + 2));
                this.monsterImage.intInfo.setStyle("fontSize", (_local1 + 2));
            };
            if (this.magicImage){
                this.magicImage.setStyle("fontSize", _local1);
            };
        }
        private function _CardImage_BasicLayout1_c():BasicLayout{
            var _local1:BasicLayout = new BasicLayout();
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CardImage_MyImage1_i():MyImage{
            var _local1:MyImage = new MyImage();
            _local1.width = 84;
            _local1.height = 112;
            _local1.id = "reversedImg";
            if (!_local1.document){
                _local1.document = this;
            };
            this.reversedImg = _local1;
            BindingManager.executeBindings(this, "reversedImg", this.reversedImg);
            return (_local1);
        }
        private function _CardImage_Group2_i():Group{
            var _local1:Group;
            _local1 = new Group();
            _local1.mouseChildren = false;
            _local1.width = 84;
            _local1.height = 112;
            _local1.addEventListener("creationComplete", this.__positiveGroup_creationComplete);
            _local1.id = "positiveGroup";
            if (!_local1.document){
                _local1.document = this;
            };
            this.positiveGroup = _local1;
            BindingManager.executeBindings(this, "positiveGroup", this.positiveGroup);
            return (_local1);
        }
        public function __positiveGroup_creationComplete(_arg1:FlexEvent):void{
            this.creationHasComplete = true;
            this.createCardInfo();
            dispatchEvent(new Event(CREATION_COMPLETE));
        }
        private function _CardImage_bindingsSetup():Array{
            var result:* = [];
            result[0] = new Binding(this, function ():Object{
                return (rImg);
            }, null, "reversedImg.source");
            return (result);
        }
        public function get positiveGroup():Group{
            return (this._1591099386positiveGroup);
        }
        public function set positiveGroup(_arg1:Group):void{
            var _local2:Object = this._1591099386positiveGroup;
            if (_local2 !== _arg1){
                this._1591099386positiveGroup = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "positiveGroup", _local2, _arg1));
                };
            };
        }
        public function get reversedImg():MyImage{
            return (this._1521788577reversedImg);
        }
        public function set reversedImg(_arg1:MyImage):void{
            var _local2:Object = this._1521788577reversedImg;
            if (_local2 !== _arg1){
                this._1521788577reversedImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "reversedImg", _local2, _arg1));
                };
            };
        }
        private function get rImg(){
            return (this._3469809rImg);
        }
        private function set rImg(_arg1):void{
            var _local2:Object = this._3469809rImg;
            if (_local2 !== _arg1){
                this._3469809rImg = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "rImg", _local2, _arg1));
                };
            };
        }

    }
}//package card_ui 

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
    import custom_effect.*;
    import SoundSystem.*;
    import flash.utils.*;
    import player_view.*;
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

    public class CombatStageHeadWindowBase extends Group {

        private var __moduleFactoryInitialized:Boolean = false;
        protected var currentHpNum:int;
        protected var currentFoodNum:int = 3;
        private var _1115960181headName:String;
        private var _1460419099headSource;
        private var _1089847805headTooltip:String;
        protected var _75594803foodLabelColor:uint;
        protected var actionArray:Array;
        protected var actionTimer:Timer;

        public function CombatStageHeadWindowBase(){
            this.actionArray = new Array();
            this.actionTimer = new Timer(400, 1);
            super();
            this.width = 217;
            this.height = 183;
            this.addEventListener("creationComplete", this.___CombatStageHeadWindowBase_Group1_creationComplete);
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
        public function playHeadCrossFadeEffect():void{
            var _local1:FakeFadeEffect;
            if (this.head){
                _local1 = new FakeFadeEffect(this.head, 500, 1, 0);
                _local1.play();
            };
        }
        public function changeHpNum(_arg1:int):void{
            var _local2:int = this.currentHpNum;
            this.currentHpNum = (this.currentHpNum + _arg1);
            this.currentHpNum = ((this.currentHpNum > 0)) ? this.currentHpNum : 0;
            this.num1.num = (this.currentHpNum / 10);
            this.num2.num = (this.currentHpNum % 10);
            this.changeColorByNum();
            this.mainFrame.setHpPercent((this.currentHpNum / 20), true, Math.abs(((this.currentHpNum - _local2) * 100)));
        }
        public function setHpNum(_arg1:int):void{
            this.currentHpNum = _arg1;
            this.num1.originalNum = (this.currentHpNum / 10);
            this.num2.originalNum = (this.currentHpNum % 10);
            this.changeColorByNum();
            this.mainFrame.setHpPercent((this.currentHpNum / 20), false);
        }
        protected function changeColorByNum():void{
            this.setStyle("color", ((this.currentHpNum <= 5)) ? 15800344 : 16760129);
        }
        public function changeFoodNum(_arg1:int):void{
            this.actionArray.push(_arg1);
            if (!this.actionTimer.running){
                this.doFoodChangeAction();
            };
        }
        protected function doFoodChangeAction(_arg1=null):void{
            var _local2:int;
            if (this.actionArray.length > 0){
                _local2 = this.actionArray.shift();
                this.currentFoodNum = (this.currentFoodNum + _local2);
                this.currentFoodNum = ((this.currentFoodNum > 0)) ? this.currentFoodNum : 0;
                this.mainFrame.setFoodNum(this.currentFoodNum, true);
                this.showFoodChangeEffect(_local2);
                this.actionTimer.reset();
                this.actionTimer.start();
            };
        }
        protected function showFoodChangeEffect(_arg1:int):void{
        }
        public function setFoodNum(_arg1:int):void{
            this.actionTimer.reset();
            this.actionArray = new Array();
            this.currentFoodNum = _arg1;
            if (this.mainFrame){
                this.mainFrame.setFoodNum(_arg1, false);
            };
        }
        public function reset():void{
            this.setHpNum(20);
            this.setFoodNum(0);
            this.clearClock();
        }
        protected function addHeadMask():void{
            var _local1:UIComponent = new UIComponent();
            addElement(_local1);
            _local1.graphics.beginFill(0);
            _local1.graphics.drawCircle(((this.headGroup.width / 2) + this.headGroup.x), ((this.headGroup.width / 2) + this.headGroup.y), (this.headGroup.width / 2));
            _local1.graphics.endFill();
            this.headGroup.mask = _local1;
        }
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            var setImage:* = null;
            var event:* = _arg1;
            setImage = function (_arg1:Event):void{
                nameFrame.source = CombatStageSourceMgr.getInstance().getSourceClass("nameFrame");
                hpFrame1.source = CombatStageSourceMgr.getInstance().getSourceClass("hp_frame_1");
                hpFrame2.source = CombatStageSourceMgr.getInstance().getSourceClass("hp_frame_2");
            };
            this.actionTimer.addEventListener(TimerEvent.TIMER, this.doFoodChangeAction);
            if (CombatStageSourceMgr.getInstance().loadingComplete){
                setImage(null);
            } else {
                CombatStageSourceMgr.getInstance().addEventListener(Event.COMPLETE, setImage);
            };
        }
        protected function head_clickHandler():void{
            if (this.headName){
                PlayViewMgr.getInstance().showOpMenu(this.headName);
            };
        }
        public function clearClock():void{
            if (this.clock){
                this.clock.clearClock();
            };
        }
        public function stopClock(_arg1:int=-1):void{
            if (this.clock){
                this.clock.stopClock(_arg1);
            };
        }
        public function startClock(_arg1:int, _arg2:int):void{
            if (this.clock){
                this.clock.startDuelClock(_arg1, _arg2);
            };
        }
        public function get headGroup():Group{
            return (this["_headGroup"]);
        }
        public function get head():MyImage{
            return (this["_head"]);
        }
        public function get mainFrame():CombatStageHeadFrame{
            return (this["_mainFrame"]);
        }
        public function get hpImg():SmoothBitmapImage{
            return (this["_hpImg"]);
        }
        public function get nameFrame():SmoothBitmapImage{
            return (this["_nameFrame"]);
        }
        public function get hpFrame1():SmoothBitmapImage{
            return (this["_hpFrame1"]);
        }
        public function get hpFrame2():SmoothBitmapImage{
            return (this["_hpFrame2"]);
        }
        public function get num1():OneRollNum{
            return (this["_num1"]);
        }
        public function get num2():OneRollNum{
            return (this["_num2"]);
        }
        public function get clock():DuelCountDownClock{
            return (this["_clock"]);
        }
        public function ___CombatStageHeadWindowBase_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function get headName():String{
            return (this._1115960181headName);
        }
        public function set headName(_arg1:String):void{
            var _local2:Object = this._1115960181headName;
            if (_local2 !== _arg1){
                this._1115960181headName = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headName", _local2, _arg1));
                };
            };
        }
        public function get headSource(){
            return (this._1460419099headSource);
        }
        public function set headSource(_arg1):void{
            var _local2:Object = this._1460419099headSource;
            if (_local2 !== _arg1){
                this._1460419099headSource = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headSource", _local2, _arg1));
                };
            };
        }
        public function get headTooltip():String{
            return (this._1089847805headTooltip);
        }
        public function set headTooltip(_arg1:String):void{
            var _local2:Object = this._1089847805headTooltip;
            if (_local2 !== _arg1){
                this._1089847805headTooltip = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "headTooltip", _local2, _arg1));
                };
            };
        }
        protected function get foodLabelColor():uint{
            return (this._75594803foodLabelColor);
        }
        protected function set foodLabelColor(_arg1:uint):void{
            var _local2:Object = this._75594803foodLabelColor;
            if (_local2 !== _arg1){
                this._75594803foodLabelColor = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "foodLabelColor", _local2, _arg1));
                };
            };
        }

    }
}//package combat_element 

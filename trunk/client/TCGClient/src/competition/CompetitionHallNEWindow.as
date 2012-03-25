//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import spark.components.*;
    import mx.binding.*;
    import custom_control1.*;
    import ui_element.*;
    import spark.filters.*;
    import flash.utils.*;
    import skins.*;

    public class CompetitionHallNEWindow extends CompetitionHallStateWindow {

        private var _459629615competitionRankBtn:Button;
        private var _473529856competitionResultBtn:Button;
        private var _158984897leftTimeText:RichText;
        private var _1316769434startBtn:UniversalImageButton;
        private var _3560248tips:RichText;
        private var __moduleFactoryInitialized:Boolean = false;
        protected var timer:Timer;

        public function CompetitionHallNEWindow(){
            this.timer = new Timer(1000);
            super();
            this.width = 0x0500;
            this.height = 800;
            this.mxmlContent = [this._CompetitionHallNEWindow_CommonOuterFrame1_c(), this._CompetitionHallNEWindow_CommonMiddleFrame1_c(), this._CompetitionHallNEWindow_Label1_c(), this._CompetitionHallNEWindow_RichText1_i(), this._CompetitionHallNEWindow_Button1_i(), this._CompetitionHallNEWindow_Button2_i(), this._CompetitionHallNEWindow_CommonOuterFrame2_c(), this._CompetitionHallNEWindow_CommonMiddleFrame2_c(), this._CompetitionHallNEWindow_Label2_c(), this._CompetitionHallNEWindow_RichText2_i(), this._CompetitionHallNEWindow_UniversalImageButton1_i()];
            this.addEventListener("creationComplete", this.___CompetitionHallNEWindow_CompetitionHallStateWindow1_creationComplete);
            this.addEventListener("addedToStage", this.___CompetitionHallNEWindow_CompetitionHallStateWindow1_addedToStage);
            this.addEventListener("removedFromStage", this.___CompetitionHallNEWindow_CompetitionHallStateWindow1_removedFromStage);
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
        protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
        }
        protected function startBtn_clickHandler(_arg1:MouseEvent):void{
        }
        protected function competitionResultBtn_clickHandler(_arg1:MouseEvent):void{
        }
        protected function competitionRankBtn_clickHandler(_arg1:MouseEvent):void{
        }
        protected function competitionhallstatewindow1_addedToStageHandler(_arg1:Event):void{
            this.timer.addEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.start();
        }
        protected function competitionhallstatewindow1_removedFromStageHandler(_arg1:Event):void{
            this.timer.removeEventListener(TimerEvent.TIMER, this.timerHandler);
            this.timer.stop();
        }
        protected function timerHandler(_arg1:TimerEvent):void{
        }
        private function _CompetitionHallNEWindow_CommonOuterFrame1_c():CommonOuterFrame{
            var _local1:CommonOuterFrame = new CommonOuterFrame();
            _local1.x = 365;
            _local1.y = 145;
            _local1.width = 550;
            _local1.height = 270;
            _local1.filters = [this._CompetitionHallNEWindow_DropShadowFilter1_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_DropShadowFilter1_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_CommonMiddleFrame1_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame;
            _local1 = new CommonMiddleFrame();
            _local1.x = 387;
            _local1.y = 185;
            _local1.width = 506;
            _local1.height = 208;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_Label1_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 550;
            _local1.y = 154;
            _local1.text = "竞  赛  说  明";
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("fontWeight", "bold");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_RichText1_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 425;
            _local1.y = 207;
            _local1.setStyle("lineHeight", 25);
            _local1.setStyle("fontSize", 16);
            _local1.setStyle("color", 16767396);
            _local1.id = "tips";
            if (!_local1.document){
                _local1.document = this;
            };
            this.tips = _local1;
            BindingManager.executeBindings(this, "tips", this.tips);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_Button1_i():Button{
            var _local1:Button = new Button();
            _local1.label = "竞赛结果";
            _local1.x = 481;
            _local1.y = 350;
            _local1.width = 90;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__competitionResultBtn_click);
            _local1.id = "competitionResultBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.competitionResultBtn = _local1;
            BindingManager.executeBindings(this, "competitionResultBtn", this.competitionResultBtn);
            return (_local1);
        }
        public function __competitionResultBtn_click(_arg1:MouseEvent):void{
            this.competitionResultBtn_clickHandler(_arg1);
        }
        private function _CompetitionHallNEWindow_Button2_i():Button{
            var _local1:Button;
            _local1 = new Button();
            _local1.label = "排行榜";
            _local1.x = 705;
            _local1.y = 350;
            _local1.width = 90;
            _local1.height = 27;
            _local1.setStyle("skinClass", brownNormalButtonSkin);
            _local1.addEventListener("click", this.__competitionRankBtn_click);
            _local1.id = "competitionRankBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.competitionRankBtn = _local1;
            BindingManager.executeBindings(this, "competitionRankBtn", this.competitionRankBtn);
            return (_local1);
        }
        public function __competitionRankBtn_click(_arg1:MouseEvent):void{
            this.competitionRankBtn_clickHandler(_arg1);
        }
        private function _CompetitionHallNEWindow_CommonOuterFrame2_c():CommonOuterFrame{
            var _local1:CommonOuterFrame;
            _local1 = new CommonOuterFrame();
            _local1.x = 365;
            _local1.y = 495;
            _local1.width = 550;
            _local1.height = 190;
            _local1.filters = [this._CompetitionHallNEWindow_DropShadowFilter2_c()];
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_DropShadowFilter2_c():DropShadowFilter{
            var _local1:DropShadowFilter = new DropShadowFilter();
            _local1.distance = 20;
            _local1.alpha = 0.7;
            _local1.angle = 40;
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_CommonMiddleFrame2_c():CommonMiddleFrame{
            var _local1:CommonMiddleFrame = new CommonMiddleFrame();
            _local1.x = 387;
            _local1.y = 535;
            _local1.width = 506;
            _local1.height = 128;
            _local1.alpha = 0.7;
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_Label2_c():Label{
            var _local1:Label;
            _local1 = new Label();
            _local1.x = 550;
            _local1.y = 504;
            _local1.text = "报  名  参  赛";
            _local1.setStyle("color", 16173701);
            _local1.setStyle("fontSize", 25);
            _local1.setStyle("fontWeight", "bold");
            if (!_local1.document){
                _local1.document = this;
            };
            BindingManager.executeBindings(this, "temp", _local1);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_RichText2_i():RichText{
            var _local1:RichText = new RichText();
            _local1.x = 482;
            _local1.y = 553;
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("color", 16767396);
            _local1.id = "leftTimeText";
            if (!_local1.document){
                _local1.document = this;
            };
            this.leftTimeText = _local1;
            BindingManager.executeBindings(this, "leftTimeText", this.leftTimeText);
            return (_local1);
        }
        private function _CompetitionHallNEWindow_UniversalImageButton1_i():UniversalImageButton{
            var _local1:UniversalImageButton = new UniversalImageButton();
            _local1.x = 561;
            _local1.y = 610;
            _local1.label = "报 名 参 赛";
            _local1.btnScale = 1.4;
            _local1.setStyle("fontSize", 18);
            _local1.setStyle("fontWeight", "bold");
            _local1.addEventListener("click", this.__startBtn_click);
            _local1.id = "startBtn";
            if (!_local1.document){
                _local1.document = this;
            };
            this.startBtn = _local1;
            BindingManager.executeBindings(this, "startBtn", this.startBtn);
            return (_local1);
        }
        public function __startBtn_click(_arg1:MouseEvent):void{
            this.startBtn_clickHandler(_arg1);
        }
        public function ___CompetitionHallNEWindow_CompetitionHallStateWindow1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }
        public function ___CompetitionHallNEWindow_CompetitionHallStateWindow1_addedToStage(_arg1:Event):void{
            this.competitionhallstatewindow1_addedToStageHandler(_arg1);
        }
        public function ___CompetitionHallNEWindow_CompetitionHallStateWindow1_removedFromStage(_arg1:Event):void{
            this.competitionhallstatewindow1_removedFromStageHandler(_arg1);
        }
        public function get competitionRankBtn():Button{
            return (this._459629615competitionRankBtn);
        }
        public function set competitionRankBtn(_arg1:Button):void{
            var _local2:Object = this._459629615competitionRankBtn;
            if (_local2 !== _arg1){
                this._459629615competitionRankBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "competitionRankBtn", _local2, _arg1));
                };
            };
        }
        public function get competitionResultBtn():Button{
            return (this._473529856competitionResultBtn);
        }
        public function set competitionResultBtn(_arg1:Button):void{
            var _local2:Object = this._473529856competitionResultBtn;
            if (_local2 !== _arg1){
                this._473529856competitionResultBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "competitionResultBtn", _local2, _arg1));
                };
            };
        }
        public function get leftTimeText():RichText{
            return (this._158984897leftTimeText);
        }
        public function set leftTimeText(_arg1:RichText):void{
            var _local2:Object = this._158984897leftTimeText;
            if (_local2 !== _arg1){
                this._158984897leftTimeText = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "leftTimeText", _local2, _arg1));
                };
            };
        }
        public function get startBtn():UniversalImageButton{
            return (this._1316769434startBtn);
        }
        public function set startBtn(_arg1:UniversalImageButton):void{
            var _local2:Object = this._1316769434startBtn;
            if (_local2 !== _arg1){
                this._1316769434startBtn = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "startBtn", _local2, _arg1));
                };
            };
        }
        public function get tips():RichText{
            return (this._3560248tips);
        }
        public function set tips(_arg1:RichText):void{
            var _local2:Object = this._3560248tips;
            if (_local2 !== _arg1){
                this._3560248tips = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "tips", _local2, _arg1));
                };
            };
        }

    }
}//package competition 

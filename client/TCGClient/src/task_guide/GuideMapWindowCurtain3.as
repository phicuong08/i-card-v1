//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import mx.binding.*;

    public class GuideMapWindowCurtain3 extends GuideMapWindowCurtainBase {

        public static const LAST_GUIDE_SECTION_ID:int = 10000;

        private var _2076671728guideLine:GuideMapLine;
        private var _892368405step10:GuideMapSign;
        private var _892368404step11:GuideMapSign;
        private var _892368403step12:GuideMapSign;
        private var _892368402step13:GuideMapSign;
        private var _892368401step14:GuideMapSign;
        private var _109761260step8:GuideMapSign;
        private var _109761261step9:GuideMapSign;
        private var __moduleFactoryInitialized:Boolean = false;

        public function GuideMapWindowCurtain3(){
            this.mxmlContent = [this._GuideMapWindowCurtain3_GuideMapLine1_i(), this._GuideMapWindowCurtain3_GuideMapSign1_i(), this._GuideMapWindowCurtain3_GuideMapSign2_i(), this._GuideMapWindowCurtain3_GuideMapSign3_i(), this._GuideMapWindowCurtain3_GuideMapSign4_i(), this._GuideMapWindowCurtain3_GuideMapSign5_i(), this._GuideMapWindowCurtain3_GuideMapSign6_i(), this._GuideMapWindowCurtain3_GuideMapSign7_i()];
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
        override protected function group1_creationCompleteHandler(_arg1:FlexEvent):void{
            super.group1_creationCompleteHandler(_arg1);
            this.drawLine();
        }
        override public function get guideSections():Array{
            return ([8, 9, 10, 11, 12, 13, 14]);
        }
        protected function drawLine():void{
            var _local1:Array = new Array();
            _local1.push({
                item1:this.step8,
                item2:this.step10
            });
            _local1.push({
                item1:this.step9,
                item2:this.step11
            });
            _local1.push({
                item1:this.step10,
                item2:this.step11
            });
            _local1.push({
                item1:this.step10,
                item2:this.step12
            });
            _local1.push({
                item1:this.step12,
                item2:this.step13,
                isCornerUp:true
            });
            _local1.push({
                item1:this.step12,
                item2:this.step14,
                isCornerUp:true
            });
            this.guideLine.drawLines(_local1);
        }
        private function _GuideMapWindowCurtain3_GuideMapLine1_i():GuideMapLine{
            var _local1:GuideMapLine = new GuideMapLine();
            _local1.id = "guideLine";
            if (!_local1.document){
                _local1.document = this;
            };
            this.guideLine = _local1;
            BindingManager.executeBindings(this, "guideLine", this.guideLine);
            return (_local1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign1_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 877;
            _local1.y = 164;
            _local1.img = "source/cardImages/651.jpg";
            _local1.toolTip = "吕布偷袭了曹操的后方根据地，准备迎接曹军反扑。";
            _local1.addEventListener("click", this.__step8_click);
            _local1.id = "step8";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step8 = _local1;
            BindingManager.executeBindings(this, "step8", this.step8);
            return (_local1);
        }
        public function __step8_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign2_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 811;
            _local1.y = 547;
            _local1.img = "source/cardImages/82.jpg";
            _local1.toolTip = "孙坚死后，长子孙策投奔了袁术。但久而久之，孙策却不愿始终寄人篱下……";
            _local1.addEventListener("click", this.__step9_click);
            _local1.id = "step9";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step9 = _local1;
            BindingManager.executeBindings(this, "step9", this.step9);
            return (_local1);
        }
        public function __step9_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign3_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 617;
            _local1.y = 335;
            _local1.img = "source/cardImages/7.jpg";
            _local1.toolTip = "要在乱世中立足，曹操必须击败面前的每个敌人——包括拥有第一武力的吕布。";
            _local1.addEventListener("click", this.__step10_click);
            _local1.id = "step10";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step10 = _local1;
            BindingManager.executeBindings(this, "step10", this.step10);
            return (_local1);
        }
        public function __step10_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign4_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 423;
            _local1.y = 547;
            _local1.img = "source/cardImages/751.jpg";
            _local1.toolTip = "战役制作中，近期开放。";
            _local1.addEventListener("click", this.__step11_click);
            _local1.id = "step11";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step11 = _local1;
            BindingManager.executeBindings(this, "step11", this.step11);
            return (_local1);
        }
        public function __step11_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign5_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 367;
            _local1.y = 164;
            _local1.img = "source/cardImages/713.jpg";
            _local1.toolTip = "战役制作中，近期开放。";
            _local1.addEventListener("click", this.__step12_click);
            _local1.id = "step12";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step12 = _local1;
            BindingManager.executeBindings(this, "step12", this.step12);
            return (_local1);
        }
        public function __step12_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign6_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 617;
            _local1.y = 25;
            _local1.img = "source/cardImages/701.jpg";
            _local1.toolTip = "战役制作中，近期开放。";
            _local1.addEventListener("click", this.__step13_click);
            _local1.id = "step13";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step13 = _local1;
            BindingManager.executeBindings(this, "step13", this.step13);
            return (_local1);
        }
        public function __step13_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain3_GuideMapSign7_i():GuideMapSign{
            var _local1:GuideMapSign = new GuideMapSign();
            _local1.x = 115;
            _local1.y = 335;
            _local1.img = "source/cardImages/402.jpg";
            _local1.toolTip = "战役制作中，近期开放。";
            _local1.addEventListener("click", this.__step14_click);
            _local1.id = "step14";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step14 = _local1;
            BindingManager.executeBindings(this, "step14", this.step14);
            return (_local1);
        }
        public function __step14_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        public function get guideLine():GuideMapLine{
            return (this._2076671728guideLine);
        }
        public function set guideLine(_arg1:GuideMapLine):void{
            var _local2:Object = this._2076671728guideLine;
            if (_local2 !== _arg1){
                this._2076671728guideLine = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "guideLine", _local2, _arg1));
                };
            };
        }
        public function get step10():GuideMapSign{
            return (this._892368405step10);
        }
        public function set step10(_arg1:GuideMapSign):void{
            var _local2:Object = this._892368405step10;
            if (_local2 !== _arg1){
                this._892368405step10 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step10", _local2, _arg1));
                };
            };
        }
        public function get step11():GuideMapSign{
            return (this._892368404step11);
        }
        public function set step11(_arg1:GuideMapSign):void{
            var _local2:Object = this._892368404step11;
            if (_local2 !== _arg1){
                this._892368404step11 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step11", _local2, _arg1));
                };
            };
        }
        public function get step12():GuideMapSign{
            return (this._892368403step12);
        }
        public function set step12(_arg1:GuideMapSign):void{
            var _local2:Object = this._892368403step12;
            if (_local2 !== _arg1){
                this._892368403step12 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step12", _local2, _arg1));
                };
            };
        }
        public function get step13():GuideMapSign{
            return (this._892368402step13);
        }
        public function set step13(_arg1:GuideMapSign):void{
            var _local2:Object = this._892368402step13;
            if (_local2 !== _arg1){
                this._892368402step13 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step13", _local2, _arg1));
                };
            };
        }
        public function get step14():GuideMapSign{
            return (this._892368401step14);
        }
        public function set step14(_arg1:GuideMapSign):void{
            var _local2:Object = this._892368401step14;
            if (_local2 !== _arg1){
                this._892368401step14 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step14", _local2, _arg1));
                };
            };
        }
        public function get step8():GuideMapSign{
            return (this._109761260step8);
        }
        public function set step8(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761260step8;
            if (_local2 !== _arg1){
                this._109761260step8 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step8", _local2, _arg1));
                };
            };
        }
        public function get step9():GuideMapSign{
            return (this._109761261step9);
        }
        public function set step9(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761261step9;
            if (_local2 !== _arg1){
                this._109761261step9 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step9", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 

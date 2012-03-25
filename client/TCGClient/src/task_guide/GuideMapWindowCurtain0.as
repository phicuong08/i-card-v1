//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import mx.binding.*;

    public class GuideMapWindowCurtain0 extends GuideMapWindowCurtainBase {

        public static const LAST_GUIDE_SECTION_ID:int = 107;

        private var _2076671728guideLine:GuideMapLine;
        private var _1893616730step101:GuideMapSign;
        private var _1893616729step102:GuideMapSign;
        private var _1893616728step103:GuideMapSign;
        private var _1893616727step104:GuideMapSign;
        private var _1893616726step105:GuideMapSign;
        private var _1893616725step106:GuideMapSign;
        private var _1893616724step107:GuideMapSign;
        private var __moduleFactoryInitialized:Boolean = false;

        public function GuideMapWindowCurtain0(){
            this.mxmlContent = [this._GuideMapWindowCurtain0_GuideMapLine1_i(), this._GuideMapWindowCurtain0_GuideMapSign1_i(), this._GuideMapWindowCurtain0_GuideMapSign2_i(), this._GuideMapWindowCurtain0_GuideMapSign3_i(), this._GuideMapWindowCurtain0_GuideMapSign4_i(), this._GuideMapWindowCurtain0_GuideMapSign5_i(), this._GuideMapWindowCurtain0_GuideMapSign6_i(), this._GuideMapWindowCurtain0_GuideMapSign7_i()];
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
            return ([101, 102, 103, 104, 105, 106, 107]);
        }
        protected function drawLine():void{
            var _local1:Array = new Array();
            _local1.push({
                item1:this.step101,
                item2:this.step102
            });
            _local1.push({
                item1:this.step102,
                item2:this.step103
            });
            _local1.push({
                item1:this.step103,
                item2:this.step104
            });
            _local1.push({
                item1:this.step104,
                item2:this.step105
            });
            _local1.push({
                item1:this.step105,
                item2:this.step106
            });
            _local1.push({
                item1:this.step106,
                item2:this.step107
            });
            this.guideLine.drawLines(_local1);
        }
        private function _GuideMapWindowCurtain0_GuideMapLine1_i():GuideMapLine{
            var _local1:GuideMapLine = new GuideMapLine();
            _local1.id = "guideLine";
            if (!_local1.document){
                _local1.document = this;
            };
            this.guideLine = _local1;
            BindingManager.executeBindings(this, "guideLine", this.guideLine);
            return (_local1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign1_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 954;
            _local1.y = 305;
            _local1.img = "source/cardImages/162.jpg";
            _local1.toolTip = "新手指引：战斗";
            _local1.addEventListener("click", this.__step101_click);
            _local1.id = "step101";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step101 = _local1;
            BindingManager.executeBindings(this, "step101", this.step101);
            return (_local1);
        }
        public function __step101_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign2_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 733;
            _local1.y = 305;
            _local1.img = "source/cardImages/200.jpg";
            _local1.toolTip = "新手指引：出战与战斗";
            _local1.addEventListener("click", this.__step102_click);
            _local1.id = "step102";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step102 = _local1;
            BindingManager.executeBindings(this, "step102", this.step102);
            return (_local1);
        }
        public function __step102_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign3_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 0x0200;
            _local1.y = 305;
            _local1.img = "source/cardImages/167.jpg";
            _local1.toolTip = "新手指引：坚守";
            _local1.addEventListener("click", this.__step103_click);
            _local1.id = "step103";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step103 = _local1;
            BindingManager.executeBindings(this, "step103", this.step103);
            return (_local1);
        }
        public function __step103_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign4_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 0x0200;
            _local1.y = 550;
            _local1.img = "source/cardImages/130.jpg";
            _local1.toolTip = "新手指引：计策卡";
            _local1.addEventListener("click", this.__step104_click);
            _local1.id = "step104";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step104 = _local1;
            BindingManager.executeBindings(this, "step104", this.step104);
            return (_local1);
        }
        public function __step104_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign5_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 291;
            _local1.y = 550;
            _local1.img = "source/cardImages/121.jpg";
            _local1.toolTip = "新手指引：陷阱卡";
            _local1.addEventListener("click", this.__step105_click);
            _local1.id = "step105";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step105 = _local1;
            BindingManager.executeBindings(this, "step105", this.step105);
            return (_local1);
        }
        public function __step105_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign6_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 291;
            _local1.y = 305;
            _local1.img = "source/cardImages/190.jpg";
            _local1.toolTip = "新手指引：克敌";
            _local1.addEventListener("click", this.__step106_click);
            _local1.id = "step106";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step106 = _local1;
            BindingManager.executeBindings(this, "step106", this.step106);
            return (_local1);
        }
        public function __step106_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain0_GuideMapSign7_i():GuideMapSign{
            var _local1:GuideMapSign = new GuideMapSign();
            _local1.x = 291;
            _local1.y = 60;
            _local1.img = "source/cardImages/164.jpg";
            _local1.toolTip = "新手指引：决战";
            _local1.addEventListener("click", this.__step107_click);
            _local1.id = "step107";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step107 = _local1;
            BindingManager.executeBindings(this, "step107", this.step107);
            return (_local1);
        }
        public function __step107_click(_arg1:MouseEvent):void{
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
        public function get step101():GuideMapSign{
            return (this._1893616730step101);
        }
        public function set step101(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616730step101;
            if (_local2 !== _arg1){
                this._1893616730step101 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step101", _local2, _arg1));
                };
            };
        }
        public function get step102():GuideMapSign{
            return (this._1893616729step102);
        }
        public function set step102(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616729step102;
            if (_local2 !== _arg1){
                this._1893616729step102 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step102", _local2, _arg1));
                };
            };
        }
        public function get step103():GuideMapSign{
            return (this._1893616728step103);
        }
        public function set step103(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616728step103;
            if (_local2 !== _arg1){
                this._1893616728step103 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step103", _local2, _arg1));
                };
            };
        }
        public function get step104():GuideMapSign{
            return (this._1893616727step104);
        }
        public function set step104(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616727step104;
            if (_local2 !== _arg1){
                this._1893616727step104 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step104", _local2, _arg1));
                };
            };
        }
        public function get step105():GuideMapSign{
            return (this._1893616726step105);
        }
        public function set step105(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616726step105;
            if (_local2 !== _arg1){
                this._1893616726step105 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step105", _local2, _arg1));
                };
            };
        }
        public function get step106():GuideMapSign{
            return (this._1893616725step106);
        }
        public function set step106(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616725step106;
            if (_local2 !== _arg1){
                this._1893616725step106 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step106", _local2, _arg1));
                };
            };
        }
        public function get step107():GuideMapSign{
            return (this._1893616724step107);
        }
        public function set step107(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616724step107;
            if (_local2 !== _arg1){
                this._1893616724step107 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step107", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 

//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import mx.binding.*;

    public class GuideMapWindowCurtain1 extends GuideMapWindowCurtainBase {

        public static const LAST_GUIDE_SECTION_ID:int = 8;

        private var _2076671728guideLine:GuideMapLine;
        private var _109761253step1:GuideMapSign;
        private var _1893616723step108:GuideMapSign;
        private var _109761254step2:GuideMapSign;
        private var _109761255step3:GuideMapSign;
        private var _109761256step4:GuideMapSign;
        private var _109761257step5:GuideMapSign;
        private var _109761258step6:GuideMapSign;
        private var _109761259step7:GuideMapSign;
        private var __moduleFactoryInitialized:Boolean = false;

        public function GuideMapWindowCurtain1(){
            this.mxmlContent = [this._GuideMapWindowCurtain1_GuideMapLine1_i(), this._GuideMapWindowCurtain1_GuideMapSign1_i(), this._GuideMapWindowCurtain1_GuideMapSign2_i(), this._GuideMapWindowCurtain1_GuideMapSign3_i(), this._GuideMapWindowCurtain1_GuideMapSign4_i(), this._GuideMapWindowCurtain1_GuideMapSign5_i(), this._GuideMapWindowCurtain1_GuideMapSign6_i(), this._GuideMapWindowCurtain1_GuideMapSign7_i(), this._GuideMapWindowCurtain1_GuideMapSign8_i()];
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
            return ([1, 2, 3, 4, 5, 6, 7, 108]);
        }
        protected function drawLine():void{
            var _local1:Array = new Array();
            _local1.push({
                item1:this.step2,
                item2:this.step3
            });
            _local1.push({
                item1:this.step3,
                item2:this.step4
            });
            _local1.push({
                item1:this.step3,
                item2:this.step5
            });
            _local1.push({
                item1:this.step5,
                item2:this.step6
            });
            _local1.push({
                item1:this.step6,
                item2:this.step7
            });
            _local1.push({
                item1:this.step3,
                item2:this.step108
            });
            this.guideLine.drawLines(_local1);
        }
        private function _GuideMapWindowCurtain1_GuideMapLine1_i():GuideMapLine{
            var _local1:GuideMapLine = new GuideMapLine();
            _local1.id = "guideLine";
            if (!_local1.document){
                _local1.document = this;
            };
            this.guideLine = _local1;
            BindingManager.executeBindings(this, "guideLine", this.guideLine);
            return (_local1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign1_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 954;
            _local1.y = 60;
            _local1.img = "source/cardImages/181.jpg";
            _local1.toolTip = "清剿黄巾军的官兵，遇到顽强的抵抗。关羽、张飞赶赴支援。";
            _local1.addEventListener("click", this.__step1_click);
            _local1.id = "step1";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step1 = _local1;
            BindingManager.executeBindings(this, "step1", this.step1);
            return (_local1);
        }
        public function __step1_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign2_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 824;
            _local1.y = 305;
            _local1.img = "source/cardImages/610.jpg";
            _local1.toolTip = "盟军遭遇困局，关公毅然请战。";
            _local1.addEventListener("click", this.__step2_click);
            _local1.id = "step2";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step2 = _local1;
            BindingManager.executeBindings(this, "step2", this.step2);
            return (_local1);
        }
        public function __step2_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign3_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 603;
            _local1.y = 305;
            _local1.img = "source/cardImages/651.jpg";
            _local1.toolTip = "刘、关、张的成名之战。";
            _local1.addEventListener("click", this.__step3_click);
            _local1.id = "step3";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step3 = _local1;
            BindingManager.executeBindings(this, "step3", this.step3);
            return (_local1);
        }
        public function __step3_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign4_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 603;
            _local1.y = 550;
            _local1.img = "source/cardImages/81.jpg";
            _local1.toolTip = "孙坚曾因私藏玉玺遭刘表截击。为了报复，孙坚举兵渡江进攻荆州。";
            _local1.addEventListener("click", this.__step4_click);
            _local1.id = "step4";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step4 = _local1;
            BindingManager.executeBindings(this, "step4", this.step4);
            return (_local1);
        }
        public function __step4_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign5_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 382;
            _local1.y = 305;
            _local1.img = "source/cardImages/11.jpg";
            _local1.toolTip = "曹操为追击董卓连夜进军，遇到了以逸待劳的董卓部队。";
            _local1.addEventListener("click", this.__step5_click);
            _local1.id = "step5";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step5 = _local1;
            BindingManager.executeBindings(this, "step5", this.step5);
            return (_local1);
        }
        public function __step5_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign6_i():GuideMapSign{
            var _local1:GuideMapSign;
            _local1 = new GuideMapSign();
            _local1.x = 161;
            _local1.y = 305;
            _local1.img = "source/cardImages/611.jpg";
            _local1.toolTip = "距离长安只有一步之遥，董卓部队在途中设下坚固的屏障。";
            _local1.addEventListener("click", this.__step6_click);
            _local1.id = "step6";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step6 = _local1;
            BindingManager.executeBindings(this, "step6", this.step6);
            return (_local1);
        }
        public function __step6_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign7_i():GuideMapSign{
            var _local1:GuideMapSign = new GuideMapSign();
            _local1.x = 161;
            _local1.y = 60;
            _local1.img = "source/cardImages/601.jpg";
            _local1.toolTip = "董卓率精兵死守长安，能否突破防线剿除国贼？";
            _local1.addEventListener("click", this.__step7_click);
            _local1.id = "step7";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step7 = _local1;
            BindingManager.executeBindings(this, "step7", this.step7);
            return (_local1);
        }
        public function __step7_click(_arg1:MouseEvent):void{
            clickHandler(_arg1);
        }
        private function _GuideMapWindowCurtain1_GuideMapSign8_i():GuideMapSign{
            var _local1:GuideMapSign = new GuideMapSign();
            _local1.x = 603;
            _local1.y = 60;
            _local1.img = "source/cardImages/778.jpg";
            _local1.toolTip = "袁绍与公孙瓒争夺地盘，在冀州展开了殊死搏斗。";
            _local1.addEventListener("click", this.__step108_click);
            _local1.id = "step108";
            if (!_local1.document){
                _local1.document = this;
            };
            this.step108 = _local1;
            BindingManager.executeBindings(this, "step108", this.step108);
            return (_local1);
        }
        public function __step108_click(_arg1:MouseEvent):void{
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
        public function get step1():GuideMapSign{
            return (this._109761253step1);
        }
        public function set step1(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761253step1;
            if (_local2 !== _arg1){
                this._109761253step1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step1", _local2, _arg1));
                };
            };
        }
        public function get step108():GuideMapSign{
            return (this._1893616723step108);
        }
        public function set step108(_arg1:GuideMapSign):void{
            var _local2:Object = this._1893616723step108;
            if (_local2 !== _arg1){
                this._1893616723step108 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step108", _local2, _arg1));
                };
            };
        }
        public function get step2():GuideMapSign{
            return (this._109761254step2);
        }
        public function set step2(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761254step2;
            if (_local2 !== _arg1){
                this._109761254step2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step2", _local2, _arg1));
                };
            };
        }
        public function get step3():GuideMapSign{
            return (this._109761255step3);
        }
        public function set step3(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761255step3;
            if (_local2 !== _arg1){
                this._109761255step3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step3", _local2, _arg1));
                };
            };
        }
        public function get step4():GuideMapSign{
            return (this._109761256step4);
        }
        public function set step4(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761256step4;
            if (_local2 !== _arg1){
                this._109761256step4 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step4", _local2, _arg1));
                };
            };
        }
        public function get step5():GuideMapSign{
            return (this._109761257step5);
        }
        public function set step5(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761257step5;
            if (_local2 !== _arg1){
                this._109761257step5 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step5", _local2, _arg1));
                };
            };
        }
        public function get step6():GuideMapSign{
            return (this._109761258step6);
        }
        public function set step6(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761258step6;
            if (_local2 !== _arg1){
                this._109761258step6 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step6", _local2, _arg1));
                };
            };
        }
        public function get step7():GuideMapSign{
            return (this._109761259step7);
        }
        public function set step7(_arg1:GuideMapSign):void{
            var _local2:Object = this._109761259step7;
            if (_local2 !== _arg1){
                this._109761259step7 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "step7", _local2, _arg1));
                };
            };
        }

    }
}//package task_guide 

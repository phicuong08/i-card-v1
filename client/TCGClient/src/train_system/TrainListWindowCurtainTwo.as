//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
    import mx.core.*;
    import mx.events.*;
    import mx.binding.*;

    public class TrainListWindowCurtainTwo extends TrainListWindowCurtainBase {

        private var _1178662798item10:TrainListWindowItem;
        private var _1178662797item11:TrainListWindowItem;
        private var _1178662796item12:TrainListWindowItem;
        private var _1178662795item13:TrainListWindowItem;
        private var _1178662794item14:TrainListWindowItem;
        private var _1178662793item15:TrainListWindowItem;
        private var _1178662792item16:TrainListWindowItem;
        private var _100525958item9:TrainListWindowItem;
        private var __moduleFactoryInitialized:Boolean = false;

        public function TrainListWindowCurtainTwo(){
            this.mxmlContent = [this._TrainListWindowCurtainTwo_TrainListWindowItem1_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem2_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem3_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem4_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem5_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem6_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem7_i(), this._TrainListWindowCurtainTwo_TrainListWindowItem8_i()];
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
        override protected function get startIndex():int{
            return (9);
        }
        override protected function get endIndex():int{
            return (16);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem1_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 31;
            _local1.y = 30;
            _local1.trainSection = 9;
            _local1.activeTooltip = "吕布势力的八健将卡组，以武力和机动性进行压制。";
            _local1.unactiveTooltip = "解锁条件：达到10级";
            _local1.active = false;
            _local1.id = "item9";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item9 = _local1;
            BindingManager.executeBindings(this, "item9", this.item9);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem2_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 231;
            _local1.y = 30;
            _local1.trainSection = 10;
            _local1.activeTooltip = "孙策率领下的东吴精英部队。";
            _local1.unactiveTooltip = "解锁条件：达到10级";
            _local1.active = false;
            _local1.id = "item10";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item10 = _local1;
            BindingManager.executeBindings(this, "item10", this.item10);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem3_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 431;
            _local1.y = 30;
            _local1.trainSection = 11;
            _local1.activeTooltip = "曹操属下的谋臣，善于运用各种计策。";
            _local1.unactiveTooltip = "解锁条件：达到15级。";
            _local1.active = false;
            _local1.id = "item11";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item11 = _local1;
            BindingManager.executeBindings(this, "item11", this.item11);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem4_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 631;
            _local1.y = 30;
            _local1.trainSection = 12;
            _local1.unactiveTooltip = "训练制作中，近期推出。";
            _local1.active = false;
            _local1.id = "item12";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item12 = _local1;
            BindingManager.executeBindings(this, "item12", this.item12);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem5_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 31;
            _local1.y = 240;
            _local1.trainSection = 13;
            _local1.unactiveTooltip = "训练制作中，近期推出。";
            _local1.active = false;
            _local1.id = "item13";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item13 = _local1;
            BindingManager.executeBindings(this, "item13", this.item13);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem6_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 231;
            _local1.y = 240;
            _local1.trainSection = 14;
            _local1.unactiveTooltip = "训练制作中，近期推出。";
            _local1.active = false;
            _local1.id = "item14";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item14 = _local1;
            BindingManager.executeBindings(this, "item14", this.item14);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem7_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 431;
            _local1.y = 240;
            _local1.trainSection = 15;
            _local1.unactiveTooltip = "训练制作中，近期推出。";
            _local1.active = false;
            _local1.id = "item15";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item15 = _local1;
            BindingManager.executeBindings(this, "item15", this.item15);
            return (_local1);
        }
        private function _TrainListWindowCurtainTwo_TrainListWindowItem8_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 631;
            _local1.y = 240;
            _local1.trainSection = 16;
            _local1.unactiveTooltip = "训练制作中，近期推出。";
            _local1.active = false;
            _local1.id = "item16";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item16 = _local1;
            BindingManager.executeBindings(this, "item16", this.item16);
            return (_local1);
        }
        public function get item10():TrainListWindowItem{
            return (this._1178662798item10);
        }
        public function set item10(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662798item10;
            if (_local2 !== _arg1){
                this._1178662798item10 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item10", _local2, _arg1));
                };
            };
        }
        public function get item11():TrainListWindowItem{
            return (this._1178662797item11);
        }
        public function set item11(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662797item11;
            if (_local2 !== _arg1){
                this._1178662797item11 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item11", _local2, _arg1));
                };
            };
        }
        public function get item12():TrainListWindowItem{
            return (this._1178662796item12);
        }
        public function set item12(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662796item12;
            if (_local2 !== _arg1){
                this._1178662796item12 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item12", _local2, _arg1));
                };
            };
        }
        public function get item13():TrainListWindowItem{
            return (this._1178662795item13);
        }
        public function set item13(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662795item13;
            if (_local2 !== _arg1){
                this._1178662795item13 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item13", _local2, _arg1));
                };
            };
        }
        public function get item14():TrainListWindowItem{
            return (this._1178662794item14);
        }
        public function set item14(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662794item14;
            if (_local2 !== _arg1){
                this._1178662794item14 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item14", _local2, _arg1));
                };
            };
        }
        public function get item15():TrainListWindowItem{
            return (this._1178662793item15);
        }
        public function set item15(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662793item15;
            if (_local2 !== _arg1){
                this._1178662793item15 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item15", _local2, _arg1));
                };
            };
        }
        public function get item16():TrainListWindowItem{
            return (this._1178662792item16);
        }
        public function set item16(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._1178662792item16;
            if (_local2 !== _arg1){
                this._1178662792item16 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item16", _local2, _arg1));
                };
            };
        }
        public function get item9():TrainListWindowItem{
            return (this._100525958item9);
        }
        public function set item9(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525958item9;
            if (_local2 !== _arg1){
                this._100525958item9 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item9", _local2, _arg1));
                };
            };
        }

    }
}//package train_system 

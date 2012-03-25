//Created by Action Script Viewer - http://www.buraks.com/asv
package train_system {
    import mx.core.*;
    import mx.events.*;
    import mx.binding.*;

    public class TrainListWindowCurtainOne extends TrainListWindowCurtainBase {

        private var _100525950item1:TrainListWindowItem;
        private var _100525951item2:TrainListWindowItem;
        private var _100525952item3:TrainListWindowItem;
        private var _100525953item4:TrainListWindowItem;
        private var _100525954item5:TrainListWindowItem;
        private var _100525955item6:TrainListWindowItem;
        private var _100525956item7:TrainListWindowItem;
        private var _100525957item8:TrainListWindowItem;
        private var __moduleFactoryInitialized:Boolean = false;

        public function TrainListWindowCurtainOne(){
            this.mxmlContent = [this._TrainListWindowCurtainOne_TrainListWindowItem1_i(), this._TrainListWindowCurtainOne_TrainListWindowItem2_i(), this._TrainListWindowCurtainOne_TrainListWindowItem3_i(), this._TrainListWindowCurtainOne_TrainListWindowItem4_i(), this._TrainListWindowCurtainOne_TrainListWindowItem5_i(), this._TrainListWindowCurtainOne_TrainListWindowItem6_i(), this._TrainListWindowCurtainOne_TrainListWindowItem7_i(), this._TrainListWindowCurtainOne_TrainListWindowItem8_i()];
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
            return (1);
        }
        override protected function get endIndex():int{
            return (8);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem1_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 31;
            _local1.y = 30;
            _local1.trainSection = 1;
            _local1.activeTooltip = "黄巾军散兵游勇，战斗力极弱。";
            _local1.active = false;
            _local1.id = "item1";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item1 = _local1;
            BindingManager.executeBindings(this, "item1", this.item1);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem2_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 231;
            _local1.y = 30;
            _local1.trainSection = 2;
            _local1.activeTooltip = "由张角率领的黄巾军，实力不容小视。";
            _local1.unactiveTooltip = "解锁条件：【黄巾徒众】获胜";
            _local1.active = false;
            _local1.id = "item2";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item2 = _local1;
            BindingManager.executeBindings(this, "item2", this.item2);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem3_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 431;
            _local1.y = 30;
            _local1.trainSection = 3;
            _local1.activeTooltip = "董卓率领的西凉悍将，擅长防守和肆无忌惮的掠夺。";
            _local1.unactiveTooltip = "解锁条件：【黄天当立】获胜";
            _local1.active = false;
            _local1.id = "item3";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item3 = _local1;
            BindingManager.executeBindings(this, "item3", this.item3);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem4_i():TrainListWindowItem{
            var _local1:TrainListWindowItem;
            _local1 = new TrainListWindowItem();
            _local1.x = 631;
            _local1.y = 30;
            _local1.trainSection = 4;
            _local1.activeTooltip = "卡组要求：不能使用金卡。";
            _local1.unactiveTooltip = "解锁条件：训练胜利20次";
            _local1.active = false;
            _local1.id = "item4";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item4 = _local1;
            BindingManager.executeBindings(this, "item4", this.item4);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem5_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 31;
            _local1.y = 240;
            _local1.trainSection = 5;
            _local1.activeTooltip = "刘备、关羽、张飞结义后，组织义军，共图大业。";
            _local1.unactiveTooltip = "解锁条件：完成10场对战";
            _local1.active = false;
            _local1.id = "item5";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item5 = _local1;
            BindingManager.executeBindings(this, "item5", this.item5);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem6_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 231;
            _local1.y = 240;
            _local1.trainSection = 6;
            _local1.activeTooltip = "曹操倾尽家财招兵买马，在众人拥护下，组成一支精干的部队。";
            _local1.unactiveTooltip = "解锁条件：完成10场对战";
            _local1.active = false;
            _local1.id = "item6";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item6 = _local1;
            BindingManager.executeBindings(this, "item6", this.item6);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem7_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 431;
            _local1.y = 240;
            _local1.trainSection = 7;
            _local1.activeTooltip = "孙坚率领的东吴众元老，惯习水战。";
            _local1.unactiveTooltip = "解锁条件：完成10场对战";
            _local1.active = false;
            _local1.id = "item7";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item7 = _local1;
            BindingManager.executeBindings(this, "item7", this.item7);
            return (_local1);
        }
        private function _TrainListWindowCurtainOne_TrainListWindowItem8_i():TrainListWindowItem{
            var _local1:TrainListWindowItem = new TrainListWindowItem();
            _local1.x = 631;
            _local1.y = 240;
            _local1.trainSection = 8;
            _local1.activeTooltip = "连续挑战各个NPC，横扫所有敌人！";
            _local1.unactiveTooltip = "解锁条件：达到99级 ";
            _local1.active = false;
            _local1.id = "item8";
            if (!_local1.document){
                _local1.document = this;
            };
            this.item8 = _local1;
            BindingManager.executeBindings(this, "item8", this.item8);
            return (_local1);
        }
        public function get item1():TrainListWindowItem{
            return (this._100525950item1);
        }
        public function set item1(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525950item1;
            if (_local2 !== _arg1){
                this._100525950item1 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item1", _local2, _arg1));
                };
            };
        }
        public function get item2():TrainListWindowItem{
            return (this._100525951item2);
        }
        public function set item2(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525951item2;
            if (_local2 !== _arg1){
                this._100525951item2 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item2", _local2, _arg1));
                };
            };
        }
        public function get item3():TrainListWindowItem{
            return (this._100525952item3);
        }
        public function set item3(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525952item3;
            if (_local2 !== _arg1){
                this._100525952item3 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item3", _local2, _arg1));
                };
            };
        }
        public function get item4():TrainListWindowItem{
            return (this._100525953item4);
        }
        public function set item4(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525953item4;
            if (_local2 !== _arg1){
                this._100525953item4 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item4", _local2, _arg1));
                };
            };
        }
        public function get item5():TrainListWindowItem{
            return (this._100525954item5);
        }
        public function set item5(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525954item5;
            if (_local2 !== _arg1){
                this._100525954item5 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item5", _local2, _arg1));
                };
            };
        }
        public function get item6():TrainListWindowItem{
            return (this._100525955item6);
        }
        public function set item6(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525955item6;
            if (_local2 !== _arg1){
                this._100525955item6 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item6", _local2, _arg1));
                };
            };
        }
        public function get item7():TrainListWindowItem{
            return (this._100525956item7);
        }
        public function set item7(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525956item7;
            if (_local2 !== _arg1){
                this._100525956item7 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item7", _local2, _arg1));
                };
            };
        }
        public function get item8():TrainListWindowItem{
            return (this._100525957item8);
        }
        public function set item8(_arg1:TrainListWindowItem):void{
            var _local2:Object = this._100525957item8;
            if (_local2 !== _arg1){
                this._100525957item8 = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "item8", _local2, _arg1));
                };
            };
        }

    }
}//package train_system 

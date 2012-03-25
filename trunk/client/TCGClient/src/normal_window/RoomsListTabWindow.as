//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.core.*;
    import mx.events.*;
    import flash.events.*;
    import spark.components.*;
    import mx.binding.*;

    public class RoomsListTabWindow extends Group {

        public static const SELECT_ITEM_CHANGED:String = "select_item_changed";

        private var _974355793freedomSection:RoomsListTabWindowItem;
        private var _1729996507newSection:RoomsListTabWindowItem;
        private var _994546310officialSection:RoomsListTabWindowItem;
        private var __moduleFactoryInitialized:Boolean = false;
        public var selectedItem:RoomsListTabWindowItem;

        public function RoomsListTabWindow(){
            this.width = 142;
            this.height = 28;
            this.mxmlContent = [this._RoomsListTabWindow_RoomsListTabWindowItem1_i(), this._RoomsListTabWindow_RoomsListTabWindowItem2_i(), this._RoomsListTabWindow_RoomsListTabWindowItem3_i()];
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
        protected function item_clickHandler(_arg1:MouseEvent):void{
            this.setSelected((_arg1.currentTarget as RoomsListTabWindowItem));
        }
        private function setSelected(_arg1:RoomsListTabWindowItem, _arg2:Boolean=true):void{
            if (((!(_arg1)) || ((_arg1 == this.selectedItem)))){
                return;
            };
            if (this.selectedItem){
                this.selectedItem.isSelected = false;
            };
            this.selectedItem = _arg1;
            this.selectedItem.isSelected = true;
            if (_arg2){
                dispatchEvent(new Event(SELECT_ITEM_CHANGED));
            };
        }
        public function set selectItemText(_arg1:String):void{
            if (this.newSection.title == _arg1){
                this.setSelected(this.newSection);
            } else {
                if (this.officialSection.title == _arg1){
                    this.setSelected(this.officialSection);
                } else {
                    if (this.freedomSection.title == _arg1){
                        this.setSelected(this.freedomSection);
                    };
                };
            };
        }
        private function _RoomsListTabWindow_RoomsListTabWindowItem1_i():RoomsListTabWindowItem{
            var _local1:RoomsListTabWindowItem = new RoomsListTabWindowItem();
            _local1.title = "新手区";
            _local1.toolTip = "适合新手玩家的对战区，只有#o20级以内#n的玩家才能加入。";
            _local1.addEventListener("click", this.__newSection_click);
            _local1.id = "newSection";
            if (!_local1.document){
                _local1.document = this;
            };
            this.newSection = _local1;
            BindingManager.executeBindings(this, "newSection", this.newSection);
            return (_local1);
        }
        public function __newSection_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _RoomsListTabWindow_RoomsListTabWindowItem2_i():RoomsListTabWindowItem{
            var _local1:RoomsListTabWindowItem;
            _local1 = new RoomsListTabWindowItem();
            _local1.x = 47;
            _local1.title = "正式区";
            _local1.toolTip = "加入该区房间需要#o8级以上#n，且参战卡组数目需在#o40到80#n之间。正式区中对战失败将被#r扣除一定积分#n！";
            _local1.addEventListener("click", this.__officialSection_click);
            _local1.id = "officialSection";
            if (!_local1.document){
                _local1.document = this;
            };
            this.officialSection = _local1;
            BindingManager.executeBindings(this, "officialSection", this.officialSection);
            return (_local1);
        }
        public function __officialSection_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        private function _RoomsListTabWindow_RoomsListTabWindowItem3_i():RoomsListTabWindowItem{
            var _local1:RoomsListTabWindowItem;
            _local1 = new RoomsListTabWindowItem();
            _local1.x = 94;
            _local1.title = "自由区";
            _local1.toolTip = "在该区房间中战斗将#r没有收益#n，参战卡组数目需在#o40到80之间#n。";
            _local1.addEventListener("click", this.__freedomSection_click);
            _local1.id = "freedomSection";
            if (!_local1.document){
                _local1.document = this;
            };
            this.freedomSection = _local1;
            BindingManager.executeBindings(this, "freedomSection", this.freedomSection);
            return (_local1);
        }
        public function __freedomSection_click(_arg1:MouseEvent):void{
            this.item_clickHandler(_arg1);
        }
        public function get freedomSection():RoomsListTabWindowItem{
            return (this._974355793freedomSection);
        }
        public function set freedomSection(_arg1:RoomsListTabWindowItem):void{
            var _local2:Object = this._974355793freedomSection;
            if (_local2 !== _arg1){
                this._974355793freedomSection = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "freedomSection", _local2, _arg1));
                };
            };
        }
        public function get newSection():RoomsListTabWindowItem{
            return (this._1729996507newSection);
        }
        public function set newSection(_arg1:RoomsListTabWindowItem):void{
            var _local2:Object = this._1729996507newSection;
            if (_local2 !== _arg1){
                this._1729996507newSection = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "newSection", _local2, _arg1));
                };
            };
        }
        public function get officialSection():RoomsListTabWindowItem{
            return (this._994546310officialSection);
        }
        public function set officialSection(_arg1:RoomsListTabWindowItem):void{
            var _local2:Object = this._994546310officialSection;
            if (_local2 !== _arg1){
                this._994546310officialSection = _arg1;
                if (this.hasEventListener("propertyChange")){
                    this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "officialSection", _local2, _arg1));
                };
            };
        }

    }
}//package normal_window 

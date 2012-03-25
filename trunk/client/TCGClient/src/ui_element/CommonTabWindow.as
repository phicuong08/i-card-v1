//Created by Action Script Viewer - http://www.buraks.com/asv
package ui_element {
    import mx.core.*;
    import flash.display.*;
    import mx.events.*;
    import flash.geom.*;
    import mx.styles.*;
    import flash.events.*;
    import flash.text.*;
    import spark.components.*;
    import mx.binding.*;
    import flash.system.*;
    import flash.media.*;
    import flash.utils.*;
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

    public class CommonTabWindow extends Group {

        public static const SELECT_ITEM_CHANGED:String = "select_item_changed";

        private var __moduleFactoryInitialized:Boolean = false;
        private var selectItem:CommonTabWindowItem;
        private var _tabItemDataProvider:Array;
        private var tabItemObject:Object;
        private var creationHasComplete:Boolean = false;

        public function CommonTabWindow(){
            this.tabItemObject = new Object();
            super();
            this.addEventListener("creationComplete", this.___CommonTabWindow_Group1_creationComplete);
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
            var _local2:CommonTabWindowItem;
            this.creationHasComplete = true;
            for each (_local2 in this.tabItemObject) {
                addElement(_local2);
            };
        }
        public function set tabItemDataProvider(_arg1:Array):void{
            if (((_arg1) && (_arg1.length))){
                this._tabItemDataProvider = _arg1;
                this.buildTabWindowItems();
            };
        }
        private function buildTabWindowItems():void{
            var _local1:CommonTabWindowItem;
            var _local2:int;
            var _local3:CommonTabWindowItem;
            var _local4:int;
            for each (_local1 in this.tabItemObject) {
                _local1.removeEventListener(MouseEvent.CLICK, this.item_clickHandler);
                _local1.removeSelf();
            };
            this.selectItem = null;
            this.tabItemObject = new Object();
            _local2 = this._tabItemDataProvider.length;
            _local4 = 0;
            while (_local4 < _local2) {
                _local3 = new CommonTabWindowItem();
                _local3.title = this._tabItemDataProvider[_local4];
                _local3.x = (_local4 * _local3.width);
                if (this.creationHasComplete){
                    addElement(_local3);
                };
                _local3.addEventListener(MouseEvent.CLICK, this.item_clickHandler);
                this.tabItemObject[_local3.title] = _local3;
                _local4++;
            };
            this.width = (_local3.width * _local2);
            this.height = _local3.height;
            this.setSelected(this.tabItemObject[this._tabItemDataProvider[0]], false);
        }
        protected function item_clickHandler(_arg1:MouseEvent):void{
            var _local2:CommonTabWindowItem = (_arg1.currentTarget as CommonTabWindowItem);
            this.setSelected(_local2);
        }
        public function get tabItemDataProvider():Array{
            return (this._tabItemDataProvider);
        }
        public function changeToPreviousItem():void{
            this.setSelectItemByIndex((this.tabItemDataProvider.indexOf(this.selectItemText) - 1));
        }
        public function changeToNextItem():void{
            this.setSelectItemByIndex((this.tabItemDataProvider.indexOf(this.selectItemText) + 1));
        }
        public function setSelectItemByIndex(_arg1:int):void{
            _arg1 = ((_arg1 < 0)) ? 0 : _arg1;
            _arg1 = ((_arg1 >= this.tabItemDataProvider.length)) ? (this.tabItemDataProvider.length - 1) : _arg1;
            this.selectItemText = this.tabItemDataProvider[_arg1];
        }
        public function set selectItemText(_arg1:String):void{
            if (this.selectItem.title == _arg1){
                return;
            };
            this.setSelected(this.tabItemObject[_arg1]);
        }
        public function get selectItemText():String{
            return (this.selectItem.title);
        }
        private function setSelected(_arg1:CommonTabWindowItem, _arg2:Boolean=true):void{
            if (((!(_arg1)) || ((_arg1 == this.selectItem)))){
                return;
            };
            if (this.selectItem){
                this.selectItem.isSelected = false;
            };
            this.selectItem = _arg1;
            this.selectItem.isSelected = true;
            if (_arg2){
                dispatchEvent(new Event(SELECT_ITEM_CHANGED));
            };
        }
        public function ___CommonTabWindow_Group1_creationComplete(_arg1:FlexEvent):void{
            this.group1_creationCompleteHandler(_arg1);
        }

    }
}//package ui_element 

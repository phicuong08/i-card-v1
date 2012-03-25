//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import spark.components.*;
    import spark.core.*;

    public class FakeListGroup extends Group {

        protected var uic:UIComponent;
        protected var _itemHeight:Number = 10;
        protected var _itemsArray:Array;

        public function FakeListGroup(){
            this.uic = new UIComponent();
            this._itemsArray = new Array();
            super();
            addElement(this.uic);
        }
        public function set itemHeight(_arg1:Number):void{
            this._itemHeight = _arg1;
        }
        public function get itemHeight():Number{
            return (this._itemHeight);
        }
        public function set itemsArray(_arg1:Array):void{
            this._itemsArray = _arg1;
        }
        public function get itemsArray():Array{
            return (this._itemsArray);
        }
        override public function getVerticalScrollPositionDelta(_arg1:uint):Number{
            var _local2:Number;
            switch (_arg1){
                case NavigationUnit.UP:
                    _local2 = (-(this.itemHeight) / 3);
                    break;
                case NavigationUnit.DOWN:
                    _local2 = (this.itemHeight / 3);
                    break;
                case NavigationUnit.PAGE_UP:
                    _local2 = -(height);
                    break;
                case NavigationUnit.PAGE_DOWN:
                    _local2 = height;
                    break;
                default:
                    _local2 = super.getVerticalScrollPositionDelta(_arg1);
            };
            return (_local2);
        }
        override public function set verticalScrollPosition(_arg1:Number):void{
            if (verticalScrollPosition != _arg1){
                super.verticalScrollPosition = _arg1;
                this.resetDisplayItem();
            };
        }
        public function resetDisplayItem():void{
            var _local1:int;
            var _local2:IVisualElement;
            var _local4:Number;
            var _local5:Number;
            var _local6:IVisualElement;
            this.uic.y = (this.itemsArray.length * this.itemHeight);
            var _local3:Array = new Array();
            _local1 = 0;
            while (_local1 < numElements) {
                _local6 = this.getElementAt(_local1);
                if (((!((_local6 == this.uic))) && ((this.itemsArray.indexOf(_local6) == -1)))){
                    _local3.push(_local6);
                };
                _local1++;
            };
            for each (_local2 in _local3) {
                this.removeElement(_local2);
            };
            _local4 = (verticalScrollPosition - (this.itemHeight * 2));
            _local5 = ((verticalScrollPosition + height) + this.itemHeight);
            _local1 = 0;
            while (_local1 < this.itemsArray.length) {
                _local2 = (this.itemsArray[_local1] as IVisualElement);
                if ((((_local2.y >= _local4)) && ((_local2.y <= _local5)))){
                    if (!_local2.parent){
                        addElement(_local2);
                    };
                } else {
                    if (_local2.parent){
                        removeElement(_local2);
                    };
                };
                _local1++;
            };
        }
        public function reset():void{
            this.removeAllElements();
            addElement(this.uic);
            this.uic.y = 0;
        }

    }
}//package custom_control 

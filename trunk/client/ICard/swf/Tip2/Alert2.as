//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import flash.display.*;
    import flash.events.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;

    public class Alert2 extends Sprite implements IAlert2 {

        public var _Confirm:SimpleButton;
        public var _Title:TextField;
        private var _parent:Sprite;
        private var _onClose:Function;

        public function Alert2(){
            this._Confirm.addEventListener(MouseEvent.CLICK, this.clickHandler);
        }
        public function show(_arg1:String):void{
            this._Title.htmlText = _arg1;
            if (this._parent){
                this._parent.addChild(this);
            };
        }
        public function hide():void{
            if (this.parent){
                this.parent.removeChild(this);
            };
            if ((this._onClose is Function)){
                this._onClose();
                this._onClose = null;
            };
        }
        private function clickHandler(_arg1:MouseEvent):void{
            this.hide();
        }
        public function reposition(_arg1:Number, _arg2:Number):void{
            x = Math.floor(((_arg1 - width) / 2));
            y = Math.floor(((_arg2 - height) / 2));
        }
        public function set oParent(_arg1:Sprite):void{
            this._parent = _arg1;
        }
        public function set onClose(_arg1:Function):void{
            this._onClose = _arg1;
        }

    }
}//package 

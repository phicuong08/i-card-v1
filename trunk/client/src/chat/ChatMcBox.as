package {
    import flash.events.*;

    public class ChatMcBox extends McBoxBase {

        private var _mcData:Object;
        private var _isPitch:Boolean = false;
        private var _boxId:int = 0;
        private var _onSendData:Function;

        public function ChatMcBox(){
            this._onSendData = new Function();
            super();
            this._Name.mouseEnabled = false;
            this._Back.addEventListener(MouseEvent.CLICK, this.backClick);
            this._Back.addEventListener(MouseEvent.MOUSE_OVER, this.backOver);
            this._Back.addEventListener(MouseEvent.MOUSE_OUT, this.backOut);
        }
        public function set mcData(_arg1:Object):void{
            this._mcData = _arg1;
        }
        public function set isPitch(_arg1:Boolean):void{
            this._isPitch = _arg1;
            this._Back.gotoAndStop(1);
        }
        public function set boxId(_arg1:int):void{
            this._boxId = _arg1;
        }
        public function set htmlText(_arg1:String):void{
            this._Name.htmlText = _arg1;
        }
        public function set mcWidth(_arg1:int):void{
            this._Back.width = _arg1;
            this._Name.width = _arg1;
        }
        public function set mcHeight(_arg1:int):void{
            this._Back.height = _arg1;
            this._Name.height = _arg1;
        }
        public function set onSendData(_arg1:Function):void{
            this._onSendData = _arg1;
        }
        public function set text(_arg1:String):void{
            this._Name.htmlText = _arg1;
        }
        public function clear():void{
            this._mcData = null;
            this._Back.mouseEnabled = false;
            this._Name.mouseEnabled = false;
            this._Back.removeEventListener(MouseEvent.CLICK, this.backClick);
            this._Back.removeEventListener(MouseEvent.MOUSE_OVER, this.backOver);
            this._Back.removeEventListener(MouseEvent.MOUSE_OUT, this.backOut);
        }
        private function backOver(_arg1:MouseEvent):void{
            this._Back.gotoAndStop(2);
        }
        private function backOut(_arg1:MouseEvent):void{
            if (this._isPitch){
                return;
            };
            this._Back.gotoAndStop(1);
        }
        private function backClick(_arg1:MouseEvent):void{
            if (this._isPitch){
                return;
            };
            this._isPitch = true;
            if (this._mcData){
                this._onSendData(this._mcData, this._boxId);
            };
        }

    }
}//package 

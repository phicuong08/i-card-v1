package {

    public class ChatDownBox extends DownBoxBase {

        private var _onSendData:Function;
        private var _onPlayerData:Object;
        private var _boxWidth:int = 86;
        private var _mcBox:ChatMcBox;
        private var _mcBoxList:Array;

        public function ChatDownBox():void{
            this._onSendData = new Function();
            super();
        }
        public function set onSendData(_arg1:Function):void{
            this._onSendData = _arg1;
        }
        public function set onPlayerData(_arg1:Object):void{
            this._onPlayerData = _arg1;
        }
        public function set getBoxList(_arg1:Array):void{
            this.renderBox(_arg1);
        }
        public function set boxWidth(_arg1:int):void{
            this._boxWidth = _arg1;
        }
        private function renderBox(_arg1:Array):void{
            var obj:* = null;
            var list:* = _arg1;
            this.clearBox();
            this._mcBoxList = [];
            var len:* = list.length;
            var i:* = 0;
            while (i < len) {
                obj = list[i];
                this._mcBox = new ChatMcBox();
                this._mcBox.text = obj.label;
                this._mcBox.mcData = obj;
                this._mcBox.mcWidth = this._boxWidth;
                this._mcBox.buttonMode = true;
                this._mcBox.boxId = i;
                this._mcBox.y = (i * this._mcBox.height);
                this._mcBox.x = 0.5;
                this._mcBoxList.push(this._mcBox);
                addChild(this._mcBox);
                this._mcBox.onSendData = function (_arg1:Object, _arg2:int):void{
                    _onSendData(_arg1, _onPlayerData);
                    _mcBoxList[_arg2].isPitch = false;
                };
                i = (i + 1);
            };
        }
        private function clearBox():void{
            if (this._mcBoxList == null){
                return;
            };
            var _local1:int = this._mcBoxList.length;
            var _local2:int;
            while (_local2 < _local1) {
                this._mcBoxList[_local2].clear();
                removeChild(this._mcBoxList[_local2]);
                this._mcBoxList[_local2] = null;
                _local2++;
            };
            this._mcBoxList = null;
        }
        public function clear():void{
            this.clearBox();
            this._onPlayerData = null;
        }

    }
}//package 

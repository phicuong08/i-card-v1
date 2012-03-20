package {
    import flash.events.*;
    import flash.display.*;
    import flash.utils.*;

    public class EipBar extends EipbarBase {

        private var _onSendEip:Function;
        private var _btnList:Array;

        public function EipBar(){
            this._onSendEip = new Function();
            super();
            this.renderEip();
        }
        public function set onSendEip(_arg1:Function):void{
            this._onSendEip = _arg1;
        }
        public function clear():void{
            var _local3:Object;
            var _local1:int = this._btnList.length;
            var _local2:int;
            while (_local2 < _local1) {
                _local3 = this._btnList[_local2];
                _local3.btn.removeEventListener(MouseEvent.CLICK, _local3.eipClick);
                _local3.btn.removeEventListener(MouseEvent.MOUSE_OVER, _local3.eipMouseOver);
                _local3.btn.removeEventListener(MouseEvent.MOUSE_OUT, _local3.eipMouseOut);
                _local3.btn.removeChild(_local3.eip);
                _local3.eip = null;
                removeChild(_local3.btn);
                _local3.btn = null;
                _local2++;
            };
            this._btnList = null;
        }
        private function renderEip():void{
            var _local2:Object;
            var _local3:EipBtn;
            var _local4:int;
            var _local5:String;
            var _local6:Class;
            var _local7:MovieClip;
            this._btnList = [];
            var _local1:int;
            while (_local1 < 25) {
                _local2 = {};
                _local3 = new EipBtn();
                _local3.x = (2 + ((_local3.width + 5) * (_local1 - (5 * Math.floor((_local1 / 5))))));
                _local3.y = (2 + (Math.floor((_local1 / 5)) * (_local3.height + 5)));
                _local3._Black.alpha = 0;
                _local3.buttonMode = true;
                addChild(_local3);
                _local4 = (_local1 + 1);
                _local5 = ("eip" + _local4);
                _local6 = (getDefinitionByName(_local5) as Class);
                _local7 = (new (_local6)() as MovieClip);
                _local3.addChild(_local7);
                _local2.eip = _local7;
                _local2.btn = _local3;
                _local2.name = _local5;
                _local2.id = _local4;
                _local2.eipClick = this.eipClick(_local2);
                _local2.eipMouseOver = this.eipMouseOver(_local2);
                _local2.eipMouseOut = this.eipMouseOut(_local2);
                _local2.btn.addEventListener(MouseEvent.CLICK, _local2.eipClick);
                _local2.btn.addEventListener(MouseEvent.MOUSE_OVER, _local2.eipMouseOver);
                _local2.btn.addEventListener(MouseEvent.MOUSE_OUT, _local2.eipMouseOut);
                this._btnList.push(_local2);
                _local1++;
            };
        }
        private function eipClick(_arg1:Object):Function{
            var data:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                _onSendEip(data);
            };
            return (func);
        }
        private function eipMouseOver(_arg1:Object):Function{
            var data:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                data.btn._Black.alpha = 1;
            };
            return (func);
        }
        private function eipMouseOut(_arg1:Object):Function{
            var data:* = _arg1;
            var func:* = function (_arg1:MouseEvent):void{
                data.btn._Black.alpha = 0;
            };
            return (func);
        }

    }
}//package 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.*;
    import com.assist.view.*;
    import com.datas.*;
    import com.assist.server.*;
    import com.lang.client.com.controllers.*;

    public class RuneController extends com.controllers.Base {

        public var ownData:RuneData;
        private var _batchRuneUse:Array;
        private var _autoRuneInfo:Array;

        public function get runeList():Object{
            var _local1:Array = this.ownData.runeList;
            var _local2:Object = {};
            _local2.count = _local1[0];
            _local2.ingot = _local1[1];
            _local2.coins = _local1[2];
            _local2.isUser = (_data.player.ingot >= _local2.ingot);
            return (_local2);
        }
        public function get runeUse():Object{
            var _local1:Object = this.ownData.runeUse;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.coins = _local1[1];
            _local2.count = _local1[2];
            _local2.ingot = _local1[3];
            _local2.isUser = (_data.player.ingot >= _local2.ingot);
            return (_local2);
        }
        public function get batchRuneData():Object{
            var _local1:Array = this.ownData.batchRuneList;
            var _local2:Object = {};
            _local2.count = _local1[0];
            _local2.useCount = _local1[1];
            _local2.myIngot = _data.player.ingot;
            _local2.ingot = _local1[2];
            _local2.coins = _local1[3];
            this.renderBatchUseInfo(_local2);
            return (_local2);
        }
        public function get batchRuneUse():Object{
            var _local1:Array = this.ownData.batchRuneUse;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            _local2.newCoins = _local1[1];
            _local2.count = _local1[2];
            _local2.ingot = _local1[3];
            _local2.coins = _local1[4];
            return (_local2);
        }
        public function get runeUseNotify():Object{
            var _local1:Array = this.ownData.runeUseNotify;
            var _local2:Object = {};
            _local2.coins = _local1[0];
            _local2.count = _local1[1];
            _local2.ingot = _local1[2];
            _local2.newcoins = _local1[3];
            return (_local2);
        }
        public function renderBatchUseInfo(_arg1:Object):void{
            _arg1.isVip6 = VIPType.check(VIPType.Level6);
            _arg1.isVip10 = VIPType.check(VIPType.Level10);
            _arg1.info = Lang.sprintf(HtmlText.white(RuneControllerLang.UserIngot), HtmlText.yellow(_arg1.ingot), _arg1.coins);
        }
        public function get autoRuneInfo():Object{
            var _local1:Array = this.ownData.autoRuneInfo;
            var _local2:Object = {};
            _local2.isAutoRune = _local1[0];
            _local2.typeList = this.renderAutoRuneInfo(_local1[1]);
            _local2.key = _local1[2];
            _local2.value = this.renderAutoRuneValue(_local2.typeList, _local1[2]);
            return (_local2);
        }
        private function renderAutoRuneInfo(_arg1:Array):Array{
            var _local5:Object;
            var _local2:Array = [];
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local5.key = _arg1[_local4][0];
                _local5.value = (_arg1[_local4][1] + RuneControllerLang.W);
                _local5.name = _local5.value;
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        private function renderAutoRuneValue(_arg1:Array, _arg2:int):String{
            var _local5:Object;
            var _local3:int = _arg1.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = _arg1[_local4];
                if (_local5.key == _arg2){
                    return (_local5.value);
                };
                _local4++;
            };
            return ("");
        }
        public function get setAutoRune():Object{
            var _local1:Array = this.ownData.setAutoRune;
            var _local2:Object = {};
            _local2.msg = _local1[0];
            return (_local2);
        }

    }
}//package com.controllers 

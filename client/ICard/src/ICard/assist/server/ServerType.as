//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {
    import ICard.haloer.net.*;
    

    public class ServerType {

        private var _list:Array;

        public function ServerType(){
            this._list = [CardType,  ServerType,   0];
            super();
        }
        public static function format(_arg1:File):void{
            var file:* = _arg1;
            var format:* = function (_arg1:Class, _arg2:String, _arg3:Array):void{
                var _local7:String;
                var _local4:Object = file.getClassByName(("ICard.assist.server.source." + _arg2));
                var _local5:int = _arg3.length;
                var _local6:int;
                while (_local6 < _local5) {
                    _local7 = _arg3[_local6];
                    if (false == _local4.hasOwnProperty(_local7)){
                        throw (new Error(((_arg2 + "不存在") + _local7)));
                    };
                    _arg1[_local7] = _local4[_local7];
                    _local6++;
                };
            };
			format(CardType, "CardTypeData", ["HeroCards", "SkillCards","TaskCards","DefCards","WeaponCards","SoldierCards","UseCard"]);

        }

    }
}//package com.assist.server 

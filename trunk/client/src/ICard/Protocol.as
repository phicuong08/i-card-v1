//Created by Action Script Viewer - http://www.buraks.com/asv
package com {
    import flash.utils.*;
    import com.assist.*;
    import com.protocols.*;
    import com.haloer.utils.*;

    public class Protocol {

        private static var _wired:Dictionary;
        public static var modName:String;
        public static var funName:String;

        public static function init():void{
            if (_wired == null){
                _wired = new Dictionary();
                addWired(Mod_Town_Base.enter_town);
                addWired(Mod_Town_Base.leave_town);
                addWired(Mod_Town_Base.move_to);
                addWired(Mod_Chat_Base.bro_to_players);
                addWired(Mod_Player_Base.update_player_data);
            };
        }
        public static function addWired(_arg1:Object):void{
            var _local2:int = _arg1["module"];
            var _local3:int = _arg1["action"];
            _wired[concat(_local2, _local3)] = true;
        }
        public static function removeWired(_arg1:int, _arg2:int):void{
            var _local3:String = concat(_arg1, _arg2);
            if (_wired[_local3]){
                delete _wired[_local3];
            };
        }
        public static function keepAlive(_arg1:int, _arg2:int):Boolean{
            return (!(!(_wired[concat(_arg1, _arg2)])));
        }
        public static function concat(_arg1:int, _arg2:int):String{
            return ([_arg1, "-", _arg2].join(""));
        }
        public static function analyze(_arg1:ByteArray, _arg2:Array):Array{
            var _local3:Array = readArray(_arg1, _arg2);
            return (_local3);
        }
        private static function readArray(_arg1:ByteArray, _arg2:Array):Array{
            var _local6:int;
            var _local7:uint;
            var _local8:Number;
            var _local9:Array;
            var _local10:uint;
            var _local11:int;
            var _local3:Array = [];
            var _local4:uint = _arg2.length;
            var _local5:uint;
            while (_local5 < _local4) {
                switch (_arg2[_local5]){
                    case Utils.BooleanUtil:
                        _local3.push(_arg1.readBoolean());
                        break;
                    case Utils.ByteUtil:
                        _local3.push(_arg1.readByte());
                        break;
                    case Utils.DoubleUtil:
                        _local3.push(_arg1.readDouble());
                        break;
                    case Utils.LongUtil:
                        _local6 = _arg1.readInt();
                        _local7 = _arg1.readUnsignedInt();
                        _local8 = ((_local6 * Math.pow(2, 32)) + _local7);
                        _local3.push(_local8);
                        break;
                    case Utils.FloatUtil:
                        _local3.push(_arg1.readFloat());
                        break;
                    case Utils.IntUtil:
                        _local3.push(_arg1.readInt());
                        break;
                    case Utils.ShortUtil:
                        _local3.push(_arg1.readShort());
                        break;
                    case Utils.StringUtil:
                        _local3.push(_arg1.readUTF());
                        break;
                    default:
                        if ((_arg2[_local5] is Array)){
                            _local9 = [];
                            _local10 = _arg1.readUnsignedShort();
                            _local11 = 0;
                            while (_local11 < _local10) {
                                _local9[_local11] = readArray(_arg1, _arg2[_local5]);
                                _local11++;
                            };
                            _local3.push(_local9);
                        };
                };
                _local5++;
            };
            return (_local3);
        }
        public static function synthesize(_arg1:Array, _arg2:Array):ByteArray{
            return (writeArray(_arg1, _arg2, true));
        }
        private static function writeArray(_arg1:Array, _arg2:Array, _arg3:Boolean=false):ByteArray{
            var _local6:uint;
            var _local8:String;
            var _local9:uint;
            var _local10:uint;
            var _local11:int;
            var _local12:int;
            var _local13:ByteArray;
            var _local4:ByteArray = new ByteArray();
            var _local5:uint = _arg2.length;
            if (_arg1.length != _local5){
                _local8 = ("[request]接口不匹配：" + getProtocolDescription(_arg2));
                Helper.error(_local8);
                throw (new Error(_local8));
            };
            _local6 = 0;
            while (_local6 < _local5) {
                switch (_arg2[_local6]){
                    case Utils.BooleanUtil:
                        _local4.writeBoolean(_arg1[_local6]);
                        break;
                    case Utils.ByteUtil:
                        _local4.writeByte(_arg1[_local6]);
                        break;
                    case Utils.DoubleUtil:
                        _local4.writeDouble(_arg1[_local6]);
                        break;
                    case Utils.LongUtil:
                        _local9 = (_arg1[_local6] / Math.pow(2, 32));
                        _local10 = (_arg1[_local6] % Math.pow(2, 32));
                        _local4.writeUnsignedInt(_local9);
                        _local4.writeUnsignedInt(_local10);
                        break;
                    case Utils.FloatUtil:
                        _local4.writeFloat(_arg1[_local6]);
                        break;
                    case Utils.IntUtil:
                        _local4.writeInt(_arg1[_local6]);
                        break;
                    case Utils.ShortUtil:
                        _local4.writeShort(_arg1[_local6]);
                        break;
                    case Utils.StringUtil:
                        _local4.writeUTF(_arg1[_local6]);
                        break;
                    default:
                        if ((_arg2[_local6] is Array)){
                            _local11 = _arg1[_local6].length;
                            _local4.writeShort(_local11);
                            _local12 = 0;
                            while (_local12 < _local11) {
                                _local13 = writeArray(_arg1[_local6][_local12], _arg2[_local6], true);
                                _local4.writeBytes(_local13, 0, _local13.length);
                                _local12++;
                            };
                        };
                };
                _local6++;
            };
            var _local7:ByteArray = new ByteArray();
            if (_arg3 == false){
                _local7.writeShort(_local4.length);
            };
            _local7.writeBytes(_local4, 0, _local4.length);
            return (_local7);
        }
        public static function lookupProtocol(_arg1:int, _arg2:int):Object{
            var _local4:String;
            var _local5:Object;
            var _local6:Array;
            var _local7:int;
            var _local8:int;
            var _local9:Object;
            var _local3:Object = {};
            for (_local4 in Mod.Modules) {
                if (parseInt(_local4) == _arg1){
                    _local5 = Mod.Modules[_local4];
                    _local6 = _local5["Actions"];
                    _local7 = _local6.length;
                    _local8 = 0;
                    while (_local8 < _local7) {
                        _local9 = _local5[_local6[_local8]];
                        if (_local9["action"] == _arg2){
                            _local3 = _local9;
                            break;
                        };
                        _local8++;
                    };
                    break;
                };
            };
            return (_local3);
        }
        public static function getProtocolDescription(_arg1:Array):String{
            var _local3:String;
            var _local4:Class;
            var _local5:Array;
            var _local6:int;
            var _local7:int;
            var _local8:Object;
            var _local2 = "";
            for (_local3 in Mod.Modules) {
                _local4 = Mod.Modules[_local3];
                _local5 = _local4["Actions"];
                _local6 = _local5.length;
                _local7 = 0;
                while (_local7 < _local6) {
                    _local8 = _local4[_local5[_local7]];
                    if (_local8["request"] == _arg1){
                        modName = (_local4 + "").replace(/^\[class |\]$/g, "");
                        funName = _local5[_local7];
                        _local2 = [modName, "(module:", _local8["module"], ")", ", ", funName, "(action:", _local8["action"], ")"].join("");
                        break;
                    };
                    _local7++;
                };
            };
            return (_local2);
        }

    }
    var _local1:* = Protocol.init();
    return (_local1);
}//package com 

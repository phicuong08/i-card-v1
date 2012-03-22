//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
    import ICard.assist.*;
    import ICard.assist.data.*;
    import ICard.datas.*;
    import ICard.protocols.*;
    
    import flash.events.ErrorEvent;
    import flash.utils.*;

    public class Data extends DataBase implements IData {

        private var _callbackList:Object;
        private var _ignoreList:Object;

        public function Data():void{
            this._callbackList = {};
            this._ignoreList = {};
            super();
        }
        
        public function get player():PlayerData{
            return ((createObject(PlayerData) as PlayerData));
        }
       
        public function get achievement():AchievementData{
            return ((createObject(AchievementData) as AchievementData));
        }
      
        override public function init(_arg1:ViewMgr, _arg2:ControllerMgr):void{
            super.init(_arg1, _arg2);

            Mod_Achievement.register(this);

            Helper.backtrace("connecting", URI.domain, URI.serverPort);
            this.connect(((URI.ip) || (URI.domain)), ((URI.port) || (URI.serverPort)));
        }
        override protected function parseSocketData(_arg1:ByteArray):void{
            var modId:* = 0;
            var funId:* = 0;
            var id:* = null;
            var p:* = null;
            var p1:* = null;
            var buffer:* = _arg1;
            modId = buffer.readUnsignedByte();
            funId = buffer.readUnsignedByte();
            if ((((modId == 120)) && ((funId == 156)))){
                buffer.position = 0;
                buffer.uncompress();
                modId = buffer.readUnsignedByte();
                funId = buffer.readUnsignedByte();
            };
            var term:* = Protocol.concat(modId, funId);
            var callback:* = this._callbackList[term];
            if (this._ignoreList[term]){
                Helper.recordInteraction(Helper.RESPONSE, modId, funId, [buffer]);
                callback(buffer);
                dispatch(modId, funId);
                return;
            };
            var result:* = [];
            for (id in Mod.Modules) {
                if (parseInt(id) == modId){
                    try {
                        result = this.analyze(Mod.Modules[id], modId, funId, buffer);
                    } catch(e:ErrorEvent) {
                        _view.alert.confirm(((((("[" + modId) + ",") + funId) + "]") + e));
                        p = Protocol.lookupProtocol(modId, funId);
                        Helper.error("[response]接口不匹配：", Protocol.getProtocolDescription(p["request"]), "\n", e);
                        return;
                    };
                };
            };
            Helper.recordInteraction(Helper.RESPONSE, modId, funId, result);
            if ((callback is Function)){
                callback(result);
            } else {
                p1 = Protocol.lookupProtocol(modId, funId);
                throw (new Error(((("\n\t" + "没有注册接口回调方法：") + Protocol.getProtocolDescription(p1["request"])) + "\n\t------")));
            };
            dispatch(modId, funId);
            removeNotAllow(modId, funId);
        }
        public function registerDataCallback(_arg1:Object, _arg2:Function, _arg3:Boolean=false):void{
            var _local4:uint = _arg1["module"];
            var _local5:uint = _arg1["action"];
            var _local6:String = Protocol.concat(_local4, _local5);
            if (this._callbackList[_local6]){
                throw (new Error("指定的协议重复注册回调方法！"));
            };
            this._callbackList[_local6] = _arg2;
            if (_arg3){
                this._ignoreList[_local6] = _arg3;
            };
        }
        private function analyze(_arg1:Class, _arg2:uint, _arg3:uint, _arg4:ByteArray):Array{
            var _local9:Object;
            var _local5:Array = [];
            var _local6:Array = _arg1["Actions"];
            var _local7:int = _local6.length;
            var _local8:int;
            while (_local8 < _local7) {
                _local9 = _arg1[_local6[_local8]];
                if (_local9["action"] == _arg3){
                    _local5 = Protocol.analyze(_arg4, _local9["response"]);
                    break;
                };
                _local8++;
            };
            return (_local5);
        }

    }
}//package com 

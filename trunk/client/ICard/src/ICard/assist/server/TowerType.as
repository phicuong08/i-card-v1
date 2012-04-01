//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.server {

    public class TowerType {

        private static var _Layer:Array = null;
        private static var _LayerSoul:Array = null;

        public static function get Layer():Array{
            if (_Layer == null){
                throw (new Error("还未赋值！"));
            };
            return (_Layer);
        }
        public static function set Layer(_arg1:Array):void{
            if (_Layer != null){
                throw (new Error("非法赋值"));
            };
            _Layer = _arg1;
        }
        public static function get LayerSoul():Array{
            if (_LayerSoul == null){
                throw (new Error("还未赋值！"));
            };
            return (_LayerSoul);
        }
        public static function set LayerSoul(_arg1:Array):void{
            if (_LayerSoul != null){
                throw (new Error("非法赋值"));
            };
            _LayerSoul = _arg1;
        }
        private static function getLayerItem(_arg1:int, _arg2:int):Array{
            var _local3:Array;
            var _local4:int = Layer.length;
            var _local5:int;
            while (_local5 < _local4) {
                if ((((Layer[_local5][0] == _arg1)) && ((Layer[_local5][1] == _arg2)))){
                    _local3 = Layer[_local5];
                    break;
                };
                _local5++;
            };
            return (_local3);
        }
        private static function getLayerSoulItem(_arg1:int, _arg2:int):Array{
            var _local3:Array = [];
            var _local4:int = LayerSoul.length;
            var _local5:int;
            while (_local5 < _local4) {
                if ((((LayerSoul[_local5][0] == _arg1)) && ((LayerSoul[_local5][1] == _arg2)))){
                    _local3.push(LayerSoul[_local5]);
                };
                _local5++;
            };
            return (_local3);
        }
        public static function getMonsterTeamId(_arg1:int, _arg2:int):int{
            var _local3:Array = getLayerItem(_arg1, _arg2);
            return ((_local3) ? _local3[2] : 0);
        }
        public static function getMonsterId(_arg1:int, _arg2:int):int{
            var _local3:Array = getLayerItem(_arg1, _arg2);
            return ((_local3) ? _local3[3] : 0);
        }
        public static function getAwardExp(_arg1:int, _arg2:int):int{
            var _local3:Array = getLayerItem(_arg1, _arg2);
            return ((_local3) ? _local3[4] : 0);
        }
        public static function getSoulIdList(_arg1:int, _arg2:int):Array{
            var _local7:int;
            var _local8:int;
            var _local3:Array = [];
            var _local4:Array = getLayerSoulItem(_arg1, _arg2);
            var _local5:int;
            while (_local5 < _local4.length) {
                _local7 = _local4[_local5][2];
                _local8 = _local4[_local5][3];
                //_local3 = _local3.concat(SoulType.getSoulIdList(_local7, _local8));
                _local5++;
            };
            var _local6:Array = [];
            _local3 = _local3.sortOn("qualityId", (Array.NUMERIC | Array.DESCENDING));
            _local5 = 0;
            while (_local5 < _local3.length) {
                _local6.push(_local3[_local5]["soulId"]);
                _local5++;
            };
            return (_local6);
        }

    }
}//package com.assist.server 

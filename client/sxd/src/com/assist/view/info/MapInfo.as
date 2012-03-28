//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {
    import flash.events.*;
    import flash.utils.*;
    import flash.net.*;
    import com.assist.view.map.*;

    public class MapInfo {

        public var urlMap:String;
        public var urlMini:String;
        public var urlXML:String;
        public var urlSound:String = "";
        public var portals:Array;
        public var builds:Array;
        public var effects:Array;
        public var xml:XML;
        public var mapW:int;
        public var mapH:int;
        public var barriers:Array;
        public var order:int = 0;
        private var _load:URLLoader;
        private var _funComplete:Function;

        public function MapInfo(){
            this.portals = [];
            this.builds = [];
            this.effects = [];
            this.barriers = [];
            this._load = new URLLoader();
            super();
        }
        public function loadXML():void{
            this.xml = null;
            this._load.load(new URLRequest(this.urlXML));
            this._load.addEventListener(Event.COMPLETE, this.xmlLoad);
        }
        private function xmlLoad(_arg1:Event):void{
            var _local2:XML;
            var _local3:XML;
            var _local4:int;
            var _local5:Array;
            var _local6:ByteArray;
            var _local7:String;
            var _local10:PortalInfo;
            var _local11:BuildInfo;
            var _local12:int;
            this.xml = XML(this._load.data);
            this._load = null;
            this.urlSound = String(this.xml.@sound);
            if (this.urlSound != ""){
                this.urlSound = ((MapStatic.FolderMap + "sound/") + this.urlSound);
            };
            this.portals = [];
            for each (_local2 in this.xml.portalList.portal) {
                _local10 = new PortalInfo();
                _local10.x = int(_local2.@x);
                _local10.y = int(_local2.@y);
                _local10.type = int(_local2.@type);
                _local10.type = ((_local10.type)==0) ? PortalInfo.TypeMission : _local10.type;
                if ((((_local10.type == PortalInfo.TypeMission)) || ((_local10.type == PortalInfo.TypeMissionHero)))){
                    this.portals.push(_local10);
                };
            };
            this.builds = [];
            for each (_local2 in this.xml.builds.build) {
                _local11 = new BuildInfo();
                _local11.id = int(_local2.@id);
                _local11.x = int(_local2.@x);
                _local11.y = int(_local2.@y);
                _local11.nx = int(_local2.@nx);
                _local11.ny = int(_local2.@ny);
                _local11.toX = int(_local2.@toX);
                _local11.toY = int(_local2.@toY);
                _local11.url = ((MapStatic.FolderMap + "build/") + String(_local2.@url));
                _local11.defaultVisible = (int(_local2.@show) == 1);
                _local11.hasMouse = (int(_local2.@notmouse) == 0);
                this.builds.push(_local11);
                if ((((_local11.toX == 0)) && ((_local11.toY == 0)))){
                    _local11.toX = _local11.x;
                    _local11.toY = _local11.y;
                };
            };
            for each (_local2 in this.xml.effectData.effect) {
                this.effects.push({
                    layder:String(_local2.@layder),
                    url:((MapStatic.FolderMap + "map_effect/") + String(_local2.@url))
                });
            };
            _local3 = this.xml.mapData[0];
            _local4 = int(_local3.yStart);
            this.mapW = int(_local3.wCount);
            this.mapH = int(_local3.hCount);
            _local5 = String(_local3.data).split(",");
            _local6 = new ByteArray();
            for each (_local7 in _local5) {
                _local6.writeUnsignedInt(int(("0x" + _local7)));
            };
            _local6.uncompress();
            this.barriers = [];
            while (this.barriers.length <= this.mapH) {
                this.barriers.push([]);
            };
            var _local8:int;
            var _local9:int = _local4;
            while (_local9 < this.mapH) {
                _local12 = 0;
                while (_local12 < this.mapW) {
                    var _temp1:int = _local8;
                    _local8 = (_local8 + 1);
                    this.barriers[_local9][_local12] = _local6[_temp1];
                    _local12++;
                };
                _local9++;
            };
            if ((this._funComplete is Function)){
                this._funComplete(this);
            };
            this._funComplete = null;
        }
        public function set onComplete(_arg1:Function):void{
            if (this.xml){
                setTimeout(_arg1, 10, this);
            } else {
                this._funComplete = _arg1;
            };
        }

    }
}//package com.assist.view.info 

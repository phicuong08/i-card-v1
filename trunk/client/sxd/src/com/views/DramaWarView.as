//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.haloer.net.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import flash.net.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.war.*;

    public class DramaWarView extends WarView implements IView {

        private var _tempData:ByteArray;

        public function DramaWarView():void{
            _type = WarType.DramaWar;
        }
        override public function show():void{
            var http:* = null;
            http = new HTTP(URLLoaderDataFormat.BINARY);
            http.onComplete = function ():void{
                _tempData = (http.loader.data as ByteArray);
                loadResources();
            };
            http.load((URI.assetsUrl + "war_demo_2011_02_17.17"));
        }
        private function formatWarData(_arg1:ByteArray):void{
            var _local2:uint = _arg1.readByte();
            var _local3:uint = _arg1.readByte();
            var _local4:Array = Protocol.analyze(_arg1, Mod_Mission_Base.fight_monster["response"]);
            var _local5:WarData = new WarData();
            _local5.format(_local4);
            _warData = _local5;
        }
        override protected function loadRoleResource():void{
            this.formatWarData(this._tempData);
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.sportUrl + "war_icon.png"));
            _arg1.push("Background");
            _arg2.push(((URI.sportUrl + (Math.floor((Math.random() * 3)) + 1)) + ".swf"));
        }
        override protected function createTarget():void{
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
        }

    }
}//package com.views 

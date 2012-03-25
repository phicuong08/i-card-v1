//Created by Action Script Viewer - http://www.buraks.com/asv
package tool {
    import flash.events.*;
    import combat_element_script.*;
    import flash.net.*;

    public class BuildEmbedLuaFileList {

        public static function build():void{
            LuaAgent.getInstance().addEventListener(LuaAgent.UPDATE_ONE_LUAFILE, mainLuaUpdateComplete);
            LuaAgent.getInstance().updateFiles();
        }
        private static function mainLuaUpdateComplete(_arg1:Event):void{
            LuaAgent.getInstance().removeEventListener(LuaAgent.UPDATE_ONE_LUAFILE, mainLuaUpdateComplete);
            var _local2:Array = LuaAgent.getInstance().nameList;
            debugWindow.myTraceEx(translate("main"));
            var _local3:int;
            while (_local3 < _local2.length) {
                debugWindow.myTraceEx(translate(_local2[_local3]));
                _local3++;
            };
            LuaAgent.getInstance().nameList = new Array();
        }
        private static function translate(_arg1:String):String{
            var _local2:String = _arg1.replace(new RegExp("/", "g"), "_");
            return (((((("[Embed(source = \"lua/" + _arg1) + ".lua\", mimeType = \"application/octet-stream\")]\r\n") + "public static var ") + _local2) + ":Class;"));
        }

    }
}//package tool 

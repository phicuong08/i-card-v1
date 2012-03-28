//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class WorldBossType {

        private static const Bosses:Object = {
            1:[10],
            2:[11],
            3:[12]
        };

        public static function getTownIdByBossId(_arg1:int):int{
            return ((Bosses[_arg1]) ? Bosses[_arg1][0] : 0);
        }
        public static function getTownIdByBossSign(_arg1:String):int{
            return (TownType.getId(_arg1));
        }

    }
}//package com.assist.server 

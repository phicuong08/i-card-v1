//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class ZodiacType {

        private static const Levels:Object = {
            1:["一重天"],
            2:["二重天"],
            3:["三重天"],
            4:["四重天"],
            5:["五重天"],
            6:["六重天"],
            7:["七重天"],
            8:["八重天"],
            9:["九重天"]
        };

        public static function getZodiaName(_arg1:int):String{
            return ((Levels[_arg1]) ? Levels[_arg1][0] : "");
        }

    }
}//package com.assist.server 

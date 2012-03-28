//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.server {

    public class PlayerType {

        public static function isTester(_arg1:int):Boolean{
            return (((((((isCommonTester(_arg1)) || (isAdvancedTester(_arg1)))) || (isGM(_arg1)))) || (isTrainer(_arg1))));
        }
        public static function isCommonTester(_arg1:int):Boolean{
            return ((1 == _arg1));
        }
        public static function isStar(_arg1:int):Boolean{
            return ((1 == _arg1));
        }
        public static function isAdvancedTester(_arg1:int):Boolean{
            return ((2 == _arg1));
        }
        public static function isGM(_arg1:int):Boolean{
            return ((3 == _arg1));
        }
        public static function isTrainer(_arg1:int):Boolean{
            return ((4 == _arg1));
        }

    }
}//package com.assist.server 

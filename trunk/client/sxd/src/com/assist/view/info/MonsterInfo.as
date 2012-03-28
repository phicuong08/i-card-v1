//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {

    public class MonsterInfo {

        public var x:int;
        public var y:int;
        public var id:int;
        public var name:String = "";
        public var sign:String = "";
        public var sayMsg:String = "";

        public function get nameHtml():String{
            return ((("<font size='13' color='#ff0000'>" + this.name) + "</font>"));
        }

    }
}//package com.assist.view.info 

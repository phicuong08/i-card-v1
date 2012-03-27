//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {

    public class NPCInfo {

        public static const NPC_Default:int = 0;
        public static const NPC_Acceptable:int = 1;
        public static const NPC_Complete:int = 2;
        public static const NPC_Accepted:int = 3;

        public var id:int;
        public var name:String;
        public var x:int;
        public var y:int;
        public var sign:String;
        public var type:int;
        public var lock:int;

        public function NPCInfo(_arg1:Object):void{
            this.x = _arg1.x;
            this.y = _arg1.y;
            this.name = _arg1.name;
            this.id = _arg1.id;
            this.type = _arg1.type;
            this.sign = _arg1.sign;
        }
        public function get nameHtml():String{
            return ((("<font size='13' color='#fff200'>" + this.name) + "</font>"));
        }

    }
}//package com.assist.view.info 

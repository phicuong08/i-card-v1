//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.pack {
    import flash.events.*;

    public class JuanZhouEvent extends Event {

        public static const Item_Req:String = "Item_Req";

        public var id:int = 0;
        public var list:Array;

        public function JuanZhouEvent(_arg1:Array, _arg2:int=0, _arg3:String="", _arg4:Boolean=false, _arg5:Boolean=false){
            super(_arg3, _arg4, _arg5);
            this.list = _arg1;
            this.id = _arg2;
        }
    }
}//package com.assist.view.pack 

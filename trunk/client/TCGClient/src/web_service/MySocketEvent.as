//Created by Action Script Viewer - http://www.buraks.com/asv
package web_service {
    import flash.events.*;

    public class MySocketEvent extends Event {

        public var message:String;

        public function MySocketEvent(_arg1:String, _arg2:String, _arg3:Boolean=false, _arg4:Boolean=false){
            this.message = _arg2;
            super(_arg1, _arg3, _arg4);
        }
    }
}//package web_service 

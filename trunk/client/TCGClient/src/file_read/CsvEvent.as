//Created by Action Script Viewer - http://www.buraks.com/asv
package file_read {
    import flash.events.*;

    public class CsvEvent extends Event {

        public static const EOF_ERROR:String = "eof_error";

        private var _type:String = "";

        public function CsvEvent(_arg1:String){
            this._type = _arg1;
            super(_arg1);
        }
        override public function clone():Event{
            var _local1:CsvEvent = new CsvEvent(this._type);
            return (_local1);
        }
        override public function toString():String{
            return (this.formatToString("CsvEvent", "type", "bubbles", "cancelabled", "eventPhase"));
        }

    }
}//package file_read 

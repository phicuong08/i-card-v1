//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class RedEnvelopesData extends Base {

        public var getEnvelopsInfo:Array;
        public var GetEnvelope:Array;
        public var getDate:Array;

        public function get_envelopes_info(_arg1:Array):void{
            this.getEnvelopsInfo = _arg1[0];
        }
        public function get_envelope(_arg1:Array):void{
            this.GetEnvelope = _arg1;
        }
        public function get_date(_arg1:Array):void{
            this.getDate = _arg1;
        }

    }
}//package com.datas 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.data.mission.*;

    public class PKWarData extends Base {

        public var warData:WarData;
        public var reportId:int;

        public function start_war(_arg1:Array):void{
            this.reportId = _arg1.pop();
            var _local2:Array = [0, 0, 0, [_arg1]];
            this.warData = new WarData();
            this.warData.format(_local2);
        }

    }
}//package com.datas 

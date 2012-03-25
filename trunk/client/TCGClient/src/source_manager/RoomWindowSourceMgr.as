//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class RoomWindowSourceMgr extends SourceMgrBase {

        private static var _instance:RoomWindowSourceMgr = new (RoomWindowSourceMgr)();
;

        public function RoomWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():RoomWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("roomWindowUI");
        }

    }
}//package source_manager 

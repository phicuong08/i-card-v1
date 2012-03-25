//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class RoomsListSourceMgr extends SourceMgrBase {

        private static var _instance:RoomsListSourceMgr = new (RoomsListSourceMgr)();
;

        public function RoomsListSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():RoomsListSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("roomListWindowUI");
        }

    }
}//package source_manager 

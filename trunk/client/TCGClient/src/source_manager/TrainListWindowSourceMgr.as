//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class TrainListWindowSourceMgr extends SourceMgrBase {

        private static var _instance:TrainListWindowSourceMgr = new (TrainListWindowSourceMgr)();
;

        public function TrainListWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():TrainListWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("trainWindowUI");
        }

    }
}//package source_manager 

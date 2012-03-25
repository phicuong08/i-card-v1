//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class BasicCardSelectWindowSourceMgr extends SourceMgrBase {

        private static var _instance:BasicCardSelectWindowSourceMgr = new (BasicCardSelectWindowSourceMgr)();
;

        public function BasicCardSelectWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():BasicCardSelectWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("basicCardSelectUI");
        }

    }
}//package source_manager 

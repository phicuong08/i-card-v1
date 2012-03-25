//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class GuideMapWindowSourceMgr extends SourceMgrBase {

        private static var _instance:GuideMapWindowSourceMgr = new (GuideMapWindowSourceMgr)();
;

        public function GuideMapWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():GuideMapWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("guideMapWindowUI");
        }

    }
}//package source_manager 

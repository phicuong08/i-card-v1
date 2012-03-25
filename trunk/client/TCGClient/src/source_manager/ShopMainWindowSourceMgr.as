//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class ShopMainWindowSourceMgr extends SourceMgrBase {

        private static var _instance:ShopMainWindowSourceMgr = new (ShopMainWindowSourceMgr)();
;

        public function ShopMainWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():ShopMainWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("shopWindowUI");
        }

    }
}//package source_manager 

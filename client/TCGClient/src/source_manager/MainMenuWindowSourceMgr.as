//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class MainMenuWindowSourceMgr extends SourceMgrBase {

        private static var _instance:MainMenuWindowSourceMgr = new (MainMenuWindowSourceMgr)();
;

        public function MainMenuWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():MainMenuWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("mainMenuWindowUI");
        }

    }
}//package source_manager 

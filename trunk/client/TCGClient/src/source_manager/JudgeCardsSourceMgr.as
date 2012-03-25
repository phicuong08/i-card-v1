//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class JudgeCardsSourceMgr extends SourceMgrBase {

        private static var _instance:JudgeCardsSourceMgr = new (JudgeCardsSourceMgr)();
;

        public function JudgeCardsSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():JudgeCardsSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("judgeCardWindowUI");
        }

    }
}//package source_manager 

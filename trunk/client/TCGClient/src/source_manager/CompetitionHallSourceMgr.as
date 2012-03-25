//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class CompetitionHallSourceMgr extends SourceMgrBase {

        private static var _instance:CompetitionHallSourceMgr = new (CompetitionHallSourceMgr)();
;

        public function CompetitionHallSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():CompetitionHallSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("competitionHallUI");
        }

    }
}//package source_manager 

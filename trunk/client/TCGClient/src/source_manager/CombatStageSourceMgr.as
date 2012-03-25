//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class CombatStageSourceMgr extends SourceMgrBase {

        private static var _instance:CombatStageSourceMgr = new (CombatStageSourceMgr)();
;

        public function CombatStageSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():CombatStageSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("combatStageSource");
        }

    }
}//package source_manager 

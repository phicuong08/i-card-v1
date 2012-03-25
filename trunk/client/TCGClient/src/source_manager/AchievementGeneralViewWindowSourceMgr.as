//Created by Action Script Viewer - http://www.buraks.com/asv
package source_manager {

    public class AchievementGeneralViewWindowSourceMgr extends SourceMgrBase {

        private static var _instance:AchievementGeneralViewWindowSourceMgr = new (AchievementGeneralViewWindowSourceMgr)();
;

        public function AchievementGeneralViewWindowSourceMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
        }
        public static function getInstance():AchievementGeneralViewWindowSourceMgr{
            return (_instance);
        }

        override protected function getSwfFileName():String{
            return ("achievementWindowUI");
        }

    }
}//package source_manager 

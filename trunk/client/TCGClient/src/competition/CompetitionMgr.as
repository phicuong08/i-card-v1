//Created by Action Script Viewer - http://www.buraks.com/asv
package competition {
    import mx.events.*;
    import flash.events.*;

    public class CompetitionMgr extends EventDispatcher {

        private static var _instance:CompetitionMgr = new (CompetitionMgr)();
;

        private var competitionHall:CompetitionHall;

        public function CompetitionMgr(){
            if (_instance){
                throw (new Error("只能用 getInstance() 获取实例"));
            };
            this.reset();
        }
        public static function getInstance():CompetitionMgr{
            return (_instance);
        }

        public function reset():void{
        }
        public function getCompetitionWindow():CompetitionHall{
            var clearWindow:* = null;
            if (!this.competitionHall){
                clearWindow = function (_arg1:FlexEvent):void{
                    competitionHall.removeEventListener(FlexEvent.REMOVE, clearWindow);
                    competitionHall = null;
                };
                this.competitionHall = new CompetitionHall();
                this.competitionHall.addEventListener(FlexEvent.REMOVE, clearWindow);
            };
            return (this.competitionHall);
        }
        public function setCompetitionHallInfo(_arg1:Object):void{
            if (this.competitionHall){
                this.competitionHall.setCompetitionHallInfo(_arg1);
            };
        }

    }
}//package competition 

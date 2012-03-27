//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class HeroMissionData extends Base {

        private var _heroMissionList:Array;
        private var _buyHeroChallenge:Array;
        public var startPractice:Array;
        public var stopPractice:Array;
        public var getNotify:Array;
        public var getContinuePracticeInfo:Array;
        public var continuePractice:Array;
        public var getQuickly:Array;

        public function get getHeroMissionList():Array{
            return (this._heroMissionList);
        }
        public function get buyHeroChallenge():Array{
            return (this._buyHeroChallenge);
        }
        public function get_hero_mission_list(_arg1:Array):void{
            this._heroMissionList = _arg1;
        }
        public function buy_hero_challenge(_arg1:Array):void{
            this._buyHeroChallenge = _arg1;
        }
        public function start_practice(_arg1:Array):void{
            this.startPractice = _arg1;
        }
        public function stop_practice(_arg1:Array):void{
            this.stopPractice = _arg1;
        }
        public function notify(_arg1:Array):void{
            this.getNotify = _arg1;
        }
        public function get_continue_practice_info(_arg1:Array):void{
            this.getContinuePracticeInfo = _arg1;
        }
        public function continue_practice(_arg1:Array):void{
            this.continuePractice = _arg1;
        }
        public function quickly(_arg1:Array):void{
            this.getQuickly = _arg1;
        }

    }
}//package com.datas 

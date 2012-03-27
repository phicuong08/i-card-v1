//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class SuperSportData extends Base {

        private var _openSuperSport:Array;
        private var _challengeList:Array;
        private var _startChallenge:Array;
        private var _clearCdTime:Array;
        private var _buyChallengeTimes:Array;
        private var _newSportWarReport:Array;
        private var _notify:Array;
        private var _closeSuperSport:Array;
        private var _playerWarReport:Array;
        private var _rankingTop:Array;
        private var _updateWinTop:Array;
        private var _notifyGlobal:Array;

        public function get openSuperSport():Array{
            return (this._openSuperSport);
        }
        public function get challengeList():Array{
            return (this._challengeList);
        }
        public function get startChallenge():Array{
            return (this._startChallenge);
        }
        public function get clearCdTime():Array{
            return (this._clearCdTime);
        }
        public function get buyChallengeTimes():Array{
            return (this._buyChallengeTimes);
        }
        public function get newSportWarReport():Array{
            return (this._newSportWarReport);
        }
        public function get getNotify():Array{
            return (this._notify);
        }
        public function get closeSuperSport():Array{
            return (this._closeSuperSport);
        }
        public function get playerWarReport():Array{
            return (this._playerWarReport);
        }
        public function get rankingTop():Array{
            return (this._rankingTop);
        }
        public function get updateWinTop():Array{
            return (this._updateWinTop);
        }
        public function get notifyGlobal():Array{
            return (this._notifyGlobal);
        }
        public function open_super_sport(_arg1:Array):void{
            this._openSuperSport = _arg1;
        }
        public function get_challenge_list(_arg1:Array):void{
            this._challengeList = _arg1;
        }
        public function start_challenge(_arg1:Array):void{
            this._startChallenge = _arg1;
        }
        public function clear_cd_time(_arg1:Array):void{
            this._clearCdTime = _arg1;
        }
        public function buy_challenge_times(_arg1:Array):void{
            this._buyChallengeTimes = _arg1;
        }
        public function notify_new_sport_war_report(_arg1:Array):void{
            this._newSportWarReport = _arg1;
        }
        public function notify(_arg1:Array):void{
            this._notify = _arg1;
        }
        public function close_super_sport(_arg1:Array):void{
            this._closeSuperSport = _arg1;
        }
        public function get_player_war_report(_arg1:Array):void{
            this._playerWarReport = _arg1;
        }
        public function get_ranking_top(_arg1:Array):void{
            this._rankingTop = _arg1[0];
        }
        public function notify_update_win_top(_arg1:Array):void{
            this._updateWinTop = _arg1;
        }
        public function notify_global(_arg1:Array):void{
            this._notifyGlobal = _arg1;
        }

    }
}//package com.datas 

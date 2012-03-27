//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class WorshipMarsController extends Base {

        public function get marsInfo():Object{
            return (this._data.worshipMars.marsInfo);
        }
        public function get incenseLog():Array{
            return (this._data.worshipMars.incenseLog);
        }
        public function get marsIncense():Object{
            return (this._data.worshipMars.marsIncense);
        }
        public function get getBlessingTimesAndExpAdd():Object{
            return (this._data.worshipMars.getBlessingTimesAndExpAdd);
        }
        public function get getRemainIncenseTimes():Object{
            return (this._data.worshipMars.getRemainIncenseTimes);
        }

    }
}//package com.controllers 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class PartnersController extends Base {

        public function getPartnersList():Array{
            return (this._data.partners.getPartnersList());
        }
        public function getRecruitCount():Object{
            return (this._data.partners.getRecruitCount());
        }
        public function Recruit():int{
            return (this._data.partners.Recruit());
        }
        public function get recommend():String{
            return (this._data.partners.recommend);
        }

    }
}//package com.controllers 

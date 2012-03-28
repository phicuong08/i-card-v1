//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class StudyStuntController extends Base {

        public function get stuntPointInfo():Array{
            return (this._data.studyStunt.stuntPointInfo);
        }
        public function get stuntInfo():Array{
            return (this._data.studyStunt.stuntInfo);
        }
        public function get playerInfo():Object{
            return (this._data.studyStunt.playerInfo);
        }
        public function get playerStudyStunt():Object{
            return (this._data.studyStunt.playerStudyStunt);
        }
        public function get mainRoleStuntIds():Array{
            return (_data.studyStunt.mainRoleStuntIds);
        }
        public function get playerCanStudyStunt():Object{
            return (_data.studyStunt.playerCanStudyStunt);
        }
        public function get isLoadComplete():Boolean{
            return (_data.studyStunt.isLoadComplete);
        }

    }
}//package com.controllers 

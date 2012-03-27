//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class ResearchController extends Base {

        public function getResearchList():Array{
            return (this._data.research.getResearchList);
        }
        public function getCdTime():int{
            return (this._data.research.getCdTime);
        }
        public function ResearchUpgrade():Object{
            return (this._data.research.getResearchUpgrade);
        }
        public function ClearCdTimeShow():Object{
            return (this._data.research.getClearCdTimeShow);
        }
        public function ClearCdTime():Object{
            return (this._data.research.getClearCdTime);
        }
        public function getMySkill():int{
            return (this._data.research.getMySkill);
        }
        public function researchAddList():Array{
            return (this._data.research.researchAddList);
        }

    }
}//package com.controllers 

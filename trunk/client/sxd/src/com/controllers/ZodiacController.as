//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.assist.data.mission.*;
    import com.assist.server.*;

    public class ZodiacController extends Base {

        public function get zodiacInfo():Object{
            return (this._data.zodiac.zodiacInfo);
        }
        public function get challengeResult():Object{
            return (this._data.zodiac.challengeResult);
        }
        public function get awardGoldOilName():String{
            return (GoldOilType.getOilName(_data.zodiac.awardGoldOilId));
        }
        public function get awardAura():int{
            return (_data.zodiac.awardAura);
        }
        public function get warData():WarData{
            var _local1:WarData = new WarData();
            _local1.format([0, 0, 0, [_data.zodiac.warData]]);
            return (_local1);
        }

    }
}//package com.controllers 

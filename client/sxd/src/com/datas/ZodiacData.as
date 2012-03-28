//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.haloer.data.*;
    import com.assist.server.*;

    public class ZodiacData extends Base {

        private var _objZodiacInfo:Object;
        private var _objChallenge:Object;
        private var _awardGoldOilId:int;
        private var _awardAura:int;
        private var _warData:Array;

        public function ZodiacData(){
            this._objZodiacInfo = {};
            this._objChallenge = {};
            super();
        }
        public function get zodiacInfo():Object{
            return (this._objZodiacInfo);
        }
        public function get challengeResult():Object{
            return (this._objChallenge);
        }
        public function get awardGoldOilId():int{
            return (this._awardGoldOilId);
        }
        public function get awardAura():int{
            return (this._awardAura);
        }
        public function get warData():Array{
            return (this._warData);
        }
        public function zodiac_info(_arg1:Array):void{
            this._objZodiacInfo = {};
            oObject.list(_arg1, this._objZodiacInfo, ["now_zodiac_level", "now_barrier", "next_zodiac_level", "next_barrier", "require_level", "gold_oil_id", "heaven"]);
            this._objZodiacInfo["gold_oil_name"] = ItemType.getName(this._objZodiacInfo["gold_oil_id"]);
            this._objZodiacInfo["heaven_name"] = ZodiacType.getZodiaName(this._objZodiacInfo["heaven"]);
        }
        public function challenge(_arg1:Array):void{
            this._objChallenge = {};
            oObject.list(_arg1, this._objChallenge, ["result", "zodiac_level", "barrier", "gold_oil_id"]);
            this._awardGoldOilId = _arg1[(_arg1.length - 3)];
            this._awardAura = _arg1[(_arg1.length - 2)];
            this._warData = _arg1[(_arg1.length - 1)][0];
        }

    }
}//package com.datas 

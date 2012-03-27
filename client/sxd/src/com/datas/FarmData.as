//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.view.*;
    import com.haloer.display.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class FarmData extends Base {

        private var _objHerbsColor:Object;
        private var _objImageUrl:Object;
        private var _aryGetFarmlandinfoList:Array;
        private var _intMaxFarmlandCount:int;
        private var _aryGetPlayerRoleInfoList:Array;
        private var _objGetSingleHerbsSeed:Object;
        private var _aryGetGroupHerbsSeed:Array;
        private var _objRefreshHerbsSeed:Object;
        private var _objGetTopHerbsSeed:Object;
        private var _objPlantHerbs:Object;
        private var _objHarvest:Object;
        private var _objReclamation:Object;
        private var _objCheckRoleState:Object;
        private var _objGetSimpleFarmlandinfo:Object;
        private var _objClearFarmlandCd:Object;
        private var _objBuyCoinTreeCountInfo:Object;
        private var _objBuyCoinTreeCount:Object;
        private var _objCoinTreeCountNotify:Object;
        private var _objIngotForFarmland:Object;
        private var _objUpFarmlandLevel:Object;
        private var _intLoadingImageCount:int;

        public function FarmData(){
            this._objHerbsColor = {
                1:HtmlText.White,
                2:38979,
                3:48127,
                4:HtmlText.Purple,
                5:HtmlText.Yellow
            };
            this._objImageUrl = {};
            this._aryGetFarmlandinfoList = [];
            this._aryGetPlayerRoleInfoList = [];
            this._objGetSingleHerbsSeed = {};
            this._aryGetGroupHerbsSeed = [];
            this._objRefreshHerbsSeed = {};
            this._objGetTopHerbsSeed = {};
            this._objPlantHerbs = {};
            this._objHarvest = {};
            this._objReclamation = {};
            this._objCheckRoleState = {};
            this._objGetSimpleFarmlandinfo = {};
            this._objClearFarmlandCd = {};
            this._objBuyCoinTreeCountInfo = {};
            this._objBuyCoinTreeCount = {};
            this._objCoinTreeCountNotify = {};
            this._objIngotForFarmland = {};
            this._objUpFarmlandLevel = {};
            super();
        }
        public function get getFarmlandinfoList():Array{
            return (this._aryGetFarmlandinfoList);
        }
        public function get maxFarmlandCount():int{
            return (this._intMaxFarmlandCount);
        }
        public function get getPlayerRoleInfoList():Array{
            return (this._aryGetPlayerRoleInfoList);
        }
        public function get getSingleHerbsSeed():Object{
            return (this._objGetSingleHerbsSeed);
        }
        public function get getGroupHerbsSeed():Array{
            return (this._aryGetGroupHerbsSeed);
        }
        public function get refreshHerbsSeed():Object{
            return (this._objRefreshHerbsSeed);
        }
        public function get getTopHerbsSeed():Object{
            return (this._objGetTopHerbsSeed);
        }
        public function get plantHerbs():Object{
            return (this._objPlantHerbs);
        }
        public function get harvestHerbs():Object{
            return (this._objHarvest);
        }
        public function get openFarmland():Object{
            return (this._objReclamation);
        }
        public function get checkRoleState():Object{
            return (this._objCheckRoleState);
        }
        public function get getSimpleFarmlandinfo():Object{
            return (this._objGetSimpleFarmlandinfo);
        }
        public function get clearFarmlandCd():Object{
            return (this._objClearFarmlandCd);
        }
        public function get buyCoinTreeCountInfo():Object{
            return (this._objBuyCoinTreeCountInfo);
        }
        public function get buyCoinTreeCount():Object{
            return (this._objBuyCoinTreeCount);
        }
        public function get coinTreeCountNotify():Object{
            return (this._objCoinTreeCountNotify);
        }
        public function get ingotForFarmland():Object{
            return (this._objIngotForFarmland);
        }
        public function get upFarmlandLevel():Object{
            return (this._objUpFarmlandLevel);
        }
        public function get getIsImgComplete():Boolean{
            return ((this._intLoadingImageCount == 0));
        }
        private function getSimpleHerbeSign(_arg1:String):String{
            var _local2:String = _arg1;
            _local2 = _local2.replace("PuTong", "");
            _local2 = _local2.replace("BaiNian", "");
            _local2 = _local2.replace("QianNian", "");
            _local2 = _local2.replace("WanNian", "");
            _local2 = _local2.replace("JiPin", "");
            return (_local2);
        }
        private function loadImageCache():void{
            var strUrl:* = null;
            var img:* = null;
            this._intLoadingImageCount = 0;
            for each (strUrl in this._objImageUrl) {
                this._intLoadingImageCount++;
                if (!Image.isInCache(strUrl)){
                    img = new Image(strUrl);
                    img.onComplete = function ():void{
                        _intLoadingImageCount--;
                    };
                } else {
                    this._intLoadingImageCount--;
                };
            };
        }
        public function get_farmlandinfo_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:int;
            var _local4:int;
            var _local5:int;
            var _local6:Object;
            var _local7:Object;
            this._aryGetFarmlandinfoList = [];
            this._intMaxFarmlandCount = _arg1[1];
            for each (_local2 in _arg1[0]) {
                _local6 = {};
                oObject.list(_local2, _local6, ["farmland_id", "player_role_id", "player_role_sign", "player_role_name", "player_role_level", "player_role_experience", "max_experience", "herbs_id", "farmland_time", "farmland_level", "is_plant", "herbs_type"]);
                _local6["herbs_sign"] = HerbsType.getSign(_local6["herbs_id"]);
                _local6["herbs_name"] = HerbsType.getName(_local6["herbs_id"]);
                _local6["herbs_star_level"] = HerbsType.getStarLevel(_local6["herbs_id"]);
                _local6["experience"] = Math.ceil((HerbsType.getExperience(_local6["herbs_id"]) * (((_local6["farmland_level"] - 1) * 0.2) + 1)));
                _local6["coin"] = Math.ceil(((HerbsType.getCoin(_local6["herbs_id"]) + (_local6["player_role_level"] * 2000)) * (((_local6["farmland_level"] - 1) * 0.2) + 1)));
                _local6["color"] = this._objHerbsColor[_local6["herbs_star_level"]];
                _local6["is_can_open"] = 0;
                _local6["growing"] = 3;
                _local6["simple_herbs_sign"] = this.getSimpleHerbeSign(_local6["herbs_sign"]);
                if (_local6["herbs_id"] != 0){
                    this._objImageUrl[(_local6["simple_herbs_sign"] + "3")] = ((URI.farmIconUrl + _local6["simple_herbs_sign"]) + "3.swf");
                };
                this._aryGetFarmlandinfoList.push(_local6);
            };
            this.loadImageCache();
            this._aryGetFarmlandinfoList.sortOn(["farmland_id"], Array.NUMERIC);
            _local3 = 0;
            _local4 = this._aryGetFarmlandinfoList.length;
            _local5 = this._aryGetFarmlandinfoList.length;
            while (_local5 < this._intMaxFarmlandCount) {
                _local7 = {};
                --_local3;
                _local7["farmland_id"] = _local3;
                _local7["herbs_id"] = 0;
                _local7["farmland_level"] = 0;
                _local7["is_can_open"] = ((_local5 == _local4)) ? 1 : 0;
                this._aryGetFarmlandinfoList.push(_local7);
                _local5++;
            };
        }
        public function get_player_roleinfo_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:Object;
            this._aryGetPlayerRoleInfoList = [];
            for each (_local2 in _arg1[0]) {
                _local3 = {};
                oObject.list(_local2, _local3, ["player_role_id", "player_role_sign", "player_role_name", "player_role_level", "player_role_experience", "max_experience", "strength", "agile", "intellect", "player_role_state"]);
                if (_local3["player_role_state"] == Mod_Farm_Base.WAR){
                    _local3["text"] = HtmlText.format((((_local3["player_role_name"] + " Lv.") + _local3["player_role_level"]) + FarmDataLang.Fight), 0xEB6100);
                } else {
                    if (_local3["player_role_state"] == Mod_Farm_Base.INVITE){
                        _local3["text"] = HtmlText.white(((_local3["player_role_name"] + " Lv.") + _local3["player_role_level"]));
                    } else {
                        if (_local3["player_role_state"] == Mod_Farm_Base.NOINVITE){
                            _local3["text"] = HtmlText.white((((_local3["player_role_name"] + " Lv.") + _local3["player_role_level"]) + FarmDataLang.Inn));
                        } else {
                            _local3["text"] = "";
                        };
                    };
                };
                _local3["role_experience"] = ((_local3["player_role_experience"] + "/") + _local3["max_experience"]);
                _local3["url"] = ((URI.iconsUrl + _local3["player_role_sign"]) + ".png");
                this._aryGetPlayerRoleInfoList.push(_local3);
            };
        }
        public function get_herbs_seed(_arg1:Array):void{
            var _local3:int;
            var _local4:Object;
            this._objGetSingleHerbsSeed = {};
            oObject.list(_arg1, this._objGetSingleHerbsSeed, ["herbs_id", "refresh_ingot", "herbs_type"]);
            this._objGetSingleHerbsSeed["herbs_sign"] = HerbsType.getSign(this._objGetSingleHerbsSeed["herbs_id"]);
            this._objGetSingleHerbsSeed["herbs_name"] = HerbsType.getName(this._objGetSingleHerbsSeed["herbs_id"]);
            this._objGetSingleHerbsSeed["herbs_star_level"] = HerbsType.getStarLevel(this._objGetSingleHerbsSeed["herbs_id"]);
            this._objGetSingleHerbsSeed["experience"] = HerbsType.getExperience(this._objGetSingleHerbsSeed["herbs_id"]);
            this._objGetSingleHerbsSeed["coin"] = HerbsType.getCoin(this._objGetSingleHerbsSeed["herbs_id"]);
            this._objGetSingleHerbsSeed["ripe_time"] = HerbsType.getRipeTime(this._objGetSingleHerbsSeed["herbs_id"]);
            this._objGetSingleHerbsSeed["color"] = this._objHerbsColor[this._objGetSingleHerbsSeed["herbs_star_level"]];
            this._aryGetGroupHerbsSeed = [];
            var _local2:Array = HerbsType.getIdsByLock(HerbsType.getLock(this._objGetSingleHerbsSeed["herbs_id"]));
            for each (_local3 in _local2) {
                _local4 = {};
                _local4["herbs_id"] = _local3;
                _local4["herbs_sign"] = HerbsType.getSign(_local4["herbs_id"]);
                _local4["herbs_name"] = HerbsType.getName(_local4["herbs_id"]);
                _local4["herbs_star_level"] = HerbsType.getStarLevel(_local4["herbs_id"]);
                _local4["experience"] = HerbsType.getExperience(_local4["herbs_id"]);
                _local4["coin"] = HerbsType.getCoin(_local4["herbs_id"]);
                _local4["ripe_time"] = HerbsType.getRipeTime(_local4["herbs_id"]);
                _local4["herbs_type"] = HerbsType.getType(_local4["herbs_id"]);
                _local4["current"] = (this._objGetSingleHerbsSeed["herbs_id"] == _local3);
                _local4["color"] = this._objHerbsColor[_local4["herbs_star_level"]];
                _local4["simple_herbs_sign"] = this.getSimpleHerbeSign(_local4["herbs_sign"]);
                _local4["url"] = (((URI.farmIconUrl + _local4["herbs_type"]) + _local4["herbs_star_level"]) + ".swf");
                this._objImageUrl[(_local4["simple_herbs_sign"] + "3")] = ((URI.farmIconUrl + _local4["simple_herbs_sign"]) + "3.swf");
                this._objImageUrl[(_local4["simple_herbs_sign"] + "2")] = ((URI.farmIconUrl + _local4["simple_herbs_sign"]) + "2.swf");
                this._objImageUrl[(_local4["simple_herbs_sign"] + "1")] = ((URI.farmIconUrl + _local4["simple_herbs_sign"]) + "1.swf");
                this._aryGetGroupHerbsSeed.push(_local4);
            };
            this.loadImageCache();
            this._aryGetGroupHerbsSeed.sortOn(["herbs_id"], Array.NUMERIC);
        }
        public function refresh_herbs_seed(_arg1:Array):void{
            this._objRefreshHerbsSeed = {};
            oObject.list(_arg1, this._objRefreshHerbsSeed, ["result", "herbs_id", "refresh_ingot", "herbs_type"]);
            this._objRefreshHerbsSeed["herbs_sign"] = HerbsType.getSign(this._objRefreshHerbsSeed["herbs_id"]);
            this._objRefreshHerbsSeed["herbs_name"] = HerbsType.getName(this._objRefreshHerbsSeed["herbs_id"]);
            this._objRefreshHerbsSeed["herbs_star_level"] = HerbsType.getStarLevel(this._objRefreshHerbsSeed["herbs_id"]);
            this._objRefreshHerbsSeed["experience"] = HerbsType.getExperience(this._objRefreshHerbsSeed["herbs_id"]);
            this._objRefreshHerbsSeed["coin"] = HerbsType.getCoin(this._objRefreshHerbsSeed["herbs_id"]);
            this._objRefreshHerbsSeed["ripe_time"] = HerbsType.getRipeTime(this._objRefreshHerbsSeed["herbs_id"]);
            this._objRefreshHerbsSeed["simple_herbs_sign"] = this.getSimpleHerbeSign(this._objRefreshHerbsSeed["herbs_sign"]);
            this._objRefreshHerbsSeed["color"] = this._objHerbsColor[this._objRefreshHerbsSeed["herbs_star_level"]];
            this._objRefreshHerbsSeed["current"] = true;
        }
        public function get_top_herbs_seed(_arg1:Array):void{
            this._objGetTopHerbsSeed = {};
            oObject.list(_arg1, this._objGetTopHerbsSeed, ["result", "herbs_id", "herbs_type"]);
            this._objGetTopHerbsSeed["herbs_sign"] = HerbsType.getSign(this._objGetTopHerbsSeed["herbs_id"]);
            this._objGetTopHerbsSeed["herbs_name"] = HerbsType.getName(this._objGetTopHerbsSeed["herbs_id"]);
            this._objGetTopHerbsSeed["herbs_star_level"] = HerbsType.getStarLevel(this._objGetTopHerbsSeed["herbs_id"]);
            this._objGetTopHerbsSeed["experience"] = HerbsType.getExperience(this._objGetTopHerbsSeed["herbs_id"]);
            this._objGetTopHerbsSeed["coin"] = HerbsType.getCoin(this._objGetTopHerbsSeed["herbs_id"]);
            this._objGetTopHerbsSeed["ripe_time"] = HerbsType.getRipeTime(this._objGetTopHerbsSeed["herbs_id"]);
            this._objGetTopHerbsSeed["color"] = this._objHerbsColor[this._objGetTopHerbsSeed["herbs_star_level"]];
            this._objGetTopHerbsSeed["simple_herbs_sign"] = this.getSimpleHerbeSign(this._objGetTopHerbsSeed["herbs_sign"]);
            this._objGetTopHerbsSeed["current"] = true;
        }
        public function plant_herbs(_arg1:Array):void{
            this._objPlantHerbs = {};
            oObject.list(_arg1, this._objPlantHerbs, ["result", "farmland_id", "player_role_id", "player_role_sign", "player_role_name", "player_role_level", "player_role_experience", "max_experience", "herbs_id", "farmland_level", "coin_tree_count", "is_plant", "herbs_type"]);
            this._objPlantHerbs["herbs_sign"] = HerbsType.getSign(this._objPlantHerbs["herbs_id"]);
            this._objPlantHerbs["herbs_name"] = HerbsType.getName(this._objPlantHerbs["herbs_id"]);
            this._objPlantHerbs["herbs_star_level"] = HerbsType.getStarLevel(this._objPlantHerbs["herbs_id"]);
            this._objPlantHerbs["experience"] = Math.ceil((HerbsType.getExperience(this._objPlantHerbs["herbs_id"]) * (((this._objPlantHerbs["farmland_level"] - 1) * 0.2) + 1)));
            this._objPlantHerbs["coin"] = Math.ceil(((HerbsType.getCoin(this._objPlantHerbs["herbs_id"]) + (this._objPlantHerbs["player_role_level"] * 2000)) * (((this._objPlantHerbs["farmland_level"] - 1) * 0.2) + 1)));
            this._objPlantHerbs["color"] = this._objHerbsColor[this._objPlantHerbs["herbs_star_level"]];
            this._objPlantHerbs["is_can_open"] = 0;
            this._objPlantHerbs["growing"] = 1;
            this._objPlantHerbs["role_experience"] = ((this._objPlantHerbs["player_role_experience"] + "/") + this._objPlantHerbs["max_experience"]);
            this._objPlantHerbs["simple_herbs_sign"] = this.getSimpleHerbeSign(this._objPlantHerbs["herbs_sign"]);
        }
        public function harvest(_arg1:Array):void{
            this._objHarvest = {};
            oObject.list(_arg1, this._objHarvest, ["result", "role_name", "herbs_name", "experience", "level", "coin", "farmland_time", "herbs_type"]);
        }
        public function reclamation(_arg1:Array):void{
            this._objReclamation = {};
            oObject.list(_arg1, this._objReclamation, ["result", "farmland_id"]);
        }
        public function check_role_state(_arg1:Array):void{
            this._objCheckRoleState = {};
            oObject.list(_arg1, this._objCheckRoleState, ["result"]);
        }
        public function get_simple_farmlandinfo(_arg1:Array):void{
            this._objGetSimpleFarmlandinfo = {};
            oObject.list(_arg1, this._objGetSimpleFarmlandinfo, ["farmland_count", "plant_count"]);
        }
        public function clear_farmland_cd(_arg1:Array):void{
            this._objClearFarmlandCd = {};
            oObject.list(_arg1, this._objClearFarmlandCd, ["result"]);
        }
        public function buy_coin_tree_count_info(_arg1:Array):void{
            this._objBuyCoinTreeCountInfo = {};
            oObject.list(_arg1, this._objBuyCoinTreeCountInfo, ["coin_tree_count", "remain_buy_times", "ingot", "recorve_cd"]);
        }
        public function buy_coin_tree_count(_arg1:Array):void{
            this._objBuyCoinTreeCount = {};
            oObject.list(_arg1, this._objBuyCoinTreeCount, ["result", "coin_tree_counts"]);
        }
        public function coin_tree_count_notify(_arg1:Array):void{
            this._objCoinTreeCountNotify = {};
            oObject.list(_arg1, this._objCoinTreeCountNotify, ["coin_tree_counts"]);
        }
        public function ingot_for_farmland(_arg1:Array):void{
            this._objIngotForFarmland = {};
            oObject.list(_arg1, this._objIngotForFarmland, ["ingot"]);
        }
        public function up_farmland_level(_arg1:Array):void{
            this._objUpFarmlandLevel = {};
            oObject.list(_arg1, this._objUpFarmlandLevel, ["result"]);
        }

    }
}//package com.datas 

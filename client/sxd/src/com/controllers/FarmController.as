//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class FarmController extends Base {

        public function get getFarmlandinfoList():Array{
            return (this._data.farm.getFarmlandinfoList);
        }
        public function get maxFarmlandCount():int{
            return (this._data.farm.maxFarmlandCount);
        }
        public function get getPlayerRoleInfoList():Array{
            return (this._data.farm.getPlayerRoleInfoList);
        }
        public function get getSingleHerbsSeed():Object{
            return (this._data.farm.getSingleHerbsSeed);
        }
        public function get getGroupHerbsSeed():Array{
            return (this._data.farm.getGroupHerbsSeed);
        }
        public function get refreshHerbsSeed():Object{
            return (this._data.farm.refreshHerbsSeed);
        }
        public function get getTopHerbsSeed():Object{
            return (this._data.farm.getTopHerbsSeed);
        }
        public function get plantHerbs():Object{
            return (this._data.farm.plantHerbs);
        }
        public function get harvestHerbs():Object{
            return (this._data.farm.harvestHerbs);
        }
        public function get openFarmland():Object{
            return (this._data.farm.openFarmland);
        }
        public function get checkRoleState():Object{
            return (this._data.farm.checkRoleState);
        }
        public function get getSimpleFarmlandinfo():Object{
            return (this._data.farm.getSimpleFarmlandinfo);
        }
        public function get clearFarmlandCd():Object{
            return (this._data.farm.clearFarmlandCd);
        }
        public function get buyCoinTreeCountInfo():Object{
            return (this._data.farm.buyCoinTreeCountInfo);
        }
        public function get buyCoinTreeCount():Object{
            return (this._data.farm.buyCoinTreeCount);
        }
        public function get coinTreeCountNotify():Object{
            return (this._data.farm.coinTreeCountNotify);
        }
        public function get ingotForFarmland():Object{
            return (this._data.farm.ingotForFarmland);
        }
        public function get upFarmlandLevel():Object{
            return (this._data.farm.upFarmlandLevel);
        }
        public function get getIsImgComplete():Boolean{
            return (this._data.farm.getIsImgComplete);
        }

    }
}//package com.controllers 

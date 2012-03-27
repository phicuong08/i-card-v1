//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.*;
    import com.haloer.data.*;
    import com.assist.server.*;

    public class SuperDeployData extends Base {

        private var _objDeployResearch:Object;
        private var _aryRoleList:Array;
        private var _aryDeployGrid:Array;
        private var _objUpDeploy:Object;
        private var _objDownDeploy:Object;
        private var _objNewDeployGridOpenNotify:Object;

        public function SuperDeployData(){
            this._objDeployResearch = {};
            this._aryRoleList = [];
            this._aryDeployGrid = [];
            this._objUpDeploy = {};
            this._objDownDeploy = {};
            this._objNewDeployGridOpenNotify = {};
            super();
        }
        public function get deployResearch():Object{
            return (this._objDeployResearch);
        }
        public function get roleList():Array{
            return (this._aryRoleList);
        }
        public function get deployGrid():Array{
            return (this._aryDeployGrid);
        }
        public function get upDeploy():Object{
            return (this._objUpDeploy);
        }
        public function get downDeploy():Object{
            return (this._objDownDeploy);
        }
        public function get newDeployGridOpenNotify():Object{
            return (this._objNewDeployGridOpenNotify);
        }
        public function super_deploy_list(_arg1:Array):void{
            var _local2:Array;
            var _local3:Array;
            var _local4:Object;
            var _local5:Object;
            var _local6:Object;
            this._aryRoleList = [];
            for each (_local2 in _arg1[(_arg1.length - 2)]) {
                _local4 = {};
                oObject.list(_local2, _local4, ["player_role_id", "is_main_role", "health", "max_health", "role_sign", "role_name", "role_level", "role_job_name", "role_stunt", "strength", "agile", "intellect", "is_deploy"]);
                if (_local4["is_main_role"] == 1){
                    _local4["role_name"] = this._data.player.nickname;
                };
                _local4["url"] = ((URI.iconsUrl + _local4["role_sign"]) + ".png");
                this._aryRoleList.push(_local4);
            };
            this._aryDeployGrid = [];
            for each (_local3 in _arg1[(_arg1.length - 1)]) {
                _local5 = {};
                oObject.list(_local3, _local5, ["grid_type_id", "player_role_id"]);
                for each (_local6 in this._aryRoleList) {
                    if (_local5["player_role_id"] != _local6["player_role_id"]){
                    } else {
                        _local5["role_name"] = _local6["role_name"];
                        _local5["url"] = _local6["url"];
                        _local5["is_main_role"] = _local6["is_main_role"];
                    };
                };
                this._aryDeployGrid.push(_local5);
            };
        }
        public function up_deploy(_arg1:Array):void{
            this._objUpDeploy = {};
            oObject.list(_arg1, this._objUpDeploy, ["result"]);
        }
        public function down_deploy(_arg1:Array):void{
            this._objDownDeploy = {};
            oObject.list(_arg1, this._objDownDeploy, ["result"]);
        }
        public function deploy_research_and_first_attack(_arg1:Array):void{
            this._objDeployResearch = {};
            oObject.list(_arg1, this._objDeployResearch, ["research_id", "research_name", "research_level", "skill", "player_level", "first_attack"]);
            this._objDeployResearch["content"] = ResearchType.getContent(this._objDeployResearch["research_id"]);
        }
        public function new_deploy_grid_open_notify(_arg1:Array):void{
            this._objNewDeployGridOpenNotify = {};
            oObject.list(_arg1, this._objNewDeployGridOpenNotify, ["id"]);
        }

    }
}//package com.datas 

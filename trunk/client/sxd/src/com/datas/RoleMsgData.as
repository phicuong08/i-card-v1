//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.info.*;
    import com.haloer.data.*;
    import com.lang.client.com.datas.*;
    import com.protocols.*;

    public class RoleMsgData extends Base {

        public var roleList:Array;
        public var otherRoleList:Array;
        public var coin:int = 0;
        public var radio:int = 0;
        public var trainingBase:Array;
        public var trainingOld:Array;
        public var trainingNew:Array;
        public var nearResult:int;
        public var roleIdList:Array;
        public var simpleRoleList:Array;
        public var flowersTips:String = "";
        public var roleWarAttributeData:Object;
        public var defaultDeployFirstAttackData:Object;
        public var ExpChange:int = 0;

        public function RoleMsgData(){
            this.roleList = [];
            this.otherRoleList = [];
            this.trainingBase = [];
            this.trainingOld = [];
            this.trainingNew = [];
            this.roleIdList = [];
            this.simpleRoleList = [];
            this.roleWarAttributeData = {};
            this.defaultDeployFirstAttackData = {};
            super();
        }
        public function get_role_list(_arg1:Array):void{
            var _local6:RoleInfo;
            var _local7:Array;
            var _local8:Boolean;
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["main_player_role_id", "eqId", "player_id", "sport_ranking", "listener_count", "flower_count", "fame", "faction_name", "max_player_id", "max_nickname", "max_flower_count", "fame_level", "player_pet_animal_lv", "player_pet_animal_stage", "role_list"]);
            var _local3:String = RoleMsgDataLang.PlayerRole;
            if (((!((_local2.faction_name == ""))) && ((_local2.sport_ranking > 0)))){
                _local3 = (((("[" + _local2.faction_name) + "]") + RoleMsgDataLang.ArenaIdx) + _local2.sport_ranking);
            } else {
                if (_local2.faction_name != ""){
                    _local3 = (("[" + _local2.faction_name) + "]");
                } else {
                    if (_local2.sport_ranking > 0){
                        _local3 = ((("[" + RoleMsgDataLang.ArenaIdx) + _local2.sport_ranking) + "]");
                    };
                };
            };
            this.flowersTips = "";
            if (_local2.max_flower_count != 0){
                this.flowersTips = ((HtmlText.format(_local2.max_nickname, 16631433) + " ") + HtmlText.format((_local2.max_flower_count + RoleMsgDataLang.Flower)));
                this.flowersTips = (((("<b>" + RoleMsgDataLang.Send) + "\n") + this.flowersTips) + "</b>");
            };
            var _local4:Boolean = !((_local2.player_id == _data.player.playerId));
            var _local5:Array = [];
            for each (_local7 in _local2.role_list) {
                _local6 = new RoleInfo();
                _local5.push(_local6);
                oObject.list(_local7, _local6, ["name", "roleId", "playerRoleId", "exp", "expMax", "lv", "jobId", "pZhiYe", "pZhanFa", "pZhanFaMsg", "pShengMing", "pShengMing", "pWuLi", "pJueJi", "pFaShu", "pWuXing", "fatePower", "is_deploy", "toTrans", "beTrans"]);
                _local8 = (((_local6.is_deploy == Mod_Role_Base.DEPLOY)) && ((false == _local4)));
                _local6.ismain = (_local6.playerRoleId == _local2.main_player_role_id);
                _local6.priority = _local6.lv;
                _local6.priority = (_local6.priority + (_local8) ? 1000 : 0);
                _local6.priority = (_local6.priority + (_local6.ismain) ? 10000 : 0);
                _local6.nameColor = (_local8) ? 0xF39700 : 16114847;
                _local6.roleTopMsg = _local6.name;
                _local6.fame = _local2.fame;
                _local6.fameLv = _local2.fame_level;
                _local6.flowers = _local2.flower_count;
                _local6.tingzhong = _local2.listener_count;
                _local6.headUrl = ((URI.iconsUrl + RoleType.getRoleSign(_local6.roleId)) + ".png");
                _local6.sign = (RoleType.getRoleSign(_local6.roleId) + (_local6.ismain) ? ItemType.getItemSuffix(_local2.eqId) : "");
                _local6.name = _data.player.removeNickNameSuffix(_local6.name);
                _local6.showDanYao = (_data.player.townKey >= TownType.getLock(TownType.getId(TownType.JingCheng)));
                _local6.showTraining = FunctionType.isOpened(FunctionType.Training);
                _local6.showFollow = (((_local6.ismain == false)) && ((_data.player.vipLevel >= 3)));
                _local6.showFlower = (((_local6.ismain == true)) && (FunctionType.isOpened(FunctionType.SendFlower)));
                _local6.showTFFame = (((_local6.ismain == true)) && ((_local6.fame > 0)));
                _local6.showChuanCheng = (((_local6.ismain == false)) && (FunctionType.isOpened(FunctionType.Inherit)));
                _local6.showSeeInfo = FunctionType.isOpened(FunctionType.WarAttribute);
                _local6.showYaoQing = ((_local6.showDanYao) && (_local6.ismain));
                if (_local6.expMax == -1){
                    _local6.expMax = 100;
                    _local6.exp = 100;
                };
                if (_local6.ismain){
                    _local3 = (_local6.name + _local3);
                    _local6.petLv = _local2.player_pet_animal_lv;
                    _local6.petStar = _local2.player_pet_animal_stage;
                };
                if (_local6.toTrans != ""){
                    _local6.toTrans = Lang.sprintf(RoleMsgDataLang.ToTrans, _local6.toTrans);
                };
                if (_local6.beTrans != ""){
                    _local6.beTrans = Lang.sprintf(RoleMsgDataLang.BeTrans, _local6.beTrans);
                };
            };
            for each (_local6 in _local5) {
                _local6.roleTopMsg = _local3;
            };
            if (_local4 == false){
                this.roleList = _local5;
            } else {
                this.otherRoleList = _local5;
            };
        }
        public function get_role_list_simpe(_arg1:Array):void{
            var _local2:RoleInfo;
            for each (_local2 in this.roleList) {
                if (_local2.playerRoleId == _arg1[1]){
                    _local2.exp = _arg1[2];
                    _local2.expMax = _arg1[3];
                    _local2.pShengMing = _arg1[4];
                    _local2.pWuLi = _arg1[6];
                    _local2.pJueJi = _arg1[7];
                    _local2.pFaShu = _arg1[8];
                    if (_local2.expMax == -1){
                        _local2.expMax = 100;
                        _local2.exp = 100;
                    };
                    break;
                };
            };
        }
        public function set_follow_role(_arg1:Array):void{
        }
        public function get_role_id_list(_arg1:Array):void{
            this.roleIdList = [];
            _arg1 = _arg1[0];
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                this.roleIdList.push(_arg1[_local3][0]);
                _local3++;
            };
        }
        public function exp_change_notify(_arg1:Array):void{
            this.ExpChange = _arg1[1];
        }
        public function get_simple_role_list(_arg1:Array):void{
            var _local3:Array;
            this.simpleRoleList = [];
            var _local2:Object = {};
            for each (_local3 in _arg1[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["id", "roleId", "level", "is_deploy"]);
                this.simpleRoleList.push(_local2);
            };
        }
        public function panel_show(_arg1:Array):void{
            var _local2:Object = {};
            oObject.list(_arg1, _local2, ["id", "lv", "coin", "role_name", "strength", "agile", "intellect", "tranining_button"]);
            this.coin = _local2.coin;
            this.radio = [Mod_Training_Base.GENERAL, Mod_Training_Base.STRENGTHEN, Mod_Training_Base.PLATINUM, Mod_Training_Base.DIAMOND, Mod_Training_Base.EXTREME].indexOf(_local2.tranining_button);
            this.trainingBase = [_local2.strength, _local2.agile, _local2.intellect];
            this.trainingOld = _arg1[8][0];
            this.trainingNew = [];
        }
        public function training(_arg1:Array):void{
            this.nearResult = _arg1[0];
            if (this.nearResult == Mod_Training_Base.SUCCEED){
                this.trainingNew = [_arg1[1], _arg1[2], _arg1[3]];
            } else {
                this.trainingNew = [];
            };
        }
        public function modify_role_data(_arg1:Array):void{
            this.nearResult = _arg1[0];
            if (this.nearResult == Mod_Training_Base.SUCCEED){
                this.trainingOld = this.trainingNew.concat();
            };
            this.trainingNew = [];
        }
        public function down_partners(_arg1:Array):void{
            this.nearResult = _arg1[0];
        }
        public function get_role_war_attribute(_arg1:Array):void{
            this.roleWarAttributeData = {};
            oObject.list(_arg1, this.roleWarAttributeData, ["role_id", "role_job_id", "role_level", "health", "attack", "defense", "hit", "dodge", "critical", "block", "break_critical", "break_block", "stunt_attack", "stunt_defense", "magic_attack", "magic_defense", "stunt_id", "kill", "first_attack"]);
            this.roleWarAttributeData["url"] = ((URI.iconsUrl + RoleType.getRoleSign(this.roleWarAttributeData["role_id"])) + ".png");
            this.roleWarAttributeData["role_name"] = RoleType.getRoleName(this.roleWarAttributeData["role_id"]);
            this.roleWarAttributeData["role_job_name"] = RoleType.getJobName(this.roleWarAttributeData["role_job_id"]);
            var _local2:String = RoleStunt.getStuntName(RoleStunt.getStuntSign(this.roleWarAttributeData["stunt_id"]));
            var _local3:int;
            var _local4:int;
            while (_local4 < _local2.length) {
                if (_local2.charCodeAt(_local4) > 127){
                    _local3 = (_local3 + 2);
                } else {
                    _local3 = (_local3 + 1);
                };
                if (_local3 > 16){
                    if (_local2.charCodeAt((_local4 - 1)) > 127){
                        _local2 = (_local2.substr(0, (_local4 - 1)) + "...");
                    } else {
                        _local2 = (_local2.substr(0, (_local4 - 2)) + "...");
                    };
                };
                _local4++;
            };
            this.roleWarAttributeData["stunt_name"] = _local2;
            this.roleWarAttributeData["stunt_description"] = RoleStunt.getStuntDescription(this.roleWarAttributeData["stunt_id"]);
        }
        public function get_default_deploy_first_attack(_arg1:Array):void{
            var _local3:String;
            this.defaultDeployFirstAttackData = {};
            oObject.list(_arg1, this.defaultDeployFirstAttackData, ["deploy_name", "research_add", "item_add", "itemstrength_add", "fate_add", "level_add", "train_add"]);
            var _local2:int;
            for (_local3 in this.defaultDeployFirstAttackData) {
                if ((this.defaultDeployFirstAttackData[_local3] is int)){
                    _local2 = (_local2 + this.defaultDeployFirstAttackData[_local3]);
                };
            };
            this.defaultDeployFirstAttackData["total"] = _local2;
        }
        private function getRoleInfoAtId(_arg1:int, _arg2:Array):RoleInfo{
            var _local3:RoleInfo;
            for each (_local3 in _arg2) {
                if (_local3.playerRoleId == _arg1){
                    return (_local3);
                };
            };
            return (null);
        }

    }
}//package com.datas 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import com.assist.view.guide.*;

    public class SuperDeployView extends Base implements IView {

        private var _superDeploy:ISuperDeploy;
        private var _blnInResearchUpgrade:Boolean = false;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._superDeploy.clear();
            this._view.guide.stopDeployGuides();
        }
        private function loadData():void{
            this.super_deploy_list(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("SuperDeploy", this.render, SuperDeployViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._superDeploy.content);
            _view.center(sign, this._superDeploy.content);
        }
        private function render():void{
            if (this._superDeploy == null){
                this._superDeploy = (_view.getAssetsObject("SuperDeploy", "SuperDeploy") as ISuperDeploy);
            };
            this.init();
            this.deploy_research_and_first_attack();
            this.superDeployCallBack();
            this.showUI();
            _view.guide.trackDeploy(2, this._superDeploy.content);
        }
        private function init():void{
            this._blnInResearchUpgrade = false;
            this._superDeploy.tip = this._view.tip.iTip;
            this._superDeploy.drag = this._view.drag.iDrag;
            this._superDeploy.onClose = this.close;
            this._superDeploy.onUpDeploy = this.up_deploy;
            this._superDeploy.onDownDeploy = this.down_deploy;
            this._superDeploy.onLevelUp = this.research_upgrade;
            this._superDeploy.onSaveShowOrder = this.saveShowOrder;
            this._superDeploy.playerLevel = this._ctrl.player.level;
            this._superDeploy.playerSkill = this._ctrl.player.skill;
            this._superDeploy.init();
        }
        private function saveShowOrder(_arg1:Boolean):void{
            _view.setCookie("SuperDeployShowOrder", _arg1);
        }
        private function checkUpDeploy(_arg1:int, _arg2:int):Boolean{
            var _local8:int;
            var _local3:Array = this._ctrl.superDeploy.roleList;
            var _local4:Array = this._ctrl.superDeploy.deployGrid;
            var _local5:Object = {};
            var _local6:Object = {};
            var _local7:Object = {};
            for each (_local5 in _local3) {
                if ((((_local5["player_role_id"] == _arg1)) && ((_local5["is_deploy"] == 0)))){
                    for each (_local6 in _local4) {
                        if ((((_local6["grid_type_id"] == _arg2)) && ((_local6["is_main_role"] == 1)))){
                            _view.showTip(SuperDeployViewLang.CanNotDownMainRole);
                            this._superDeploy.renderDeploy(_local3, _local4, _view.getCookie("SuperDeployShowOrder"));
                            return (false);
                        };
                    };
                };
            };
            if (this.getObject(_arg1, _local3)["is_deploy"] == 0){
                _local8 = ((_local4.length >= 5)) ? 5 : _local4.length;
                for each (_local6 in _local4) {
                    if ((((_local6["grid_type_id"] == _arg2)) && ((_local6["player_role_id"] == 0)))){
                        for each (_local7 in _local4) {
                            if (_local7["player_role_id"] != 0){
                                _local8--;
                            };
                            if (_local8 <= 0){
                                _view.showTip(SuperDeployViewLang.FullDeploy);
                                this._superDeploy.renderDeploy(_local3, _local4, _view.getCookie("SuperDeployShowOrder"));
                                return (false);
                            };
                        };
                    };
                };
            };
            return (true);
        }
        private function checkDownDeploy(_arg1:int):Boolean{
            var _local2:Array = this._ctrl.superDeploy.roleList;
            var _local3:Array = this._ctrl.superDeploy.deployGrid;
            var _local4:Object = {};
            for each (_local4 in _local3) {
                if ((((_local4["grid_type_id"] == _arg1)) && ((_local4["is_main_role"] == 1)))){
                    _view.showTip(SuperDeployViewLang.CanNotDownMainRole);
                    this._superDeploy.renderDeploy(_local2, _local3, _view.getCookie("SuperDeployShowOrder"));
                    return (false);
                };
            };
            return (true);
        }
        private function beforeUpDeployServerToRenderSuccess(_arg1:int, _arg2:int):void{
            this._superDeploy.clearDeployGrid();
            this._superDeploy.clearRoleIcon();
            var _local3:Array = this._ctrl.superDeploy.roleList;
            var _local4:Array = this._ctrl.superDeploy.deployGrid;
            var _local5:Object = {};
            var _local6:Object = {};
            var _local7:Object = this.getObject(_arg1, _local3);
            _local7["is_deploy"] = 1;
            var _local8:String = _local7["role_name"];
            var _local9:String = _local7["url"];
            var _local10:int = _local7["is_main_role"];
            _arg1 = _local7["player_role_id"];
            var _local11:Object;
            for each (_local5 in _local4) {
                if ((((_local5["grid_type_id"] == _arg2)) && (!((_local5["player_role_id"] == 0))))){
                    _local11 = this.getObject(_local5["player_role_id"], _local3);
                    _local11["is_deploy"] = 0;
                    for each (_local6 in _local4) {
                        if (_local6["player_role_id"] == _local7["player_role_id"]){
                            _local6["role_name"] = _local11["role_name"];
                            _local6["url"] = _local11["url"];
                            _local6["is_main_role"] = _local11["is_main_role"];
                            _local6["player_role_id"] = _local11["player_role_id"];
                            _local11["is_deploy"] = 1;
                            break;
                        };
                    };
                    _local5["role_name"] = _local8;
                    _local5["url"] = _local9;
                    _local5["is_main_role"] = _local10;
                    _local5["player_role_id"] = _arg1;
                    break;
                };
            };
            if (_local11 == null){
                for each (_local6 in _local4) {
                    if (_local6["player_role_id"] == _local7["player_role_id"]){
                        _local6["role_name"] = "";
                        _local6["url"] = "";
                        _local6["is_main_role"] = 0;
                        _local6["player_role_id"] = 0;
                        break;
                    };
                };
                for each (_local5 in _local4) {
                    if (_local5["grid_type_id"] == _arg2){
                        _local5["role_name"] = _local8;
                        _local5["url"] = _local9;
                        _local5["is_main_role"] = _local10;
                        _local5["player_role_id"] = _arg1;
                        break;
                    };
                };
            };
            this._superDeploy.renderDeploy(_local3, _local4, _view.getCookie("SuperDeployShowOrder"));
        }
        private function beforeDownDeployServerToRenderSuccess(_arg1:int):void{
            var _local4:Object;
            var _local5:Object;
            this._superDeploy.clearDeployGrid();
            this._superDeploy.clearRoleIcon();
            var _local2:Array = this._ctrl.superDeploy.roleList;
            var _local3:Array = this._ctrl.superDeploy.deployGrid;
            for each (_local4 in _local3) {
                if (_local4["grid_type_id"] == _arg1){
                    _local5 = this.getObject(_local4["player_role_id"], _local2);
                    _local5["is_deploy"] = 0;
                    _local4["role_name"] = "";
                    _local4["url"] = "";
                    _local4["is_main_role"] = 0;
                    _local4["player_role_id"] = 0;
                    break;
                };
            };
            this._superDeploy.renderDeploy(_local2, _local3, _view.getCookie("SuperDeployShowOrder"));
        }
        private function getObject(_arg1:int, _arg2:Array):Object{
            var _local3:Object;
            for each (_local3 in _arg2) {
                if (_local3["player_role_id"] == _arg1){
                    return (_local3);
                };
            };
            return (null);
        }
        private function super_deploy_list(_arg1:Function):void{
            _data.call(Mod_SuperDeploy_Base.super_deploy_list, _arg1, []);
        }
        private function superDeployCallBack():void{
            var _local1:Array = this._ctrl.superDeploy.roleList;
            var _local2:Array = this._ctrl.superDeploy.deployGrid;
            this._superDeploy.renderDeploy(_local1, _local2, _view.getCookie("SuperDeployShowOrder"));
        }
        private function up_deploy(_arg1:int, _arg2:int):void{
            if (!this.checkUpDeploy(_arg1, _arg2)){
                return;
            };
            this.beforeUpDeployServerToRenderSuccess(_arg1, _arg2);
            _data.call(Mod_SuperDeploy_Base.up_deploy, this.upDeployCallBack, [_arg1, _arg2]);
            _view.guide.trackDeploy(3, this._superDeploy.content);
            if (false == _view.guide.isLastTrace(GuideType.Deploy)){
                _view.guide.setCookie(GuideType.Deploy);
            };
        }
        private function upDeployCallBack():void{
            var _local1:Object = this._ctrl.superDeploy.upDeploy;
            if (_local1["result"] != Mod_SuperDeploy_Base.SUCCEED){
                _view.showTip(this.superDeployMessage(_local1["result"]));
            };
            this.super_deploy_list(this.superDeployCallBack);
            this.deploy_research_and_first_attack();
        }
        private function down_deploy(_arg1:int):void{
            if (!this.checkDownDeploy(_arg1)){
                return;
            };
            this.beforeDownDeployServerToRenderSuccess(_arg1);
            _data.call(Mod_SuperDeploy_Base.down_deploy, this.downDeployCallBack, [_arg1]);
        }
        private function downDeployCallBack():void{
            var _local1:Object = this._ctrl.superDeploy.downDeploy;
            if (_local1["result"] != Mod_SuperDeploy_Base.SUCCEED){
                _view.showTip(this.superDeployMessage(_local1["result"]));
            };
            this.super_deploy_list(this.superDeployCallBack);
            this.deploy_research_and_first_attack();
        }
        private function research_upgrade(_arg1:int):void{
            if (this._blnInResearchUpgrade){
                return;
            };
            this._blnInResearchUpgrade = true;
            this._data.call(Mod_Research_Base.research_upgrade, this.researchUpgradeCallBack, [_arg1]);
        }
        private function researchUpgradeCallBack():void{
            var _local1:Object = this._ctrl.research.ResearchUpgrade();
            if (_local1["result"] == Mod_Research_Base.SUCCEED){
                this._superDeploy.isPlayLevelUpCartoon = true;
                this.deploy_research_and_first_attack();
            } else {
                _view.showTip(this.researchMessage(_local1["result"]));
                this._blnInResearchUpgrade = false;
            };
        }
        private function deploy_research_and_first_attack():void{
            _data.call(Mod_SuperDeploy_Base.deploy_research_and_first_attack, this.deployResearchAndFirstAttack, []);
        }
        private function deployResearchAndFirstAttack():void{
            var _local1:Object = this._ctrl.superDeploy.deployResearch;
            this._superDeploy.playerSkill = this._ctrl.player.skill;
            this._superDeploy.renderDeployResearch(_local1);
            this._blnInResearchUpgrade = false;
        }
        private function superDeployMessage(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_SuperDeploy_Base.SUCCEED:
                    _local2 = SuperDeployViewLang.Succeed;
                    break;
                case Mod_SuperDeploy_Base.CAN_NOT_DOWN_MAIN_ROLE:
                    _local2 = SuperDeployViewLang.CanNotDownMainRole;
                    break;
                case Mod_SuperDeploy_Base.NOT_MY_ROLE:
                    _local2 = SuperDeployViewLang.NotMyRole;
                    break;
                case Mod_SuperDeploy_Base.LEAVE_TEAM:
                    _local2 = SuperDeployViewLang.LeaveTeam;
                    break;
                case Mod_SuperDeploy_Base.NOT_ENOUGTH_LEVEL:
                    _local2 = SuperDeployViewLang.NotEnougthLevel;
                    break;
                case Mod_SuperDeploy_Base.FULL_DEPLOY:
                    _local2 = SuperDeployViewLang.FullDeploy;
                    break;
                default:
                    _local2 = (SuperDeployViewLang.Error + _arg1);
            };
            return (_local2);
        }
        private function researchMessage(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Research_Base.SUCCEED:
                    _local2 = ResearchViewLang.Succeed;
                    break;
                case Mod_Research_Base.FAILED:
                    _local2 = ResearchViewLang.Failed;
                    break;
                case Mod_Research_Base.FULL:
                    _local2 = ResearchViewLang.Full;
                    break;
                case Mod_Research_Base.CDTIME:
                    _local2 = ResearchViewLang.CdTime2;
                    break;
                case Mod_Research_Base.NOENOUGHSKILL:
                    _local2 = ResearchViewLang.NoEnoughSkill;
                    break;
                case Mod_Research_Base.LIMITLEVELSTRUCT:
                    _local2 = ResearchViewLang.LimitLevelStruct;
                    break;
                case Mod_Research_Base.NOENOUGHLEVEL:
                    _local2 = ResearchViewLang.NoEnoughLevel;
                    break;
                case Mod_Research_Base.NOENOUGHINGOT:
                    _local2 = ResearchViewLang.NoEnoughIngot;
                    break;
                default:
                    _local2 = (ResearchViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

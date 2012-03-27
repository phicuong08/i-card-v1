//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;

    public class PlayerCompareView extends Base implements IView {

        public var myPlayerId:int;
        public var myName:String;
        public var anotherPlayerId:int;
        public var anotherName:String;
        private var _playerCompare:IPlayerCompare;
        private var _aryMyResearch:Array;
        private var _aryAnotherResearch:Array;

        public function PlayerCompareView(){
            this._aryMyResearch = [];
            this._aryAnotherResearch = [];
            super();
        }
        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._playerCompare.clear();
            Helper.gc();
        }
        public function updateSkill():void{
        }
        private function loadData():void{
            this.research_add_list(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("PlayerCompare", this.render, PlayerCompareViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._playerCompare.content);
            _view.center(sign, this._playerCompare.content);
        }
        private function render():void{
            if (this._playerCompare == null){
                this._playerCompare = (_view.getAssetsObject("PlayerCompare", "PlayerCompare") as IPlayerCompare);
            };
            this.init();
            this.get_simple_role_list();
            this._playerCompare.renderResearchCompare(this._aryMyResearch, this._aryAnotherResearch);
            this.showUI();
        }
        private function init():void{
            this._playerCompare.tip = this._view.tip.iTip;
            this._playerCompare.drag = this._view.drag.iDrag;
            this._playerCompare.onClose = this.close;
            this._playerCompare.onResearchCompare = this.researchAddList;
            this._playerCompare.onFirstAttackCompare = this.get_default_deploy_first_attack;
            this._playerCompare.onAttribCompare = this.get_role_war_attribute;
            this._playerCompare.onFateCompare = this.get_role_fate_list;
            this._playerCompare.init(this.myName, this.anotherName);
        }
        private function copyObject(_arg1:Object):Object{
            var _local3:String;
            var _local2:Object = {};
            for (_local3 in _arg1) {
                _local2[_local3] = _arg1[_local3];
            };
            return (_local2);
        }
        private function researchAddList():void{
            var callBack:* = null;
            callBack = function ():void{
                _playerCompare.renderResearchCompare(_aryMyResearch, _aryAnotherResearch);
            };
            this.research_add_list(callBack);
        }
        private function get_default_deploy_first_attack():void{
            var objMy:* = null;
            var objAnother:* = null;
            var fun1:* = null;
            var fun2:* = null;
            fun1 = function ():void{
                objMy = copyObject(_ctrl.rolemsg.getDefaultDeployFirstAttack);
                _data.call(Mod_Role_Base.get_default_deploy_first_attack, fun2, [anotherPlayerId]);
            };
            fun2 = function ():void{
                objAnother = copyObject(_ctrl.rolemsg.getDefaultDeployFirstAttack);
                _playerCompare.renderFirstAttack(objMy, objAnother);
            };
            this._data.call(Mod_Role_Base.get_default_deploy_first_attack, fun1, [this.myPlayerId]);
            objMy = {};
            objAnother = {};
        }
        private function research_add_list(_arg1:Function):void{
            var fun1:* = null;
            var fun2:* = null;
            var callBack:* = _arg1;
            fun1 = function ():void{
                _aryMyResearch = _ctrl.research.researchAddList().slice();
                _data.call(Mod_Research_Base.research_add_list, fun2, [anotherPlayerId]);
            };
            fun2 = function ():void{
                _aryAnotherResearch = _ctrl.research.researchAddList().slice();
                callBack();
            };
            this._data.call(Mod_Research_Base.research_add_list, fun1, [this.myPlayerId]);
        }
        private function get_role_war_attribute(_arg1:int, _arg2:int):void{
            var objMy:* = null;
            var objAnother:* = null;
            var fun1:* = null;
            var fun2:* = null;
            var intMyRoleId:* = _arg1;
            var intAnotherRoleId:* = _arg2;
            fun1 = function ():void{
                objMy = copyObject(_ctrl.rolemsg.roleWarAttributeData);
                _data.call(Mod_Role_Base.get_role_war_attribute, fun2, [intAnotherRoleId]);
            };
            fun2 = function ():void{
                objAnother = copyObject(_ctrl.rolemsg.roleWarAttributeData);
                _playerCompare.renderAttrib(objMy, objAnother);
            };
            _data.call(Mod_Role_Base.get_role_war_attribute, fun1, [intMyRoleId]);
            objMy = {};
            objAnother = {};
        }
        private function get_role_fate_list(_arg1:int, _arg2:int):void{
            var objMy:* = null;
            var objAnother:* = null;
            var fun1:* = null;
            var fun2:* = null;
            var intMyRoleId:* = _arg1;
            var intAnotherRoleId:* = _arg2;
            fun1 = function ():void{
                objMy = copyObject(_ctrl.fate.roleFateData);
                _data.call(Mod_Fate_Base.get_role_fate_list, fun2, [intAnotherRoleId]);
            };
            fun2 = function ():void{
                objAnother = copyObject(_ctrl.fate.roleFateData);
                _playerCompare.renderFate(objMy, objAnother);
            };
            _data.call(Mod_Fate_Base.get_role_fate_list, fun1, [intMyRoleId]);
            objMy = {};
            objAnother = {};
        }
        private function get_simple_role_list():void{
            var aryMyRole:* = null;
            var aryAnotherRole:* = null;
            var fun1:* = null;
            var fun2:* = null;
            fun1 = function ():void{
                var _local2:Object;
                aryMyRole = _ctrl.upgrade.getSimpleRoleList().slice();
                var _local1:int = (aryMyRole.length - 1);
                while (_local1 >= 0) {
                    _local2 = (aryMyRole[_local1] as Object);
                    if (_local2["is_deploy"] == Mod_Role_Base.NODEPLOY){
                        aryMyRole.splice(_local1, 1);
                    };
                    _local1--;
                };
                _data.call(Mod_Role_Base.get_simple_role_list, fun2, [anotherPlayerId]);
            };
            fun2 = function ():void{
                var _local2:Object;
                aryAnotherRole = _ctrl.upgrade.getSimpleRoleList().slice();
                var _local1:int = (aryAnotherRole.length - 1);
                while (_local1 >= 0) {
                    _local2 = (aryAnotherRole[_local1] as Object);
                    if (_local2["roleId"] <= 6){
                        _local2["old_name"] = anotherName;
                    };
                    if (_local2["is_deploy"] == Mod_Role_Base.NODEPLOY){
                        aryAnotherRole.splice(_local1, 1);
                    };
                    aryAnotherRole.sortOn("roleId", Array.NUMERIC);
                    _local1--;
                };
                _playerCompare.renderRoleList(aryMyRole, aryAnotherRole);
            };
            _data.call(Mod_Role_Base.get_simple_role_list, fun1, [this.myPlayerId]);
            aryMyRole = [];
            aryAnotherRole = [];
        }

    }
}//package com.views 

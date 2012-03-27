//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class InheritView extends Base implements IView {

        private var _inherit:IInherit;
        private var _dialog:IAlert = null;
        private var _objInheritAttrib:Object = null;
        private var _aryInheritDrug:Array;
        private var _objBeInheritAttrib:Object = null;
        private var _aryAfterInheritDrug:Array;
        private var _intRoleType:int;
        private var _intRoleTypeInherit:int = 0;
        private var _intRoleTypeBeInherit:int = 1;
        private var _objInheritInfo:Object = null;
        private var _objBeInheritInfo:Object = null;
        private var _aryBeInheritRoleList:Array;
        private var _immInfo:ImmortalityInfo;
        public var playerRoleId:int;

        public function InheritView(){
            this._aryInheritDrug = [];
            this._aryAfterInheritDrug = [];
            this._aryBeInheritRoleList = [];
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
            this._objInheritAttrib = null;
            this._objBeInheritAttrib = null;
            this._objInheritInfo = null;
            this._objBeInheritInfo = null;
            this._aryAfterInheritDrug = [];
            this._aryInheritDrug = [];
            this._aryBeInheritRoleList = [];
            if (this._view.immortalityMsg.inStage){
                this._view.immortalityMsg.close();
            };
            this._inherit.clear();
            Helper.gc();
        }
        private function showUI():void{
            _popup.addView(this, this._inherit.content);
            _view.center(sign, this._inherit.content);
        }
        private function render():void{
            if (this._inherit == null){
                this._inherit = (_view.getAssetsObject("Inherit", "Inherit") as IInherit);
            };
            this.init();
            this.roleListCallBack();
            this._intRoleType = this._intRoleTypeInherit;
            this.role_list(this._intRoleType);
            this.showUI();
        }
        private function init():void{
            this._dialog = _view.alert.iAlert;
            this._inherit.tip = this._view.tip.iTip;
            this._inherit.drag = this._view.drag.iDrag;
            this._inherit.onClose = this.close;
            this._inherit.onDrugInherit = this.showInheritDrug;
            this._inherit.onDrugBeInherit = this.shwoAfterInheritDrug;
            this._inherit.onInherit = this.roleInherit;
            this._inherit.onRoleInheritChoose = this.role_attribute;
            this._inherit.onRoleBeInheritChoose = this.role_attribute;
            this._inherit.onIngotLevelCheck = this.ingotLevelCheck;
            this._inherit.onShwoDialog = this.showDialog;
            this._inherit.init(this.playerRoleId);
        }
        private function showInheritDrug(_arg1:String, _arg2:int):void{
            if (this._aryInheritDrug.length == 0){
                return;
            };
            this._immInfo = new ImmortalityInfo();
            this._immInfo.listWuli = this._aryInheritDrug[ItemType.WuLiDan];
            this._immInfo.listJueJi = this._aryInheritDrug[ItemType.JueJiDan];
            this._immInfo.listFaShu = this._aryInheritDrug[ItemType.FaShuDan];
            this._immInfo.roleLv = _arg2;
            this._immInfo.roleName = _arg1;
            _view.immortalityMsg.roleName = _arg1;
            _view.immortalityMsg.roleLv = _arg2;
            _view.immortalityMsg.showSee(this._immInfo);
        }
        private function shwoAfterInheritDrug(_arg1:String, _arg2:int, _arg3:int):void{
            if (this._aryAfterInheritDrug.length == 0){
                return;
            };
            this._immInfo = new ImmortalityInfo();
            var _local4:Object = (this._aryAfterInheritDrug[_arg3] as Object);
            var _local5:Array = _local4["after_inherit_drug_info"];
            this._immInfo.listWuli = _local5[ItemType.WuLiDan];
            this._immInfo.listJueJi = _local5[ItemType.JueJiDan];
            this._immInfo.listFaShu = _local5[ItemType.FaShuDan];
            this._immInfo.roleLv = _arg2;
            this._immInfo.roleName = _arg1;
            _view.immortalityMsg.roleName = _arg1;
            _view.immortalityMsg.roleLv = _arg2;
            _view.immortalityMsg.showSee(this._immInfo);
        }
        private function roleInherit(_arg1:int):void{
            var intIngot:* = 0;
            var intCoin:* = 0;
            var intSkill:* = 0;
            var callBack:* = null;
            var strTemp:* = null;
            var strMessage:* = null;
            var intType:* = _arg1;
            callBack = function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    inherit(intType);
                };
            };
            if ((((this._objInheritInfo == null)) || ((this._objBeInheritInfo == null)))){
                _view.showTip(InheritViewLang.NoChoose);
                return;
            };
            var ary:* = this._ctrl.inherit.attributeAfterInherit;
            if (intType == 0){
                intSkill = (ary[0] as Object)["skill"];
                intCoin = (ary[0] as Object)["coin"];
            } else {
                if (intType == 1){
                    intIngot = (ary[1] as Object)["ingot"];
                } else {
                    intIngot = (ary[2] as Object)["ingot"];
                };
            };
            if ((((((((intCoin == 0)) && ((intSkill == 0)))) && ((intIngot == 0)))) && (this.compareStateInvalid(intType)))){
                _view.showTip(InheritViewLang.NoEffect);
                return;
            };
            if ((((((intCoin > 0)) || ((intSkill > 0)))) || ((intIngot > 0)))){
                strTemp = "";
                if (intIngot > 0){
                    strTemp = (strTemp + (HtmlText.yellow(intIngot.toString()) + InheritViewLang.Ingot));
                };
                if (intCoin > 0){
                    strTemp = (strTemp + (HtmlText.yellow(intCoin.toString()) + InheritViewLang.Coin));
                };
                if (intSkill > 0){
                    strTemp = (strTemp + (HtmlText.yellow(intSkill.toString()) + InheritViewLang.Skill));
                };
                strMessage = Lang.sprintf(InheritViewLang.IsStartInherit, strTemp);
                this._dialog.yesLabel = InheritViewLang.DialogYes;
                this._dialog.noLabel = InheritViewLang.DialogNo;
                this._dialog.show(strMessage, (AlertButtonType.Yes | AlertButtonType.No), callBack);
            } else {
                return;
            };
        }
        private function compareStateInvalid(_arg1:int):Boolean{
            var _local2:Boolean;
            var _local3:Object = (this._ctrl.inherit.attributeAfterInherit[_arg1] as Object);
            if (this._objBeInheritAttrib["state_id"] > _local3["state_id"]){
                _local2 = true;
            } else {
                if (this._objBeInheritAttrib["state_id"] == _local3["state_id"]){
                    if (this._objBeInheritAttrib["state_level"] >= _local3["state_level"]){
                        _local2 = true;
                    };
                };
            };
            return (_local2);
        }
        private function showDialog(_arg1:String):void{
            var callBack:* = null;
            var strMessage:* = _arg1;
            callBack = function (_arg1:uint):void{
                close();
            };
            this._view.activities.showWinEffect();
            this._dialog.yesLabel = InheritViewLang.DialogYes;
            this._dialog.show(InheritViewLang.InheritSuccess, AlertButtonType.Yes, callBack);
        }
        private function ingotLevelCheck(_arg1:int):void{
            if (this._objBeInheritInfo == null){
                return;
            };
            this.updateAfterInheritDrugMsg(this._objBeInheritInfo["roleName"], this._objBeInheritInfo["level"], _arg1);
        }
        private function updateAfterInheritDrugMsg(_arg1:String, _arg2:int, _arg3:int):void{
            if (((_view.immortalityMsg.inStage) && ((_view.immortalityMsg.roleName == _arg1)))){
                this.shwoAfterInheritDrug(_arg1, _arg2, _arg3);
            };
        }
        private function updateInheritDrugMsg(_arg1:String, _arg2:int):void{
            if (((_view.immortalityMsg.inStage) && ((_view.immortalityMsg.roleName == _arg1)))){
                this.showInheritDrug(_arg1, _arg2);
            };
        }
        private function loadData():void{
            this._intRoleType = this._intRoleTypeBeInherit;
            _data.call(Mod_Inherit_Base.role_list, this.loadDataCallBack, [this._intRoleType]);
        }
        private function loadDataCallBack():void{
            loadAssets("Inherit", this.render, InheritViewLang.LoadInfo);
        }
        private function role_list(_arg1:int):void{
            _data.call(Mod_Inherit_Base.role_list, this.roleListCallBack, [_arg1]);
        }
        private function roleListCallBack():void{
            var _local1:Array = this._ctrl.inherit.roleList;
            if (this._intRoleType == this._intRoleTypeInherit){
                this._inherit.renderRoleInheritList(_local1);
            } else {
                this._aryBeInheritRoleList = _local1;
            };
        }
        private function role_attribute(_arg1:Object, _arg2:int, _arg3:int):void{
            var callBack:* = null;
            var ary:* = null;
            var i:* = 0;
            var objRole:* = null;
            var obj:* = _arg1;
            var intRoleType:* = _arg2;
            var intInheritType:* = _arg3;
            callBack = function ():void{
                roleAttributeCallBack(intInheritType);
            };
            this._intRoleType = intRoleType;
            if (this._intRoleType == this._intRoleTypeInherit){
                this._objInheritInfo = obj;
                this._objBeInheritInfo = null;
                this._objBeInheritAttrib = null;
                this._aryAfterInheritDrug = [];
                ary = this._aryBeInheritRoleList.slice();
                i = (ary.length - 1);
                while (i >= 0) {
                    objRole = ary[i];
                    if (objRole["player_role_id"] == this._objInheritInfo["roleId"]){
                        ary.splice(i, 1);
                    };
                    i = (i - 1);
                };
                this._inherit.renderRoleBeInheritList(ary);
            } else {
                this._objBeInheritInfo = obj;
            };
            _data.call(Mod_Inherit_Base.role_attribute, callBack, [obj["roleId"]]);
        }
        private function roleAttributeCallBack(_arg1:int):void{
            if (this._intRoleType == this._intRoleTypeInherit){
                this.get_player_role_elixir_record(_arg1);
            } else {
                this.attribute_after_inherit(_arg1);
            };
        }
        private function get_player_role_elixir_record(_arg1:int):void{
            var callBack:* = null;
            var intInheritType:* = _arg1;
            callBack = function ():void{
                getPlayerRoleElixirRecordCallBack(intInheritType);
            };
            _data.call(Mod_Item_Base.get_player_role_elixir_record, callBack, [this._objInheritInfo["roleId"]]);
        }
        private function getPlayerRoleElixirRecordCallBack(_arg1:int):void{
            this.attribute_after_inherit(_arg1);
        }
        private function attribute_after_inherit(_arg1:int):void{
            var intInheritType:* = _arg1;
            if (this._objBeInheritInfo == null){
                this._objInheritAttrib = this._ctrl.inherit.roleAttribute;
                this._aryInheritDrug = this._ctrl.item.danyaoList;
                if (this._intRoleType == this._intRoleTypeInherit){
                    this.updateInheritDrugMsg(this._objInheritInfo["roleName"], this._objInheritInfo["level"]);
                } else {
                    this.updateAfterInheritDrugMsg(this._objBeInheritInfo["roleName"], this._objBeInheritInfo["level"], intInheritType);
                };
                this._inherit.renderRoleCompare(this._objInheritAttrib, this._objBeInheritAttrib, this._ctrl.inherit.attributeAfterInherit);
            } else {
                var callBack:* = function ():void{
                    attributeAfterInheritCallBack(intInheritType);
                };
                _data.call(Mod_Inherit_Base.attribute_after_inherit, callBack, [this._objInheritInfo["roleId"], this._objBeInheritInfo["roleId"]]);
            };
        }
        private function attributeAfterInheritCallBack(_arg1:int):void{
            if (this._intRoleType == this._intRoleTypeInherit){
                this._aryInheritDrug = this._ctrl.item.danyaoList;
                this._objInheritAttrib = this._ctrl.inherit.roleAttribute;
                this.updateInheritDrugMsg(this._objInheritInfo["roleName"], this._objInheritInfo["level"]);
            } else {
                this._aryAfterInheritDrug = this._ctrl.inherit.attributeAfterInherit;
                this._objBeInheritAttrib = this._ctrl.inherit.roleAttribute;
                this.updateAfterInheritDrugMsg(this._objBeInheritInfo["roleName"], this._objBeInheritInfo["level"], _arg1);
            };
            this._inherit.renderRoleCompare(this._objInheritAttrib, this._objBeInheritAttrib, this._ctrl.inherit.attributeAfterInherit);
        }
        private function inherit(_arg1:int):void{
            _data.call(Mod_Inherit_Base.inherit, this.inheritCallBack, [this._objInheritInfo["roleId"], this._objBeInheritInfo["roleId"], _arg1]);
        }
        private function inheritCallBack():void{
            var _local1:Object = this._ctrl.inherit.inherit;
            if (_local1["result"] == Mod_Inherit_Base.SUCCESS){
                this._inherit.renderInheritSuccess();
            } else {
                this._view.showTip(this.message(_local1["result"]));
            };
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Inherit_Base.SUCCESS:
                    _local2 = InheritViewLang.Success;
                    break;
                case Mod_Inherit_Base.NO_COIN:
                    _local2 = InheritViewLang.NoCoin;
                    break;
                case Mod_Inherit_Base.NO_SKILL:
                    _local2 = InheritViewLang.NoSkill;
                    break;
                case Mod_Inherit_Base.NO_INGOT:
                    _local2 = InheritViewLang.NoIngot;
                    break;
                case Mod_Inherit_Base.CAN_NOT_INHERIT:
                    _local2 = InheritViewLang.CanNotInherit;
                    break;
                default:
                    _local2 = (InheritViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

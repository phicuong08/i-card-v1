//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;

    public class RoleDetailInfoView extends Base implements IView {

        private var _roleDetailInfo:IRoleDetailInfo;
        public var playerRoleId:int;
        public var playerName:String;

        public function show():void{
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._roleDetailInfo.clear();
        }
        public function updateDetailInfo(_arg1:int, _arg2:String):void{
            this.playerName = _arg2;
            this.playerRoleId = _arg1;
            this.get_role_war_attribute();
        }
        private function showUI():void{
            _popup.addView(this, this._roleDetailInfo.content);
            _view.center(sign, this._roleDetailInfo.content);
        }
        private function render():void{
            if (this._roleDetailInfo == null){
                this._roleDetailInfo = (_view.getAssetsObject("RoleDetailInfo", "RoleDetailInfo") as IRoleDetailInfo);
            };
            this.init();
            this.getRoleWarAttributecallBack();
            this.showUI();
        }
        private function init():void{
            this._roleDetailInfo.tip = this._view.tip.iTip;
            this._roleDetailInfo.drag = this._view.drag.iDrag;
            this._roleDetailInfo.onClose = this.close;
            this._roleDetailInfo.init();
        }
        private function loadData():void{
            if (this.playerRoleId == 0){
                return;
            };
            _data.call(Mod_Role_Base.get_role_war_attribute, this.loadDataCallBack, [this.playerRoleId]);
        }
        private function loadDataCallBack():void{
            loadAssets("RoleDetailInfo", this.render, RoleDetailInfoViewLang.LoadInfo);
        }
        private function get_role_war_attribute():void{
            if (this.playerRoleId == 0){
                return;
            };
            _data.call(Mod_Role_Base.get_role_war_attribute, this.getRoleWarAttributecallBack, [this.playerRoleId]);
        }
        private function getRoleWarAttributecallBack():void{
            var _local1:Object = this._ctrl.rolemsg.roleWarAttributeData;
            _local1["role_name"] = this.playerName;
            this._roleDetailInfo.renderDetailInfo(_local1);
        }

    }
}//package com.views 

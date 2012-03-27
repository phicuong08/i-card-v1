//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {
    import com.assist.view.*;
    import com.assist.*;
    import com.haloer.data.*;
    import com.assist.server.*;
    import com.lang.client.com.datas.*;

    public class PartnersData extends Base {

        private var _aryPartnersList:Array;
        private var _aryPartnersInvite:Array;
        public var recommend:String;

        public function PartnersData(){
            this._aryPartnersList = [];
            this._aryPartnersInvite = [];
            super();
        }
        public function getPartnersList():Array{
            var _local2:Object;
            var _local3:Array;
            var _local1:Array = [];
            for each (_local3 in this._aryPartnersList[0]) {
                _local2 = {};
                oObject.list(_local3, _local2, ["rold_id", "level", "fees", "fame", "stunt_name", "stunt_info", "health", "max_health", "strength", "agile", "intellect", "is_recommend", "fame_level", "is_invite_before"]);
                _local2["role_job_name"] = RoleType.getJobName(RoleType.getJobIdByRoleId(_local2["rold_id"]));
                _local2["name"] = RoleType.getRoleName(_local2["rold_id"]);
                _local2["rold_sign"] = RoleType.getRoleSign(_local2["rold_id"]);
                _local2["job_sign"] = RoleType.getJobSign(RoleType.getJobIdByRoleId(_local2["rold_id"]));
                _local1.push(_local2);
            };
            _local1.sort(this.sortFame);
            return (_local1);
        }
        public function getRecruitCount():Object{
            var _local1:Object = {};
            _local1["max_count"] = this._aryPartnersList[1];
            _local1["curr_count"] = this._aryPartnersList[2];
            _local1["fame_level"] = this._aryPartnersList[3];
            return (_local1);
        }
        public function Recruit():int{
            var _local1:int = this._aryPartnersInvite[0];
            return (_local1);
        }
        private function sortFame(_arg1:Object, _arg2:Object):int{
            var _local3:int = _arg1["fame"];
            var _local4:int = _arg2["fame"];
            if (_local3 < _local4){
                return (1);
            };
            if (_local3 > _local4){
                return (-1);
            };
            return (0);
        }
        public function partners_list(_arg1:Array):void{
            this._aryPartnersList = _arg1;
        }
        public function partners_invite(_arg1:Array):void{
            this._aryPartnersInvite = _arg1;
        }
        public function now_and_next_Recommend_role_list(_arg1:Array):void{
            var _local3:Array;
            this.recommend = ((((PartnersDataLang.Fame + _data.player.fame) + "(Lv") + _arg1[2]) + ")");
            this.recommend = ("<font size='18'> </font>" + htmlFormat(this.recommend, 14, 0xEB6100, true));
            var _local2:String = (("(" + HtmlText.green(PartnersDataLang.Recommend)) + ")");
            var _local4:String = "\n<font size='18'> </font>";
            if (_arg1[0].length > 0){
                this.recommend = ((this.recommend + _local4) + HtmlText.yellow(PartnersDataLang.NowPartner));
                for each (_local3 in _arg1[0]) {
                    this.recommend = (((((this.recommend + _local4) + RoleType.getRoleName(_local3[0])) + ", ") + RoleType.getJobName(RoleType.getJobIdByRoleId(_local3[0]))) + _local2);
                };
            };
            if (_arg1[1].length > 0){
                this.recommend = ((this.recommend + _local4) + HtmlText.yellow(PartnersDataLang.NextPartner));
                for each (_local3 in _arg1[1]) {
                    if (_local3[1] == 1){
                        this.recommend = (((((this.recommend + _local4) + RoleType.getRoleName(_local3[0])) + ", ") + RoleType.getJobName(RoleType.getJobIdByRoleId(_local3[0]))) + _local2);
                    } else {
                        this.recommend = ((((this.recommend + _local4) + RoleType.getRoleName(_local3[0])) + ", ") + RoleType.getJobName(RoleType.getJobIdByRoleId(_local3[0])));
                    };
                };
            };
            if ((((_arg1[0].length == 0)) && ((_arg1[1].length == 0)))){
                this.recommend = "";
            };
        }

    }
}//package com.datas 

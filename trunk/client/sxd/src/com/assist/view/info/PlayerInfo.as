//Created by Action Script Viewer - http://www.buraks.com/asv
package com.assist.view.info {
    import com.assist.server.*;

    public class PlayerInfo {

        public static var info:PlayerInfo;

        public var id:int;
        public var roleId:int;
        public var x:int;
        public var y:int;
        public var name:String = "";
        public var nameColor:int = 0xEEEEEE;
        public var followRoleId:int = 0;
        public var isMine:Boolean = false;
        public var fullHeadUrl:String = "";
        public var sign:String = "";
        public var signSuffix:String = "";
        public var starUser:int = 0;
        public var topUser:int = 0;
        public var petLv:int = 0;
        public var petStar:int = 0;
        public var sign2:String = "";
        public var action2:String = "";
        public var speed:int = 0;
        public var offY1:int = 0;
        public var offY2:int;
        public var showType:int = 0;
        public var underPractice:int = 0;
        public var itemId1:int = 0;
        public var itemId2:int = 0;
        public var warState:int = 0;
        public var factionId:int = 0;
        public var factionName:String = "";
        public var factionColor:int = 0xEEEEEE;
        public var practice:int = 0;
        public var practiceExp:int = 0;
        public var practiceExpOne:int = 0;
        public var practiceTime:int = 0;
        public var practiceWar:int = 0;
        public var practiceSpeedNum:int = 0;

        public function PlayerInfo(_arg1:Boolean=false):void{
            this.isMine = _arg1;
            if (_arg1){
                this.nameColor = 0xF39800;
            };
        }
        public function get signHash():String{
            return (((((this.sign2 + this.action2) + this.sign) + this.signSuffix) + this.practice));
        }
        public function get nameHtml():String{
            return ((((("<font size='13' color='#" + this.nameColor.toString(16)) + "'>") + this.name) + "</font>"));
        }
        public function get factionNameHtml():String{
            if (this.factionId == 0){
                return ("");
            };
            return ((((("\n<font size='13' color='#" + this.factionColor.toString(16)) + "'>【") + this.factionName) + "】</font>"));
        }
        public function setMount(_arg1:int):void{
            this.itemId1 = _arg1;
            this.updateMountAvatar();
        }
        public function setAvatar(_arg1:int):void{
            this.itemId2 = _arg1;
            this.updateMountAvatar();
        }
        private function updateMountAvatar():void{
            var _local1:int;
            var _local2:String;
            this.sign2 = "";
            this.action2 = "";
            this.speed = (this.offY1 = (this.offY2 = (this.showType = (this.underPractice = 0))));
            if (this.itemId1 == 32){
                this.action2 = "cloud";
                this.sign2 = "cloud";
                this.speed = 40;
                this.offY1 = 21;
                this.offY2 = -38;
                this.showType = 1;
            } else {
                if (this.itemId1 == 1008){
                    this.action2 = "cloud";
                    this.sign2 = "feijian";
                    this.speed = 80;
                    this.offY1 = 21;
                    this.offY2 = -43;
                    this.showType = 1;
                    this.underPractice = 1;
                } else {
                    if (this.itemId1 == 1192){
                        this.action2 = "cloud";
                        this.sign2 = "hulu";
                        this.speed = 100;
                        this.offY1 = 21;
                        this.offY2 = -95;
                        this.showType = 1;
                        this.underPractice = 1;
                    } else {
                        if (this.itemId1 == 1195){
                            this.action2 = "cloud";
                            this.sign2 = "hulu2";
                            this.speed = 100;
                            this.offY1 = 21;
                            this.offY2 = -95;
                            this.showType = 1;
                            this.underPractice = 1;
                        } else {
                            if (this.itemId1 == 1094){
                                this.action2 = "cloud";
                                this.sign2 = "cloud2";
                                this.speed = 100;
                                this.offY1 = 21;
                                this.offY2 = -50;
                                this.showType = 1;
                                this.underPractice = 1;
                            } else {
                                if (this.itemId1 == 1055){
                                    this.action2 = "mount_baihu_";
                                    this.sign2 = "BaiHu";
                                    this.speed = 100;
                                    this.showType = 2;
                                    this.underPractice = 1;
                                } else {
                                    if (this.itemId1 == 1177){
                                        this.action2 = "mount_lingyu_";
                                        this.sign2 = "LingYu";
                                        this.speed = 100;
                                        this.showType = 2;
                                        this.underPractice = 1;
                                    } else {
                                        if (this.itemId1 == 1196){
                                            this.action2 = "";
                                            this.sign2 = "mount_fenleiyi_";
                                            this.speed = 150;
                                            this.showType = 3;
                                            this.underPractice = 1;
                                        } else {
                                            if (this.itemId2 != 0){
                                                _local1 = ItemType.getMonsterId(this.itemId2);
                                                _local2 = MonsterType.getMonsterSign(_local1);
                                                _local2 = MonsterType.sameResource(_local2);
                                                this.sign2 = _local2;
                                                this.showType = 4;
                                                this.underPractice = 1;
                                                if (this.itemId2 == 1273){
                                                    this.sign2 = (RoleType.getRoleSign(this.roleId) + "_0214");
                                                    this.speed = 150;
                                                };
                                            };
                                        };
                                    };
                                };
                            };
                        };
                    };
                };
            };
        }

    }
}//package com.assist.view.info 

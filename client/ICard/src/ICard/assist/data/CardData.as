//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.data {
	
	import ICard.assist.view.controls.BattleFieldType;
	import ICard.haloer.data.*;
    public class CardData {
		private static const StateNormal:int = 1;
		private static const StateSide:int = 2;
		private static const StateTurn:int = 2;
		
		public var _realID:int; //唯一id
		public var _cardID:int; //卡片id,
		public var _buf:Array;  //挂着的buf
		public var _hpAdd:int;  //负值为扣血量
		public var _state:int;  //卡片状态，正常，横置，翻转
		public var _slot:int;  //卡片所在槽 
		
     
//        public function format(_arg1:Array):void{
//            var _local2:Object = {};
//            oObject.list(_arg1, _local2, ["offX", "offY", "challenged", "warResult", "awardExp", "awardItems", "failureAwardItem", "debugInfo", "reportId"]);
//            this.offset = [_local2["offX"], _local2["offY"]];
//            this.challenged = _local2["challenged"];
//            this.formatWarResult(_local2["warResult"][0]);
//            this.awardExperiences = this.formatAwardExperiences(((_local2["awardExp"]) || ([])));
//            this.awardItems = this.formatAwardItems(((_local2["awardItems"]) || ([])));
//            this.failureAwardItem = this.formatAwardItems(((_local2["failureAwardItem"]) || ([])));
//            this.debugInfo = ((_local2["debugInfo"]) || ([]));
//            this.reportId = ((_local2["reportId"]) || (0));
//        }
//        private function formatWarResult(_arg1:Array):void{
//            var _local2:Array;
//            var _local3:int;
//            var _local4:int;
//            this.winId = _arg1[0];
//            _local2 = _arg1[1][0];
//            this.attackerId = _local2[0];
//            this.attackerName = removeNickNameSuffix(_local2[1]);
//            this.attackerSoldiers = this.formatFighter(_local2[2], true);
//            this.attackerMainPlayerRoleId = _local2[3];
//            this.attackerMainRoleSuffix = getItemSuffix(parseInt(_local2[4]));
//            this.attackerMainRoleId = _local2[5];
//            this.attackerLevel = _local2[6];
//            this.attackerFirstAttack = _local2[7];
//            this.attackerPetName = _local2[8];
//            this.attackerPetLevel = _local2[9];
//            this.attackerPetStep = _local2[10];
//            _local2 = _arg1[1][1];
//            this.defenderId = _local2[0];
//            this.defenderName = removeNickNameSuffix(_local2[1]);
//            this.defenderSoldiers = this.formatFighter(_local2[2], false);
//            this.defenderMainPlayerRoleId = _local2[3];
//            this.defenderMainRoleSuffix = getItemSuffix(parseInt(_local2[4]));
//            this.defenderMainRoleId = _local2[5];
//            this.defenderLevel = _local2[6];
//            this.defenderFirstAttack = _local2[7];
//            this.defenderPetName = _local2[8];
//            this.defenderPetLevel = _local2[9];
//            this.defenderPetStep = _local2[10];
//            this.formatProcesses(_arg1[2]);
//        }
//    
  
//        private function formatAwardExperiences(_arg1:Array):Array{
//            var _local2:Array = [];
//            if (_arg1 == null){
//                return (_local2);
//            };
//            var _local3:int;
//            while (_local3 < _arg1.length) {
//                _local2[_local3] = {
//                    roleId:_arg1[_local3][0],
//                    exps:_arg1[_local3][1]
//                };
//                _local3++;
//            };
//            return (_local2);
//        }

    }
}//package com.assist.data.mission 

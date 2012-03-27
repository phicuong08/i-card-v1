//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {
    import com.datas.*;
    import com.lang.client.com.controllers.*;

    public class DeployController extends com.controllers.Base {

        public var ownData:DeployData;
        public var DeployResearchId:int = 0;

        public function get deployList():Array{
            var _local1:Array = this.ownData.deployList;
            var _local2:Array = [];
            _local2[0] = this.renderPlayer(_local1);
            _local2[1] = this.renderOpenDeploy(_local1);
            _local2[2] = this.renderDeploy(_local1);
            _local2[3] = _local1[6];
            _local2[4] = {firstAttack:_local1[8]};
            return (_local2);
        }
        public function renderPlayer(_arg1:Array):Array{
            var _local5:Object;
            var _local6:Object;
            var _local2:Array = [];
            var _local3:int = _arg1[5].length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local6 = _arg1[5][_local4];
                _local5.id = _local6[0];
                _local5.isRoleMain = _local6[1];
                _local5.health = ((_local6[2] + "/") + _local6[3]);
                _local5.name = _local6[4];
                if (_local5.isRoleMain == 1){
                    _local5.name = _data.player.nickname;
                };
                _local5.job = _local6[5];
                _local5.level = _local6[6];
                _local5.roleJobName = _local6[7];
                _local5.roleStunt = _local6[8];
                _local5.liveType = _local6[9];
                _local5.strength = _local6[10];
                _local5.agile = _local6[11];
                _local5.intellect = _local6[12];
                _local5.isDeploy = _local6[13];
                _local5.isPlant = _local6[14];
                _local2.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        private function renderOpenDeploy(_arg1:Array):Array{
            var _local5:Object;
            var _local6:Object;
            var _local2:Array = [];
            var _local3:int = _arg1[0].length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local6 = _arg1[0][_local4];
                _local5.id = _local6[0];
                _local5.name = _local6[1];
                _local5.level = _local6[2];
                _local5.isDefaut = _local6[3];
                _local5.researchId = _local6[4];
                _local5.topLevel = (_local6[5] < 0);
                _local5.isPlayerLevel = (_ctrl.player.level >= _local6[5]);
                _local5.playerSkill = _arg1[7];
                _local5.upLevelSkill = _local6[6];
                if (_local5.level > 0){
                    _local2.push(_local5);
                };
                _local4++;
            };
            return (_local2);
        }
        private function renderDeploy(_arg1:Array):Array{
            var _local5:Object;
            var _local6:Object;
            var _local2:Array = [];
            _local2[0] = {};
            _local2[0].name = _arg1[1];
            _local2[0].level = _arg1[2];
            _local2[0].discript = _arg1[3];
            _local2[0].addInfo = ((_local2[0].level > 10)) ? DeployControllerLang.FirstStrike : "";
            this.DeployResearchId = _arg1[4];
            _local2[0].player = [];
            var _local3:int = _arg1[4].length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = {};
                _local6 = _arg1[4][_local4];
                _local5.id = _local6[1];
                _local5.place = (_local6[0] - 1);
                _local2[0].player.push(_local5);
                _local4++;
            };
            return (_local2);
        }
        public function get upDeploy():Array{
            var _local1:Array = this.ownData.upDeploy;
            return (_local1);
        }
        public function get downDeploy():Array{
            var _local1:Array = this.ownData.downDeploy;
            return (_local1);
        }
        public function get allDownDeploy():Array{
            var _local1:Array = this.ownData.allDownDeploy;
            return (_local1);
        }
        public function get setDefautDeploy():Array{
            var _local1:Array = this.ownData.setDefautDeploy;
            return (_local1);
        }

    }
}//package com.controllers 

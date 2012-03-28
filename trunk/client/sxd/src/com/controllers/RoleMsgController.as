//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class RoleMsgController extends Base {

        public function get roleList():Array{
            return (_data.rolemsg.roleList);
        }
        public function get otherRoleList():Array{
            return (_data.rolemsg.otherRoleList);
        }
        public function get result():int{
            return (_data.rolemsg.nearResult);
        }
        public function get roleIdList():Array{
            return (_data.rolemsg.roleIdList);
        }
        public function get ExpChange():int{
            return (_data.rolemsg.ExpChange);
        }
        public function get coin():int{
            return (_data.rolemsg.coin);
        }
        public function get radio():int{
            return (_data.rolemsg.radio);
        }
        public function get trainingBase():Array{
            return (_data.rolemsg.trainingBase);
        }
        public function get trainingOld():Array{
            return (_data.rolemsg.trainingOld);
        }
        public function get trainingNew():Array{
            return (_data.rolemsg.trainingNew);
        }
        public function get simpleRoleList():Array{
            return (_data.rolemsg.simpleRoleList);
        }
        public function get flowersTips():String{
            return (_data.rolemsg.flowersTips);
        }
        public function get hasLower():Boolean{
            var _local1:int;
            while (_local1 < 3) {
                if (_data.rolemsg.trainingNew[_local1] < _data.rolemsg.trainingOld[_local1]){
                    return (true);
                };
                _local1++;
            };
            return (false);
        }
        public function get roleWarAttributeData():Object{
            return (_data.rolemsg.roleWarAttributeData);
        }
        public function get getDefaultDeployFirstAttack():Object{
            return (_data.rolemsg.defaultDeployFirstAttackData);
        }

    }
}//package com.controllers 

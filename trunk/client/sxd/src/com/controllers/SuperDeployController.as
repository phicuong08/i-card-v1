//Created by Action Script Viewer - http://www.buraks.com/asv
package com.controllers {

    public class SuperDeployController extends Base {

        public function get deployResearch():Object{
            return (this._data.superDeploy.deployResearch);
        }
        public function get roleList():Array{
            return (this._data.superDeploy.roleList);
        }
        public function get deployGrid():Array{
            return (this._data.superDeploy.deployGrid);
        }
        public function get upDeploy():Object{
            return (this._data.superDeploy.upDeploy);
        }
        public function get downDeploy():Object{
            return (this._data.superDeploy.downDeploy);
        }
        public function get newDeployGridOpenNotify():Object{
            return (this._data.superDeploy.newDeployGridOpenNotify);
        }

    }
}//package com.controllers 

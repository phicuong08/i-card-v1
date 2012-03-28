//Created by Action Script Viewer - http://www.buraks.com/asv
package com.datas {

    public class DeployData extends Base {

        private var _deployList:Array;
        private var _upDeploy:Array;
        private var _downDeploy:Array;
        private var _allDownDeploy:Array;
        private var _setDefautDeploy:Array;

        public function get deployList():Array{
            return (this._deployList);
        }
        public function get upDeploy():Array{
            return (this._upDeploy);
        }
        public function get downDeploy():Array{
            return (this._downDeploy);
        }
        public function get allDownDeploy():Array{
            return (this._allDownDeploy);
        }
        public function get setDefautDeploy():Array{
            return (this._setDefautDeploy);
        }
        public function deploy_list(_arg1:Array):void{
            this._deployList = _arg1;
        }
        public function up_deploy(_arg1:Array):void{
            this._upDeploy = _arg1;
        }
        public function down_deploy(_arg1:Array):void{
            this._downDeploy = _arg1;
        }
        public function all_down_deploy(_arg1:Array):void{
            this._allDownDeploy = _arg1;
        }
        public function set_defaut_deploy(_arg1:Array):void{
            this._setDefautDeploy = _arg1;
        }

    }
}//package com.datas 

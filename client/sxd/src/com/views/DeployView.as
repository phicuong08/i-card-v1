//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.guide.*;

    public class DeployView extends Base implements IView {

        private var _deploy:IDeploy;
        private var _firstAttack:int = 0;
        private var _playerData:Array;
        private var _deployData:Array;
        private var _deFaultData:Array;
        private var _downTimer:int = 0;
        private var _showDeploy:String = "";
        private var _openDeployLevel:int = 0;
        private var _isDefautDeploy:Boolean = false;
        private var _deployID:int = 0;
        private var _isShowSequence:Boolean = false;

        public function DeployView(){
            this._playerData = [];
            this._deployData = [];
            this._deFaultData = [];
            super();
        }
        private function open_Deploy(_arg1:int):void{
            _data.call(Mod_Deploy_Base.deploy_list, this.openDeployCallback, [_arg1]);
        }
        private function deploy_list(_arg1:int):void{
            _data.call(Mod_Deploy_Base.deploy_list, this.deployListCallback, [_arg1]);
        }
        private function up_deploy(_arg1:int, _arg2:int, _arg3:int):void{
            _data.call(Mod_Deploy_Base.up_deploy, this.upDeployCallback, [_arg1, _arg2, _arg3]);
        }
        private function down_deploy(_arg1:int, _arg2:int):void{
            _data.call(Mod_Deploy_Base.down_deploy, this.downDeployCallback, [_arg1, _arg2]);
        }
        private function all_down_deploy(_arg1:int):void{
            _data.call(Mod_Deploy_Base.all_down_deploy, this.allDownDeployCallback, [_arg1], false);
        }
        private function set_defaut_deploy(_arg1:int):void{
            _data.call(Mod_Deploy_Base.set_defaut_deploy, this.setDefautDeployCallback, [_arg1], false);
        }
        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.open_Deploy(0);
        }
        private function openDeployCallback():void{
            var _local5:Object;
            var _local1:Array = _ctrl.deploy.deployList;
            var _local2:int = _local1[0].length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5 = this.playerIcon(_local1[0][_local4]);
                _local3.push(_local5);
                _local4++;
            };
            this._playerData = _local3;
            this._deployData = _local1[1];
            this._deFaultData = _local1[2];
            this._downTimer = _local1[3];
            this._firstAttack = _local1[4].firstAttack;
            this._showDeploy = this._deFaultData[0].name;
            this._openDeployLevel = this._deFaultData[0].level;
            if (inStage == false){
                loadAssets("Deploy", this.render, DeployViewLang.LoadAssets);
            };
        }
        private function deployListCallback():void{
            var _local5:Object;
            var _local1:Array = _ctrl.deploy.deployList;
            var _local2:int = _local1[0].length;
            var _local3:Array = [];
            var _local4:int;
            while (_local4 < _local2) {
                _local5 = {};
                _local5 = this.playerIcon(_local1[0][_local4]);
                _local3.push(_local5);
                _local4++;
            };
            this._playerData = _local3;
            this._deployData = _local1[1];
            this._deFaultData = _local1[2];
            this._downTimer = _local1[3];
            this._firstAttack = _local1[4].firstAttack;
            this._deploy.downTimer = this._downTimer;
            this._deploy.getFirstAttack = this._firstAttack;
            if (((((!((this._showDeploy == this._deFaultData[0].name))) || (!((this._openDeployLevel == this._deFaultData[0].level))))) || (this._isDefautDeploy))){
                if (!this._isDefautDeploy){
                    this._deploy.playerData(this._playerData);
                    this._deploy.deployInfo(this._deFaultData);
                };
                this._deploy.openDeploy(this._deployData);
                this._showDeploy = this._deFaultData[0].name;
                this._openDeployLevel = this._deFaultData[0].level;
                this._isDefautDeploy = false;
            };
        }
        private function upDeployCallback():void{
            this.deploy_list(this._deployID);
            _view.guide.trackDeploy(3, this._deploy.content);
            if (false == _view.guide.isLastTrace(GuideType.Deploy)){
                _view.guide.setCookie(GuideType.Deploy);
            };
        }
        private function downDeployCallback():void{
            this.deploy_list(this._deployID);
        }
        private function allDownDeployCallback():void{
            this.deploy_list(this._deployID);
        }
        private function setDefautDeployCallback():void{
            this.deploy_list(this._deployID);
            this._isDefautDeploy = true;
        }
        private function upLevelResearchCallBack():void{
            var _local1:Object = _ctrl.research.ResearchUpgrade();
            if (_local1.result == Mod_Research_Base.SUCCEED){
                this.deploy_list(this._deployID);
            } else {
                _view.showTip(DeployViewLang.UpLevelSuccess);
            };
        }
        private function clearCdTimerCallBack():void{
            var _local1:Object = _ctrl.research.ClearCdTime();
            if (_local1.result == Mod_Research_Base.SUCCEED){
                this._deploy.downTimer = 0;
            } else {
                _view.showTip(DeployViewLang.ClearCdFail);
            };
        }
        private function playerIcon(_arg1:Object):Object{
            var _local2:String = URI.getRoleIconUrl(_arg1.job);
            _arg1.url = _local2;
            return (_arg1);
        }
        private function render():void{
            this._deploy = (_view.getAssetsObject("Deploy", "Deploy") as IDeploy);
            _popup.addView(this, this._deploy.content);
            this._deploy.tip = _view.tip.iTip;
            this._deploy.drag = _view.drag.iDrag;
            var obj:* = _view.getCookie("isShowSequence");
            this._isShowSequence = _view.getCookie("isShowSequence");
            this._deploy.deforeShowSequence = this._isShowSequence;
            this._deploy.isOpenResearch = FunctionType.isOpened(FunctionType.Research);
            this._deploy.isShowSequence = FunctionType.isOpened(FunctionType.TravelEvent);
            this._deploy.onClose = function ():void{
                close();
            };
            this._deploy.onUpDeploy = function (_arg1:Object, _arg2:int, _arg3:int):void{
                _deployID = _arg2;
                up_deploy(_arg1.id, _arg2, _arg3);
                loaderUpDeploy(_arg1.id, (_arg3 - 1));
            };
            this._deploy.onDownDeploy = function (_arg1:int, _arg2:int):void{
                loaderDownDeploy((_arg2 - 1));
                Helper.output(_arg1, _arg2);
                _deployID = _arg1;
                down_deploy(_arg1, _arg2);
            };
            this._deploy.onDeploy = function (_arg1:int):void{
                Helper.output(_arg1);
                _deployID = _arg1;
                deploy_list(_arg1);
            };
            this._deploy.onShowSequence = function (_arg1:Boolean):void{
                _view.setCookie("isShowSequence", _arg1);
                _isShowSequence = _arg1;
            };
            this._deploy.onDefault = function (_arg1:int):void{
                Helper.output(_arg1);
                _deployID = _arg1;
                set_defaut_deploy(_arg1);
            };
            this._deploy.onClearCdTimer = function ():void{
                _view.research.clearCdTime(clearCdTimerCallBack);
            };
            this._deploy.onUpLevelHandler = function (_arg1:Object):void{
                _view.research.researchUpgrade(_arg1.researchId, upLevelResearchCallBack);
            };
            this._deploy.downTimer = this._downTimer;
            this._deploy.playerData(this._playerData);
            this._deploy.deployInfo(this._deFaultData);
            this._deploy.openDeploy(this._deployData);
            this._deploy.getFirstAttack = this._firstAttack;
            _view.center(sign, this._deploy.content);
            _view.guide.trackDeploy(2, this._deploy.content);
        }
        public function clearCdTimer():void{
            if (inStage == false){
                return;
            };
            this._deploy.downTimer = 0;
        }
        public function close():void{
            this.clear();
            Helper.gc();
            _popup.closeView(this);
            this._view.guide.stopDeployGuides();
        }
        public function clear():void{
            this._deploy.clear();
        }
        private function loaderDownDeploy(_arg1:int):void{
            var _local2:int = this.changeOldDeployId(_arg1);
            this.changeUpDeploy(_local2, false);
            this._deploy.playerData(this._playerData);
            this._deploy.deployInfo(this._deFaultData);
        }
        private function loaderUpDeploy(_arg1:int, _arg2:int):void{
            var _local5:Object;
            var _local6:int;
            var _local7:int;
            var _local8:Boolean;
            var _local3:int = this._deFaultData[0].player.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this._deFaultData[0].player[_local4];
                _local6 = 0;
                _local7 = _ctrl.player.mainPlayerRoleId;
                if (_local5.place == _arg2){
                    _local8 = this.isUpDeploy(_arg1);
                    if (_local5.id != 0){
                        if (_local8){
                            _local6 = this.changeOldDeploy(_arg1, _local5.place);
                            this.changeOldDeploy(_local5.id, _local6);
                        } else {
                            if (_local5.id == _local7){
                                _view.showTip(DeployViewLang.DownDeploy);
                                return;
                            };
                            this.changeUpDeploy(_arg1, true);
                            this.changeUpDeploy(_local5.id, false);
                            _local5.id = _arg1;
                        };
                    } else {
                        if (_local8){
                            _local6 = this.changeOldDeploy(_arg1, _local5.place, false);
                            this.changeOldDeployId(_local6);
                        } else {
                            this.changeUpDeploy(_arg1, true);
                        };
                        _local5.id = _arg1;
                    };
                };
                _local4++;
            };
            this._deploy.playerData(this._playerData);
            this._deploy.deployInfo(this._deFaultData);
        }
        private function isUpDeploy(_arg1:int):Boolean{
            var _local4:Object;
            var _local2:int = this._playerData.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._playerData[_local3];
                if (_local4.id == _arg1){
                    return ((_local4.isDeploy == 1));
                };
                _local3++;
            };
            return (false);
        }
        private function changeUpDeploy(_arg1:int, _arg2:Boolean):void{
            var _local5:Object;
            var _local3:int = this._playerData.length;
            var _local4:int;
            while (_local4 < _local3) {
                _local5 = this._playerData[_local4];
                if (_local5.id == _arg1){
                    if (_arg2){
                        _local5.isDeploy = 1;
                    } else {
                        _local5.isDeploy = 0;
                    };
                };
                _local4++;
            };
        }
        private function changeOldDeploy(_arg1:int, _arg2:int, _arg3:Boolean=true):int{
            var _local6:Object;
            var _local7:int;
            var _local4:int = this._deFaultData[0].player.length;
            var _local5:int;
            while (_local5 < _local4) {
                _local6 = this._deFaultData[0].player[_local5];
                if (_local6.id == _arg1){
                    _local7 = _local6.place;
                    if (_arg3){
                        _local6.place = _arg2;
                    };
                    return (_local7);
                };
                _local5++;
            };
            return (-1);
        }
        private function changeOldDeployId(_arg1:int):int{
            var _local4:Object;
            var _local5:int;
            var _local2:int = this._deFaultData[0].player.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = this._deFaultData[0].player[_local3];
                if (_local4.place == _arg1){
                    _local5 = _local4.id;
                    _local4.id = 0;
                    return (_local5);
                };
                _local3++;
            };
            return (0);
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;

    public class DuJieView extends Base implements IView {

        public var roleList:Array;
        public var roleObj:Object;
        public var defaultObj:Object;
        private var _target:IDuJie;

        public function DuJieView(){
            this.roleList = [];
            this.roleObj = {};
            this.defaultObj = {};
            super();
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.factionWarMap.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.serverWarCup.inStageWithTip){
                return;
            };
            if (_view.superSport.inStageWithTip){
                return;
            };
            if (_view.takeBibleRoad.inStageWithTip){
                return;
            };
            if (_view.tower.inStageWithTip){
                return;
            };
            if (_view.worldBossMap.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            loadAssets("DuJie", this.loadComplete, "", true);
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("DuJie", "MCDuJie") as IDuJie);
                this._target.onClose = this.close;
                this._target.onOk = this.onOk;
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._target.init(this.roleObj, this.defaultObj, this.roleList);
        }
        private function onOk():void{
            this.go_dujie(this.roleObj.id, this._target.selectRole.id, this._target.selectLineup);
        }
        private function onWarClose(_arg1:Boolean):void{
            if (_ctrl.dujie.result == Mod_Dujie_Base.SUCCESS){
                _view.roleMsg.show();
            };
        }
        private function go_dujie(_arg1:int, _arg2:int, _arg3:int):void{
            _view.dujieWar.opened = true;
            _data.call(Mod_Dujie_Base.go_dujie, this.go_dujie_back, [_arg1, _arg2, _arg3]);
        }
        private function go_dujie_back():void{
            this.close();
            _view.dujieWar.warData = _ctrl.dujie.warData;
            _view.dujieWar.onClose = this.onWarClose;
            _view.dujieWar.show();
        }

    }
}//package com.views 

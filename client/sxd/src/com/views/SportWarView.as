//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.*;
    import com.assist.view.war.*;

    public class SportWarView extends WarView implements IView {

        public var defenderPlayerId:int;

        public function SportWarView():void{
            _type = WarType.SportWar;
        }
        override public function show():void{
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.multiMission.isMinimumWithTip){
                return;
            };
            if (((!((WarType.CampWar == _type))) && (_view.campWar.inStageWithTip))){
                return;
            };
            if (((!((WarType.WorldBossWar == _type))) && (_view.worldBossMap.inStageWithTip))){
                return;
            };
            isLastMonster = false;
            this.start();
        }
        protected function start():void{
            onClose = function (_arg1:Boolean):void{
                _popup.removeMask();
            };
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading("", _arg3, (_arg2 + 1), _arg1);
            };
            _popup.addMask();
        }
        override protected function loadRoleResource():void{
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.sportUrl + "war_icon.png"));
            _arg1.push("Background");
            _arg2.push(((URI.sportUrl + (Math.floor((Math.random() * 4)) + 1)) + ".swf"));
        }
        protected function removeWar():void{
            if (_war){
                _war.close();
                closeWar();
            };
        }
        protected function myself(_arg1:int):Boolean{
            if (_ctrl.player.playerId == _arg1){
                _view.showTip("不能与自己对战");
                return (true);
            };
            return (false);
        }

    }
}//package com.views 

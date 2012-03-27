//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class SuperSportWarView extends SportWarView {

        public var awardFame:int;
        public var awardCoin:int;
        public var warData:WarData;
        public var reportId:int;
        public var detail:Object;

        public function SuperSportWarView():void{
            _type = WarType.SuperSportWar;
        }
        override public function show():void{
            if (myself(defenderPlayerId)){
                return;
            };
            super.show();
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(SuperSportWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            loadResources();
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            _warData.reportId = this.reportId;
            super.loadRoleResource();
        }
        override protected function createTarget():void{
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.playerId = _ctrl.player.playerId;
            _war.sportDetailData = this.detail;
            if (((this.awardCoin) || (this.awardFame))){
                _war.sportAwardText = Lang.sprintf(SuperSportWarViewLang.Award, (("<font color=\"#00ff00\">" + this.awardCoin) + "</font>"), (("<font color=\"#00ff00\">" + this.awardFame) + "</font>"));
            };
            _popup.removeMask();
        }
        override protected function onCloseHandler(_arg1:Boolean):void{
            clearRoles();
            closeWar();
            if ((onClose is Function)){
                onClose(_arg1);
            };
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class InCampWarView extends SportWarView {

        public var auto:Boolean;

        public function InCampWarView():void{
            _type = WarType.CampWar;
        }
        override public function show():void{
            removeWar();
            super.show();
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(InCampWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            if (this._ctrl.heroesWar.getWarMode["mode"] == 0){
                _data.call(Mod_CampWar_Base.get_war_result, loadResources, []);
            } else {
                _data.call(Mod_HeroesWar_Base.get_war_result, loadResources, []);
            };
        }
        override protected function loadRoleResource():void{
            if (this._ctrl.heroesWar.getWarMode["mode"] == 0){
                _warData = _ctrl.campWar.warResult;
            } else {
                _warData = _ctrl.heroesWar.warResult;
            };
            super.loadRoleResource();
        }
        override protected function createTarget():void{
            var _local1:int;
            var _local2:int;
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.playerId = _ctrl.player.playerId;
            _war.autoWar = this.auto;
            if (this._ctrl.heroesWar.getWarMode["mode"] == 0){
                _war.sportDetailData = _ctrl.campWar.warDetail;
                _local1 = _ctrl.campWar.awardCoin;
                _local2 = _ctrl.campWar.awardFame;
            } else {
                _war.sportDetailData = _ctrl.heroesWar.warDetail;
                _local1 = _ctrl.heroesWar.awardCoin;
                _local2 = _ctrl.heroesWar.awardFame;
            };
            var _local3:String = "";
            if ((((_local2 > 0)) && ((_local1 > 0)))){
                _local3 = Lang.sprintf(InCampWarViewLang.AwardFameCoin, (("<font color=\"#00ff00\">+" + _local2) + "</font>"), (("<font color=\"#00ff00\">+" + _local1) + "</font>"));
            } else {
                if ((((_local2 > 0)) && ((_local1 == 0)))){
                    _local3 = Lang.sprintf(InCampWarViewLang.AwardFame, (("<font color=\"#00ff00\">+" + _local2) + "</font>"));
                } else {
                    if ((((_local2 == 0)) && ((_local1 > 0)))){
                        _local3 = Lang.sprintf(InCampWarViewLang.AwardfCoin, (("<font color=\"#00ff00\">+" + _local1) + "</font>"));
                    } else {
                        _local3 = InCampWarViewLang.NonAward;
                    };
                };
            };
            _war.sportAwardText = _local3;
        }

    }
}//package com.views 

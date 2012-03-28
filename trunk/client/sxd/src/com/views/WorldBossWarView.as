//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class WorldBossWarView extends SportWarView {

        public var worldBossId:int;
        public var warData:WarData;

        public function WorldBossWarView():void{
            _type = WarType.WorldBossWar;
            isBoss = true;
        }
        override public function show():void{
            super.show();
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(WorldBossWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            _popup.addMask();
            showEffect();
            loadMainRoleResource(this.showWarScene);
        }
        private function showWarScene():void{
            loadResources1(this.warData);
        }
        override protected function getMonsterResources():void{
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            var _local3:String = TownType.getSign(WorldBossType.getTownIdByBossId(this.worldBossId));
            var _local4:String = _local3;
            _local4 = MonsterType.sameResource(_local4);
            _arg1.push("WarIcon");
            _arg2.push((((URI.worldBossUrl + "war_icon_") + _local4) + ".png"));
            _arg1.push("WorldBossMomentum");
            _arg2.push((URI.effectsUrl + "WorldBossMomentum.swf"));
            var _local5:Array = [_local4];
            getRoleResources(_local5, _local5, true);
        }
        override protected function createTarget():void{
            var _local6:String;
            _view.hideLoading();
            _war = new _cWar();
            _war.warData = _warData;
            _war.background = background;
            _war.playerId = _ctrl.player.playerId;
            _war.sportDetailData = {attackerInspire:_ctrl.worldBossMap.combatBuff};
            var _local1:Object = _ctrl.worldBossMap.awards;
            var _local2:int = _local1["coin"];
            var _local3:int = _local1["exp"];
            var _local4:int = _local1["fame"];
            var _local5:int = _local1["hurt"];
            if (((((((_local2) || (_local3))) || (_local4))) || (_local5))){
                _local6 = "";
                if (_local5 > 0){
                    _local6 = (Lang.sprintf(WorldBossWarViewLang.Hurt, (("<font color=\"#eb6100\">" + _local5) + "</font>")) + "  ");
                };
                if ((((_local4 > 0)) && ((_local2 > 0)))){
                    _local6 = (_local6 + ((Lang.sprintf(WorldBossWarViewLang.Fame, (("<font color=\"#00ff00\">+" + _local4) + "</font>")) + "   ") + Lang.sprintf(WorldBossWarViewLang.Coin, (("<font color=\"#00ff00\">+" + _local2) + "</font>"))));
                } else {
                    if ((((_local4 > 0)) && ((_local2 == 0)))){
                        _local6 = (_local6 + ((Lang.sprintf(WorldBossWarViewLang.Fame, (("<font color=\"#00ff00\">+" + _local4) + "</font>")) + "  ") + WorldBossWarViewLang.CoinFull));
                    } else {
                        if ((((_local4 == 0)) && ((_local2 > 0)))){
                            _local6 = (_local6 + ((Lang.sprintf(WorldBossWarViewLang.Coin, (("<font color=\"#00ff00\">+" + _local2) + "</font>")) + "  ") + WorldBossWarViewLang.FameFull));
                        } else {
                            _local6 = (_local6 + WorldBossWarViewLang.FameCoinFull);
                        };
                    };
                };
                _war.sportAwardText = _local6;
            };
        }
        override protected function onCloseHandler(_arg1:Boolean):void{
            closeWar();
            if ((onClose is Function)){
                onClose(_arg1);
            };
        }

    }
}//package com.views 

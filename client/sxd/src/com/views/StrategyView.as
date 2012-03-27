//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class StrategyView extends Base implements IView {

        private var _iStrategy:IStrategy;
        private var _playerList:Array;
        public var missionId:int;
        public var monsterTeamId:int;
        public var background:BitmapData;

        public function show():void{
            if (inStage){
                return;
            };
            _data.call(Mod_Mission_Base.get_monster_strategy_list, this.loadResources, [this.monsterTeamId]);
        }
        private function loadResources():void{
            loadAssets("Strategy", this.render, StrategyViewLang.LoadInfo);
        }
        private function render():void{
            this._iStrategy = (_view.getAssetsObject("Strategy", "Strategy") as IStrategy);
            this._iStrategy.drag = _view.drag.iDrag;
            this._iStrategy.onClose = this.close;
            this._iStrategy.showStrategyWar = this.showStrategyWar;
            var _local1:int = _ctrl.mission.masterMonsterId;
            var _local2:String = MonsterType.getMonsterNameById(_local1);
            this._playerList = _ctrl.mission.strategyList;
            this._iStrategy.renderPlayerList(this._playerList, _local2);
            _popup.addView(this, this._iStrategy.content);
            _view.center(sign, this._iStrategy.content);
        }
        private function showStrategyWar(_arg1:int, _arg2:String, _arg3:String):void{
            _view.strategyWar.warType = WarType.War;
            _view.strategyWar.version = _arg3;
            _view.strategyWar.reportId = _arg1;
            _view.strategyWar.missionId = this.missionId;
            _view.strategyWar.background = this.background;
            _view.strategyWar.show();
        }
        public function close():void{
            if (false == inStage){
                return;
            };
            this.clear();
            this._playerList = null;
            _popup.closeView(this);
        }
        public function clear():void{
            this._iStrategy.clear();
        }

    }
}//package com.views 

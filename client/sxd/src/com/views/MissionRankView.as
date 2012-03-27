//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.*;
    import com.assist.view.interfaces.map.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;

    public class MissionRankView extends Base implements IView {

        private var _target:IMissionRank;

        public function show():void{
            _requested = true;
            this.rank_mission();
        }
        public function close():void{
            _requested = false;
            _popup.closeView(this);
            _view.triggerDelayed(DelayType.LevelUp, DelayType.Experience);
            _view.missionMap.showChest();
        }
        public function clear():void{
        }
        private function complete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("MissionRank", "MCMissionRank") as IMissionRank);
            };
            if (_view.missionMap.inStage == false){
                return;
            };
            this._target.onRankOK = this.close;
            this._target.initRank(_ctrl.mission.rank);
            _popup.addView(this, this._target.content);
        }
        private function rank_mission():void{
            _data.call(Mod_Mission_Base.rank_mission, this.rank_mission_back, []);
        }
        private function rank_mission_back():void{
            loadAssets("MissionRank", null, MissionRankViewLang.LoadingRank, false, false, this.complete);
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.info.*;
    import com.assist.view.interfaces.map.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import flash.filters.*;

    public class FactionBossSelectView extends Base implements IView {

        private var _cf:Array;
        private var _target:IFactionBossSelect;
        public var isSee:Boolean = false;

        public function FactionBossSelectView(){
            this._cf = [new ColorMatrixFilter([0.2, 0.2, 0.2, 0, 0, 0.2, 0.2, 0.2, 0, 0, 0.2, 0.2, 0.2, 0, 0, 0, 0, 0, 1, 1])];
            super();
        }
        public function show():void{
            if (inStage){
                return;
            };
            this.faction_boss_time_list(BossInfo.BossDaoBaTu);
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            var _local6:Object;
            if (this._target == null){
                this._target = (_view.getAssetsObject("FactionBossSelect", "FactionBossSelect") as IFactionBossSelect);
                this._target.onClose = this.close;
                this._target.onOk = this.onOk;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            var _local1:BossInfo = _ctrl.worldBossMap.bossList[BossInfo.BossDaoBaTu];
            if (_local1.state == -1){
                return;
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            var _local2:Array = [5, 6];
            var _local3:Array = _local1.setList;
            var _local4:int;
            this._target.See = this.isSee;
            var _local5:String = (this.isSee) ? _local3[0].see : "";
            while (_local4 < 7) {
                _local6 = _local3[_local4];
                this._target.getTF(_local4).htmlText = (_local5 + _local6.msg);
                if ((((_local6.expired == 0)) || (this.isSee))){
                    this._target.getMC(_local4).filters = [];
                    this._target.getMC(_local4).mouseChildren = (this._target.getMC(_local4).mouseEnabled = true);
                } else {
                    this._target.getMC(_local4).filters = this._cf;
                    this._target.getMC(_local4).mouseChildren = (this._target.getMC(_local4).mouseEnabled = false);
                };
                if (_local6.selected == 1){
                    _local2.unshift(_local4);
                    if (this.isSee){
                        this._target.getTF(_local4).htmlText = (((_local5 + _local6.msg) + "        ") + ((_local6.expired)==0) ? (("<font color='#009900'>" + FactionBossSelectViewLang.IsChoose) + "</font>") : FactionBossSelectViewLang.IsEnd);
                    };
                };
                _local4++;
            };
            this._target.setSelectAB(_local2[0], _local2[1]);
        }
        private function onOk(_arg1:int, _arg2:int):void{
            if (this.isSee == true){
                this.close();
                return;
            };
            if ((((_arg1 == -1)) && ((_arg2 == -1)))){
                _view.showTip(FactionBossSelectViewLang.MoreTwo);
                return;
            };
            if ((((_arg1 == -1)) || ((_arg2 == -1)))){
                _view.showTip(FactionBossSelectViewLang.MoreOne);
                return;
            };
            var _local3:BossInfo = _ctrl.worldBossMap.bossList[BossInfo.BossDaoBaTu];
            var _local4:Array = _local3.setList;
            this.select_faction_boss_time(_local4[_arg1].type_id, _local4[_arg2].type_id);
        }
        private function faction_boss_time_list(_arg1:int):void{
            _data.call(Mod_WorldBoss_Base.faction_boss_time_list, this.faction_boss_time_list_back, [_arg1]);
        }
        private function faction_boss_time_list_back():void{
            loadAssets("FactionBossSelect", this.loadComplete, FactionBossSelectViewLang.LoadInfo, true);
        }
        private function select_faction_boss_time(_arg1:int, _arg2:int):void{
            _data.call(Mod_WorldBoss_Base.select_faction_boss_time, this.select_faction_boss_time_back, [BossInfo.BossDaoBaTu, _arg1, _arg2]);
        }
        private function select_faction_boss_time_back():void{
            if (_ctrl.worldBossMap.result == -1){
                _view.showTip(FactionBossSelectViewLang.SettingFail);
            } else {
                _view.alert.confirm(_ctrl.worldBossMap.notifyBoss.chatTips);
            };
            this.close();
            _view.factionWindow.get_world_boss_list();
        }

    }
}//package com.views 

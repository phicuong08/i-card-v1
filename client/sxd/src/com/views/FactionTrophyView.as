//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.factionWar.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class FactionTrophyView extends Base implements IView {

        private var _target:IFactionTrophy;

        public function show():void{
            if (_requested){
                return;
            };
            _requested = true;
            this.get_faction_war_gift_detail();
        }
        public function close():void{
            _requested = false;
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("FactionTrophy", "MCFactionTrophy") as IFactionTrophy);
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            this._target.onClose = this.close;
            this._target.onOK = this.onOK;
            var _local1:Array = _ctrl.factionWarMap.giftList;
            this._target.resetSelect(_local1);
            _popup.addView(this, this._target.content);
        }
        private function onOK():void{
            var _local1:Array = [];
            if (this._target.select1 != ""){
                _local1.push([_ctrl.factionWarMap.getGiftIdForName(this._target.select1)]);
            };
            if (this._target.select2 != ""){
                _local1.push([_ctrl.factionWarMap.getGiftIdForName(this._target.select2)]);
            };
            if (this._target.select3 != ""){
                _local1.push([_ctrl.factionWarMap.getGiftIdForName(this._target.select3)]);
            };
            this.give_faction_war_gift(_local1);
            this.close();
        }
        private function get_faction_war_gift_detail():void{
            _data.call(Mod_FactionWar_Base.get_faction_war_gift_detail, this.get_faction_war_gift_detail_back, []);
        }
        private function get_faction_war_gift_detail_back():void{
            loadAssets("FactionTrophy", this.loadComplete, FactionTrophyViewLang.LoadInfo, true);
        }
        private function give_faction_war_gift(_arg1:Array):void{
            _data.call(Mod_FactionWar_Base.give_faction_war_gift, this.give_faction_war_gift_back, [_arg1]);
        }
        private function give_faction_war_gift_back():void{
            switch (_ctrl.factionWarMap.result){
                case Mod_FactionWar_Base.ACTION_SUCCESS:
                    _view.activities.removeActivity(ActivityType.FactionWarGift);
                    _view.showTip(FactionTrophyViewLang.AssignSuccess, "", TipType.Success);
                    break;
                default:
                    _view.showTip(FactionTrophyViewLang.AssignFail, "", TipType.Question);
            };
        }

    }
}//package com.views 

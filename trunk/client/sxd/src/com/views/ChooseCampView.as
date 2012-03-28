//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ChooseCampView extends Base implements IView {

        private var _chooseCamp:IChooseCamp;

        public function show():void{
            loadAssets("ChooseCamp", this.render, ChooseCampViewLang.LoadInfo);
        }
        private function render():void{
            this._chooseCamp = (_view.getAssetsObject("ChooseCamp", "ChooseCamp") as IChooseCamp);
            _popup.addView(this, this._chooseCamp.content);
            this._chooseCamp.tip = _view.tip.iTip;
            this._chooseCamp.drag = _view.drag.iDrag;
            this._chooseCamp.onClose = this.close;
            this._chooseCamp.onGotoTown = function (_arg1:String):void{
                close();
                var _local2:int = FactionType.campId(_arg1);
                _data.call(Mod_Player_Base.set_player_camp, setPlayerCampCallback(_local2, _arg1), [_local2]);
            };
            _view.center(sign, this._chooseCamp.content);
        }
        private function setPlayerCampCallback(_arg1:int, _arg2:String):Function{
            var campId:* = _arg1;
            var townType:* = _arg2;
            return (function ():void{
                var _local1:*;
                _view.toolbar.loadQuestTrace();
                switch (_ctrl.player.campResult){
                    case Mod_Player_Base.SUCCESS:
                        _ctrl.player.campId = campId;
                        _local1 = TownType.getId(townType);
                        _view.world.autoEnterTown(_ctrl.player.mapId, _local1);
                        break;
                    case Mod_Player_Base.CAMP_ERR:
                        _view.alert.confirm(ChooseCampViewLang.CampErr);
                        break;
                    case Mod_Player_Base.CANT_CHANGE_CAMP:
                        _view.alert.confirm(ChooseCampViewLang.CantChangeCamp);
                        break;
                };
            });
        }
        public function loginToChoose():void{
            var _local1:int = _ctrl.player.campId;
            if (FactionType.campSign(_local1) == FactionType.WeiXuanZe){
                this.show();
            };
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._chooseCamp.close();
        }

    }
}//package com.views 

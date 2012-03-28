//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class PKWarView extends SportWarView {

        public function PKWarView():void{
            _type = WarType.PKWar;
        }
        override public function show():void{
            if (myself(defenderPlayerId)){
                return;
            };
            super.show();
        }
        override protected function start():void{
            onClose = function (_arg1:Boolean):void{
                _popup.removeMask();
            };
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(PKWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            var handler:* = function (_arg1:Boolean):void{
                if (false == _arg1){
                    _popup.addMask();
                    _data.call(Mod_Pk_Base.start_war, loadResources, [defenderPlayerId]);
                };
            };
            _view.toolbar.checkWarCdTime(handler);
        }
        override protected function loadRoleResource():void{
            _warData = _ctrl.pkWar.warData;
            _warData.reportId = _ctrl.pkWar.reportId;
            super.loadRoleResource();
        }
        override protected function createTarget():void{
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.sportAwardText = "";
        }
        public function test():void{
            _view.pkWar.defenderPlayerId = 45;
            _view.pkWar.show();
        }

    }
}//package com.views 

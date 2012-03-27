//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class DuJieWarView extends SportWarView {

        public var warData:WarData;

        public function DuJieWarView():void{
            _type = WarType.DuJieWar;
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(DuJieWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            loadResources();
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.mapUrl + "dujie/dujie.png"));
            _arg1.push("Background");
            _arg2.push((URI.mapUrl + "dujie/dujie.swf"));
        }
        override protected function createTarget():void{
            var _local1:String;
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.background = background;
            _war.sportDetailData = {attackerInspire:_ctrl.worldBossMap.combatBuff};
            if (_ctrl.dujie.addHealth){
                _local1 = ((_ctrl.dujie.roleId == _ctrl.player.mainRoleId)) ? _ctrl.player.nickname : RoleType.getRoleName(_ctrl.dujie.roleId);
                _war.sportAwardText = Lang.sprintf(DuJieWarViewLang.Award, _local1, HtmlText.green(("+" + _ctrl.dujie.addHealth)), ((((("<font color=\"#" + DuJieType.getSpiritColor(_ctrl.dujie.spiritStateId).toString(16)) + "\">") + DuJieType.getSpiritName(_ctrl.dujie.spiritStateId)) + DuJieType.getSpiritLevelInfo(_ctrl.dujie.spiritStateLevel)) + "</font>"), (_ctrl.dujie.awardAura) ? (DuJieWarViewLang.Aura + HtmlText.green(("+" + _ctrl.dujie.awardAura))) : "");
            };
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

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.haloer.net.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class MiniFactionWarView extends SportWarView implements IView {

        public var awardExp:int;
        public var awardFame:int;
        public var awardCoin:int;
        public var warData:WarData;
        private var _preloadId:int;

        public function MiniFactionWarView():void{
            _type = WarType.MiniFactionWar;
        }
        override public function show():void{
            removeWar();
            this.stopPreload();
            super.show();
        }
        override protected function showEffect():void{
            onEffectFinish(null);
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(MiniFactionWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            onAfterAdded = function ():void{
                _popup.addMask(false, 0);
            };
            _popup.addMask(false, 0);
            this.loadResources();
        }
        override protected function loadResources():void{
            loadAssets("MiniFactionWar", this.loadRoleResource, MiniFactionWarViewLang.LoadInfo);
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            super.loadRoleResource();
        }
        override protected function createTarget():void{
            _view.hideLoading();
            _war = (_view.getAssetsObject("MiniFactionWar", "MiniFactionWar") as IWar);
            _war.warData = _warData;
            _war.autoWar = true;
            if (((this.awardCoin) || (this.awardFame))){
                _war.sportAwardText = Lang.sprintf(MiniFactionWarViewLang.Award, (("<font color=\"#00ff00\">" + this.awardCoin) + "</font>"), (("<font color=\"#00ff00\">" + this.awardFame) + "</font>"));
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
        public function startPreload():void{
            _data.call(Mod_Role_Base.get_role_id_list, this.preloadResources, []);
        }
        public function stopPreload():void{
            File.stopLoadList(this._preloadId);
        }
        private function preloadResources():void{
            var sign:* = null;
            var signs:* = RoleType.getRoleSigns(_ctrl.rolemsg.roleIdList);
            var mainRoleSuffix:* = _ctrl.player.playerInfo.signSuffix;
            var i:* = 0;
            while (i < signs.length) {
                sign = signs[i];
                if (RoleType.isMainRole(sign)){
                    sign = (sign + mainRoleSuffix);
                };
                signs[i] = ((URI.warRolesUrl + sign) + ".swf");
                i = (i + 1);
            };
            var callback:* = function (_arg1:Array):void{
            };
            this._preloadId = File.loadList(signs, callback);
        }

    }
}//package com.views 

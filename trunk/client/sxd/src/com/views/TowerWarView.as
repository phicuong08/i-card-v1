//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.data.mission.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class TowerWarView extends SportWarView {

        public var warData:WarData;
        public var autoSellL:Boolean = false;
        public var autoSellZ:Boolean = false;

        public function TowerWarView():void{
            _type = WarType.TowerWar;
            isBoss = true;
        }
        override protected function start():void{
            onProgress = function (_arg1:int, _arg2:int, _arg3:int, _arg4:String):void{
                _view.showLoading(TowerWarViewLang.LoadInfo, _arg3, (_arg2 + 1), _arg1);
            };
            loadResources();
        }
        override protected function loadRoleResource():void{
            _warData = this.warData;
            super.loadRoleResource();
        }
        override protected function addonWarIcon(_arg1:Array, _arg2:Array):void{
            _arg1.push("WarIcon");
            _arg2.push((URI.mapUrl + "tower/war_icon.png"));
            _arg1.push("Background");
            _arg2.push(((URI.sportUrl + (Math.floor((Math.random() * 3)) + 1)) + ".swf"));
        }
        override protected function createTarget():void{
            var _local3:uint;
            var _local4:int;
            _view.hideLoading();
            _war = (_view.getAssetsObject("War", "War") as IWar);
            _war.warData = _warData;
            _war.background = background;
            _war.sportDetailData = {attackerInspire:_ctrl.worldBossMap.combatBuff};
            var _local1:String = "";
            if (_ctrl.tower.warExp > 0){
                _local1 = ((TowerWarViewLang.Exp + HtmlText.green(("+" + _ctrl.tower.warExp))) + "  ");
            };
            if (_ctrl.tower.warFame > 0){
                _local1 = (((_local1 + TowerWarViewLang.Fame) + HtmlText.green(("+" + _ctrl.tower.warFame))) + "  ");
            };
            if (_ctrl.tower.warCoin > 0){
                _local1 = (((_local1 + TowerWarViewLang.Coin) + HtmlText.green(("+" + _ctrl.tower.warCoin))) + "  ");
            };
            if (_ctrl.tower.warAura > 0){
                _local1 = (((_local1 + TowerWarViewLang.Aura) + HtmlText.green(("+" + _ctrl.tower.warAura))) + "  ");
            };
            var _local2:int = _ctrl.tower.warSoulId;
            if (_local2 > 0){
                _local3 = SoulType.getQualityColor(SoulType.getSoulQualityId(_local2));
                _local1 = ((((((_local1 + TowerWarViewLang.Soul) + "<font color=\"#") + _local3.toString(16)) + "\">") + SoulType.getSoulName(_local2)) + "</font>");
                _local4 = SoulType.getSoulQualityId(_local2);
                if ((((((_local4 == 1)) && (this.autoSellL))) || ((((_local4 == 2)) && (this.autoSellZ))))){
                    _local1 = (_local1 + HtmlText.yellow2((("(" + TowerWarViewLang.Sell) + ")")));
                };
            };
            _war.sportAwardText = _local1;
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

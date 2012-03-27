//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.sound.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ResearchView extends Base implements IView {

        private var _research:IResearch;
        private var _dialog:IAlert;
        private var _blnInResearchUpgrade:Boolean = false;
        private var clearCdTimeForOutsideCallBack:Function = null;

        public function show():void{
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            if (this._dialog != null){
                this._dialog.hide();
            };
            this._research.clear();
        }
        public function clearCdTime(_arg1:Function=null):void{
            this.clearCdTimeForOutsideCallBack = _arg1;
            this.clear_cd_time_show();
        }
        public function researchUpgrade(_arg1:int, _arg2:Function):void{
            this.research_upgrade(_arg1, _arg2);
        }
        private function loadData():void{
            _data.call(Mod_Research_Base.research_list, this.loadDataCallBack, [ResearchType.All]);
        }
        private function loadDataCallBack():void{
            var callBack:* = function ():void{
                render();
                researchListCallBack();
                showUI();
            };
            loadAssets("Research", callBack, ResearchViewLang.LoadInfo);
        }
        private function render():void{
            if (this._research == null){
                this._research = (_view.getAssetsObject("Research", "Research") as IResearch);
            };
            this.init();
            this._research.init();
        }
        private function showUI():void{
            _popup.addView(this, this._research.content);
            _view.center(sign, this._research.content);
        }
        private function init():void{
            this._research.iconUrl = URI.researchIconUrl;
            if (this._dialog == null){
                this._dialog = this._view.alert.iAlert;
            };
            this._research.dialog = this._view.alert.iAlert;
            this._research.tip = this._view.tip.iTip;
            this._research.drag = this._view.drag.iDrag;
            this._research.myLevel = this._ctrl.player.level;
            this._research.onCloseBtn = this.close;
            this._research.onLevelUpBtn = this.lvevlUpResearch;
            this._research.onResearchData = this.research_list;
        }
        private function getPageCount(_arg1:Array):int{
            return (Math.ceil((_arg1.length / 12)));
        }
        private function lvevlUpResearch():void{
            this.research_upgrade(this._research.researchID, this.researchUpgradeCallBack);
            SoundEffect.play(SoundEffect.ResearchUpgrade);
        }
        private function research_list():void{
            this._data.call(Mod_Research_Base.research_list, this.researchListCallBack, [ResearchType.All]);
        }
        private function researchListCallBack():void{
            this._research.mySkill = this._ctrl.research.getMySkill();
            var _local1:Array = this._ctrl.research.getResearchList();
            this._research.renderGetResearchData(_local1);
        }
        private function research_upgrade(_arg1:int, _arg2:Function):void{
            if (this._blnInResearchUpgrade){
                return;
            };
            this._blnInResearchUpgrade = true;
            this._data.call(Mod_Research_Base.research_upgrade, _arg2, [_arg1]);
        }
        private function researchUpgradeCallBack():void{
            var _local1:Object = this._ctrl.research.ResearchUpgrade();
            if (_local1.result != Mod_Research_Base.SUCCEED){
                _view.showTip(this.message(_local1.result));
            } else {
                this._research.renderLevelUpBtnClick(_local1);
            };
            this._blnInResearchUpgrade = false;
        }
        private function clear_cd_time_show():void{
            if (!_view.vipEnabled){
                return;
            };
            this._data.call(Mod_Research_Base.clear_cd_time_show, this.clearCdTimeShowCallBack, []);
        }
        private function clearCdTimeShowCallBack():void{
        }
        private function clear_cd_time():void{
            this._data.call(Mod_Research_Base.clear_cd_time, this.clearCdTimeCallBack, []);
        }
        private function clearCdTimeCallBack():void{
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Research_Base.SUCCEED:
                    _local2 = ResearchViewLang.Succeed;
                    break;
                case Mod_Research_Base.FAILED:
                    _local2 = ResearchViewLang.Failed;
                    break;
                case Mod_Research_Base.FULL:
                    _local2 = ResearchViewLang.Full;
                    break;
                case Mod_Research_Base.CDTIME:
                    _local2 = ResearchViewLang.CdTime2;
                    break;
                case Mod_Research_Base.NOENOUGHSKILL:
                    _local2 = ResearchViewLang.NoEnoughSkill;
                    break;
                case Mod_Research_Base.LIMITLEVELSTRUCT:
                    _local2 = ResearchViewLang.LimitLevelStruct;
                    break;
                case Mod_Research_Base.NOENOUGHLEVEL:
                    _local2 = ResearchViewLang.NoEnoughLevel;
                    break;
                case Mod_Research_Base.NOENOUGHINGOT:
                    _local2 = ResearchViewLang.NoEnoughIngot;
                    break;
                default:
                    _local2 = (ResearchViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

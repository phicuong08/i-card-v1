//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class ZodiacView extends Base implements IView {

        private var _zodiac:IZodiac;
        private var _blnInStartWar:Boolean = false;

        public function ZodiacView():void{
            _inStageTipTitle = ZodiacViewLang.inStageTipTitle;
            _inStageTipContent = "";
        }
        public function show():void{
            if (_view.chooseMission.inStageWithTip){
                return;
            };
            if (_view.heroMission.inStageWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.campWar.inStageWithTip){
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._zodiac.clear();
        }
        private function loadData():void{
            this.zodiac_info(this.loadDataCallBack);
        }
        private function loadDataCallBack():void{
            loadAssets("Zodiac", this.render, ZodiacViewLang.LoadInfo);
        }
        private function showUI():void{
            _popup.addView(this, this._zodiac.content);
            _view.center(sign, this._zodiac.content);
        }
        private function render():void{
            if (this._zodiac == null){
                this._zodiac = (_view.getAssetsObject("Zodiac", "Zodiac") as IZodiac);
            };
            this.init();
            this.zodiacInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._blnInStartWar = false;
            this._zodiac.tip = this._view.tip.iTip;
            this._zodiac.drag = this._view.drag.iDrag;
            this._zodiac.onClose = this.close;
            this._zodiac.onStartWar = this.challenge;
            this._zodiac.onGoldOilShop = this._view.goldOilShop.switchSelf;
            this._zodiac.init();
        }
        private function zodiac_info(_arg1:Function):void{
            _data.call(Mod_Zodiac_Base.zodiac_info, _arg1, []);
        }
        private function zodiacInfoCallBack():void{
            var _local1:Object = this._ctrl.zodiac.zodiacInfo;
            this._zodiac.myLevel = this._ctrl.player.level;
            if ((((_local1["now_zodiac_level"] == 0)) && ((_local1["now_barrier"] == 0)))){
                if (!this._view.getCookie("NoFirstOpenZodiac")){
                    this._zodiac.renderZodiacInfo(_local1, true);
                    _view.setCookie("NoFirstOpenZodiac", true);
                    return;
                };
            };
            this._zodiac.renderZodiacInfo(_local1);
        }
        private function challenge():void{
            if (this._blnInStartWar){
                return;
            };
            this._blnInStartWar = true;
            _view.zodiacWar.opened = true;
            _data.call(Mod_Zodiac_Base.challenge, this.challengeCallBack, []);
        }
        private function challengeCallBack():void{
            var objChallenge:* = null;
            var callBack:* = null;
            callBack = function ():void{
                var _local1:Object = _ctrl.zodiac.zodiacInfo;
                objChallenge["gold_oil_name"] = ItemType.getName(objChallenge["gold_oil_id"]);
                _zodiac.renderChallengeSuccess(_local1, objChallenge);
            };
            objChallenge = this._ctrl.zodiac.challengeResult;
            if ((((objChallenge["result"] == Mod_Zodiac_Base.SUCCESS)) || ((objChallenge["result"] == Mod_Zodiac_Base.FAIL)))){
                _view.zodiacWar.warData = _ctrl.zodiac.warData;
                _view.zodiacWar.onClose = function (_arg1:Boolean):void{
                    if (_arg1){
                        zodiac_info(callBack);
                    };
                    _view.chat.resetDepth();
                };
                _view.zodiacWar.show();
            } else {
                _view.zodiacWar.opened = false;
                this._view.showTip(this.message(objChallenge["result"]));
            };
            this._blnInStartWar = false;
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_Zodiac_Base.SUCCESS:
                    _local2 = ZodiacViewLang.Success;
                    break;
                case Mod_Zodiac_Base.FAIL:
                    _local2 = ZodiacViewLang.Fail;
                    break;
                case Mod_Zodiac_Base.TOP_HEAVEN:
                    _local2 = ZodiacViewLang.TopZodiacLevel;
                    break;
                case Mod_Zodiac_Base.NOT_ENOUGTH_PLAYER_LEVEL:
                    _local2 = ZodiacViewLang.NotEnougthPlayerLevel;
                    break;
                case Mod_Zodiac_Base.BAG_FULL:
                    _local2 = ZodiacViewLang.BagFull;
                    break;
                default:
                    _local2 = (ZodiacViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

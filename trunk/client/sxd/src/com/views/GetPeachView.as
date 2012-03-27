//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.*;
    import flash.utils.*;
    import com.assist.view.interfaces.*;
    import com.haloer.display.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class GetPeachView extends Base implements IView {

        private var _getPeach:IGetPeach;
        private var _autoList:Array;
        private var _isBattle:Boolean = false;
        private var _isShow:Boolean = false;
        private var _buttleData:Object;

        public function GetPeachView(){
            this._autoList = [];
            this._buttleData = {};
            super();
        }
        public function show():void{
            if (_view.campWar.inStageWithTip){
                return;
            };
            if (_view.heroesWar.inStageWithTip){
                return;
            };
            if (_view.multiMission.inStageWithTip){
                return;
            };
            if (_view.chooseMission.inStageWithTip){
                return;
            };
            if (_view.heroMission.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            _inStageTipTitle = GetPeachViewLang.inStageTipTitle;
            this.peach_info();
        }
        public function get_peach():void{
            this._isBattle = true;
            _view.getPeachWar.requested = true;
            _data.call(Mod_GetPeach_Base.get_peach, this.getPeachCallback, []);
        }
        public function buyMonkeys():void{
            _data.call(Mod_GetPeach_Base.buy_monkeys, this.buyMonkeysCallback, []);
        }
        public function peach_info():void{
            _data.call(Mod_GetPeach_Base.peach_info, this.peachInfoCallback, []);
        }
        public function player_info():void{
            _data.call(Mod_GetPeach_Base.player_info, this.playerInfoCallback, []);
        }
        private function getPeachCallback():void{
            this._isBattle = false;
            if (_ctrl.getPeach.warResult == Mod_GetPeach_Base.SUCCESS){
                _view.getPeachWar.onClose = function ():void{
                    _isShow = false;
                    if (_ctrl.getPeach.warExp > 0){
                        setTimeout(lostPlay, 500);
                        peach_info();
                        player_info();
                    };
                    _view.triggerDelayed(DelayType.LevelUp, DelayType.Experience, DelayType.PartnerUpgrade);
                };
                _view.getPeachWar.warData = _ctrl.getPeach.warData;
                _view.getPeachWar.show();
            } else {
                _view.getPeachWar.requested = false;
                this.renderMsg(_ctrl.getPeach.warResult);
            };
        }
        private function lostPlay():void{
            this._buttleData.info = (("+" + _ctrl.getPeach.warExp) + GetPeachViewLang.GetExp);
            this._getPeach.buttenSuccess = this._buttleData;
        }
        private function buyMonkeysCallback():void{
            var _local1:Object = _ctrl.getPeach.buyMonkeys;
            if (_local1.msg == Mod_GetPeach_Base.SUCCESS){
                this.peach_info();
                this.player_info();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function peachInfoCallback():void{
            var _local1:Object = _ctrl.getPeach.peachInfo;
            if (_local1.peachNum <= 0){
                _view.activities.removeActivity(FunctionType.GetPeach);
            };
            if (inStage){
                this._getPeach.peachInfo(_local1, this._isShow);
            } else {
                loadAssets("GetPeach", this.render, GetPeachViewLang.LoadAssets);
            };
        }
        private function playerInfoCallback():void{
            if (inStage == false){
                return;
            };
            var _local1:Object = _ctrl.getPeach.playerInfo;
            this._getPeach.playerInfo = _local1;
            this._getPeach.summerWuKong = _local1.haveMonkeyNum;
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_GetPeach_Base.FAILURE:
                    _view.showTip(GetPeachViewLang.NoIngot);
                    break;
                case Mod_GetPeach_Base.NOT_ENOUGH_PEACH_COUNT:
                    _view.showTip(GetPeachViewLang.NoEnoughPeachCount);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function render():void{
            this._getPeach = (_view.getAssetsObject("GetPeach", "GetPeach") as IGetPeach);
            _popup.addView(this, this._getPeach.content);
            this._getPeach.tip = _view.tip.iTip;
            this._getPeach.drag = _view.drag.iDrag;
            _view.center(sign, this._getPeach.content);
            this._getPeach.onClose = function ():void{
                close();
            };
            this._getPeach.onTip = function (_arg1:String):void{
                switch (_arg1){
                    case GetPeachViewLang.noCountNum:
                        _view.showTip(GetPeachViewLang.noCountNum);
                        break;
                    case GetPeachViewLang.noRobeNum:
                        _view.showTip(GetPeachViewLang.noRobeNum);
                        break;
                    case GetPeachViewLang.userRobelRedirection:
                        _view.showTip(GetPeachViewLang.userRobelRedirection);
                        break;
                };
            };
            this._getPeach.onGetPeach = function (_arg1:Object):void{
                if (_isBattle){
                    return;
                };
                _buttleData = _arg1;
                get_peach();
            };
            this._getPeach.onBuyMonkeys = function ():void{
                var callback:* = null;
                if (!_view.getCookie("GetPeachBuyMonkeys")){
                    dialog.yesLabel = GetPeachViewLang.Sure;
                    dialog.cancelLabel = GetPeachViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            buyMonkeys();
                        };
                        if (dialog.checked){
                            _view.setCookie("GetPeachBuyMonkeys", true);
                        };
                    };
                    dialog.show(Lang.sprintf(GetPeachViewLang.GetPeachBuyMonkeys, (HtmlText.yellow("100") + GetPeachViewLang.Ingot)), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    buyMonkeys();
                };
            };
            this._isShow = true;
            this.peachInfoCallback();
            this.player_info();
            this.addWuKong();
            this.addAnger();
        }
        private function addWuKong():void{
            var img:* = null;
            img = new Image((URI.assetsUrl + "peach_wukong.swf"));
            img.onComplete = function ():void{
                if (_getPeach == null){
                    return;
                };
                _getPeach.addWuKong(img);
            };
        }
        private function addAnger():void{
            var img:* = null;
            img = new Image((URI.assetsUrl + "peach_anger.swf"));
            img.onComplete = function ():void{
                if (_getPeach == null){
                    return;
                };
                _getPeach.addAnger(img);
            };
        }
        public function close():void{
            this._isBattle = false;
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._getPeach.clear();
        }

    }
}//package com.views 

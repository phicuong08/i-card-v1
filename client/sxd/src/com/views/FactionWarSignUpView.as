//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.utils.*;
    import flash.text.*;
    import com.assist.view.interfaces.factionWar.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.lang.client.com.views.*;

    public class FactionWarSignUpView extends Base implements IView {

        private var _target:IFactionWarSignUp;

        public function show():void{
            if (inStage){
                return;
            };
            this.get_faction_war_list();
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            var _local1:TextField;
            var _local2:TextField;
            if (this._target == null){
                this._target = (_view.getAssetsObject("FactionWarSignUp", "FactionWarSignUp") as IFactionWarSignUp);
                this._target.onSignUp = this.onSignUp;
                this._target.onSee = this.onSee;
                this._target.onClose = this.close;
                _local1 = new TextField();
                _local1.textColor = 0xFFFFFF;
                _local1.wordWrap = true;
                _local1.width = 150;
                _local1.htmlText = FactionWarSignUpViewLang.AwardTip1;
                _local1.height = (_local1.textHeight + 5);
                _view.tip.iTip.addTarget(this._target.btnWin1, _local1);
                _local2 = new TextField();
                _local2.textColor = 0xFFFFFF;
                _local2.wordWrap = true;
                _local2.width = 150;
                _local2.htmlText = FactionWarSignUpViewLang.AwardTip2;
                _local2.height = (_local2.textHeight + 5);
                _view.tip.iTip.addTarget(this._target.btnWin2, _local2);
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._target.btnSignUpVisible = (((_ctrl.factionWarMap.canSignup == 1)) && ((_ctrl.factionWarMap.isSignup == 0)));
            this._target.TFNumMsg = _ctrl.factionWarMap.signupTip;
        }
        private function onSignUp():void{
            _view.alert.showYesNoMsg(FactionWarSignUpViewLang.AskSignUp, FactionWarSignUpViewLang.Yes, FactionWarSignUpViewLang.No, function (_arg1:int):void{
                if (_arg1 == AlertButtonType.Yes){
                    sign_up(1);
                };
            });
        }
        private function onSee():void{
            this.sign_up_list(1);
        }
        private function get_faction_war_list():void{
            _data.call(Mod_FactionWar_Base.get_faction_war_list, this.get_faction_war_list_back, []);
        }
        private function get_faction_war_list_back():void{
            loadAssets("FactionWarSignUp", null, FactionWarSignUpViewLang.Loading, true, false, this.loadComplete);
        }
        private function sign_up(_arg1:int):void{
            _data.call(Mod_FactionWar_Base.sign_up, this.sign_up_back, [_arg1], false);
        }
        private function sign_up_back():void{
            if (_ctrl.factionWarMap.result == Mod_FactionWar_Base.ACTION_SUCCESS){
                _view.showTip(FactionWarSignUpViewLang.SignUpSuccess, "", TipType.Success);
            } else {
                if (_ctrl.factionWarMap.result == Mod_FactionWar_Base.NOT_ENOUGH_COINS){
                    _view.alert.confirm(FactionWarSignUpViewLang.CoinLack);
                } else {
                    _view.alert.confirm(FactionWarSignUpViewLang.SignUpFails);
                };
            };
            setTimeout(this.get_faction_war_list, 200);
        }
        private function sign_up_list(_arg1:int):void{
            _data.call(Mod_FactionWar_Base.sign_up_list, this.sign_up_list_back, [_arg1], false);
        }
        private function sign_up_list_back():void{
            _view.factionWarSignUpList.show();
        }

    }
}//package com.views 

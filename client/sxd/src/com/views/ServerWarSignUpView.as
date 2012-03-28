//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import com.assist.view.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.serverWar.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.lang.client.com.views.*;

    public class ServerWarSignUpView extends Base implements IView {

        private var _target:IServerWarSignUp;
        private var _info:ServerWarInfo;
        private var _date:Date;

        public function ServerWarSignUpView(){
            this._date = new Date();
            super();
        }
        public function show():void{
            this._info = _ctrl.serverWar.info;
            loadAssets("ServerWarSignUp", null, ServerWarSignUpViewLang.Loadding, false, false, this.loadComplete);
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        public function update():void{
            if (this.inStage == false){
                return;
            };
            this._info = _ctrl.serverWar.info;
            this.loadComplete();
        }
        override public function get inStage():Boolean{
            return (((!((this._target == null))) && (!((this._target.content.stage == null)))));
        }
        public function loadComplete():void{
            var _local6:String;
            var _local7:String;
            if (this._target == null){
                this._target = (_view.getAssetsObject("ServerWarSignUp", "MCSignUp") as IServerWarSignUp);
                this._target.onSignUp = this.onSignUp;
                this._target.onClose = this.close;
                this._target.tfGift.htmlText = (("<u><a href='event:aaa'>" + ServerWarSignUpViewLang.Page) + "</a></u>");
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (this.inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._target.btnSignup.visible = false;
            this._target.tfSignUp.htmlText = "";
            switch (this._info.serverState){
                case Mod_ServerWar_Base.SERVER_WAR_PREPARE:
                    if (this._info.isThisService){
                        this._target.tfSignUp.htmlText = HtmlText.red(ServerWarSignUpViewLang.SignUpNoStart);
                    } else {
                        this._target.tfSignUp.htmlText = HtmlText.red(ServerWarSignUpViewLang.SignUpAuto);
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_APPLY:
                    if (this._info.userState == Mod_ServerWar_Base.SERVER_WAR_APPLY){
                        this._target.tfSignUp.htmlText = HtmlText.green(ServerWarSignUpViewLang.SignUpComplete);
                    } else {
                        if (this._info.isThisService){
                            this._target.btnSignup.visible = true;
                        };
                    };
                    break;
                case Mod_ServerWar_Base.SERVER_WAR_TIANBANG:
                case Mod_ServerWar_Base.SERVER_WAR_DIBANG:
                    this._target.tfSignUp.htmlText = this._info.knockoutTip;
                    break;
                default:
                    if (this._info.isCrossService){
                        this._target.tfSignUp.text = "";
                    } else {
                        if (this._info.userState == Mod_ServerWar_Base.SERVER_WAR_APPLY){
                            this._target.tfSignUp.htmlText = HtmlText.green(ServerWarSignUpViewLang.SignUpComplete);
                        } else {
                            this._target.tfSignUp.htmlText = HtmlText.red(ServerWarSignUpViewLang.SignUpStop);
                        };
                    };
            };
            var _local1:Array = [];
            var _local2:String = "";
            var _local3:String = "";
            var _local4:String = "";
            _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_TIANBANG) + ServerWarSignUpViewLang.WarTianBang);
            _local1.push(_local4);
            _local4 = (this.getTime_MD_AtState(Mod_ServerWar_Base.SERVER_WAR_TIANBANG) + ServerWarSignUpViewLang.WarDiBang);
            _local1.push(_local4);
            _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_16) + ServerWarSignUpViewLang.War16);
            _local1.push(_local4);
            _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_8) + ServerWarSignUpViewLang.War8);
            _local1.push(_local4);
            _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_4) + ServerWarSignUpViewLang.War4);
            _local1.push(_local4);
            _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_2) + ServerWarSignUpViewLang.War2);
            _local1.push(_local4);
            _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_1) + ServerWarSignUpViewLang.War1);
            _local1.push(_local4);
            if (this._info.isThisService){
                _local2 = ServerWarSignUpViewLang.Rule1;
                _local3 = ServerWarSignUpViewLang.WarName1;
                _local4 = Lang.sprintf(ServerWarSignUpViewLang.SignUpTime, this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_APPLY), this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_APPLY_COMPLETE));
                _local1.unshift(_local4);
                _local1.unshift(ServerWarSignUpViewLang.SignUpLeveReq);
                _local1.push(ServerWarSignUpViewLang.SignUpTip10);
                _local7 = (HtmlText.yellow2(ServerWarSignUpViewLang.AwardTip1) + "\n");
                _local7 = (_local7 + Lang.sprintf(ServerWarSignUpViewLang.AwardTip3, HtmlText.purple(ServerWarSignUpViewLang.Award20000Fame), HtmlText.green(ServerWarSignUpViewLang.Award1000Coin), HtmlText.yellow2(ServerWarSignUpViewLang.AwardMount1)));
                _view.tip.iTip.addTarget(this._target.tfGift, _local7);
                this._target.tfServerWar.text = "";
            } else {
                _local2 = ServerWarSignUpViewLang.Rule2;
                _local3 = ServerWarSignUpViewLang.WarName2;
                _local1.unshift(ServerWarSignUpViewLang.ReadyTime);
                _local4 = (this.getTime_MDHI_AtState(Mod_ServerWar_Base.SERVER_WAR_PREPARE) + ServerWarSignUpViewLang.ToReadyTime);
                _local1.unshift(_local4);
                _local1.unshift(ServerWarSignUpViewLang.SignUpTip11);
                _local7 = (HtmlText.yellow2(ServerWarSignUpViewLang.AwardTip2) + "\n");
                _local7 = (_local7 + Lang.sprintf(ServerWarSignUpViewLang.AwardTip4, HtmlText.purple(ServerWarSignUpViewLang.Award60000Fame), HtmlText.green(ServerWarSignUpViewLang.Award8000Coin), HtmlText.yellow2(ServerWarSignUpViewLang.AwardYuPai18), HtmlText.yellow2(ServerWarSignUpViewLang.AwardMount2), HtmlText.yellow2(ServerWarSignUpViewLang.Star), HtmlText.yellow2(ServerWarSignUpViewLang.InLine), HtmlText.yellow2(ServerWarSignUpViewLang.WorldFirst)));
                _view.tip.iTip.addTarget(this._target.tfGift, _local7);
                this._target.tfServerWar.htmlText = this.linkText(HtmlText.blue2(ServerWarSignUpViewLang.SeeWorld), ["See"]);
                this._target.tfServerWar.addEventListener(TextEvent.LINK, this.onSeeWorldLink);
            };
            _local4 = "";
            var _local5:int;
            for each (_local6 in _local1) {
                ++_local5;
                _local4 = ((((_local4 + _local5) + "、") + _local6) + "\n");
            };
            this._target.tfRuleHead.text = _local2;
            this._target.tfTitle.htmlText = (("<b>" + _local3) + "</b>");
            this._target.tfRule.text = _local4;
        }
        private function getTime_MDHI_AtState(_arg1:int):String{
            var _local2:Number = (this._info.getRoundTime(_arg1) * 1000);
            var _local3:Array = this.getDateArray(_local2);
            var _local4:Date = new Date();
            if (_local4.date == _local3[1]){
                return ((((ServerWarSignUpViewLang.Today + _local3[2]) + ":") + _local3[3]));
            };
            _local4.time = (_local4.time + (24 * 3600000));
            if (_local4.date == _local3[1]){
                return ((((ServerWarSignUpViewLang.Tomorrow + _local3[2]) + ":") + _local3[3]));
            };
            return ((((((((_local3[0] + ServerWarSignUpViewLang.Moth) + _local3[1]) + ServerWarSignUpViewLang.Day) + " ") + _local3[2]) + ":") + _local3[3]));
        }
        private function getTime_MD_AtState(_arg1:int):String{
            var _local2:Number = (this._info.getRoundTime(_arg1) * 1000);
            var _local3:Array = this.getDateArray(_local2);
            var _local4:Date = new Date();
            if (_local4.date == _local3[1]){
                return (ServerWarSignUpViewLang.Today);
            };
            _local4.time = (_local4.time + (24 * 3600000));
            if (_local4.date == _local3[1]){
                return (ServerWarSignUpViewLang.Tomorrow);
            };
            return ((((_local3[0] + ServerWarSignUpViewLang.Moth) + _local3[1]) + ServerWarSignUpViewLang.Day));
        }
        private function getDateArray(_arg1:Number):Array{
            this._date.time = _arg1;
            var _local2:String = ("" + this._date.hours);
            var _local3:String = ("" + ((this._date.minutes)<10) ? ("0" + this._date.minutes.toString()) : this._date.minutes.toString());
            var _local4:String = ("" + ((this._date.seconds)<10) ? ("0" + this._date.seconds.toString()) : this._date.seconds.toString());
            return ([(this._date.month + 1), this._date.date, _local2, _local3, _local4, this._date.fullYear]);
        }
        private function onSeeWorldLink(_arg1:Event):void{
            this._target.initSeeWorld(this._info.worldZone, this._info.serverNameList, _popup);
        }
        public function onSignUp():void{
            this.apply();
        }
        private function apply():void{
            this._target.btnSignup.visible = false;
            _data.call(Mod_ServerWar_Base.apply, this.apply_back, []);
        }
        private function apply_back():void{
            switch (this._info.signupState){
                case Mod_ServerWar_Base.SUCCESS:
                    _view.showTip(ServerWarSignUpViewLang.SignUpSuccess, null, TipType.Success);
                    break;
                case Mod_ServerWar_Base.REQUEST_LEVEL:
                    _view.showTip(ServerWarSignUpViewLang.SignUpLeve);
                    break;
                default:
                    _view.showTip(ServerWarSignUpViewLang.SignUpFails);
            };
            _view.activities.serverInit();
        }
        private function linkText(_arg1:String, _arg2:Array):String{
            return ((((("<u><a href='event:" + _arg2.join("_")) + "'>") + _arg1) + "</a></u>"));
        }

    }
}//package com.views 

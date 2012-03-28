//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.assist.view.interfaces.*;
    import flash.net.*;
    import com.adobe.serialization.json.*;
    import com.assist.*;
    import com.lang.client.com.views.*;

    public class GameMasterView extends Base implements IView {

        private const MAX_SUBMIT_TIMES:int = 5;

        private var _gm:IGameMaster;
        private var _loaderSubmitBug:URLLoader;
        private var _loaderGetBugList:URLLoader;
        private var _loaderSubmitAssess:URLLoader;
        private var _canGetBugList:Boolean = true;
        private var _intOpenPanel:int = 1;
        private var _intAssessId:int = 0;

        public function GameMasterView(){
            this._loaderSubmitBug = new URLLoader();
            this._loaderGetBugList = new URLLoader();
            this._loaderSubmitAssess = new URLLoader();
            super();
        }
        private function submit_bug(_arg1:int, _arg2:String, _arg3:int):void{
            var _local4:URLVariables;
            var _local5:URLRequest;
            if (_arg3 == 0){
                _local4 = new URLVariables();
                _local4.username = (this._ctrl.player.nickname + URI.nickNameSuffix());
                _local4.contents = _arg2;
                _local4.type = _arg1;
                _local4.time = this._ctrl.player.serverTime;
                _local4.webdomain = URI.serverName;
                _local4.user = URI.playerName;
                _local4.times = URI.time;
                _local4.sign = URI.hashCode;
                _local5 = new URLRequest();
                _local5.data = _local4;
                _local5.url = URI.bugUrl;
                this._loaderSubmitBug.load(_local5);
            } else {
                if (_arg3 == 1){
                    _view.showTip(GameMasterViewLang.Prompts, GameMasterViewLang.TooLong);
                } else {
                    if (_arg3 == 2){
                        _view.showTip(GameMasterViewLang.Prompts, GameMasterViewLang.NoNull);
                    } else {
                        if (_arg3 == 3){
                            _view.showTip(GameMasterViewLang.Prompts, GameMasterViewLang.UpperLimit);
                        };
                    };
                };
            };
        }
        private function get_bug_list():void{
            if (!this._canGetBugList){
                return;
            };
            this._canGetBugList = false;
            var _local1:URLVariables = new URLVariables();
            _local1.username = (this._ctrl.player.nickname + URI.nickNameSuffix());
            _local1.time = this._ctrl.player.serverTime;
            _local1.webdomain = URI.serverName;
            _local1.user = URI.playerName;
            _local1.times = URI.time;
            _local1.sign = URI.hashCode;
            var _local2:URLRequest = new URLRequest();
            _local2.url = URI.bugListUrl;
            _local2.data = _local1;
            this._loaderGetBugList.load(_local2);
        }
        private function submit_assess(_arg1:int, _arg2:int):void{
            this._intAssessId = _arg1;
            var _local3:URLVariables = new URLVariables();
            _local3.username = (this._ctrl.player.nickname + URI.nickNameSuffix());
            _local3.id = _arg1;
            _local3.type = _arg2;
            _local3.webdomain = URI.serverName;
            _local3.user = URI.playerName;
            _local3.times = URI.time;
            _local3.sign = URI.hashCode;
            var _local4:URLRequest = new URLRequest();
            _local4.data = _local3;
            _local4.url = URI.bugFeedbackUrl;
            this._loaderSubmitAssess.load(_local4);
        }
        public function show():void{
            if (URI.gmUrl != ""){
                navigateToURL(new URLRequest(URI.gmUrl), "_blank");
            } else {
                this.loadResources();
            };
        }
        private function loadResources():void{
            loadAssets("GameMaster", this.render, GameMasterViewLang.LoadInfo, false, true);
        }
        public function render():void{
            if (inStage){
                return;
            };
            this._gm = (_view.getAssetsObject("GameMaster", "GameMaster") as IGameMaster);
            _popup.addView(this, this._gm.content);
            this._gm.drag = _view.drag.iDrag;
            this._gm.tip = _view.tip.iTip;
            this._gm.alert = _view.alert.iAlert;
            this._gm.nickName = _ctrl.player.nickname;
            this._gm.bbsUrl = ((URI.bbsUrl) || ("http : //bbs.xd.com/"));
            this._gm.onSubmit = function (_arg1:int, _arg2:String, _arg3:int):void{
                submit_bug(_arg1, _arg2, _arg3);
            };
            this._gm.onGetBugList = function ():void{
                get_bug_list();
            };
            this._gm.onSubmitAssess = this.submit_assess;
            this._gm.onClose = function (_arg1:int):void{
                _intOpenPanel = _arg1;
                close();
            };
            this._gm.init(this._intOpenPanel);
            this.addEvent();
            _view.center(sign, this._gm.content);
        }
        private function addEvent():void{
            this._loaderSubmitBug.addEventListener(Event.COMPLETE, this.onSubmitBugComplete);
            this._loaderSubmitBug.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
            this._loaderSubmitBug.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
            this._loaderGetBugList.addEventListener(Event.COMPLETE, this.onGetBugListComplete);
            this._loaderGetBugList.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
            this._loaderGetBugList.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
            this._loaderSubmitAssess.addEventListener(Event.COMPLETE, this.onSubmitAssessComplete);
            this._loaderSubmitAssess.addEventListener(IOErrorEvent.IO_ERROR, this.ioError);
            this._loaderSubmitAssess.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
        }
        private function removeEvent():void{
            this._loaderSubmitBug.removeEventListener(Event.COMPLETE, this.onSubmitBugComplete);
            this._loaderSubmitBug.removeEventListener(IOErrorEvent.IO_ERROR, this.ioError);
            this._loaderSubmitBug.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
            this._loaderGetBugList.removeEventListener(Event.COMPLETE, this.onGetBugListComplete);
            this._loaderGetBugList.removeEventListener(IOErrorEvent.IO_ERROR, this.ioError);
            this._loaderGetBugList.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
            this._loaderSubmitAssess.removeEventListener(Event.COMPLETE, this.onSubmitAssessComplete);
            this._loaderSubmitAssess.removeEventListener(IOErrorEvent.IO_ERROR, this.ioError);
            this._loaderSubmitAssess.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, this.securityError);
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this.removeEvent();
            this._canGetBugList = true;
            this._gm.clear();
        }
        private function onSubmitBugComplete(_arg1:Event):void{
            var _local2:String = this.message(parseInt(_arg1.target.data));
            _view.showTip(GameMasterViewLang.Prompts, _local2);
            if (_arg1.target.data == 1){
                this._gm.renderSubmitBug = [true];
            };
            this._canGetBugList = true;
        }
        private function onGetBugListComplete(_arg1:Event):void{
            var _local3:String;
            var _local4:Array;
            var _local2:String = _arg1.target.data;
            if (_local2.length == 1){
                _local3 = this.message(parseInt(_local2));
                _view.showTip(GameMasterViewLang.Prompts, _local3);
                this._canGetBugList = true;
            } else {
                _local4 = com.adobe.serialization.json.JSON.decode(_local2);
                this._gm.renderBugList = _local4;
            };
        }
        private function onSubmitAssessComplete(_arg1:Event):void{
            var _local3:String;
            var _local2:String = _arg1.target.data;
            if (_local2.length == 1){
                _local3 = this.message(parseInt(_local2));
                _view.showTip(GameMasterViewLang.Prompts, _local3);
            };
            this._gm.renderSubmitAssessComplete(this._intAssessId);
        }
        private function ioError(_arg1:IOErrorEvent):void{
        }
        private function securityError(_arg1:SecurityErrorEvent):void{
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case 0:
                    _local2 = GameMasterViewLang.SubmitFail;
                    break;
                case 1:
                    _local2 = GameMasterViewLang.SubmitSuccess;
                    break;
                case 2:
                    _local2 = GameMasterViewLang.ParaError;
                    break;
                case 3:
                    _local2 = GameMasterViewLang.NoServer;
                    break;
                case 4:
                    _local2 = GameMasterViewLang.NoAccount;
                    break;
                case 5:
                    _local2 = GameMasterViewLang.SubmitUpperLimit;
                    break;
                case 6:
                    _local2 = GameMasterViewLang.NoConsistency;
                    break;
                case 7:
                    _local2 = GameMasterViewLang.NoAssess;
                    break;
                case 8:
                    _local2 = GameMasterViewLang.AssessFinish;
                    break;
                default:
                    _local2 = (GameMasterViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

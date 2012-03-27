//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.*;
    import com.assist.view.war.*;
    import com.haloer.net.*;
    import com.lang.client.com.views.*;
    
    import flash.display.*;
    import flash.events.ErrorEvent;
    import flash.net.*;
    public class StrategyWarView extends Base implements IView {

        public var warType:String;
        public var version:String;
        public var nickName:String;
        public var reportId:int;
        public var missionId:int;
        public var background:BitmapData;
        public var onSendChat:Function;
        private var _connector:Connector;
        private var _war:File;
        public var onClose:Function;
        public var _opened:Boolean = false;
        public var isServerWar:Boolean = false;
        public var sameServer:Boolean = false;
        public var onWarClose:Function;
        private var _reportArgs:Array;

        public function StrategyWarView():void{
            this._reportArgs = [];
            super();
            this._connector = new Connector();
            this._connector.name = "strategy_connector";
            this._connector.assetsUrl = URI.assetsUrl;
            this._connector.onClose = function (_arg1:int):void{
                _connector.warData = null;
                _connector.background = null;
                _connector.reportUrl = "";
                _connector.onSendChat = null;
                if (((((_war) && (_war.loader))) && (_war.loader.parent))){
                    _popup.removeChild(_war.loader);
                };
                if ((onClose is Function)){
                    onClose();
                };
                _popup.removeMask();
                _opened = false;
                isServerWar = false;
                if ((onWarClose is Function)){
                    onWarClose();
                };
                if (Connector.Exception == _arg1){
                    _view.alert.confirm(StrategyWarViewLang.Exception);
                } else {
                    if (Connector.HasNotSwf == _arg1){
                        _view.alert.confirm(StrategyWarViewLang.HasNotSwf);
                    };
                };
            };
        }
        public function get opened():Boolean{
            return (this._opened);
        }
        public function show():void{
            this._opened = true;
            this._connector.sameServer = ((!((this.warType == WarType.ServerWar))) || (this.sameServer));
            this._connector.playerId = _ctrl.player.playerId;
            this._connector.nickName = _ctrl.player.nickname;
            this._connector.roleId = _ctrl.player.mainRoleId;
            this._connector.playerRoleId = _ctrl.player.mainPlayerRoleId;
            this._connector.defenderNickName = this.nickName;
            this._connector.missionId = this.missionId;
            this._connector.background = this.background;
            this._connector.showLoading = _view.showLoading;
            this._connector.hideLoading = _view.hideLoading;
            this._connector.reportUrl = this.reportUrl;
            this._connector.onSendChat = this.onSendChat;
            _view.stage.addChild(this._connector);
            this.loadResource();
        }
        private function loadResource():void{
            var self:* = null;
            self = this;
            _popup.addMask(true);
            this._connector.warData = _ctrl.mission.strategyWarData;
            this._war = new File();
            this._war.useNewDomain = true;
            this._war.onProgress = function (_arg1:Number, _arg2:Number):void{
                _view.showLoading(StrategyWarViewLang.LoadInfo, Math.floor(((_arg2 / _arg1) * 100)));
            };
            this._war.onError = function ():void{
                _view.hideLoading();
                _connector.onClose(Connector.HasNotSwf);
            };
            this._war.onComplete = function ():void{
                try {
                    _popup.addChild(_war.loader);
                } catch(e:ErrorEvent) {
                    _connector.onClose();
                };
                _view.chat.updateDepth(self);
                _view.friendMessage.updateDepth(self);
            };
            this.version = ((this.version) || (Config.GameVersion));
            var url:* = (("strategy_war/" + this.version) + ".swf");
            var clientUrl:* = URI.clientUrl.replace(/\/201\d\d{2}\d{2}\d{2}\//, (("/" + this.version) + "/"));
            var v:* = new URLVariables();
            v.w = this.warType;
            v.s = (this.isServerWar) ? URI.worldWarServerUrl : URI.serverUrl;
            v.r = this.reportId;
            v.m = this.missionId;
            v.c = URI.getVersion((URI.assetsUrl + url));
            v.client_url = clientUrl;
            url = (((URI.fullAssetsUrl.replace(/\/201\d\d{2}\d{2}\d{2}\//, (("/" + this.version) + "/")) + url) + "?") + v.toString());
            this._connector.url = url;
            this._war.load(url);
        }
        public function clear():void{
        }
        public function close():void{
        }
        public function get reportArgs():Array{
            this.reportUrl;
            return (this._reportArgs);
        }
        public function get reportUrl():String{
            var _local2:String;
            this._reportArgs = [this.version, this.warType, this.reportId, this.missionId, _local2];
            var _local1:String = (("strategy_war/" + this.version) + ".swf");
            _local2 = URI.getVersion((URI.assetsUrl + _local1));
            var _local3:URLVariables = new URLVariables();
            _local3.v = this.version;
            _local3.w = this.warType;
            _local3.s = (this.isServerWar) ? URI.worldWarServerUrl : URI.serverUrl;
            _local3.r = this.reportId;
            _local3.m = this.missionId;
            _local3.c = _local2;
            return (((URI.serverUrl + "war.php?") + _local3.toString()));
        }

    }
}//package com.views 

import flash.display.*;
import flash.utils.*;

class Connector extends Sprite {

    public static const HasNotSwf:int = 1;
    public static const Exception:int = 2;

    public var url:String;
    public var assetsUrl:String;
    public var warData:ByteArray;
    public var sameServer:Boolean;
    public var background:BitmapData;
    public var playerId:int;
    public var nickName:String;
    public var roleId:int;
    public var playerRoleId:int;
    public var reportUrl:String;
    public var onSendChat:Function;
    public var defenderNickName:String;
    public var missionId:int;
    public var onClose:Function;
    public var showLoading:Function;
    public var hideLoading:Function;

    public function Connector(){
    }
    public function close(_arg1:int=0):void{
        if ((this.onClose is Function)){
            this.onClose(_arg1);
        };
    }

}

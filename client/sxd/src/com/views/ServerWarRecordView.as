//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.utils.*;
    import com.assist.view.info.*;
    import com.assist.*;
    import com.assist.view.interfaces.serverWar.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;
    import com.assist.view.war.*;

    public class ServerWarRecordView extends Base implements IView {

        private var _target:IServerWarRecord;
        private var _info:ServerWarInfo;
        private var _updateTime:int = 0;
        private var _linkData:Array;

        public function show():void{
            this._info = _ctrl.serverWar.info;
            if (this._info.userState == Mod_ServerWar_Base.CLOSE){
                _view.serverWarSignUp.show();
            } else {
                this.get_standings();
            };
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        override public function get inStage():Boolean{
            return (((!((this._target == null))) && (!((this._target.content.stage == null)))));
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("ServerWarRecord", "MCRecord") as IServerWarRecord);
                this._target.onClose = this.close;
                this._target.onLink = this.onLink;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (this.inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._target.update(this._info);
        }
        public function update():void{
            if (this.inStage == false){
                return;
            };
            this._info = _ctrl.serverWar.info;
            this.get_standings();
        }
        private function onLink(_arg1:String):void{
            var _local2:Array;
            var _local3:ClickTipList;
            this._linkData = _arg1.split("_");
            if (this._linkData[0] == "war"){
                _view.strategyWar.isServerWar = this._info.isCrossService;
                _view.strategyWar.sameServer = this._info.isThisService;
                _view.strategyWar.warType = WarType.ServerWar;
                _view.strategyWar.version = this._linkData[2];
                _view.strategyWar.reportId = int(this._linkData[1]);
                _view.strategyWar.show();
            } else {
                if (this._linkData[0] == "player"){
                    if (_ctrl.player.playerId == int(this._linkData[1])){
                        return;
                    };
                    _local2 = [ServerWarRecordViewLang.See, ServerWarRecordViewLang.Add, ServerWarRecordViewLang.Send, ServerWarRecordViewLang.Talk];
                    _local3 = new ClickTipList(_local2, _local2, this.onTextClick);
                    setTimeout(_view.tip.iTip.clickToOpen, 50, _local3);
                };
            };
        }
        private function onTextClick(_arg1:String):void{
            var _local2:int = int(this._linkData[1]);
            var _local3:String = this._linkData[2];
            if (_arg1 == ServerWarRecordViewLang.See){
                _view.otherRoleMsg.init(_local2, _local3);
                _view.otherRoleMsg.show();
            } else {
                if (_arg1 == ServerWarRecordViewLang.Add){
                    _view.friendList.addFriend(_local3, _local2);
                } else {
                    if (_arg1 == ServerWarRecordViewLang.Talk){
                        this._view.friendChat.get_friendinfo_chatrecord_list(_local2);
                    } else {
                        if (_arg1 == ServerWarRecordViewLang.Send){
                            this._view.sendFlower.sendPlayerID = _local2;
                            this._view.sendFlower.show();
                        };
                    };
                };
            };
        }
        private function get_standings():void{
            _data.call(Mod_ServerWar_Base.get_standings, this.get_standings_back, []);
        }
        private function get_standings_back():void{
            loadAssets("ServerWarRecord", null, ServerWarRecordViewLang.Talk, false, false, this.loadComplete);
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class AudienceView extends Base implements IView {

        private var _Audience:IAudience;

        public function show():void{
            _data.call(Mod_Friend_Base.get_listeners, this.renderShow, [1], false);
        }
        private function get_listeners(_arg1:int):void{
            _data.call(Mod_Friend_Base.get_listeners, this.getListenersCallBack, [_arg1]);
        }
        private function renderShow():void{
            this.loadResource(this.render);
        }
        private function loadResource(_arg1:Function):void{
            loadAssets("Audience", _arg1, AudienceViewLang.AddAudience);
        }
        private function render():void{
            this._Audience = (_view.getAssetsObject("Audience", "Audience") as IAudience);
            _popup.addView(this, this._Audience.content);
            this._Audience.drag = _view.drag.iDrag;
            this._Audience.tip = _view.tip.iTip;
            _view.center(sign, this._Audience.content);
            this.renderList();
        }
        private function getListenersCallBack():void{
            this._Audience.audienceData = this._ctrl.friend.getListeners;
        }
        public function set onlineState(_arg1:Object):void{
            if (this.inStage){
                this._Audience.isOnLine = _arg1;
            };
        }
        private function renderList():void{
            this._Audience.audienceData = this._ctrl.friend.getListeners;
            this._Audience.isOpenPk = FunctionType.isOpened(FunctionType.SendFlower);
            this._Audience.onGetAudience = function (_arg1:int):void{
                get_listeners(_arg1);
            };
            this._Audience.onShowPerson = function (_arg1:Object):void{
                _view.otherRoleMsg.init(_arg1.id, _arg1.name);
                _view.otherRoleMsg.show();
            };
            this._Audience.onMoveFriend = function (_arg1:Object):void{
                _view.friendList.addFriend(_arg1.name, 0);
            };
            this._Audience.onChatShow = function (_arg1:int):void{
                _view.friendChat.get_friendinfo_chatrecord_list(_arg1);
            };
            this._Audience.onButtleFriend = function (_arg1:Object):void{
                _view.pkWar.defenderPlayerId = _arg1.id;
                _view.pkWar.show();
            };
            this._Audience.onSendFlower = function (_arg1:Object):void{
                _view.sendFlower.sendPlayerID = _arg1.id;
                _view.sendFlower.show();
            };
            this._Audience.onClose = function ():void{
                close();
            };
        }
        public function close():void{
            this._Audience.close();
            this._Audience = null;
            Helper.gc();
            _popup.closeView(this);
        }
        public function clear():void{
        }

    }
}//package com.views 

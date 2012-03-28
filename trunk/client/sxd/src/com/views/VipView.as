//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.interfaces.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.net.*;

    public class VipView extends Base implements IView {

        private var _iVip:IVip;
        private var _playerVipLevel:int;
        private var _moneyToNextLevel:int;
        private var _intChangeIngot:int;

        public function show():void{
            this.get_player_vip_info();
        }
        private function get_player_vip_info():void{
            _data.call(Mod_Vip_Base.get_player_vip_info, this.getPlayerVipInfoCallback, []);
        }
        private function getPlayerVipInfoCallback():void{
            this._playerVipLevel = _ctrl.vip.playerVipLevel;
            this._moneyToNextLevel = _ctrl.vip.moneyToNextLevel;
            loadAssets("Vip", this.render, VipViewLang.LoadInfo);
        }
        private function render():void{
            this._iVip = (_view.getAssetsObject("Vip", "Vip") as IVip);
            _popup.addView(this, this._iVip.content);
            this._iVip.drag = _view.drag.iDrag;
            this._iVip.onClose = this.close;
            this._iVip.onRecharge = this.gotoRecharge;
            this._iVip.onShowVIPInfo = this.showVIPInfo;
            var _local1:Number = URI.openTime;
            var _local2:Number = _ctrl.player.serverTime;
            var _local3:int = (_ctrl.player.serverTime - _local1);
            var _local4:Date = new Date(2012, 2, 3);
            var _local5:Number = (_local4.time / 1000);
            if (_local1 >= _local5){
                this._iVip.showOnePayBtn = (_local3 < 259200);
                this._iVip.showFirstPayBtn = false;
            } else {
                this._iVip.showOnePayBtn = false;
                this._iVip.showFirstPayBtn = (_ctrl.player.vipLevel == VIPType.Level0);
            };
            this.showInfo();
            _view.center(sign, this._iVip.content);
        }
        private function gotoRecharge():void{
            navigateToURL(new URLRequest(URI.rechargeUrl));
            this.close();
        }
        private function showVIPInfo():void{
            navigateToURL(new URLRequest(URI.vipInfoUrl));
            this.close();
        }
        private function showInfo():void{
            var _local1:int = this._playerVipLevel;
            var _local2:String = "";
            if (_local1 > 0){
                _local2 = Lang.sprintf(VipViewLang.VipMember, _local1);
            } else {
                _local2 = VipViewLang.Nothing;
            };
            var _local3:String = ((_local1 >= VIPType.MaxLevel)) ? VipViewLang.TopLevel1 : Lang.sprintf(VipViewLang.NextLevel, (_local1 + 1));
            var _local4:String = ((_local3 + "\n") + ((_local1 >= VIPType.MaxLevel)) ? (("<font size=\"12\">" + VIPType.getVIPInfo(_local1)) + "</font>") : (("<font size=\"12\">" + VIPType.getVIPInfo((_local1 + 1))) + "</font>"));
            var _local5:String = "";
            var _local6:int;
            if (_local1 >= VIPType.MaxLevel){
                _local5 = VipViewLang.TopLevel2;
                _local6 = VIPType.getRequireMoney(VIPType.MaxLevel);
            } else {
                _local5 = Lang.sprintf(VipViewLang.NextIngot, this._moneyToNextLevel, (_local1 + 1));
                _local6 = VIPType.getRequireMoney((_ctrl.player.vipLevel + 1));
            };
            this._iVip.info(_local2, _local4, _local5);
            this._iVip.renderProgressBar(this._moneyToNextLevel, _local6, this._intChangeIngot);
        }
        private function send_ingot_receive_show_vip():void{
            _data.call(Mod_Player_Base.send_ingot_receive_show_vip, this.sendIngotReceiveShowVipCallBack, []);
        }
        private function sendIngotReceiveShowVipCallBack():void{
            var callBack:* = null;
            callBack = function ():void{
                _playerVipLevel = _ctrl.vip.playerVipLevel;
                _moneyToNextLevel = _ctrl.vip.moneyToNextLevel;
                showInfo();
            };
            if (this._ctrl.player.isSendIngotReceiveShowVip){
                this._intChangeIngot = this._ctrl.player.ingotChange;
                if (this.inStage){
                    _data.call(Mod_Vip_Base.get_player_vip_info, callBack, []);
                } else {
                    this.show();
                };
            };
        }
        public function clear():void{
            this._iVip.clear();
            this._intChangeIngot = 0;
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function sendIngotReceiveShowVip():void{
            this.send_ingot_receive_show_vip();
        }

    }
}//package com.views 

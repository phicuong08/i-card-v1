//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.view.interfaces.*;
    import flash.net.*;
    import ICard.assist.*;
    import ICard.protocols.*;
    import ICard.assist.server.*;
    import ICard.lang.client.com.views.*;
	import ICard.assist.view.*;
    public class LoginView extends Base implements IView {

        private var _iLogin:ILogin;
        private var _playerVipLevel:int;
        private var _moneyToNextLevel:int;
        private var _intChangeIngot:int;

        public function show():void{
			
			var _local1:LoadResponder;
			if (_viewMgr.hasResource("login")){
				this.render();
			} else {
				_local1 = new LoadResponder(this.render);
				_viewMgr.loadResources(["login"], _local1);
			};
			
		//	this.render();
        }
        private function get_player_vip_info():void{
     //       _data.call(Mod_Vip_Base.get_player_vip_info, this.getPlayerVipInfoCallback, []);
        }
        private function getPlayerVipInfoCallback():void{
             loadAssets("login", this.render, AchievementViewLang.LoadInfo);
        }
        private function render():void{
            this._iLogin = (_viewMgr.getAssetsObject("login", "login") as ILogin);
            _popup.addView(this, this._iLogin.content);
    
            this.showInfo();
			_viewMgr.center(sign, this._iLogin.content);
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
          
        }
        private function send_ingot_receive_show_vip():void{
            _data.call(Mod_Player_Base.send_ingot_receive_show_vip, this.sendIngotReceiveShowVipCallBack, []);
        }
        private function sendIngotReceiveShowVipCallBack():void{
           
        }
        public function clear():void{
            this._iLogin.clear();
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

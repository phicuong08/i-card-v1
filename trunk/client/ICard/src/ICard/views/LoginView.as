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

		private var _first:Boolean;
		
		public function show():void{
			var lr:* = new LoadResponder(this.login, function (_arg1:String, _arg2:int):void{
				_viewMgr.showViewProcess(_arg1, _arg2);
			});
			_viewMgr.loadResources([("InitLoading" + _viewMgr.initLoading.logoSuffix), "Alert"], lr);
		}
		private function login():void{
			_viewMgr.initLoading.show();
			var _local1:String = ((URI.playerName) || ("test"));
			var _local2:String = ((URI.hashCode) || ("I love you!"));
			var _local3:String = ((URI.time) || (Math.floor((new Date().getTime() / 1000)).toString()));
			Helper.output(_local1, _local2);
			Helper.backtrace("Mod_Player_Base.login, 1");
//			_data.call(Mod_Player_Base.login, this.loginCallback, [_local1, _local2, _local3, URI.sourceUrl, URI.regdate]);
//			URI.localConnection(_local1);
			
		}
		private function loginCallback():void{
			Helper.backtrace("Mod_Player_Base.login, 0");
			switch (_ctrl.player.logined){
				case Mod_Player_Base.SUCCEED:
					this._first = false;
					_viewMgr.initLoading.loadToolbar();
					break;
				case Mod_Player_Base.FIRST_TIME:
					this._first = true;
					_viewMgr.firstLogin(true);
					_viewMgr.initLoading.loadChooseRole();
					break;
				case Mod_Player_Base.DUPLICATED_NICKNAME:
					_viewMgr.alert.confirm(LoginViewLang.DuplicatedNickName);
					break;
				case Mod_Player_Base.DISABLE_LOGIN:
					_viewMgr.alert.confirm((LoginViewLang.DisableLogin + _ctrl.player.enableTime));
					break;
				default:
					Helper.alert(LoginViewLang.LoginFail);
			};
		}
		public function close():void{
		}
		public function clear():void{
		}
		public function get first():Boolean{
			return (this._first);
		}
		
	}
}//package com.views 

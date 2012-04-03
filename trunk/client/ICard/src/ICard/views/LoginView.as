//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.*;
    import ICard.assist.*;
    import ICard.assist.server.*;
    import ICard.assist.view.*;
    import ICard.assist.view.interfaces.*;
    import ICard.lang.client.com.views.*;
    import ICard.protocols.*;
    
	import com.smartfoxserver.v2.core.SFSEvent;
    import flash.events.MouseEvent;
    import flash.net.*;
    public class LoginView extends Base implements IView {

		private var _first:Boolean;
		private var _login:ILogin;
		
		public function show():void{
			loadAssets("login", this.loadCallback, "");
		}
		
		private function loadCallback():void
		{
			this._login = (_viewMgr.getAssetsObject("login", "login") as ILogin);
			this._login.onLogin = this.login;
			this._login.onReg = this.reg;
			this.render();
		}
		private function render():void{
			if(this._login){
				_popup.addView(this, this._login.content);
			}
//			if (this._achievement == null){
//				this._achievement = (_viewMgr.getAssetsObject("Achievement", "Achievement") as IAchievement);
//			};
//			this.init();
//			this.getPlayerAchievementListCallBack();
//			this.showUI();
//			if ((this._delayGotoAchievementLabel is Function)){
//				this._delayGotoAchievementLabel();
//			};
		}
		
		
		public function showLoading():void{
			var lr:* = new LoadResponder(this.onInitLoading, function (_arg1:String, _arg2:int):void{
				_viewMgr.showViewProcess(_arg1, _arg2);
			});
			_viewMgr.loadResources([("InitLoading" + _viewMgr.initLoading.logoSuffix), "Alert"], lr);
		}
		private function reg(e:MouseEvent):void{
			
		}
		private function login(e:MouseEvent):void{
		//	_viewMgr.initLoading.show();
			var name:String = this._login.usrName;
			var pwd:String = this._login.usrPwd;
			Helper.output(name, pwd);
			_data.SFS_login(name,pwd,this.onLogin,this.onLoginError);
			Helper.backtrace("Mod_Player_Base.login, 1");
//			_data.call(Mod_Player_Base.login, this.loginCallback, [name, pwd]);
//			URI.localConnection(_local1);
			
		}
		private function onInitLoading():void
		{
			_popup.closeView(this);
			_viewMgr.initLoading.show();
		}
		private function onLogin(evt:SFSEvent):void
		{
			Helper.backtrace("SFS.login, 0");
			trace("Login successful!");
			
			showLoading();
			//_popup.closeView(this);

		}
		
		private function onLoginError(evt:SFSEvent):void
		{
			Helper.backtrace("SFS.login, -1");
			trace("Login failure: " + evt.params.errorMessage);
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

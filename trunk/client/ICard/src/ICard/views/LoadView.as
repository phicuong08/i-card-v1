// ActionScript file//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
	import ICard.haloer.net.*;
	import ICard.assist.*;
	
	public class LoadView extends Base implements IView {
		
		public function show():void{
			var file:* = new HTTP();
			file.onComplete = function (_arg1:String):void{
				URI.formatVersion(_arg1);
				File.onVersion = URI.getVersion;
				_viewMgr.login.show();
				_viewMgr.hideLoadingText();
			};
			//file.load(((URI.clientUrl + "assets.txt?rnd=") + URI.assetsRnd));
			file.load((URI.clientUrl + "assets.txt") );
		}
		public function close():void{
		}
		public function clear():void{
		}
		
	}
}//package com.views 

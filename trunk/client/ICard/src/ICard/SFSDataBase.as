//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard {
   
	import ICard.assist.*;
	import flash.events.*;
	
    import com.smartfoxserver.v2.SmartFox;
    import com.smartfoxserver.v2.core.SFSEvent;
    import com.smartfoxserver.v2.entities.*;
    import com.smartfoxserver.v2.entities.data.*;
    import com.smartfoxserver.v2.requests.*;
    
    public class SFSDataBase extends DataBase {

	
		public function SFS_login(name:String,pwd:String,callback_ok:Function,callback_fail:Function):void
		{
			SFS.addEventListener(SFSEvent.LOGIN, callback_ok);
			SFS.addEventListener(SFSEvent.LOGIN_ERROR, callback_fail);
			
			// Login
			SFS.send(new LoginRequest(name,pwd));

		}

    }
}//package com 

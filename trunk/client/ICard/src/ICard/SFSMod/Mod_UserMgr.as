//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.entities.variables.*;
	import com.smartfoxserver.v2.requests.*;
	import com.smartfoxserver.v2.entities.managers.SFSUserManager;
	
	public class Mod_UserMgr extends Object{
		
		public var _smartFox : SmartFox;
		
		public function Mod_UserMgr(arg1:SmartFox):void{
			_smartFox = arg1;	
		}
		public function PlayerReady(id:int):Boolean{
			var player:User = _smartFox.userManager.getUserById(id);
			var val:UserVariable = player.getVariable("game_ready");
			if(val==null)
				return false;
			return val.getBoolValue();
		}
		

	}
}//package ICard.protocols 

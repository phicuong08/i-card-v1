//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.requests.*;
	import com.smartfoxserver.v2.entities.variables.*;
	public class Mod_RoomUser extends Object{
		
		public var _smartFox : SmartFox;
				
		public function Mod_RoomUser(arg1:SmartFox):void{
			SFS = arg1;	
			SFS.addEventListener(SFSEvent.USER_VARIABLES_UPDATE, onUserVarsUpdate);

		}

		public function get SFS():SmartFox{
			return _smartFox;
		}
		public function set SFS(arg1:SmartFox):void{
			_smartFox = arg1;
		}
		public function GameReady():void{
			var userVars:Array = [];
			userVars.push(new SFSUserVariable("game_ready", 1));
			SFS.send(new SetUserVariablesRequest(userVars));
		}
		
		private function onUserVarsUpdate(evt:SFSEvent):void
		{
			var changedVars:Array = evt.params.changedVars as Array;
			var user:User = evt.params.user as User;
			
			// Check if the user changed his x and y user variables
			if (changedVars.indexOf("x") != -1 || changedVars.indexOf("y") != -1)
			{
				// Move the user avatar to a new position
				;
			}
		}

	}
}//package ICard.protocols 

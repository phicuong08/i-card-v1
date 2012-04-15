//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.entities.variables.*;
	import com.smartfoxserver.v2.requests.*;
	public class Mod_RoomUser extends Object{
		
		public var _smartFox : SmartFox;
		private const GAME_READY_STR:String = "game_ready";
		
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
			userVars.push(new SFSUserVariable(GAME_READY_STR, true));
			SFS.send(new SetUserVariablesRequest(userVars));   //SetRoomVariablesRequest

		}
		
		private function onUserVarsUpdate(evt:SFSEvent):void
		{
			var user:SFSUser = evt.params.user;
			
			var changedVars:Array = evt.params.changedVars as Array;
			var p1:User = evt.params.user as User;
			
			// Check if the user changed his x and y user variables
			if (changedVars.indexOf(GAME_READY_STR) != -1 )
			{
				var bReady:Boolean = p1.getVariable(GAME_READY_STR).getBoolValue();
				// Move the user avatar to a new position
				;
			}
		}

	}
}//package ICard.protocols 

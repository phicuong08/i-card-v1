//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.SFSMod {
	
	import com.smartfoxserver.v2.SmartFox;
	import com.smartfoxserver.v2.core.SFSEvent;
	import com.smartfoxserver.v2.entities.*;
	import com.smartfoxserver.v2.entities.data.*;
	import com.smartfoxserver.v2.entities.variables.*;
	import com.smartfoxserver.v2.requests.*;
	public class Mod_Battle extends Object{
		
		public var _smartFox : SmartFox;
		public function Mod_Battle(arg1:SmartFox):void{
			SFS = arg1;	
			//SFS.addEventListener(SFSEvent.USER_VARIABLES_UPDATE, onUserVarsUpdate);

		}

		public function get SFS():SmartFox{
			return _smartFox;
		}
		public function set SFS(arg1:SmartFox):void{
			_smartFox = arg1;
		}
		public function QueryStartGame():void{
			var params:ISFSObject = new SFSObject();
			params.putInt("state", 2);
			SFS.send( new ExtensionRequest( ICardMsgDef.c2s_client_battle_state_update, params) );
		}
		public function QueryUpdateCard(realID:int,slot:int):void{
			var params:ISFSObject = new SFSObject();
			params.putInt("realID", realID);
			params.putInt("slot", slot);
			SFS.send( new ExtensionRequest( ICardMsgDef.c2s_battle_card_update, params) );
		}
		public function QueryUseCard(realID:int,targets:Array):void{
			var params:ISFSObject = new SFSObject();
			params.putInt("srcID", realID);
			if(targets.length >0)
			{
				params.putIntArray("srcID",targets);
			}
			SFS.send( new ExtensionRequest( ICardMsgDef.c2s_battle_card_update, params) );
		}
//		private function onUserVarsUpdate(evt:SFSEvent):void
//		{
//			var user:SFSUser = evt.params.user;
//			
//			var changedVars:Array = evt.params.changedVars as Array;
//			var p1:User = evt.params.user as User;
//			
//			// Check if the user changed his x and y user variables
//			if (changedVars.indexOf(GAME_READY_STR) != -1 && _playerReadyCallback!=null)
//			{
//				var readyVal:Object={};
//				var bReady:Boolean = p1.getVariable(GAME_READY_STR).getBoolValue();
//				readyVal.bReady = true;
//				readyVal.bOwner = p1.isItMe;
//				readyVal.id = p1.id;
//				_playerReadyCallback(readyVal);
//				// Move the user avatar to a new position
//				;
//			}
//		}

	}
}//package ICard.protocols 

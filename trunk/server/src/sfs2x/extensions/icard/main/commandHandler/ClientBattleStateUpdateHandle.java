package sfs2x.extensions.icard.main.commandHandler;

import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;

import sfs2x.extensions.icard.bsn.*;
import sfs2x.extensions.icard.beans.*;
import sfs2x.extensions.icard.utils.Commands;
public class ClientBattleStateUpdateHandle extends ICardClientRequestHandler {

	@Override
	public void handleClientRequest(User sender, ISFSObject paramISFSObject) {
		//int statVal = paramISFSObject.getInt("state");

		int playerID = sender.getId();
		//SFSExtension this.getParentExtension()
		CardGameBean newGame = GameBsn.CreateVSAIGame();
		
		CardAbilityStoreBean.GetInstance();
		if(newGame!=null)
		{
			Integer ai=0;
			for (CardSiteBean site : newGame.getSites().values())
			{
				ai = site.getPlayerID();
				break;
			}
			newGame.AddPlayer(playerID,sender);
			GameBsn.InitGameCard(newGame);
			
			ISFSObject params = new SFSObject();
			params.putInt("me", playerID);
			params.putInt("you", ai.intValue());
			params.putInt("game",newGame.getId());
			sender.setProperty("game", newGame.getId());
			ISFSArray sfsa = SFSObjectBsn.genDirtyGameArr(newGame,playerID);
			params.putSFSArray("card", sfsa);
			send(Commands.CMD_S2C_GAME_START, params, sender);
			GameBsn.StartGame(newGame);
		}
		else
		{
			SendErrorMsg(sender,"Fail to Create Game!");
		}
	}

}

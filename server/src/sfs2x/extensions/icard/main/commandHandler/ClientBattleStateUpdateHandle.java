package sfs2x.extensions.icard.main.commandHandler;

import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class ClientBattleStateUpdateHandle extends ICardClientRequestHandler {

	@Override
	public void handleClientRequest(User sender, ISFSObject paramISFSObject) {
		CardUser cardUser = CardUserManager.getInstance().GetUser(sender.getId());
		
			params.putInt("state", 2);
		//SFSExtension this.getParentExtension()
		CardGameBean newGame = GameBsn.CreateGame();
		if(newGame)
		{
		
		}
		else
		{
			SendErrorMsg(sender,"Fail to Create Game!");
		}
	}

}

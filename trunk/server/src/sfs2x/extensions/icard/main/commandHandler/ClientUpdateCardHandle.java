package sfs2x.extensions.icard.main.commandHandler;

import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class ClientUpdateCardHandle extends BaseClientRequestHandler {

	@Override
	public void handleClientRequest(User paramUser, ISFSObject paramISFSObject) {
		CardUser cardUser = CardUserManager.getInstance().GetUser(paramUser.getId());
		ErrorDef.Empty();
		int realID = paramISFSObject.getInt("realID");
		int slot = paramISFSObject.getInt("slot");
		int gameId = paramISFSObject.getInt("game");
		
		CardGameBean game = GameLobbyBean.GetInstance().getGameMap.get(gameId);
		if(game==null)
			return;
		ClientQueryBsn.updateCardSlot(game,paramUser.getId(),realID,slot);
		
		SendOnErr(paramUser);
	}

}

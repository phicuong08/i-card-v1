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
public class ClientEndOpHandle extends ICardClientRequestHandler {

	@Override
	public void handleClientRequest(User sender, ISFSObject paramISFSObject) {
		int playerID = sender.getId();
		int gameId = paramISFSObject.getInt("game");
		CardGameBean game = GameLobbyBean.GetInstance().getGameMap().get(gameId);
		if(game!=null)
		{
			GameBsn.ClientEndOp(game,playerID);
		}
	}

}

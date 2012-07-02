package sfs2x.extensions.icard.main.commandHandler;


import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;


import sfs2x.extensions.icard.bsn.*;
import sfs2x.extensions.icard.beans.*;
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

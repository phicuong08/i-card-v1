package sfs2x.extensions.icard.main.commandHandler;


import java.util.Collection;
import java.util.Vector;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;


import sfs2x.extensions.icard.bsn.*;
import sfs2x.extensions.icard.beans.*;
public class ClientExOpHandle extends ICardClientRequestHandler {

	@Override
	public void handleClientRequest(User sender, ISFSObject paramISFSObject) {
		int playerID = sender.getId();
		int gameId = paramISFSObject.getInt("game");
		CardGameBean game = GameLobbyBean.GetInstance().getGameMap().get(gameId);
		
		if(game!=null&& BattleBsn.VerifyClienRequest(game, playerID, 0))
		{
			BattleBsn.ClientEndOp(game,playerID);
		}
		
		Vector<Integer> des = new Vector<Integer>();
		Collection<Integer> targetCol = paramISFSObject.getIntArray("target"); 
		for(Integer targetID:targetCol){
			des.add(targetID);
		}
		CardActionBean action = new CardActionBean(0,playerID,CardActionBean.DO_ABILITY_2_OP,des);
		game.setCurAction(action);
		
	}

}

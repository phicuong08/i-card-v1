package sfs2x.extensions.icard.main.commandHandler;

import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class ClientUseCardHandle extends BaseClientRequestHandler {

	@Override
	public void handleClientRequest(User paramUser, ISFSObject paramISFSObject) {

			if(targets.length >0)
			{
				params.putIntArray("target",targets);
			}
			int srcID = paramISFSObject.getInt("srcID");
			int gameID = paramISFSObject.getInt("game");
			CardGameBean game = GameLobbyBean.GetInstance().getGameMap().get(gameID);
			if(game==null)
				return;
			
			Vector<Integer> des = new Vector<Integer>();
			Collection<Integer> targetCol = params.getIntArray("target"); 
			for(Interget targetID:targetCol){
				des.add(targetID);
			}
			CardActionBean action = new CardActionBean(srcID,paramUser.getId(),CardActionBean.DO_CARD_2_USE,des);
			game.setCurAction(action);
	}

}

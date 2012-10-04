package sfs2x.extensions.icard.main.commandHandler;


import java.util.Collection;
import java.util.Vector;

import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.GameLobbyBean;
import sfs2x.extensions.icard.bsn.CardActionBsn;
import sfs2x.extensions.icard.bsn.ClientQueryBsn;
import sfs2x.extensions.icard.utils.ErrorDef;


import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;

public class ClientFightCardHandle extends ICardClientRequestHandler {

	@Override
	public void handleClientRequest(User paramUser, ISFSObject paramISFSObject) {
		trace("start handle Client Request");
		ErrorDef.Empty();
		int srcID = paramISFSObject.getInt("srcID");
		int gameId = paramISFSObject.getInt("game");

		CardGameBean game = GameLobbyBean.GetInstance().getGameMap().get(gameId);
		if(game==null)
			return;
		if(ClientQueryBsn.procGeneralVerify(game, paramUser.getId(), srcID)==false)
			return;
		
		Vector<Integer> des = new Vector<Integer>();
		Collection<Integer> targetCol = paramISFSObject.getIntArray("target"); 
		if(targetCol!=null){
			for(Integer targetID:targetCol){
				if(CardActionBsn.IsMatchFight(game,srcID,targetID))
					des.add(targetID);
			}		
		}

		ClientQueryBsn.procFightCardRequest(game, paramUser.getId(), srcID,des);
		SendOnErr(paramUser);
	}

}

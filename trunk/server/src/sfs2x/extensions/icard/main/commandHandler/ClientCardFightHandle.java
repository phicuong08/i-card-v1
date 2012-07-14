package sfs2x.extensions.icard.main.commandHandler;

import java.util.Collection;
import java.util.Vector;

import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.GameLobbyBean;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class ClientCardFightHandle extends BaseClientRequestHandler {

	@Override
	public void handleClientRequest(User paramUser, ISFSObject paramISFSObject) {

			int srcID = paramISFSObject.getInt("srcID");
			int gameID = paramISFSObject.getInt("game");
			CardGameBean game = GameLobbyBean.GetInstance().getGameMap().get(gameID);
			if(game==null)
				return;
			if(game.getOpPlayer()!=paramUser.getId())
				return;
			if(game.getCardOwner(srcID)!= paramUser.getId())
				return;
				
			Vector<Integer> des = new Vector<Integer>();
			Collection<Integer> targetCol = paramISFSObject.getIntArray("target"); 
			for(Integer targetID:targetCol){
				des.add(targetID);
			}
			CardActionBean action = new CardActionBean(srcID,paramUser.getId(),CardActionBean.DO_CARD_2_FIGHT,des);
			game.setCurAction(action);
	}

}

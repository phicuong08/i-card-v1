package sfs2x.extensions.icard.main.commandHandler;

import java.util.Collection;
import java.util.Vector;

import sfs2x.extensions.icard.beans.BattleStateBean;
import sfs2x.extensions.icard.beans.CardActionBean;
import sfs2x.extensions.icard.beans.CardGameBean;
import sfs2x.extensions.icard.beans.GameLobbyBean;
import sfs2x.extensions.icard.bsn.BattleBsn;
import sfs2x.extensions.icard.bsn.CardActionBsn;

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
			if(BattleBsn.VerifyClienRequest(game, paramUser.getId(), srcID)==false)
				return;
				
			Vector<Integer> des = new Vector<Integer>();
			Collection<Integer> targetCol = paramISFSObject.getIntArray("target"); 
			for(Integer targetID:targetCol){
				if(CardActionBsn.IsMatchFight(game,srcID,targetID))
					des.add(targetID);
			}
			
			int actionType;
			switch(game.getStateBean().getState())
			{
			case BattleStateBean.ST_WAIT_EX_OP:
				actionType = CardActionBean.DO_ABILITY_2_OP;
				break;
			default:
				actionType = CardActionBean.DO_CARD_2_FIGHT;
				break;
			}
			CardActionBean action = new CardActionBean(srcID,paramUser.getId(),actionType,des);
			game.setCurAction(action);
	}

}

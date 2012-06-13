package sfs2x.extensions.icard.main.eventHandler;


import sfs2x.extensions.icard.bsn.GameBsn;

import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.variables.UserVariable;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.extensions.BaseServerEventHandler;

public class UserDisconnectedEventHandler extends BaseServerEventHandler {

	@Override
	public void handleServerEvent(ISFSEvent paramISFSEvent) throws SFSException {
		User user = (User) paramISFSEvent.getParameter(SFSEventParam.USER);
		trace("icard: user '" + user.getName() + "' Disconnected - user id: " + user.getId());
		CardUserManager.getInstance().RemoveUser(user.getId());
		Integer id = (Integer) user.getProperty("game");
		GameBsn.RemovePlayer(id, user.getId());
	}

}

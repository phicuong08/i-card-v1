package sfs2x.extensions.icard.main.eventHandler;

import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.extensions.BaseServerEventHandler;

public class UserJoinedZoneEventHandler extends BaseServerEventHandler {

	@Override
	public void handleServerEvent(ISFSEvent paramISFSEvent) throws SFSException {
//		User user = (User) paramISFSEvent.getParameter(SFSEventParam.USER);
//		trace("icard: user  join ZONE',user name =" + user.getName() + "' - user id: " + user.getId());
//		CardUser cardUser = new CardUser(user.getId());
//		CardUserManager.getInstance().AddUser(cardUser);
		
	}

}

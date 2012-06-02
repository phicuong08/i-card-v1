package sfs2x.extensions.icard.main.eventHandler;

import com.icard.room.CardRoom;
import com.icard.room.CardRoomManager;
import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.extensions.BaseServerEventHandler;

public class UserJoinedRoomEventHandler extends BaseServerEventHandler {

	@Override
	public void handleServerEvent(ISFSEvent event) throws SFSException {
		/*
		Room room = (Room) event.getParameter(SFSEventParam.ROOM);	

		// Get user that joined
		User user = (User) event.getParameter(SFSEventParam.USER);

		trace("icard: user " + user.getName() + " entered the game room '" + room.getName() + "' - game room id: " + room.getId());
		
		CardUser cardUser = CardUserManager.getInstance().GetUser(user.getId());
		CardRoom cardRoom = CardRoomManager.getInstance().GetRoom(room.getId());
		cardRoom.OnPlayerJoinRoom(cardUser);
		*/
	}

}

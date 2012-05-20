package sfs2x.extensions.icard.main.eventHandler;

import com.icard.room.CardRoom;
import com.icard.room.CardRoomManager;
import com.smartfoxserver.v2.core.ISFSEvent;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.exceptions.SFSException;
import com.smartfoxserver.v2.extensions.BaseServerEventHandler;

public class RoomCreatedEventHandler extends BaseServerEventHandler {

	@Override
	public void handleServerEvent(ISFSEvent paramISFSEvent) throws SFSException {
		Room room = (Room) paramISFSEvent.getParameter(SFSEventParam.ROOM);	
		
		trace("icard: game room '" + room.getName() + "' created - game room id: " + room.getId());
		
		CardRoom cardRoom = new CardRoom(room.getId());
		CardRoomManager.getInstance().AddRoom(cardRoom);
	}

}

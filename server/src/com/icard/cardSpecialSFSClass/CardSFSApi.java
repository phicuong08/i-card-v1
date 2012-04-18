package com.icard.cardSpecialSFSClass;

import com.smartfoxserver.v2.SmartFoxServer;
import com.smartfoxserver.v2.api.CreateRoomSettings;
import com.smartfoxserver.v2.api.SFSApi;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;
import com.smartfoxserver.v2.exceptions.SFSJoinRoomException;

public class CardSFSApi extends SFSApi {

	public CardSFSApi(SmartFoxServer sfs) {
		super(sfs);

	}

	public Room createRoom(Zone zone, CreateRoomSettings params, User owner,
			boolean joinIt, Room roomToLeave, boolean fireClientEvent,
			boolean fireServerEvent) throws SFSCreateRoomException {

		Room room = super.createRoom(zone, params, owner, joinIt, roomToLeave,
				fireClientEvent, fireServerEvent);
		
		if(room != null)
		{
			try {
				joinRoom(owner, room);
			} catch (SFSJoinRoomException e) {
				e.printStackTrace();
			}
		}
		return room;
	}

}

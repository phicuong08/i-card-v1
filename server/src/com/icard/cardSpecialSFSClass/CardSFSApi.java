package com.icard.cardSpecialSFSClass;

import com.smartfoxserver.v2.SmartFoxServer;
import com.smartfoxserver.v2.api.CreateRoomSettings;
import com.smartfoxserver.v2.api.SFSApi;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import com.smartfoxserver.v2.exceptions.SFSCreateRoomException;

public class CardSFSApi extends SFSApi {

	public CardSFSApi(SmartFoxServer sfs) {
		super(sfs);
		
	}
	
	public Room createRoom(Zone zone, CreateRoomSettings params, User owner, boolean joinIt, Room roomToLeave, boolean fireClientEvent, boolean fireServerEvent)
			     throws SFSCreateRoomException
			   {
				int a=1;
				a++;
			    return super.createRoom(zone, params, owner, joinIt, roomToLeave, fireClientEvent, fireServerEvent); 
			   }

}

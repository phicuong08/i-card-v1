package sfs2x.extensions.icard.main;



import java.util.ArrayList;
import java.util.HashMap;

import com.icard.data.excel.ExcelReader;
import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class ICardExtension extends SFSExtension {

	@Override
	public void init() {
		trace("**************************************");
		trace("* Starting ICard extension");

		//ws
		HashMap<String,ArrayList<HashMap<String,String>>> data = ExcelReader.loadFile("./card.xls");

		//ws
		
		// Event handler: join room
		addEventHandler(SFSEventType.USER_JOIN_ROOM, UserJoinedEventHandler.class);

		// Event handler: user leave game room
		addEventHandler(SFSEventType.USER_LEAVE_ROOM, UserLeavedEventHandler.class);

		// Event handler: user log out
		addEventHandler(SFSEventType.USER_LOGOUT, UserDisconnectedEventHandler.class);

		// Event handler: user disconnect
		addEventHandler(SFSEventType.USER_DISCONNECT, UserDisconnectedEventHandler.class);

		trace("* BattleFarm initialization completed");
		trace("**************************************");
	}

}

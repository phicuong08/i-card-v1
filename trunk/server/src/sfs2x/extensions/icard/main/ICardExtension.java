package sfs2x.extensions.icard.main;



import java.util.ArrayList;
import java.util.HashMap;


import sfs2x.extensions.icard.main.commandHandler.ClientGameStateUpdateHandle;
import sfs2x.extensions.icard.main.eventHandler.UserDisconnectedEventHandler;
import sfs2x.extensions.icard.main.eventHandler.UserJoinedEventHandler;
import sfs2x.extensions.icard.main.eventHandler.UserLeavedEventHandler;
import sfs2x.extensions.icard.utils.Commands;

import com.icard.data.excel.ExcelReader;
import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class ICardExtension extends SFSExtension {

	@Override
	public void init() {
		trace("**************************************");
		trace("* Starting ICard extension");


		
		//命令handler添加
		//客户端准备
		addRequestHandler(Commands.CMD_C2S_CLIENT_GAME_STATE_UPDATE,ClientGameStateUpdateHandle.class);
		
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

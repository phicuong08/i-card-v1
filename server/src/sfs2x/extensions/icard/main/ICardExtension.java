package sfs2x.extensions.icard.main;





import java.util.List;

import sfs2x.extensions.icard.beans.CardInfoStoreBean;
import sfs2x.extensions.icard.main.commandHandler.ClientGameStateUpdateHandle;
import sfs2x.extensions.icard.main.eventHandler.RoomCreatedEventHandler;
import sfs2x.extensions.icard.main.eventHandler.RoomRemovedEventHandler;
import sfs2x.extensions.icard.main.eventHandler.UserDisconnectedEventHandler;
import sfs2x.extensions.icard.main.eventHandler.UserJoinedRoomEventHandler;
import sfs2x.extensions.icard.main.eventHandler.UserJoinedZoneEventHandler;
import sfs2x.extensions.icard.main.eventHandler.UserLeavedRoomEventHandler;
import sfs2x.extensions.icard.utils.Commands;


import com.smartfoxserver.v2.core.SFSEventType;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.extensions.SFSExtension;

public class ICardExtension extends SFSExtension {

	@Override
	public void init() {
		trace("**************************************");
		trace("* Starting ICard extension");
		CardInfoStoreBean.GetInstance();
		ParentExtension.setInstance(this);
	

		//命令handler添加
		//客户端准备
		addRequestHandler(Commands.CMD_C2S_CLIENT_BATTLE_STATE_UPDATE,ClientBattleStateUpdateHandle.class);
		addRequestHandler(Commands.CMD_C2S_CARD_USE,ClientUseCardHandle.class);
		addRequestHandler(Commands.CMD_C2S_CARD_UPDATE,ClientUpdateCardHandle.class);
		
		//事件handle添加
		// Event handler: join room
		addEventHandler(SFSEventType.USER_JOIN_ROOM, UserJoinedRoomEventHandler.class);

		// Event handler: user leave game room
		addEventHandler(SFSEventType.USER_LEAVE_ROOM, UserLeavedRoomEventHandler.class);

		// Event handler: user log out
		addEventHandler(SFSEventType.USER_LOGOUT, UserDisconnectedEventHandler.class);

		// Event handler: user disconnect
		addEventHandler(SFSEventType.USER_DISCONNECT, UserDisconnectedEventHandler.class);
		
		// Event handler: USER_JOIN_ZONE
		addEventHandler(SFSEventType.USER_JOIN_ZONE, UserJoinedZoneEventHandler.class);
		
		// Event handler: ROOM_ADDED
		addEventHandler(SFSEventType.ROOM_ADDED, RoomCreatedEventHandler.class);
		
		// Event handler: ROOM_REMOVED 
		addEventHandler(SFSEventType.ROOM_REMOVED, RoomRemovedEventHandler.class);


		trace("* BattleFarm initialization completed");
		trace("**************************************");
	}
	public void startGame(List<User> players)
	{
		
	}
}

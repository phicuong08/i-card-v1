package sfs2x.extensions.games.battlefarm.main;

import sfs2x.extensions.games.battlefarm.utils.Commands;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

/**
 * MapListHandler: manage a map list request
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class MapListHandler extends BaseClientRequestHandler
{
	@Override
	public void handleClientRequest(User sender, ISFSObject params)
	{	
		// Get response object (already prepared during map initialization)
		ISFSObject resObj = ((BattleFarmExtension) (getParentExtension())).getGameMapsInfoBean().getMapListObject();

		// Send it back
		send(Commands.CMD_MAP_LIST, resObj, sender);
	}
}
package sfs2x.extensions.games.battlefarm.main;

import java.util.List;

import sfs2x.extensions.games.battlefarm.beans.BombBean;
import sfs2x.extensions.games.battlefarm.beans.GameBean;
import sfs2x.extensions.games.battlefarm.beans.MapTileBean;
import sfs2x.extensions.games.battlefarm.beans.PlayerBean;
import sfs2x.extensions.games.battlefarm.utils.Commands;
import sfs2x.extensions.games.battlefarm.utils.Constants;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

/**
 * Bomb handler: manages all bombs commands from users
 * 
 * @author Ing. Ignazio Locatelli
 * @versione 1.0
 */
public class BombHandler extends BaseClientRequestHandler
{
	/**
	 * Handle bomb request from user
	 * 
	 * @param sender The user that made the request
	 * @param params The parameters passed with the request
	 */
	@Override
	public void handleClientRequest(User sender, ISFSObject params)
	{
		// Retrieve user's room
		Room room = null;
		List<Room> rooms = sender.getJoinedRooms();
		if (rooms.size() > 0) room = rooms.get(0);  // User can be only in 1 room at a time
	
		int bombId = params.getInt("bId");
		int bombPx = params.getInt("bx");
		int bombPy = params.getInt("by");
		
		// Get game bean
		GameBean gameBean = ((BattleFarmExtension) (getParentExtension())).getGames().get(room.getId());

		if (gameBean != null)
		{	
			PlayerBean p = gameBean.getPlayers().get(sender.getId());
			
			// Initialize bomb
			int bombIndex = bombId;
			
			if (!p.isMaster()) bombIndex += Constants.BOMBS;
			
			BombBean bombBean = (BombBean) gameBean.getBombList().get(bombIndex);
			bombBean.setPx(bombPx);
			bombBean.setPy(bombPy);
			bombBean.setBoomTime(System.currentTimeMillis() + Constants.BOMB_TIME);
			bombBean.setIdOwner(sender.getId());
			bombBean.setActive(true);
						
			// Put bomb on map
			gameBean.getGameMap()[bombPy][bombPx] = Constants.BOMB_SYMBOL;
			
			// Remove empty tile relative to the bomb
			MapTileBean mt = null;
			synchronized(gameBean.getEmptyTiles())
			{
				int i;
		        for (i = 0; i < gameBean.getEmptyTiles().size(); i++)
		        {
		        	mt = (MapTileBean) gameBean.getEmptyTiles().get(i);
		        	if (mt.getPx() == bombBean.getPx() && mt.getPy() == bombBean.getPy())
		        		break;
		        }
		        
		        if (i < gameBean.getEmptyTiles().size())
		        	gameBean.getEmptyTiles().remove(i);
		      }
			
			// Send response to opponent
			ISFSObject resObj = new SFSObject();
			resObj.putInt("bId",bombId);
			resObj.putInt("bx",bombPx);
			resObj.putInt("by",bombPy);
			
			List<User> recipients = room.getUserList();
			recipients.remove(p.getSfsUser());
			
			send(Commands.BOMB, resObj, recipients);
		}
	}
}
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
 * MovementHandler: manages avatar movements from the users
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class MovementHandler extends BaseClientRequestHandler
{
	/**
	 * Handle movement request from user
	 * 
	 * @param sender	The user that made the request
	 * @param params	The parameters passed with the request
	 */
	@Override
	public void handleClientRequest(User sender, ISFSObject params)
	{
		// Retrieve user's room
		Room room = null;
		List<Room> rooms = sender.getJoinedRooms();
		if (rooms.size() > 0) room = rooms.get(0);  // User can be only in 1 room at a time

		// Get game bean
		GameBean gameBean = ((BattleFarmExtension) (getParentExtension())).getGames().get(room.getId());

		if (gameBean != null)
		{
			PlayerBean p = gameBean.getPlayers().get(sender.getId());

			int px = params.getInt("px");
			int py = params.getInt("py");

			// Update player coordinates
			p.setX(px);
			p.setY(py);

			// Send update to opponent
			ISFSObject resObj = new SFSObject();
			resObj.putInt("px",px);
			resObj.putInt("py",py);

			List<User> recipients = room.getUserList();
			recipients.remove(p.getSfsUser());

			send(Commands.MV, resObj, recipients);

			PlayerBean p1 = (PlayerBean) gameBean.getPlayers().get(gameBean.getMaster());
			PlayerBean p2 = (PlayerBean) gameBean.getPlayers().get(gameBean.getSlave());

			// Test if there's a collision with the door (if open)
			if (gameBean.isDoorOpen())
			{
				if (px == gameBean.getDoor().getPx() && py == gameBean.getDoor().getPy())
				{
					// If it's a TIE, no one can exit :-)
					if (p1.getScore() != p2.getScore())
					{
						// If my score is the highest then I am the winner, otherwise I can't use the door!
						if (p.getScore() >= p1.getScore() && p.getScore() >= p2.getScore())
						{
							// Stop the current game
							gameBean.setStarted(false);

							// Clear all active bombs
							for (int i = 0; i < gameBean.getBombList().size(); i++)
								((BombBean) (gameBean.getBombList()).get(i)).setActive(false);

							int winnerId = (p1 == p) ? p1.getSfsUser().getId() : p2.getSfsUser().getId();

							ISFSObject winObj = new SFSObject();
							winObj.putInt("id",winnerId);

							trace("BattleFarm: User: " + ((p1 == p) ? p1.getSfsUser().getName() : p2.getSfsUser().getName()) + " won the game");

							// Send winner's player id to players
							send(Commands.WIN, winObj, room.getUserList());
						}
					}
				}
			}

			// Test if there's a collision with collectible element 
			if (gameBean.getBaseGameMapBean().getCollectibles().indexOf(gameBean.getGameMap()[py][px]) != -1)
			{
				gameBean.getGameMap()[py][px] = Constants.EMPTY_TILE;
				gameBean.getEmptyTiles().add(new MapTileBean(px,py));
				p.setScore(p.getScore()+1);
				
				// Send information to players
				ISFSObject collectibleObj = new SFSObject();
				collectibleObj.putInt("px",px);
				collectibleObj.putInt("py",py);
				collectibleObj.putInt("who",((p.isMaster()) ? p1.getId() : p2.getId()));
				collectibleObj.putInt("sc",p.getScore());   // Send updated score

				// Send "got collectible" to both clients
				send(Commands.COLLECTIBLE, collectibleObj, room.getUserList());	    	
			}
		}
		else
		{
			trace("GameBean is null");
		}
	}
}
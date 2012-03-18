package sfs2x.extensions.games.battlefarm.main;

import java.util.Enumeration;

import sfs2x.extensions.games.battlefarm.beans.BombBean;
import sfs2x.extensions.games.battlefarm.beans.GameBean;
import sfs2x.extensions.games.battlefarm.bsn.GameBsn;
import sfs2x.extensions.games.battlefarm.utils.Constants;

/**
 * GameController: thread controlling time ticking on all running games
 * 
 * @author  Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameController extends Thread
{	
	/** Reference to main extension */
	private BattleFarmExtension extension = null;
	
	/** Continue flag */
	private boolean timeEventsRunning = true;
	
	/** Debug flag */
	private boolean debug = false;
	
	/**
	 * Constructor
	 * 
	 * @param extension		Reference to main extension
	 */
	public GameController(BattleFarmExtension extension)
	{
		this.extension = extension;
	}
	
	/** 
	 * Main run method
	 */
	public void run()
	{	
		int count = 0;
		
		while (timeEventsRunning)
		{
			count++;
			
			// Cycle for all the running games
			for (Enumeration<GameBean> e = extension.getGames().elements(); e.hasMoreElements(); )
			{	
				GameBean currGameBean = (GameBean) e.nextElement();
				
				// Process the game only if it has been started
				if (currGameBean.isStarted())
				{	
					if ( debug && (count%100) == 0) extension.trace("analyze match: " + currGameBean.getId());
					
					// Check the current game Timer
					if (!currGameBean.isDoorOpen() && System.currentTimeMillis() > (currGameBean.getGameStartTime() + currGameBean.getMatchDuration()))
						GameBsn.openTheDoor(currGameBean,extension);
					
					// Cycle through all bombs
					for (int b = 0; b < currGameBean.getBombList().size(); b++)
					{
						BombBean bb = (BombBean) currGameBean.getBombList().get(b);
						
						if (debug && (count%100) == 0)
							extension.trace("match id: " + currGameBean.getId() + " bomb id: " + bb.getId() + " active: " + bb.isActive());
						
						if (bb.isActive() && System.currentTimeMillis() > bb.getBoomTime())
							GameBsn.explodeBomb(currGameBean, bb, extension);
					}
				}
			}
			
			// Sleep a bit
			try
			{ 
				Thread.sleep(Constants.SLEEP_TIME); 
			}
			catch(InterruptedException e)
			{
				// Halt this thread
				extension.trace("BattleFarm extension was halted");
			}	
		}
	}
	
	/* GETTERS & SETTERS */

	public boolean isTimeEventsRunning() {
		return timeEventsRunning;
	}

	public void setTimeEventsRunning(boolean timeEventsRunning) {
		this.timeEventsRunning = timeEventsRunning;
	}
}
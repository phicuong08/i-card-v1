package sfs2x.extensions.icard.main;

import java.util.Enumeration;

import sfs2x.extensions.icard.beans.*;
import sfs2x.extensions.icard.bsn.GameBsn;
import sfs2x.extensions.icard.utils.Constants;

/**
 * GameController: thread controlling time ticking on all running games
 * 
 * @author  Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameController extends Thread
{	
	/** Reference to main extension */
	private ICardExtension _extension = null;
	
	/** Continue flag */
	private boolean timeEventsRunning = true;
	
	/** Debug flag */
	private boolean debug = false;
	private long _lastTickTime;
	/**
	 * Constructor
	 * 
	 * @param extension		Reference to main extension
	 */
	public GameController(ICardExtension extension)
	{
		this._extension = extension;
	}
	
	/** 
	 * Main run method
	 */
	public void run()
	{	
		int count = 0;
		
		_lastTickTime = System.nanoTime();
		while (timeEventsRunning)
		{
			count++;
			long curNano =  System.nanoTime();
			long elapsed = curNano - _lastTickTime;
			_lastTickTime = curNano;

			// Cycle for all the running games
			for (Enumeration<CardGameBean> e = _extension.getGames().elements(); e.hasMoreElements(); )
			{	
				CardGameBean currGameBean = (CardGameBean) e.nextElement();
				
				// Process the game only if it has been started
				if (currGameBean.isStarted())
				{	
					currGameBean.gameTick(_extension,(int) elapsed);
					//if ( debug && (count%100) == 0) extension.trace("analyze match: " + currGameBean.getId());

/*					
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
*/					
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
				_extension.trace("ICard extension was halted");
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
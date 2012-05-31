package sfs2x.extensions.icard.utils;

import java.util.*;

import sfs2x.extensions.icard.main.ICardExtension;

import com.smartfoxserver.v2.entities.User;

/**
 * SyncGameStart: utility class used to synchronize game start command after a certain period of time
 * 
 * @author  Ing. Ignazio Locatelli
 * @version 1.0
 */
public class SyncGameStart extends TimerTask
{	
	/** Game players */
	private List<User> players = null;

	/** Reference to handler managing communication with Players */
	private ICardExtension ext = null;

	/** Creates a new instance of SyncGameStart */
	public SyncGameStart(ICardExtension ext, List<User> players)
	{
		this.ext = ext;
		this.players = players;
	}

	public void run()
	{
		ext.startGame(players);
	}   
}
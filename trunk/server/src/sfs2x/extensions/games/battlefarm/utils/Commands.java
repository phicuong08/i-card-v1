package sfs2x.extensions.games.battlefarm.utils;

/**
 * Commands: constant class containin all available commands managed by the extension
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class Commands
{
	/** Get the list of available maps */
	public static final String CMD_MAP_LIST = "map_list";
	
	/** Stop game caused by user exit */
	public static final String CMD_STOP = "stop";
	
	/** Ready to start a game */
	public static final String CMD_READY = "ready";
	
	/** Map data */
	public static final String CMD_MAP_DATA = "map";
	
	/** Go command: game started */
	public static final String CMD_GO = "go";
	
	/** Restart command */
	public static final String CMD_RESTART = "restart";
	
	/** Movement command */
	public static final String MV = "mv";
	
	/** Bbomb command */
	public static final String BOMB = "bb";
	
	/** Bomb explosion */
	public static final String XP = "xp";
	
	/** Got collectible item */
	public static final String COLLECTIBLE = "gi";
	
	/** Open door command */
	public static final String OPEN_DOOR = "od";
	
	/** Win command */
	public static final String WIN = "win";
	
	/** Create room command */
	public static final String CREATE_ROOM = "createRoom";
	
	/** Room created response command */
	public static final String ROOM_CREATED = "roomCreated";
}
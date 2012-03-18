package sfs2x.extensions.games.battlefarm.utils;

/**
 * Constants: class containing constatns used to configure the extension
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class Constants
{	
	/** Default game duration */
	public final static int DEFAULT_GAME_DURATION = 60;

	/** Map width */
	public static final int MAP_WIDTH = 20;

	/** Map height */
	public static final int MAP_HEIGHT = 16;

	/** Empty tile */
	public static final char EMPTY_TILE = '.';

	/** Bombs number */
	public static final int BOMBS = 3;

	/** Bomb explosion time */
	public static final int BOMB_TIME = 2500;

	/** Sleep time for the Game Controller process */
	public static final int SLEEP_TIME = 100;

	/** Direction constant: left */
	public static final int LEFT = 0;

	/** Direction constant: right */
	public static final int RIGHT = 1;

	/** Direction constant: up */
	public static final int UP = 2;

	/** Direction constant: down */
	public static final int DOWN = 3;

	/** Points decreased when hit by bomb */
	public static final int ITEM_TAX = 3;

	/** Chain reaction flag */
	public static final boolean CHAIN_REACTION = true;

	/** Symbol used for a bomb left by the user */
	public static final char BOMB_SYMBOL = 'X';
}
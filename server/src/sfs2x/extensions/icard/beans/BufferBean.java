package sfs2x.extensions.games.battlefarm.beans;

import sfs2x.extensions.games.battlefarm.utils.Constants;

import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;

/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameMapBean
{
	/** Map cells */
	private char map[][];

	/** Progressive map id */
	private int id;

	/** Map name */
	private String name;

	/** Room icon */
	private String icon;

	/** Thumbnail */
	private String thumbnail;

	/** Map background (e.g. grass, stubble, soil) */
	private String background;

	/** Map foreground (e.g. leafs) */
	private String foreground;

	/** Match duration (expressed in seconds) */
	private int matchDuration;

	/** Initial x position for player 1 */
	private int p1x;

	/** Initial y position for player 1 */
	private int p1y;

	/** Initial x position for player 2 */
	private int p2x;

	/** Initial y position for player 2 */
	private int p2y;

	/** Collectibles available on the map */
	private String collectibles = "";

	/** SFSObject representation ready to be used in responses to clients */
	private ISFSObject mapObject = null;

	/**
	 * Create a new instance of GameMapBean
	 * 
	 * @param id			Id of the map
	 * @param name			Name associated to the map
	 * @param map			Map cells
	 * @param icon			Icon associated to the map
	 * @param thumbnail		Thumbnail associated to the map
	 * @param background	Background to use for the map
	 * @param foreground	Foreground to use for the map
	 * @param matchDuration	Duration of the match associated to the map
	 * @param p1x			Initial x position for player1
	 * @param p1y			Initial y position for player1
	 * @param p2x			Initial x position for player2
	 * @param p2y			Initial y position for player2
	 * @param collectibles	List of available collectibles for this map
	 */
	public GameMapBean(int id, String name, char map[][], String icon,
			String thumbnail, String background, String foreground,
			int matchDuration, int p1x, int p1y, int p2x, int p2y,
			String collectibles)
	{
		this.map = new char[Constants.MAP_HEIGHT][Constants.MAP_WIDTH];
		this.id = id;
		this.name = name;
		this.map = map;
		this.icon = icon;
		this.thumbnail = thumbnail;
		this.background = background;
		this.foreground = foreground;
		this.matchDuration = matchDuration;
		this.p1x = p1x;
		this.p1y = p1y;
		this.p2x = p2x;
		this.p2y = p2y;
		this.collectibles = collectibles;
		initializeMapObject();
	}
	
	/* GETTERS & SETTERS */

	public char[][] getMap() {
		return map;
	}

	public void setMap(char[][] map) {
		this.map = map;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getBackground() {
		return background;
	}

	public void setBackground(String background) {
		this.background = background;
	}

	public String getForeground() {
		return foreground;
	}

	public void setForeground(String foreground) {
		this.foreground = foreground;
	}

	public int getMatchDuration() {
		return matchDuration;
	}

	public void setMatchDuration(int matchDuration) {
		this.matchDuration = matchDuration;
	}

	public int getP1x() {
		return p1x;
	}

	public void setP1x(int p1x) {
		this.p1x = p1x;
	}

	public int getP1y() {
		return p1y;
	}

	public void setP1y(int p1y) {
		this.p1y = p1y;
	}

	public int getP2x() {
		return p2x;
	}

	public void setP2x(int p2x) {
		this.p2x = p2x;
	}

	public int getP2y() {
		return p2y;
	}

	public void setP2y(int p2y) {
		this.p2y = p2y;
	}

	public String getCollectibles() {
		return collectibles;
	}

	public void setCollectibles(String collectibles) {
		this.collectibles = collectibles;
	}

	public ISFSObject getMapObject() {
		return mapObject;
	}

	public void setMapObject(ISFSObject mapObject) {
		this.mapObject = mapObject;
	}
	
	/* PUBLIC METHODS */

	/**
	 * Initialize the map object
	 * This object an already ready object that can be used to send map information at match start
	 */
	private void initializeMapObject()
	{
		mapObject = new SFSObject();
		mapObject.putUtfString("bg", background);
		mapObject.putUtfString("fg", foreground);
		mapObject.putInt("dur", matchDuration);
		mapObject.putInt("p1x", p1x);
		mapObject.putInt("p1y", p1y);
		mapObject.putInt("p2x", p2x);
		mapObject.putInt("p2y", p2y);
		mapObject.putUtfString("coll", collectibles);

		char tempMap[][] = new char[Constants.MAP_HEIGHT][Constants.MAP_WIDTH];
		tempMap = (char[][]) map;

		for (int i = 0; i < Constants.MAP_HEIGHT; i++)
			mapObject.putUtfString("" + i, new String(tempMap[i]));
	}
}

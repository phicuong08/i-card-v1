package sfs2x.extensions.games.battlefarm.beans;

/**
 * MapTileBean: class describing a tile on a map
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class MapTileBean
{
	/** X coordinate */
	private int px = 0;

	/** Y coordinate */
	private int py = 0;

	/**
	 * Empty constructor
	 */
	public MapTileBean() {}

	/** 
	 * Constructor
	 * 
	 * @param px	The x position of the tile
	 * @param py	The y position of the tile
	 */
	public MapTileBean(int px, int py)
	{
		this.px = px;
		this.py = py;
	}
	
	/* GETTERS & SETTERS */

	public int getPx() {
		return px;
	}

	public void setPx(int px) {
		this.px = px;
	}

	public int getPy() {
		return py;
	}

	public void setPy(int py) {
		this.py = py;
	}
}
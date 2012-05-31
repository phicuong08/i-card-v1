package sfs2x.extensions.games.battlefarm.beans;

/**
 * BombBean: object describing a bomb on the game map
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BombBean
{
	/** Bomb id */
	private int id;

	/** X position */
	private int px = 0;

	/** Y position */
	private int py;

	/** Set time bomb */
	private long boomTime;

	/** Active flag */
	private boolean active;

	/** User id of the bomb owner */
	private int idOwner = 0;

	/**
	 * Constructor
	 * 
	 * @param id        The bomb id
	 * @param px        The x position of the bomb
	 * @param py        The y position of the bomb
	 * @param boomTime  The time at which the bomb will explode
	 * @param idOwner   SFS id of the owner of the bomb
	 */
	public BombBean(int id, int px, int py, long boomTime, int idOwner)
	{
		this.active = false;
		this.id = id;
		this.px = px;
		this.py = py;
		this.boomTime = boomTime;
		this.idOwner = idOwner;
	}
	
	/* GETTERS & SETTERS */

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

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

	public long getBoomTime() {
		return boomTime;
	}

	public void setBoomTime(long boomTime) {
		this.boomTime = boomTime;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public int getIdOwner() {
		return idOwner;
	}

	public void setIdOwner(int idOwner) {
		this.idOwner = idOwner;
	}
}
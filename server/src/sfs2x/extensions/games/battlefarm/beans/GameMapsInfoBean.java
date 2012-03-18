package sfs2x.extensions.games.battlefarm.beans;

import java.util.ArrayList;

import java.util.Iterator;

import com.smartfoxserver.v2.entities.data.ISFSArray;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;

/**
 * GameMapsInfoBean: class containing map description of the available maps
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameMapsInfoBean 
{
	/** List of available maps */
	private ArrayList<GameMapBean> maps = null;

	/** Collectibles available */
	private String collectibles = "";

	/** Pre-built object for sending map list information */
	private ISFSObject mapListObject = null;

	/** 
	 * Empty constructor
	 */
	public GameMapsInfoBean() {}

	/**
	 * Constructor
	 * 
	 * @param maps			List of available maps
	 * @param collectibles	Collectibles available for the maps
	 */
	public GameMapsInfoBean(ArrayList<GameMapBean> maps, String collectibles)
	{
		this.maps = maps;
		this.collectibles = collectibles;
		buildMapListObject();
	}
	
	/* GETTERS & SETTERS */

	public ArrayList<GameMapBean> getMaps() {
		return maps;
	}

	public void setMaps(ArrayList<GameMapBean> maps) {
		this.maps = maps;
		buildMapListObject();
	}

	public String getCollectibles() {
		return collectibles;
	}

	public void setCollectibles(String collectibles) {
		this.collectibles = collectibles;
	}

	public ISFSObject getMapListObject() {
		return mapListObject;
	}
	
	/* PUBLIC METHODS */

	/**
	 * Build ISFSArray object for map list commands (ready to use object to send to clients)
	 */
	private void buildMapListObject()
	{
		mapListObject = new SFSObject();

		ISFSArray mapsArray = new SFSArray();

		for (Iterator<GameMapBean> i = maps.iterator(); i.hasNext(); )
		{
			GameMapBean gameMapBean = (GameMapBean) i.next();
			ISFSObject mapObj = new SFSObject();
			mapObj.putShort("id",(short)gameMapBean.getId());
			mapObj.putUtfString("name",gameMapBean.getName());
			mapObj.putUtfString("icon",gameMapBean.getIcon());
			mapObj.putUtfString("thumb",gameMapBean.getThumbnail());
			mapsArray.addSFSObject(mapObj);
		}

		mapListObject.putSFSArray("list", mapsArray);
	}
}
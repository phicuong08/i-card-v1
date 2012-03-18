package sfs2x.extensions.games.battlefarm.bsn;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;

import sfs2x.extensions.games.battlefarm.beans.GameMapBean;
import sfs2x.extensions.games.battlefarm.beans.GameMapsInfoBean;
import sfs2x.extensions.games.battlefarm.main.BattleFarmExtension;
import sfs2x.extensions.games.battlefarm.utils.Constants;


import net.n3.nanoxml.*;

/**
 * GameMapBsn: class containing methods to load and manage maps
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class GameMapBsn
{
	/** Maps configuration file */
	private final static String mapConfigFile = "extensions/battleFarm/BattleFarmMaps.xml";

	/**
	 * Load all available maps
	 * 
	 * @param parent	Reference to the main Battlefarm extension
	 * 
	 * @return	A GameMapsInfoBean object containing description of all the loaded maps
	 */
	@SuppressWarnings("unchecked")
	public static GameMapsInfoBean loadMaps(BattleFarmExtension parent)
	{
		// Create the new object that is going to contain all available maps
		GameMapsInfoBean gameMapsInfoBean = new GameMapsInfoBean();

		// List of available maps
		ArrayList<GameMapBean> maps = new ArrayList<GameMapBean>();

		try
		{ 
			// Initialize xml parser
			IXMLParser parser = XMLParserFactory.createDefaultXMLParser(); 
			IXMLReader reader = StdXMLReader.fileReader(new File(mapConfigFile).toURI().getPath());
			parser.setReader(reader);
			IXMLElement xml = (IXMLElement) parser.parse(true);

			// Get <Collectibles></Collectibles> tag
			IXMLElement collectibleTag = xml.getFirstChildNamed("Collectibles");
			gameMapsInfoBean.setCollectibles(collectibleTag.getAttribute("list", "a"));

			// Get <Maps></Maps> tag
			IXMLElement mapsTag = xml.getFirstChildNamed("Maps");
			Enumeration mapsAvailable = mapsTag.enumerateChildren();

			int mapId = 0;

			char[][] tempMap;

			while(mapsAvailable.hasMoreElements())
			{
				tempMap = new char[Constants.MAP_HEIGHT][Constants.MAP_WIDTH];

				// Get <MapData></MapData> tag
				IXMLElement newMap = (IXMLElement) mapsAvailable.nextElement();

				if (newMap.getName().equalsIgnoreCase("MapData"))
				{
					String mapName = newMap.getAttribute("name", "");
					String mapIcon = newMap.getAttribute("roomIcon", "");
					String mapThumbnail = newMap.getAttribute("thumbnail", "");
					String mapBackground = newMap.getAttribute("background", "");
					String mapForeground = newMap.getAttribute("foreground", "");
					int matchDuration = Integer.parseInt(newMap.getAttribute("matchTime", String.valueOf(Constants.DEFAULT_GAME_DURATION)));
					int p1x = Integer.parseInt(newMap.getAttribute("p1x", "1"));
					int p1y = Integer.parseInt(newMap.getAttribute("p1y", "14"));
					int p2x = Integer.parseInt(newMap.getAttribute("p2x", "18"));
					int p2y = Integer.parseInt(newMap.getAttribute("p2y", "1"));

					Enumeration<IXMLElement> mapLines = newMap.enumerateChildren();

					int count = 0;

					while(mapLines.hasMoreElements())
					{
						IXMLElement line = (IXMLElement) mapLines.nextElement();
						
						if (line.getName().equalsIgnoreCase("mapline"))
						{
							String str = line.getContent();
							String l = "";
							
							for(int x = 0; x < Constants.MAP_WIDTH; x++)
							{
								tempMap[count][x] = str.charAt(x);
								l+=str.charAt(x);
							}
						}

						count++;
					}

					// Adds a new map to the maps collections
					maps.add(new GameMapBean(mapId, mapName, tempMap, mapIcon, mapThumbnail, mapBackground, mapForeground, matchDuration, p1x, p1y, p2x, p2y,gameMapsInfoBean.getCollectibles()) );

					parent.trace("* new map loaded: " + mapName);
				}

				mapId++;
			}

			parent.trace("* Map loading ended. Maps loaded: " + maps.size());

			gameMapsInfoBean.setMaps(maps);

		}
		catch(Exception e)
		{
			parent.trace("Exception in loading maps",e);
		}

		return gameMapsInfoBean;
	}
}
package com.smartfoxserver.v2.entities.match;

import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.Zone;
import java.util.List;

public abstract interface IMatchingEngine
{
  public abstract List<Room> findGames(MatchExpression paramMatchExpression, Zone paramZone);

  public abstract List<Room> findGames(MatchExpression paramMatchExpression, Zone paramZone, int paramInt);

  public abstract List<Room> findGames(MatchExpression paramMatchExpression, Zone paramZone, String paramString);

  public abstract List<Room> findGames(MatchExpression paramMatchExpression, Zone paramZone, String paramString, int paramInt);

  public abstract List<User> findPlayers(MatchExpression paramMatchExpression, Zone paramZone);

  public abstract List<User> findPlayers(MatchExpression paramMatchExpression, Zone paramZone, int paramInt);

  public abstract List<User> findPlayers(MatchExpression paramMatchExpression, Zone paramZone, Room paramRoom);

  public abstract List<User> findPlayers(MatchExpression paramMatchExpression, Zone paramZone, Room paramRoom, int paramInt);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.IMatchingEngine
 * JD-Core Version:    0.6.0
 */
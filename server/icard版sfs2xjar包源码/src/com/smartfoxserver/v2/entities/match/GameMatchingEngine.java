/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import com.smartfoxserver.v2.entities.Zone;
/*    */ import java.util.Collection;
/*    */ import java.util.List;
/*    */ 
/*    */ public class GameMatchingEngine
/*    */   implements IMatchingEngine
/*    */ {
/*    */   private final MatchingUtils matcher;
/*    */ 
/*    */   public GameMatchingEngine()
/*    */   {
/* 18 */     this.matcher = MatchingUtils.getInstance();
/*    */   }
/*    */ 
/*    */   public List<Room> findGames(MatchExpression conditions, Zone zone, int limit)
/*    */   {
/* 24 */     return findGames(conditions, zone, null, limit);
/*    */   }
/*    */ 
/*    */   public List<Room> findGames(MatchExpression conditions, Zone zone, String groupId, int limit)
/*    */   {
/* 30 */     if ((groupId != null) && (!zone.containsGroup(groupId))) {
/* 31 */       throw new IllegalArgumentException("Provided group is not available: " + groupId);
/*    */     }
/*    */ 
/* 34 */     List searchableRooms = groupId == null ? zone.getRoomList() : zone.getRoomListFromGroup(groupId);
/*    */ 
/* 36 */     return this.matcher.matchRooms(searchableRooms, conditions, limit);
/*    */   }
/*    */ 
/*    */   public List<Room> findGames(MatchExpression conditions, Zone zone, String groupId)
/*    */   {
/* 42 */     return findGames(conditions, zone, groupId, 2147483647);
/*    */   }
/*    */ 
/*    */   public List<Room> findGames(MatchExpression conditions, Zone zone)
/*    */   {
/* 48 */     return findGames(conditions, zone, null, 2147483647);
/*    */   }
/*    */ 
/*    */   public List<User> findPlayers(MatchExpression conditions, Zone zone, int limit)
/*    */   {
/* 54 */     return findPlayers(conditions, zone, null, limit);
/*    */   }
/*    */ 
/*    */   public List<User> findPlayers(MatchExpression conditions, Zone zone, Room room, int limit)
/*    */   {
/* 61 */     Collection searchableUsers = room == null ? zone.getUserList() : room.getUserList();
/*    */ 
/* 63 */     return this.matcher.matchUsers(searchableUsers, conditions, limit);
/*    */   }
/*    */ 
/*    */   public List<User> findPlayers(MatchExpression conditions, Zone zone, Room room)
/*    */   {
/* 69 */     return findPlayers(conditions, zone, room, 2147483647);
/*    */   }
/*    */ 
/*    */   public List<User> findPlayers(MatchExpression conditions, Zone zone)
/*    */   {
/* 75 */     return findPlayers(conditions, zone, null, 2147483647);
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.GameMatchingEngine
 * JD-Core Version:    0.6.0
 */
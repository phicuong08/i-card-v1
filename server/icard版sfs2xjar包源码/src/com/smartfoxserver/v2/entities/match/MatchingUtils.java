/*    */ package com.smartfoxserver.v2.entities.match;
/*    */ 
/*    */ import com.smartfoxserver.v2.entities.Room;
/*    */ import com.smartfoxserver.v2.entities.User;
/*    */ import java.util.ArrayList;
/*    */ import java.util.Collection;
/*    */ import java.util.List;
/*    */ 
/*    */ public class MatchingUtils
/*    */ {
/* 12 */   private static final MatchingUtils _instance = new MatchingUtils();
/*    */   private final ExpressionMatcher roomMatcher;
/*    */   private final ExpressionMatcher userMatcher;
/*    */ 
/*    */   private MatchingUtils()
/*    */   {
/* 21 */     this.roomMatcher = new VariablesMatcher();
/* 22 */     this.roomMatcher.setProxyVariableResolver(new RoomProxyVariableResolver());
/*    */ 
/* 24 */     this.userMatcher = new VariablesMatcher();
/* 25 */     this.userMatcher.setProxyVariableResolver(new UserProxyVariableMatcher());
/*    */   }
/*    */ 
/*    */   public static MatchingUtils getInstance()
/*    */   {
/* 30 */     return _instance;
/*    */   }
/*    */ 
/*    */   public boolean matchUser(User user, MatchExpression conditions)
/*    */   {
/* 35 */     return this.userMatcher.match(new EntityWithVariablesWrapper(user), conditions);
/*    */   }
/*    */ 
/*    */   public boolean matchRoom(Room room, MatchExpression conditions)
/*    */   {
/* 40 */     return this.roomMatcher.match(new EntityWithVariablesWrapper(room), conditions);
/*    */   }
/*    */ 
/*    */   public List<User> matchUsers(Collection<User> userList, MatchExpression conditions)
/*    */   {
/* 45 */     return matchUsers(userList, conditions, 2147483647);
/*    */   }
/*    */ 
/*    */   public List<User> matchUsers(Collection<User> userList, MatchExpression conditions, int limit)
/*    */   {
/* 50 */     if (limit <= 0) {
/* 51 */       limit = 2147483647;
/*    */     }
/* 53 */     List filteredUsers = new ArrayList();
/*    */ 
/* 55 */     for (User user : userList)
/*    */     {
/* 57 */       if (!matchUser(user, conditions))
/*    */         continue;
/* 59 */       if (filteredUsers.size() >= limit) break;
/* 60 */       filteredUsers.add(user);
/*    */     }
/*    */ 
/* 66 */     return filteredUsers;
/*    */   }
/*    */ 
/*    */   public List<Room> matchRooms(Collection<Room> roomList, MatchExpression conditions)
/*    */   {
/* 71 */     return matchRooms(roomList, conditions, 2147483647);
/*    */   }
/*    */ 
/*    */   public List<Room> matchRooms(Collection<Room> roomList, MatchExpression conditions, int limit)
/*    */   {
/* 76 */     if (limit <= 0) {
/* 77 */       limit = 2147483647;
/*    */     }
/* 79 */     List filteredRooms = new ArrayList();
/*    */ 
/* 81 */     for (Room room : roomList)
/*    */     {
/* 83 */       if (!matchRoom(room, conditions))
/*    */         continue;
/* 85 */       if (filteredRooms.size() >= limit) break;
/* 86 */       filteredRooms.add(room);
/*    */     }
/*    */ 
/* 92 */     return filteredRooms;
/*    */   }
/*    */ }

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.match.MatchingUtils
 * JD-Core Version:    0.6.0
 */
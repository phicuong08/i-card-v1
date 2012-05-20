package com.icard.user;

import java.util.HashMap;
import java.util.Map;



public class CardUserManager {
	private Map<Integer,CardUser> userMap = new HashMap<Integer,CardUser>();
	
	private static CardUserManager mInstance =null;
	
	private CardUserManager(){
	}
	
	public static CardUserManager getInstance(){
		if(mInstance == null){
			mInstance = new CardUserManager();
		}
		return mInstance;
	}
	
	public void AddUser(CardUser user){
		if(!userMap.containsKey(user.getId())){
			userMap.put(user.getId(), user);
		}
	}
	
	public void RemoveUser(int userId){
		if(userMap.containsKey(userId)){
			userMap.remove(userId);
		}
	}
	
	public CardUser GetUser(int userId){
		if(userMap.containsKey(userId)){
			return userMap.get(userId);
		}else{
			return null;
		}
	}
}

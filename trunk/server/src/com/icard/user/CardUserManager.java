package com.icard.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sfs2x.extensions.icard.main.ParentExtension;

import com.smartfoxserver.v2.entities.User;



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
	
	public List<User> GetSFSUserByCardUser(List<CardUser> cardUser){
		List<User> ret = new ArrayList<User>();
		for(CardUser card:cardUser){
			User user = ParentExtension.getInstance().getParentZone().getUserById(card.getId());
			ret.add(user);
		}
		return ret;
	}
}

package com.icard.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.icard.room.CardDesktop;
import com.icard.room.CardSite;

public class CardUser {
	private int Id;
	
	private CardSite site;
	
	//选中的卡组

	public CardUser(int Id){
		this.Id = Id;
		//模拟出30张牌和一个英雄
	}

	public int getId() {
		return Id;
	}

	//模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟

	//模拟出30张牌和一个英雄
	//模拟模拟模拟模拟模拟模拟模拟模拟endendendendendendendendendendendend
	
	//生成一个新的list


	
	public CardSite getSite() {
		return site;
	}
	
	public void siteUp(){
		if(site!=null){
			site.belongUserID=-1;
			site.userReadyState = CardSite.USER_READY_STATE_NOT_READY;
			site=null;
		}
	}
	
	public boolean siteDown(CardDesktop desktop){
		for(CardSite site:desktop.getSites()){
			if(site.belongUserID ==-1){
				this.site = site;
				this.site.belongUserID =Id;
				site.userReadyState = CardSite.USER_READY_STATE_NOT_READY;
				return true;
			}
		}
		return false;
	}
	
	
}

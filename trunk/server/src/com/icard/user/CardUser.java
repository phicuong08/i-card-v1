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
	
	//ѡ�еĿ���

	public CardUser(int Id){
		this.Id = Id;
		//ģ���30���ƺ�һ��Ӣ��
	}

	public int getId() {
		return Id;
	}

	//ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��

	//ģ���30���ƺ�һ��Ӣ��
	//ģ��ģ��ģ��ģ��ģ��ģ��ģ��ģ��endendendendendendendendendendendend
	
	//����һ���µ�list


	
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

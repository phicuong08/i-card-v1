package com.icard.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.icard.cards.BaseCard;
import com.icard.cards.cardInfo.CardInfo;
import com.icard.cards.cardInfo.CardInfoManager;
import com.icard.room.CardDesktop;
import com.icard.room.CardSite;

public class CardUser {
	private int Id;
	
	private CardSite site;
	
	//选中的卡组
	private List<BaseCard> selectCards = new ArrayList<BaseCard>();
	private BaseCard hero;
	
	public CardUser(int Id){
		this.Id = Id;
		//模拟出30张牌和一个英雄
		moniPaiYingxiong();
	}

	public int getId() {
		return Id;
	}

	//模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟模拟
	private CardInfo monigetRandomCardInfo(ArrayList<CardInfo> heroList){
		java.util.Random Random = new java.util.Random();
		int randomIndex = Random.nextInt(heroList.size());
		return heroList.get(randomIndex);
	}
	private BaseCard monigetHero(){
		ArrayList<CardInfo> heroList = new ArrayList<CardInfo>();
		CardInfoManager cardInfoManager = CardInfoManager.GetInstance();
		for(int id:cardInfoManager.getCardInfoMap().keySet()){
			CardInfo info = cardInfoManager.getCardInfoMap().get(id);
			if(info.isIsHero()){
				heroList.add(info);
			}
		}
		BaseCard baseCard = new BaseCard(monigetRandomCardInfo(heroList));
		return baseCard;
	}
	private List<BaseCard> moniget30Cards(){
		List<BaseCard> ret = new ArrayList<BaseCard>();
		ArrayList<CardInfo> cardList = new ArrayList<CardInfo>();
		CardInfoManager cardInfoManager = CardInfoManager.GetInstance();
		for(int id:cardInfoManager.getCardInfoMap().keySet()){
			CardInfo info = cardInfoManager.getCardInfoMap().get(id);
			if(!info.isIsHero()){
				cardList.add(info);
			}
		}
		for(int count =0;count <30;count++){
			BaseCard baseCard = new BaseCard(monigetRandomCardInfo(cardList));
			ret.add(baseCard);
		}
		
		return ret;
	}
	//模拟出30张牌和一个英雄
	private void moniPaiYingxiong(){
		hero = monigetHero();
		selectCards = moniget30Cards();
	}
	//模拟模拟模拟模拟模拟模拟模拟模拟endendendendendendendendendendendend
	
	//生成一个新的list
	public List<BaseCard> getSelectCards() {
		List<BaseCard> ret = new ArrayList<BaseCard>(selectCards);
		return ret;
	}

	public BaseCard getHero() {
		return hero;
	}

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

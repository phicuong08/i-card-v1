package com.icard.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.icard.user.CardUserManager;

 

public class CardDesktop {
	

	
	//����
	private CardUser roomOwner = null;	
	//��Ϸ��
	private CardUser gamePlayer =null;
	
	//�ۿ���
	private HashMap <Integer,CardUser>	watchers =null;
	
	private ArrayList<CardSite> sites =  new ArrayList<CardSite>();
		
	private java.util.Random Random = new java.util.Random();
	
	public CardDesktop(){
		sites.add(new CardSite());
		sites.add(new CardSite());
	}
	
	//��ʼ��Ϸ
	public void startGame(CardUser RoomOwner,CardUser Player,HashMap <Integer,CardUser>	watchers){
		this.roomOwner = RoomOwner;
		this.gamePlayer = Player;
		this.watchers = watchers;
		if(RefeshCard()==false){
			return;
		}
		
	}
	//ϴ��
	private boolean RefeshCard(){
		int cardRealIdIndex =0;
		for(CardSite site:sites){
			CardUser user = CardUserManager.getInstance().GetUser(site.belongUserID);
			if(user ==null){
				return false;
			}
			site.clear();
			site.Hero = user.getHero();
			site.Hero.setRealId(cardRealIdIndex);
			cardRealIdIndex++;
			List<BaseCard> cards = user.getSelectCards();
			while(cards.size()>0){
				int count = cards.size();
				int randomIndex = Random.nextInt(count);
				BaseCard card = cards.get(randomIndex);
				card.setRealId(cardRealIdIndex);
				site.CardBox.add(card);
				cards.remove(randomIndex);
				cardRealIdIndex++;
			}
		}
		return true;
	}
	public ArrayList<CardSite> getSites() {
		return sites;
	}
	
}

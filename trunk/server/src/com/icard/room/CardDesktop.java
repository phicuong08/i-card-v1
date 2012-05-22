package com.icard.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import sfs2x.extensions.icard.main.ParentExtension;
import sfs2x.extensions.icard.utils.Commands;

import com.icard.cards.BaseCard;
import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.entities.data.SFSObject;

 

public class CardDesktop {
	
	//����
	private CardUser roomOwner = null;	
		
	//��Ϸ�����е����
	private HashMap <Integer,CardUser> allPlayers = new HashMap <Integer,CardUser>();	
	
	//��Ϸ�����еĹۿ���
	private HashMap <Integer,CardUser>	watchers =null;
	
	private ArrayList<CardSite> sites =  new ArrayList<CardSite>();
		
	private java.util.Random Random = new java.util.Random();
	
	public CardDesktop(){
		//����֧��2����
		sites.add(new CardSite());
		sites.add(new CardSite());
	}
	
	//��ʼ��Ϸ
	public void startGame(CardUser RoomOwner,CardUser Player,HashMap <Integer,CardUser>	watchers){
		this.roomOwner = RoomOwner;
		allPlayers.put(RoomOwner.getId(), RoomOwner);
		allPlayers.put(Player.getId(), Player);
		this.watchers = watchers;
		if(RefeshCard()==false){
			return;
		}
		ISFSObject params = new SFSObject ();
		params.putInt("playerID", userId);
		params.putInt("state",userState);
		List<CardUser> cardUser = new ArrayList<CardUser>();
		cardUser.add(roomOwner);
		gamePlayer!=null){
			cardUser.add(gamePlayer);
		}
		cardUser.addAll(watchers.values());
		List<User> recipients = CardUserManager.getInstance().GetSFSUserByCardUser(cardUser);
		//����
		ParentExtension.getInstance().send(Commands.CMD_S2C_CLIENT_GAME_STATE_UPDATE, params, recipients);
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

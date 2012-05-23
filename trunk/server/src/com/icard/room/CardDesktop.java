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
import com.smartfoxserver.v2.entities.data.SFSArray;
import com.smartfoxserver.v2.entities.data.SFSObject;

 

public class CardDesktop {
	
	//房主
	private CardUser roomOwner = null;
	//房主的对手
	private CardUser player	   = null;

	
	//游戏中所有的玩家
	private HashMap <Integer,CardUser> allPlayers = new HashMap <Integer,CardUser>();
	//用于接收send数据用的sfx玩家
	private List<User> allSFSPlayer = null;
	private HashMap <Integer,User> allSFSPlayerMap = new HashMap <Integer,User>();
	
	//游戏中所有的观看者
	private HashMap <Integer,CardUser>	watchers =null;
	//用于接收send数据用的sfx观察者
	private List<User> allSFSWatchers = null;
	
	private ArrayList<CardSite> sites =  new ArrayList<CardSite>();
		
	private java.util.Random Random = new java.util.Random();
	
	public CardDesktop(){
		//现在支持2人玩
		sites.add(new CardSite());
		sites.add(new CardSite());
	}
	
	//开始游戏
	public void startGame(CardUser RoomOwner,CardUser Player,HashMap <Integer,CardUser>	watchers){
		this.roomOwner = RoomOwner;
		this.player = Player;
		allPlayers.put(RoomOwner.getId(), RoomOwner);
		allPlayers.put(Player.getId(), Player);
		this.watchers = watchers;
		if(RefeshCard()==false){
			return;
		}
		//设置用于接收send数据用的sfx玩家，sfx观察者
		allSFSPlayer = CardUserManager.getInstance().GetSFSUserByCardUser(new ArrayList<CardUser>(allPlayers.values()));
		for(User user:allSFSPlayer){
			allSFSPlayerMap.put(user.getId(), user);
		}
		allSFSWatchers = CardUserManager.getInstance().GetSFSUserByCardUser(new ArrayList<CardUser>(watchers.values()));
		
		//发送开始命令给玩家
		ISFSObject params = new SFSObject ();
		SFSArray  cards = new SFSArray  ();
		for(CardSite site :sites){
			List<BaseCard> pickedCards = site.pickCard(7);
			for(BaseCard pickedCard :pickedCards){
				ISFSObject card = new SFSObject ();
				card.putInt("playerID", site.belongUserID);
				card.putInt("realID", pickedCard.getRealId());
				card.putInt("cardID", pickedCard.getCardInfo().getId());
				cards.addSFSObject(card);
			}
		}
		params.putSFSArray("card", cards);
		params.putInt("me", roomOwner.getId());
		params.putInt("you", this.player.getId());
		ParentExtension.getInstance().send(Commands.CMD_S2C_GAME_START, params, this.allSFSPlayerMap.get(roomOwner.getId()));
		
		params.putInt("me", player.getId());
		params.putInt("you", this.roomOwner.getId());
		ParentExtension.getInstance().send(Commands.CMD_S2C_GAME_START, params, this.allSFSPlayerMap.get(player.getId()));
	}
	
	//洗牌
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

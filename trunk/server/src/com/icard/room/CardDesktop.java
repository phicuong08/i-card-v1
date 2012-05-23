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
	
	//����
	private CardUser roomOwner = null;
	//�����Ķ���
	private CardUser player	   = null;

	
	//��Ϸ�����е����
	private HashMap <Integer,CardUser> allPlayers = new HashMap <Integer,CardUser>();
	//���ڽ���send�����õ�sfx���
	private List<User> allSFSPlayer = null;
	private HashMap <Integer,User> allSFSPlayerMap = new HashMap <Integer,User>();
	
	//��Ϸ�����еĹۿ���
	private HashMap <Integer,CardUser>	watchers =null;
	//���ڽ���send�����õ�sfx�۲���
	private List<User> allSFSWatchers = null;
	
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
		this.player = Player;
		allPlayers.put(RoomOwner.getId(), RoomOwner);
		allPlayers.put(Player.getId(), Player);
		this.watchers = watchers;
		if(RefeshCard()==false){
			return;
		}
		//�������ڽ���send�����õ�sfx��ң�sfx�۲���
		allSFSPlayer = CardUserManager.getInstance().GetSFSUserByCardUser(new ArrayList<CardUser>(allPlayers.values()));
		for(User user:allSFSPlayer){
			allSFSPlayerMap.put(user.getId(), user);
		}
		allSFSWatchers = CardUserManager.getInstance().GetSFSUserByCardUser(new ArrayList<CardUser>(watchers.values()));
		
		//���Ϳ�ʼ��������
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

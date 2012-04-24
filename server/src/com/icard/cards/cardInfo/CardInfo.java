package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.List;

public final class CardInfo {
	private int Id = 0; // 牌的id，与数据库中的ID对应
	private int CountOfThisCard = 0; // 这种牌的全服务器数量

	private String Name = "";
	private int Colour = 0; // 所属的种族（盟军，英雄有效）
	private List<Integer> MatchColours = new ArrayList<Integer>(); // 匹配的种族（对技能，武器，物品有效）
	private int BaseCost = 0; // 最初始的上场花费（对盟军，技能有效）
	private int BaseAttack = 0; // 最初始的攻击力
	private int BaseLife = 0; // 最初始的生命

	public CardInfo(int Id, String Name, int Colour,
			List<Integer> MatchColours, int BaseCost, int BaseAttack,
			int BaseLife) {
		this.Id = Id;
		this.Name=Name;
		this.Colour=Colour;
		this.MatchColours = MatchColours;
		this.BaseCost=BaseCost;
		this.BaseAttack =BaseAttack;
		this.BaseLife =BaseLife;
	}

	public int getId() {
		return Id;
	}

	public int getCountOfThisCard() {
		return CountOfThisCard;
	}
	
	//增加此种牌的全服务器计数
	public void AddCountOfThisCard() {
		synchronized (this){
			CountOfThisCard++;
		}
	}
	
	//减少此种牌的全服务器计数
	public void DecCountOfThisCard() {
		synchronized (this){
			CountOfThisCard--;
		}
	}

	public String getName() {
		return Name;
	}

	public int getColour() {
		return Colour;
	}

	public List<Integer> getMatchColours() {
		return MatchColours;
	}

	public int getBaseCost() {
		return BaseCost;
	}

	public int getBaseAttack() {
		return BaseAttack;
	}

	public int getBaseLife() {
		return BaseLife;
	}
	
}

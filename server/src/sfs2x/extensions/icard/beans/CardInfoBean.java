package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.List;

public final class CardInfo {
	public static final int COLOR_ALL = 0;	//所有种族 
	public static final int COLOR_DPS = 1;  
	public static final int COLOR_TANK = 2;
	public static final int COLOR_HEALER = 3; 
	public static final int COLOR_OTHER = 4;
	
	public static final String color_all_str 	= "all";	//所有种族 
	public static final String color_dps_str 	= "dps";
	public static final String color_tank_str 	= "tank";
	public static final String color_healer_str= "healer";
	public static final String color_other_str = "other";
	
	private int Id = 0; // 牌的id
	private boolean IsHero	= false; //是否英雄
	private String Name = "";
	private int Colour = 0; // 所属的种族（盟军，英雄有效）
	private List<Integer> MatchColours = null; // 匹配的种族（对技能，武器，物品有效）
	private int BaseCost = 0; // 最初始的上场花费（对盟军，技能，武器有效）
	private int BaseAttack = 0; // 最初始的攻击力
	private int BaseLife = 0; // 最初始的生命
	private int BaseDefence = 0;//最初的防御
	private int BaseUseOnceCost = 0; // 最初始的使用一次花费（对武器有效）
	
	private int CountOfThisCard = 0; // 这种牌的全服务器数量

	public CardInfo(int Id,boolean IsHero, String Name, int Colour,
			List<Integer> MatchColours, int BaseCost, int BaseAttack,
			int BaseLife,int BaseDefence,int BaseUseOnceCost) {
		this.Id = Id;
		this.Name=Name;
		this.Colour=Colour;
		this.MatchColours = MatchColours;
		this.BaseCost=BaseCost;
		this.BaseAttack =BaseAttack;
		this.BaseLife =BaseLife;
		this.IsHero = IsHero;
		this.BaseDefence = BaseDefence;
		this.BaseUseOnceCost = BaseUseOnceCost;
	}

	public static int getColorInt(String Color){
		int ret =-1;
		if(Color.endsWith(color_all_str)){
			ret = COLOR_ALL;
		}
		if(Color.endsWith(color_dps_str )){
			ret = COLOR_DPS ;
		}
		if(Color.endsWith(color_tank_str )){
			ret = COLOR_TANK ;
		}
		if(Color.endsWith(color_healer_str)){
			ret = COLOR_HEALER ;
		}
		if(Color.endsWith(color_other_str )){
			ret = COLOR_OTHER  ;
		}
		return ret;
	}
	public static ArrayList<Integer> getColorIntList(String ColorList){
		ArrayList<Integer> ret = new ArrayList<Integer>();
		for(String colorStr :ColorList.split(",")){
			ret.add(getColorInt(colorStr));
		}
		return ret;
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

	public int getBaseDefence() {
		return BaseDefence;
	}

	public boolean isIsHero() {
		return IsHero;
	}

	public int getBaseUseOnceCost() {
		return BaseUseOnceCost;
	}
	
}

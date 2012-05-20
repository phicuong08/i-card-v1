package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.List;

public final class CardInfo {
	public static final int COLOR_ALL = 0;	//�������� 
	public static final int COLOR_DPS = 1;  
	public static final int COLOR_TANK = 2;
	public static final int COLOR_HEALER = 3; 
	public static final int COLOR_OTHER = 4;
	
	public static final String color_all_str 	= "all";	//�������� 
	public static final String color_dps_str 	= "dps";
	public static final String color_tank_str 	= "tank";
	public static final String color_healer_str= "healer";
	public static final String color_other_str = "other";
	
	private int Id = 0; // �Ƶ�id
	private boolean IsHero	= false; //�Ƿ�Ӣ��
	private String Name = "";
	private int Colour = 0; // ���������壨�˾���Ӣ����Ч��
	private List<Integer> MatchColours = null; // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
	private int BaseCost = 0; // ���ʼ���ϳ����ѣ����˾������ܣ�������Ч��
	private int BaseAttack = 0; // ���ʼ�Ĺ�����
	private int BaseLife = 0; // ���ʼ������
	private int BaseDefence = 0;//����ķ���
	private int BaseUseOnceCost = 0; // ���ʼ��ʹ��һ�λ��ѣ���������Ч��
	
	private int CountOfThisCard = 0; // �����Ƶ�ȫ����������

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
	
	//���Ӵ����Ƶ�ȫ����������
	public void AddCountOfThisCard() {
		synchronized (this){
			CountOfThisCard++;
		}
	}
	
	//���ٴ����Ƶ�ȫ����������
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

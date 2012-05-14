package com.icard.cards.cardInfo;

import java.util.ArrayList;
import java.util.List;

public final class CardInfo {
	public static final int COLOR_ALL = 0;	//�������� 
	public static final int COLOR_DPS = 1;  
	public static final int COLOR_TANK = 2;
	public static final int COLOR_HEALER = 3; 
	public static final int COLOR_OTHER = 4;
	
	private int Id = 0; // �Ƶ�id
	private int CountOfThisCard = 0; // �����Ƶ�ȫ����������

	private String Name = "";
	private int Colour = 0; // ���������壨�˾���Ӣ����Ч��
	private List<Integer> MatchColours = new ArrayList<Integer>(); // ƥ������壨�Լ��ܣ���������Ʒ��Ч��
	private int BaseCost = 0; // ���ʼ���ϳ����ѣ����˾���������Ч��
	private int BaseAttack = 0; // ���ʼ�Ĺ�����
	private int BaseLife = 0; // ���ʼ������

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
	
}

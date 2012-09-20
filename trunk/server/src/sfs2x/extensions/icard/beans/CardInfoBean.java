package sfs2x.extensions.icard.beans;

public final class CardInfoBean {

	public static final int HERO = 0;
	public static final int ALLY = 1;
	public static final int WEAPON = 2;
	public static final int ARMOR = 3;
	public static final int ABILITY = 4;
	public static final int QUEST = 5;
	public static final int SUPPORT = 6;
		
	private int _cardID = 0; // �Ƶ�id
	
	private int _BaseCost = 0; // ���ʼ���ϳ����ѣ����˾������ܣ�������Ч��
	private int _BaseAttack = 0; // ���ʼ�Ĺ�����
	private int _BaseHp = 0; // ���ʼ������
	private int _BaseDefence = 0;//����ķ���
	private int _BaseUseCost = 0; // ���ʼ��ʹ��һ�λ��ѣ���������Ч��
	
	public CardInfoBean(int cardID,int BaseCost, int BaseAttack,
			int BaseHp,int BaseDefence,int BaseUseCost) {
		this._cardID = cardID;
		this._BaseCost=BaseCost;
		this._BaseAttack =BaseAttack;
		this._BaseHp =BaseHp;
		this._BaseDefence = BaseDefence;
		this._BaseUseCost = BaseUseCost;
	}
	
	public int getCardID() {
		return _cardID;
	}

	//���ٴ����Ƶ�ȫ����������
//	public void DecCountOfThisCard() {
//		synchronized (this){
//			CountOfThisCard--;
//		}
//	}

	public int getBaseCost() {
		return _BaseCost;
	}

	public int getBaseAttack() {
		return _BaseAttack;
	}

	public int getBaseHp() {
		return _BaseHp;
	}

	public int getBaseDefence() {
		return _BaseDefence;
	}

	public int getBaseUseCost() {
		return _BaseUseCost;
	}
	public int getType(){
				int ret=99;
				switch(_cardID/1000)
				{
				case 20:
					ret = HERO;
					break;
				case 21:
				case 22:
				case 23:
					ret = ALLY;
					break;
				case 30:
					ret = WEAPON;
					break;
				case 31:
					ret = ARMOR;
					break;	
				case 40:
					ret = QUEST;
					break;
				case 50:
					ret = ABILITY;
					break;
				case 60:
					ret = SUPPORT;
					break;
			}
			return ret;
		}
}

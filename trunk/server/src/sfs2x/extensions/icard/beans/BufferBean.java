package sfs2x.extensions.icard.beans;

/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferBean
{
	
	public static final int TYPE_RESET_UNABLE=5; //��������
	public static final int TYPE_USECOST_ADD=6; //ʹ�÷���
	
	public static final int WORK_ALWAYS=1;   //��������
	public static final int WORK_MYLOOP=2;   //�ҷ��غϼ���
	
	private int _id;
	private CardAbilityBean _ability;
	public BufferBean(CardAbilityBean ability,int realID){
		_ability = ability;
		_id = realID;
	}
	public CardAbilityBean getAbility(){
		return _ability;
	}
	public int getWhen(){
		return _ability.getWhen();
	}
	public int getID(){
		return _id;
	}
	public int getVal(){
		return _ability.getVal();
	}
	public int getSrc(){
		return _id;
	}
	public int getType(){
		return _ability.getType();
	}
}

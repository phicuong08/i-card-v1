package sfs2x.extensions.icard.beans;

/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferBean
{
	
	public static final int TYPE_RESET_UNABLE=5; //不可重置
	public static final int TYPE_USECOST_ADD=6; //使用费用
	
	public static final int WORK_ALWAYS=1;   //持续激活
	public static final int WORK_MYLOOP=2;   //我方回合激活
	
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

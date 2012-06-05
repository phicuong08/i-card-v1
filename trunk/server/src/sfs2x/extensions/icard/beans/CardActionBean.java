package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.utils.Constants;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionBean
{
	public static final int DO_CARD_2_RES;        //卡到资源
	public static final int DO_CARD_2_FIGHTSLOT;  //卡到战斗区
	public static final int DO_CARD_2_EQUIPSLOT;  //卡到装备
	public static final int DO_CARD_2_ATK;        //卡进攻 
	public static final int DO_CARD_2_DEF;        //卡护卫
	public static final int DO_CARD_2_USE;        //任务，技能卡使用
	public static final int DO_CARD_2_TURN;       //英雄卡翻转
	
	private int _type;
	private int _src;
	private Vector<Integer> _des;
	public CardActionBean(int src,int type,Vector<Integer> des)
	{
		_src = src;
		_type = type;
		_des = des;
	}
	public int getType(){
		return _type;
	}
	public int getSrc(){
		return _src;
	}
	public Vector<Integer> getDes(){
		return _des;
	}
}

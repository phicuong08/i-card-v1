package sfs2x.extensions.icard.beans;

import java.util.Vector;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionBean
{
	public static final int DO_CARD_2_RES=1;        //卡到资源
	public static final int DO_CARD_2_FIGHTSLOT=2;  //卡到战斗区
	public static final int DO_CARD_2_EQUIPSLOT=3;  //卡到装备
	public static final int DO_CARD_2_ATK=4;        //卡进攻 
	public static final int DO_CARD_2_GUIDE=5;      //卡护卫
	public static final int DO_CARD_2_USE=6;        //任务，技能卡使用
	public static final int DO_CARD_2_TURN=7;       //英雄卡翻转
	public static final int DO_WEAPON_2_USE=8;        //武器使用
	public static final int DO_EQUIP_2_USE=9;        //装备使用
	public static final int DO_CARD_2_DEF=10;
	
	private int _type;
	private int _src;
	private int _playerID;
	private Vector<Integer> _des;
	public CardActionBean(int src,int playerID,int type,Vector<Integer> des)
	{
		_src = src;
		_playerID = playerID;
		_type = type;
		_des = des;
	}
	public int getPlayerID(){
		return _playerID;
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

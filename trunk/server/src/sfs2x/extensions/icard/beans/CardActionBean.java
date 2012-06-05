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
	public static final int DO_CARD_2_RES;        //������Դ
	public static final int DO_CARD_2_FIGHTSLOT;  //����ս����
	public static final int DO_CARD_2_EQUIPSLOT;  //����װ��
	public static final int DO_CARD_2_ATK;        //������ 
	public static final int DO_CARD_2_DEF;        //������
	public static final int DO_CARD_2_USE;        //���񣬼��ܿ�ʹ��
	public static final int DO_CARD_2_TURN;       //Ӣ�ۿ���ת
	
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

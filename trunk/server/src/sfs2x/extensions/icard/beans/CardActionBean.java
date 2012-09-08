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
	public static final int DO_FIGHT_CARD =1;      	//�˾���װ������ս����,ʹ�ó���������
	public static final int DO_ENTER_CARD =2;      	//�˾���װ������ս����
	public static final int DO_PLAY_RES_CARD =3;    //����Դ
	public static final int DO_USE_POWER =4;      	//ʹ�ÿ�������
	public static final int DO_COMPLETE_QUEST=5; 	//������
	public static final int DO_PLACE_RESOURCE=6; 	//����Դ
	public static final int DO_PROPOSE_COMBAT=7; 	//����ս��
	
	public static final int DO_CARD_2_EQUIPSLOT=3;  //����װ��
	public static final int DO_CARD_2_GUIDE=5;      //������
	public static final int DO_CARD_2_TASK=6;        //����ʹ��
	public static final int DO_CARD_2_TURN=7;       //Ӣ�ۿ���ת
//	public static final int DO_WEAPON_2_USE=8;        //����ʹ��
//	public static final int DO_EQUIP_2_USE=9;        //װ��ʹ��
	public static final int DO_CARD_2_DEF=10;
	public static final int DO_ABILITY_2_OP=11;
	
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

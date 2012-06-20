package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.utils.Constants;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardAbilityBean
{
	public static final int WHEN_NULL=0;
	public static final int WHEN_USE =1; //����,ʹ�� 
	public static final int WHEN_ALL =2; //����
	public static final int WHEN_ENTER =3; //����
	public static final int WHEN_ATK =4;   //����
	public static final int WHEN_ATK_SIDE =5; //�������õз�
	public static final int WHEN_ATK_HERO_DAMAGE =6; //��Ӣ������˺�
	public static final int WHEN_ATK_DAMAGE =7;  //�Եз�����˺�
	public static final int WHEN_MY_LOOP_BEGIN =8; //�ҷ��غϿ�ʼʱ
	public static final int WHEN_USE_SKILL =9; //ʹ�ü���
	public static final int WHEN_DEAD =10; //�Ʊ�����ʱ
	public static final int WHEN_DEF_DEAD =11; //�Ʒ���������ʱ
	public static final int WHEN_ATKED =12; //�ܵ�����
	public static final int WHEN_USE_WEAPON=13;//ʹ������
	public static final int WHEN_RESET=14;     //����ʱ
	public static final int WHEN_SIDE=15;      //����ʱ
	
	public static final int BUF_ATK_UNABLE             =1;  //�޷�����
	public static final int BUF_ATK_ADD                =2;  //����������
	public static final int BUF_ATK_DIST               =3;  //Զ��
	public static final int BUF_DAMAGE_UNSTOP          =4;  //�˺����ɷ�ֹ
	public static final int BUF_DEF_UNABLE             =5;  //�޷�����
	public static final int BUF_DIST_WEAPON_ATK_ADD    =6;  //Զ����������������
	public static final int BUF_GUIDE                  =7;  //��������
	public static final int BUF_HIDDEN                 =8;  //����
	public static final int BUF_POINT_UNABLE           =9;  //����ָ��
	public static final int BUF_SHIELD                 =10; //�����˺�
	public static final int BUF_UNABLE                 =11; //�޷�ִ��
	public static final int BUF_COST_ADD               =12; //��������
	public static final int BUF_DEF_ADD                =13; //
	public static final int BUF_SIDE                   =14; //
	public static final int BUF_HEAL                   =15; //
	public static final int BUF_CURE                   =16; //�ܵ�����ʱ�˺�����
	public static final int BUF_LATENT                 =17; //Ǳ��
	
	public static final int DO_NULL           =100;  //
	public static final int DO_KILL_SKILL     =101;  //������
	public static final int DO_DEAD           =102;  //������
	public static final int DO_KILL_WEAPON    =103;  //��������
	public static final int DO_RESET_HERO     =104;  //����Ӣ��
	public static final int DO_RESET_WEAPON   =105;  //��������
	public static final int DO_DRAW_CARD      =106;  //ץ��
	public static final int DO_BREAK_SKILL    =107;  //��ϼ���
	public static final int DO_DROP_RES       =108;  //����Դ
	public static final int DO_DROP_HAND_CARD =109;  //������
	public static final int DO_HEAL           =110;  //����
	public static final int DO_DAMAGE         =111;  //����
	public static final int DO_ATK_SIDE_ADD   =112;  //��������ʱ���˺�

	public static final int OP_OR             =1;
	public static final int OP_AND            =2;
	
	private int _id;
	private int _when;
	private int _type;
	private int _val;
	private int _op;
	
	public CardAbilityBean(int id,int when,int type,int val,int op){
		_id = id;
		_when = when;
		_type = type;
		_val = val;
		_op = op;
	}
	public int getID(){
		return _id;
	}
	public int getWhen(){
		return _when;
	}
	public int getType(){
		return _type;
	}
	public int getVal(){
		return _val;
	}
	public int getOP(){
		return _op;
	}
}

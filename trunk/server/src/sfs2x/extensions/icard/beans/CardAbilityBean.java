package sfs2x.extensions.icard.beans;

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
	public static final int WHEN_ATK =4;   //����
	public static final int WHEN_ATKED =5; //�ܵ�����
	public static final int WHEN_ATK_DAMAGE =6;  //�Եз�����˺�
	public static final int WHEN_ENTER =7; //����
	public static final int WHEN_DEAD =8; //�Ʊ�����ʱ
	public static final int WHEN_DEF_DEAD =9; //�Ʒ���������ʱ
	public static final int WHEN_USE_SKILL =11; //ʹ�ü���
	public static final int WHEN_SACRIFICE=12;      //����ʱ	
	public static final int WHEN_MY_LOOP_BEGIN=13;
	public static final int WHEN_MY_LOOP_END=14;
	public static final int WHEN_LOOP_BEGIN=15;   //�غϿ�ʼ
	public static final int WHEN_LOOP_END=16;	  //�غϽ���	
	
	public static final int BUF_ATK_DIST          =1;   //Զ��
	public static final int BUF_ATK_WITH_EQUIP    =2;   //ÿװ���򹥻�����
	public static final int BUF_ATK_ADD           =3;   //����ʱ����������

	public static final int BUF_ATK_UNABLE        =5;   //�޷�����
	public static final int BUF_UNABLE_ATKED      =6;   //�޷�������
	
	public static final int BUF_CURE              =10;   //�ܵ�����ʱ�˺�����
	public static final int BUF_DAMAGE_UNSTOP     =11;   //�˺����ɷ�ֹ
	public static final int BUF_GUIDE             =12;   //��������
	public static final int BUF_HEAL              =13;   //����
	public static final int BUF_HIDDEN            =14;   //����
	public static final int BUF_HP_WITH_EQUIP     =15;  //ÿװ������������
	public static final int BUF_LATENT            =16;  //Ǳ��
	public static final int BUF_SHIELD            =17;  //�����˺�
	public static final int BUF_SIDE              =18;  //����
	public static final int BUF_STRIKE_COST_ADD   =19;  //���������������
	public static final int BUF_STRIKE_DAMAGE_ADD =20;  //��������˺�����
	public static final int BUF_POINT_UNABLE      =21;  //����ָ��
	public static final int BUF_DEF_ADD           =22;   //
	public static final int BUF_DEF_UNABLE        =23;  //�޷�����
	public static final int BUF_AT_ONCE           =24;  //˲��
	public static final int BUF_CAST_DAMAGE_ADD   =25;  //ʩ���˺�����
	public static final int BUF_MAX               =99;  //
	
	public static final int WHICH_NULL                 =0;  
	public static final int WHICH_MY                   =1;  //�ҷ�
	public static final int WHICH_MYHERO               =2;  //�ҷ�Ӣ��
	public static final int WHICH_MYSOLDIER            =3;  //�ҷ��˾� 
	public static final int WHICH_MYWEAPON             =4;  //�ҷ�����
	public static final int WHICH_YOUR                 =5;  //�з�
	public static final int WHICH_YOURHERO             =6;  //�з�Ӣ��
	public static final int WHICH_YOURSOLDIER         =7;  //�з��˾�
	public static final int WHICH_YOURWEAPON           =8;  //�з�����
	public static final int WHICH_SKILL                =9;  //���� 
	public static final int WHICH_DES                  =10; //Ŀ��
	public static final int WHICH_SRC                  =11; //Դ
	public static final int WHICH_I                    =12; //�Լ�
	public static final int WHICH_SOLDIER              =13; //
	public static final int WHICH_IU                   =14; //˫��
	public static final int WHICH_HERO                 =15; //
	public static final int WHICH_U                    =16; //
	public static final int WHICH_DES_HERO             =17; //Ŀ��


	public static final int DO_NULL                 =100;  //
	public static final int DO_ATK_SIDE_ADD         =101;  //��������ʱ���˺�
	public static final int DO_REMOVE_SKILL         =102;  //�Ƴ�����
	public static final int DO_REMOVE_GOOD_SKILL    =103;  //�Ƴ����漼��
	public static final int DO_REMOVE_BAD_SKILL     =104;  //�Ƴ��к�����
	public static final int DO_DROP_HAND_CARD       =105;  //������
	public static final int DO_DRAW_HAND_CARD       =106;  //ץ��
	public static final int DO_DROP_RES             =107;  //����Դ
	public static final int DO_DAMAGE               =108;  //�˺�
	public static final int DO_HEAL                 =109;  //����
	public static final int DO_KILL                 =110;  //����
	public static final int DO_KILL_COST_UP         =111;  //������ô���
	public static final int DO_KILL_COST_DOWN       =112;  //�������С��
	public static final int DO_RESET                =113;  //����
	public static final int DO_SIDE                 =114;  //����
	public static final int DO_ADD_ATK_INDICATE     =115;

	public static final int OP_OR             =1;
	public static final int OP_AND            =2;
	
	public static final int LOOP_ONE          =1;
	public static final int LOOP_ALL          =2;
	public static final int LOOP_MY           =3;
	
	private int _id;
	private int _when;
	private int _which;
	private int _type;
	private int _val;
	private int _op;
	private int _loopNum;
	private int _targetNum;

	public CardAbilityBean(int id,int when,int which,int type,int val,int op,int loopnum,int tarNum){
		_id = id;
		_when = when;
		_which = which;
		_type = type;
		_val = val;
		_op = op;
		_loopNum = loopnum;
		_targetNum=tarNum;
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
	public boolean getIsFriendly(){
		if(_type==DO_HEAL || _type==DO_RESET)
			return true;
		else
			return false;
		
	}
	public int getOP(){
		return _op;
	}
	public int getLoopNum(){
		return _loopNum;
	}
	public int getTargetNum(){
		return _targetNum;
	}
	public boolean IsRangeTarget(){
		return (_targetNum>=999);
	}
	public int getWhich(){
		return _which;
	}
	public boolean IsAttach(){
		return (_type <= BUF_MAX && _loopNum>=999);
	}
	public boolean IsBuf(){
		return (_type <= BUF_MAX && _loopNum<999);
	}

	public boolean IsGoodBuf(){
		if(IsBuf()==false)
			return false;
		boolean ret = false;
		switch(_type){
		case BUF_GUIDE:
		case BUF_HIDDEN:
		case BUF_LATENT:
		case BUF_SHIELD:
		case BUF_POINT_UNABLE:
		case BUF_AT_ONCE:
			ret = true;
			break;
		case BUF_HEAL:
			ret = (_val>0)? true:false;
			break;
		}
		return ret;
	}
	public boolean IsWhenMatch(int when){
		if(_when==WHEN_ALL)
			return true;
		if(_when==when)
			return true;
		boolean ret = false;
		switch(when){
		case WHEN_MY_LOOP_BEGIN:
			if(_when==WHEN_LOOP_BEGIN)
				ret = true;
			break;
		case WHEN_MY_LOOP_END:
			if(_when==WHEN_LOOP_END)
				ret = true;
			break; 
		
		}
		return ret;
	}
	public boolean IsWhichMatch(int which){
		if(_which==which)
			return true;
		boolean ret = false;
		switch(which){
		case WHICH_MYHERO:
			if(_which == WHICH_HERO|| _which==WHICH_MY)
				ret = true;
			break;
		case WHICH_MYSOLDIER:
			if(_which == WHICH_SOLDIER|| _which==WHICH_MY)
				ret = true;
			break;
		case WHICH_YOURHERO:
			if(_which == WHICH_HERO|| _which==WHICH_YOUR)
				ret = true;
			break;
		case WHICH_YOURSOLDIER:
			if(_which == WHICH_SOLDIER || _which==WHICH_YOUR)
				ret = true;
			break;
		}
		return ret;
	}
}


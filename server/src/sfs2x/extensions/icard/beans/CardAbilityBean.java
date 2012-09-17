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
	public static final int WHEN_USE =1; //横置,使用 
	public static final int WHEN_ALL =2; //持续
	public static final int WHEN_ATK =4;   //进攻
	public static final int WHEN_ATKED =5; //受到攻击
	public static final int WHEN_ATK_DAMAGE =6;  //对敌方造成伤害
	public static final int WHEN_ENTER =7; //进场
	public static final int WHEN_DEAD =8; //牌被消灭时
	public static final int WHEN_DEF_DEAD =9; //牌防御被消灭时
	public static final int WHEN_USE_SKILL =11; //使用技能
	public static final int WHEN_SACRIFICE=12;      //牺牲时	
	public static final int WHEN_MY_LOOP_BEGIN=13;
	public static final int WHEN_MY_LOOP_END=14;
	
	public static final int BUF_ATK_DIST          =1;   //远程
	public static final int BUF_ATK_WITH_EQUIP    =2;   //每装备则攻击增加
	public static final int BUF_ATK_ADD           =3;   //攻击力增加
	public static final int BUF_ATK_UNABLE        =4;   //无法攻击
	public static final int BUF_CURE              =5;   //受到攻击时伤害增加
	public static final int BUF_DAMAGE_UNSTOP     =6;   //伤害不可防止
	public static final int BUF_GUIDE             =7;   //护卫能力
	public static final int BUF_HEAL              =8;   //治疗
	public static final int BUF_HIDDEN            =9;   //隐遁
	public static final int BUF_HP_WITH_EQUIP     =10;  //每装备则生命增加
	public static final int BUF_LATENT            =11;  //潜行
	public static final int BUF_SHIELD            =12;  //吸收伤害
	public static final int BUF_SIDE              =13;  //横置
	public static final int BUF_STRIKE_COST_ADD   =14;  //武器打击费用增加
	public static final int BUF_STRIKE_DAMAGE_ADD =15;  //武器打击伤害增加
	public static final int BUF_POINT_UNABLE      =16;  //不可指定
	public static final int BUF_DEF_ADD           =17;   //
	public static final int BUF_DEF_UNABLE        =18;  //无法防御
	public static final int BUF_AT_ONCE           =19;  //瞬发
	public static final int BUF_MAX               =99;  //
	
	public static final int WHICH_NULL                 =0;  
	public static final int WHICH_MY                   =1;  //我方
	public static final int WHICH_MYHERO               =2;  //我方英雄
	public static final int WHICH_MYSOLDIER            =3;  //我方盟军 
	public static final int WHICH_MYWEAPON             =4;  //我方武器
	public static final int WHICH_YOUR                 =5;  //敌方
	public static final int WHICH_YOURHERO             =6;  //敌方英雄
	public static final int WHICH_YOURSOLDIER          =7;  //敌方盟军
	public static final int WHICH_YOURWEAPON           =8;  //敌方武器
	public static final int WHICH_SKILL                =9;  //技能 
	public static final int WHICH_DES                  =10; //目标
	public static final int WHICH_SRC                  =11; //源
	public static final int WHICH_I                    =12; //自己


	public static final int DO_NULL                 =100;  //
	public static final int DO_ATK_SIDE_ADD         =101;  //攻击横置时加伤害
	public static final int DO_BREAK_SKILL          =102;  //打断技能
	public static final int DO_DROP_HAND_CARD       =103;  //弃手牌
	public static final int DO_DRAW_HAND_CARD       =104;  //抓牌
	public static final int DO_DROP_RES             =105;  //弃资源
	public static final int DO_DAMAGE               =106;  //伤害
	public static final int DO_HEAL                 =107;  //治疗
	public static final int DO_KILL                 =108;  //消灭
	public static final int DO_KILL_COST_UP         =109;  //消灭费用大于
	public static final int DO_KILL_COST_DOWN       =110;  //消灭费用小于
	public static final int DO_RESET                =111;  //重置
	public static final int DO_SIDE                 =112;  //横置

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
	private int _loopType;
	private int _targetNum;

	public CardAbilityBean(int id,int when,int which,int type,int val,int op,int loopType,int tarNum){
		_id = id;
		_when = when;
		_which = which;
		_type = type;
		_val = val;
		_op = op;
		_loopType = loopType;
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
	public int getLoopType(){
		return _loopType;
	}
	public int getTargetNum(){
		return _targetNum;
	}
	public int getWhich(){
		return _which;
	}
	public boolean IsBuf(){
		return (_type <= BUF_MAX);
	}
	public boolean IsWhenMatch(int when){
		return (_when==when || _when==WHEN_ALL);
	}
	public boolean IsWhichMatch(int which){
		boolean ret = false;
		switch(which){
		case WHICH_MYHERO:
			if(_which == WHICH_MYHERO ||
				_which == WHICH_MY)
				ret = true;
			break;
		case WHICH_MYSOLDIER:
			if(_which == WHICH_MYSOLDIER ||
			_which == WHICH_MY)
				ret = true;
			break;
		case WHICH_MYWEAPON:
			if(_which == WHICH_MYWEAPON)
				ret = true;
			break;
		case WHICH_YOURHERO:
			if(_which == WHICH_YOURHERO ||
			_which == WHICH_YOUR)
			ret = true;
			break;
		case WHICH_YOURSOLDIER:
			if(_which == WHICH_YOURSOLDIER ||
			_which == WHICH_YOUR)
				ret = true;
			break;
		case WHICH_YOURWEAPON:
			if(_which == WHICH_YOURWEAPON)
				ret = true;
			break;
		}
		return ret;
	}
}


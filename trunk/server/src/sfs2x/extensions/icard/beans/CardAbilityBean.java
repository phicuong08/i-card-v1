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
	public static final int WHEN_USE =1; //横置,使用 
	public static final int WHEN_ALL =2; //持续
	public static final int WHEN_ENTER =3; //进场
	public static final int WHEN_ATK =4;   //进攻
	public static final int WHEN_ATK_SIDE =5; //进攻横置敌方
	public static final int WHEN_ATK_HERO_DAMAGE =6; //对英雄造成伤害
	public static final int WHEN_ATK_DAMAGE =7;  //对敌方造成伤害
	public static final int WHEN_MY_LOOP_BEGIN =8; //我方回合开始时
	public static final int WHEN_USE_SKILL =9; //使用技能
	public static final int WHEN_DEAD =10; //牌被消灭时
	public static final int WHEN_DEF_DEAD =11; //牌防御被消灭时
	public static final int WHEN_ATKED =12; //受到攻击
	public static final int WHEN_USE_WEAPON=13;//使用武器
	public static final int WHEN_RESET=14;     //重置时
	public static final int WHEN_SIDE=15;      //横置时
	
	public static final int BUF_ATK_UNABLE             =1;  //无法攻击
	public static final int BUF_ATK_ADD                =2;  //攻击力增加
	public static final int BUF_ATK_DIST               =3;  //远程
	public static final int BUF_DAMAGE_UNSTOP          =4;  //伤害不可防止
	public static final int BUF_DEF_UNABLE             =5;  //无法防御
	public static final int BUF_DIST_WEAPON_ATK_ADD    =6;  //远程武器攻击力增加
	public static final int BUF_GUIDE                  =7;  //护卫能力
	public static final int BUF_HIDDEN                 =8;  //隐遁
	public static final int BUF_POINT_UNABLE           =9;  //不可指定
	public static final int BUF_SHIELD                 =10; //吸收伤害
	public static final int BUF_UNABLE                 =11; //无法执行
	public static final int BUF_COST_ADD               =12; //费用增加
	public static final int BUF_DEF_ADD                =13; //
	public static final int BUF_SIDE                   =14; //
	public static final int BUF_HEAL                   =15; //
	public static final int BUF_CURE                   =16; //受到攻击时伤害增加
	public static final int BUF_LATENT                 =17; //潜行
	
	public static final int DO_NULL           =100;  //
	public static final int DO_KILL_SKILL     =101;  //消灭技能
	public static final int DO_DEAD           =102;  //消灭牌
	public static final int DO_KILL_WEAPON    =103;  //消灭武器
	public static final int DO_RESET_HERO     =104;  //重置英雄
	public static final int DO_RESET_WEAPON   =105;  //重置武器
	public static final int DO_DRAW_CARD      =106;  //抓牌
	public static final int DO_BREAK_SKILL    =107;  //打断技能
	public static final int DO_DROP_RES       =108;  //弃资源
	public static final int DO_DROP_HAND_CARD =109;  //弃手牌
	public static final int DO_HEAL           =110;  //治疗
	public static final int DO_DAMAGE         =111;  //治疗
	public static final int DO_ATK_SIDE_ADD   =112;  //攻击横置时加伤害

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

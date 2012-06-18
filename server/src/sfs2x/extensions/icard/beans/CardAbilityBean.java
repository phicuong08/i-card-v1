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
	public CardAbilityBean(){

	}

}

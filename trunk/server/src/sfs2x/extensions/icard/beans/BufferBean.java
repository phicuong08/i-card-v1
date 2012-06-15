package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.utils.Constants;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferBean
{
	public static final int TYPE_ATK_ADD=1;  //增加攻击力
	public static final int TYPE_DEF_ADD=2;  //增加防御值
	public static final int TYPE_GUIDE_ABLE=3; //可护卫
	public static final int TYPE_ATK_UNABLE=4; //不可攻击
	public static final int TYPE_RESET_UNABLE=5; //不可重置
	public static final int TYPE_USECOST_ADD=6; //使用费用
	public static final int TYPE_REMOTE=7; //远程
	public static final int TYPE_HIDDEN=8; //潜行
	public static final int TYPE_POINT_UNABLE=9; //不可被指定
	
	public static final int WORK_ALWAYS=1;   //持续激活
	public static final int WORK_MYLOOP=2;   //我方回合激活
	
	
	private int _loopNum=1;  //持续时间
	private int _workType;   
	private int _srcID;
	public BufferBean()
	{
	}
	

}

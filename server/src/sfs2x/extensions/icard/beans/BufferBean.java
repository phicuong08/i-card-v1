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
	
	public static final int TYPE_RESET_UNABLE=5; //不可重置
	public static final int TYPE_USECOST_ADD=6; //使用费用
	
	public static final int WORK_ALWAYS=1;   //持续激活
	public static final int WORK_MYLOOP=2;   //我方回合激活
	
	private int _id;
	private int _loopNum=1;  //持续时间
	private int _workType;   
	private int _srcID;
	private int _val;
	public BufferBean(int id,int type,int src,int val,int loopNum){
		_id = id;
		_workType = type;
		_srcID = src;
		_val = val;
		_loopNum = loopNum;
	}
	public int getID(){
		return _id;
	}
	public int getVal(){
		return _val;
	}
	public int getSrc(){
		return _srcID;
	}
	public int getType(){
		return _workType;
	}
	public int getLoopNum(){
		return _loopNum;
	}
}

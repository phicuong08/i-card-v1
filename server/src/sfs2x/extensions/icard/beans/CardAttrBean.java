package sfs2x.extensions.icard.beans;

import java.util.Vector;

/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardAttrBean
{
	public static final int ATT_NULL 	 	      =0; //
	public static final int ATK_UNSTOP        =1; //攻击不可防止
	public static final int DIST_ATK        	=2; //远程
	public static final int GUIDE        			=3; //护卫
	public static final int HIDE        			=4; //隐遁
	public static final int INSTANT        		=5; //瞬发
	public static final int LATENT        		=6; //潜行
	public static final int POINT_UNABLE      =7; //不可指定
	public static final int ONGOING           =8; //持续
	
	private int _id;
	private Vector<Integer> _vals;
	public CardAttrBean(int id){
		_id = id;
		_vals = new Vector<Integer>();
	}
	public int getID(){
		return _id;
	}
	public void AddAttr(String val){
		int attr = parseVal(val);
		if(attr != ATT_NULL)
			_vals.add(attr);
	}
	public boolean IsExistAttr(int attr){
		for(int i=0;i<_vals.size();i++){
			if(_vals.get(i)==attr)
				return true;
		}
		return false;
	}
	private int parseVal(String val){
		if(val.equals("ATK_UNSTOP"))
			return CardAttrBean.ATK_UNSTOP;
		else if(val.equals("DIST_ATK"))
			return CardAttrBean.DIST_ATK;
		else if(val.equals("GUIDE"))
			return CardAttrBean.GUIDE;
		else if(val.equals("HIDE"))
			return CardAttrBean.HIDE;
		else if(val.equals("INSTANT"))
			return CardAttrBean.INSTANT;
		else if(val.equals("LATENT"))
			return CardAttrBean.LATENT;
		else if(val.equals("POINT_UNABLE"))
			return CardAttrBean.POINT_UNABLE;		
		else if(val.equals("ONGOING"))
			return CardAttrBean.ONGOING;	
		return 	CardAttrBean.ATT_NULL;
	}

}


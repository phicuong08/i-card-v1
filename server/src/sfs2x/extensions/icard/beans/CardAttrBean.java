package sfs2x.extensions.icard.beans;

/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardAbilityBean
{
	public static final int ATT_NULL 	 	      =0; //
	public static final int ATK_UNSTOP        =1; //攻击不可防止
	public static final int DIST_ATK        	=2; //远程
	public static final int GUIDE        			=3; //护卫
	public static final int HIDE        			=4; //隐遁
	public static final int INSTANT        		=5; //瞬发
	public static final int LATENT        		=6; //潜行
	public static final int POINT_UNABLE      =7; //不可指定
	
	private int _id;
	private Vector<Integer> _vals;
	public CardAbilityBean(int id){
		_id = id;
		_vals = new Vector<Integer>();
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
		if(loop.equals("ATK_UNSTOP"))
			return CardAttrBean.ATK_UNSTOP;
		else if(loop.equals("DIST_ATK"))
			return CardAttrBean.DIST_ATK;
		else if(loop.equals("GUIDE"))
			return CardAttrBean.GUIDE;
		else if(loop.equals("HIDE"))
			return CardAttrBean.HIDE;
		else if(loop.equals("INSTANT"))
			return CardAttrBean.INSTANT;
		else if(loop.equals("LATENT"))
			return CardAttrBean.LATENT;
		else if(loop.equals("POINT_UNABLE"))
			return CardAttrBean.POINT_UNABLE;				
		return 	CardAttrBean.ATT_NULL;
	}

}


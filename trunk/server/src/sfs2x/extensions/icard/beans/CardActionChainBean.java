package sfs2x.extensions.icard.beans;

import java.util.Vector;

import sfs2x.extensions.icard.utils.Constants;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionChainBean
{
	private Vector<CardActionBean> _actionVect;
	public CardActionChainBean()
	{
		Empty();
	}
	public void Empty(){
		_actionVect = new Vector<CardActionBean>();
	}
	public Boolean IsEmpty(){
		return _actionVect.size()==0;
	}
	public void PushAction(CardActionBean action){
		_actionVect.add(action);
	}
	
	public Vector<CardActionBean> getActionChain(){
		return _actionVect;
	}
}

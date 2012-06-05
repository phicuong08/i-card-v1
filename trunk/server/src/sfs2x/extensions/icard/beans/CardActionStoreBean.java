package sfs2x.extensions.icard.beans;

import java.util.Vector;

import sfs2x.extensions.icard.utils.Constants;


/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardActionStoreBean
{
	private Vector<CardActionBean> _actionVect;
	public CardActionStoreBean()
	{
		_actionVect = new Vector<CardActionBean>();
	}
	public void AddAction(CardActionBean action){
		_actionVect.add(action);
	}
	public Vector<CardActionBean> getActionVect(){
		return _actionVect;
	}
}

package sfs2x.extensions.icard.beans;

/**
 * BombBean: object describing a bomb on the game map
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardBean
{
	private int _realID;
	private int _cardID;
	private int _addHp;
	private int _addAtk;
	private int _addDef;
	
	private CardInfoBean _info;
	
	public CardBean(int realID, int cardID)
	{
		_realID = realID;
		_cardID = cardID;
		_info = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
	}
	
	/* GETTERS & SETTERS */

	public int getRealID() {
		return _realID;
	}

	public void setRealID(int id) {
		_realID = id;
	}
	public int getCost(){ //费用
		return _info.getBaseCost();
	}
	public int getUseCost(){ //使用（武器，法术）,横置(盟军)费用
		return _info.getBaseUseCost();
	}
	public int getDef(){ //防御力
		return _info.getBaseDefence();
	}
	public int getAtk(){ //攻击力
		return _info.getBaseAttack();
	}
	public int getHp(){  //血量
		return _addHp + _info.getBaseHp();
	}
	public void AddHp(int val){
		_addHp += val;
		if(_addHp > (getMaxHp() - _info.getBaseHp()))
			_addHp = getMaxHp() - _info.getBaseHp();
	}
	public bool getIsDead(){ 
		return (_addHp + _info.getBaseHp())<=0;
	}
	public int getMaxHp(){ //血上限
		return _info.getBaseHp();
	}

}
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
	public int getCost(){ //����
		return _info.getBaseCost();
	}
	public int getUseCost(){ //ʹ�ã�������������,����(�˾�)����
		return _info.getBaseUseCost();
	}
	public int getDef(){ //������
		return _info.getBaseDefence();
	}
	public int getAtk(){ //������
		return _info.getBaseAttack();
	}
	public int getHp(){  //Ѫ��
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
	public int getMaxHp(){ //Ѫ����
		return _info.getBaseHp();
	}

}
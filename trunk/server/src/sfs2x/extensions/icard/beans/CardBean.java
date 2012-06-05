package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.utils.Constants;

/**
 * BombBean: object describing a bomb on the game map
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class CardBean
{
	public final static int HAND_SLOT_ID = 1;
	public final static int RES_SLOT_ID = 2;
	public final static int EQUIP_SLOT_ID = 3;
	public final static int FIGHT_SLOT_ID = 4;
	public final static int TOMB_SLOT_ID = 5;
	public final static int HERO_SLOT_ID = 6;
	private int _realID;
	private int _cardID;
	private int _slotID;
	private int _turn;
	private int _side;
	private int _addHp;
	private int _addAtk;
	private int _addDef;
	
	private CardInfoBean _info;
	
	public CardBean(int realID, int cardID,int slotID)
	{
		_realID = realID;
		_cardID = cardID;
		_slotID = slotID;
		_info = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
	}
	
	/* GETTERS & SETTERS */
	public int getCardID() {
		return _cardID;
	}
	public int getClientCardID(Boolean bOwner){
		if(bOwner==false){
			if(_slotID==CardBean.HAND_SLOT_ID || 
			  (_slotID==CardBean.RES_SLOT_ID && _turn==1))
				return 1;			
		}
		return _cardID;
	}
	public void setCardID(int id) {
		_cardID = id;
	}
	
	public int getRealID() {
		return _realID;
	}

	public void setRealID(int id) {
		_realID = id;
	}
	public int getSlotID(){
		return _slotID;
	}
	public void setSlotID(int id){
		_slotID = id;
	}
	public int getTurn() {
		return _turn;
	}

	public void setTurn(int val) {
		_turn = val;
	}
	public int getSide() {
		return _side;
	}

	public void setSide(int val) {
		_side = val;
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
	public Boolean getDefDirty(){
		return (getDef()!=_info.getBaseDefence());
	}
	public Boolean getHpDirty(){
		return (getHp()!=_info.getBaseHp());
	}
	public Boolean getAtkDirty(){
		return (getAtk()!=_info.getBaseAttack());
	}
	public void AddHp(int val){
		_addHp += val;
		if(_addHp > (getMaxHp() - _info.getBaseHp()))
			_addHp = getMaxHp() - _info.getBaseHp();
	}
	public Boolean getIsDead(){ 
		return (_addHp + _info.getBaseHp())<=0;
	}
	public int getMaxHp(){ //血上限
		return _info.getBaseHp();
	}

}
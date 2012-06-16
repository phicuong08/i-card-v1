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
	public final static int HERO = 0;
	public final static int SOLDIER = 1;
	public final static int WEAPON = 2;
	public final static int DEF = 3;
	public final static int SKILL = 4;
	public final static int TASK = 5;
	
	
	public final static int HAND_SLOT_ID = 1;
	public final static int RES_SLOT_ID = 2;
	public final static int EQUIP_SLOT_ID = 3;
	public final static int FIGHT_SLOT_ID = 4;
	public final static int TOMB_SLOT_ID = 5;
	public final static int HERO_SLOT_ID = 6;
	
	public final static int SLOT_DIRTY_BIT = 0;
	public final static int HP_DIRTY_BIT = 1;
	public final static int TURN_DIRTY_BIT = 2;
	public final static int ATK_DIRTY_BIT = 3;
	public final static int DEF_DIRTY_BIT = 4;
	public final static int COST_DIRTY_BIT = 5;
	public final static int SIDE_DIRTY_BIT = 6;
	public final static int CARDID_DIRTY_BIT = 7;
	
	private int _realID;
	private int _cardID;
	private int _slotID;
	private int _turn;
	private int _side;
	private int _addHp;
	private int _dirtyFlag=0;
	private CardInfoBean _info;
	
	public CardBean(int realID, int cardID,int slotID)
	{
		_realID = realID;
		_cardID = cardID;
		_slotID = slotID;
		setDirtyFlagBit(SLOT_DIRTY_BIT);
		setDirtyFlagBit(CARDID_DIRTY_BIT);
		_info = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
	}
	
	/* GETTERS & SETTERS */
	public int getCardID() {
		return _cardID;
	}
	public int getClientCardID(Boolean bOwner){
		if(bOwner==false){
			if(_slotID==CardBean.HAND_SLOT_ID)
				return Constants.BACK_CARD_ID;			
		}
		return _cardID;
	}
	public void setCardID(int id) {
		_cardID = id;
	}
	public int getCardType(){
		int typeId = _cardID/1000;
		int retType = 0;
		switch(typeId)
		{
			case 30:
				retType = WEAPON;
				break;
			case 31:
				retType = DEF;
				break;
			case 21:
			case 22:
			case 23:
				retType = SOLDIER;
				break;
			case 20:
				retType = HERO;
				break;
			case 50:
				retType = SKILL;
				break;
			case 40:
				retType = TASK;
				break;
		}
		return retType;
	}
	public CardInfoBean getInfo(){
		return _info;
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
		setDirtyFlagBit(SLOT_DIRTY_BIT);
	}
	public int getTurn() {
		return _turn;
	}

	public void setTurn(int val) {
		_turn = val;
		setDirtyFlagBit(TURN_DIRTY_BIT);
	}
	public int getSide() {
		return _side;
	}

	public void setSide(int val) {
		_side = val;
		setDirtyFlagBit(SIDE_DIRTY_BIT);
	}
	
	public int getCost(){ //费用
		return _info.getBaseCost();
	}
	public int getUseCost(){ //使用（武器，法术）,横置(盟军)费用,英雄翻转
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
		setDirtyFlagBit(HP_DIRTY_BIT);	
	}
	public Boolean getIsDead(){ 
		return (_addHp + _info.getBaseHp())<=0;
	}
	public int getMaxHp(){ //血上限
		return _info.getBaseHp();
	}
	public void setDirtyFlagBit(int bitPos){
		_dirtyFlag |= 1<< bitPos;
	}
	public int getDirtyFlag(){
		return _dirtyFlag;
	}
	public void setDirtyFlag(int val){
		_dirtyFlag = val;
	}
	public Boolean getDirtyFlagBit(int bitPos){
		int val = _dirtyFlag & (1<<bitPos);
		return (val>0);
	}

	
	
}
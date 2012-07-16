package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.bsn.BufferBsn;
import sfs2x.extensions.icard.bsn.CardUseBsn;
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
	public final static int BUF_SLOT_ID = 7;
	
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
	private BufferStoreBean _bufStore;
	public CardBean(int realID, int cardID,int slotID)
	{
		_realID = realID;
		_cardID = cardID;
		_slotID = slotID;
		setDirtyFlagBit(SLOT_DIRTY_BIT);
		setDirtyFlagBit(CARDID_DIRTY_BIT);
		_info = CardInfoStoreBean.GetInstance().getCardInfo(cardID);
		_bufStore = new BufferStoreBean();
	}
	/* GETTERS & SETTERS */
	public BufferStoreBean getBufStore(){
		return _bufStore;
	}
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
		if(_info!=null)
			return _info.getType();
		return 0;
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
		if(CardUseBsn.IsSideEnable(this,val)==false)
			return;
		_side = val;
		setDirtyFlagBit(SIDE_DIRTY_BIT);
	}
	
	public boolean IsDistAtk(int when){
		if(BufferBsn.IsCardAbility(this,when,CardAbilityBean.BUF_ATK_DIST))
			return true;
		return BufferBsn.IsExistBuf(this,CardAbilityBean.BUF_ATK_DIST,when);
	}
	public boolean IsAtkUnable(int when){
		return BufferBsn.IsExistBuf(this,CardAbilityBean.BUF_ATK_UNABLE,when);
	}
	public boolean IsGuidable(int when){
		if(BufferBsn.getCardAbility(this,when,CardAbilityBean.WHICH_I,CardAbilityBean.BUF_GUIDE)!=null)
			return true;
		return BufferBsn.IsExistBuf(this,CardAbilityBean.BUF_GUIDE,when);
	}
	public int getCost(){ //费用
		return _info.getBaseCost();
	}
	public int getUseCost(){ //使用（武器，法术）,横置(盟军)费用,英雄翻转
		return _info.getBaseUseCost();
	}
	public int getDef(int when){ //防御力
		return _info.getBaseDefence() + BufferBsn.getAbilityVal(this,when,CardAbilityBean.BUF_DEF_ADD);
	}
	public int getAtk(int when){ //攻击力
		return _info.getBaseAttack() + BufferBsn.getAbilityVal(this,when,CardAbilityBean.BUF_ATK_ADD);
	}
	public void setDead(){
		AddHp(-10000);
		setSlotID(TOMB_SLOT_ID);
	}
	public int getHp(){  //血量
		return _addHp + _info.getBaseHp() ;
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
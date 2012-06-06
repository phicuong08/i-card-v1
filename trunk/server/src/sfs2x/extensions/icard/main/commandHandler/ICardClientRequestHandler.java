package sfs2x.extensions.icard.main.commandHandler;


import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;
import com.smartfoxserver.v2.entities.data.*;
import sfs2x.extensions.icard.utils.*;
import sfs2x.extensions.icard.beans.*;
public class ICardClientRequestHandler extends BaseClientRequestHandler {

	@Override
	public void handleClientRequest(User paramUser, ISFSObject paramISFSObject) {
	
	}
	
	public void SendOnErr(User sender){
		if(ErrorDef.IsEmpty()==false)
			SendErrorMsg(sender,ErrorDef._CurErr);	
	}
	public void SendErrorMsg(User sender,String msg){
			ISFSObject errObj = new SFSObject();;
			errObj.putUtfString("note",msg);
			send(Commands.CMD_S2C_ERROR, errObj, sender);
	}
	
	public void FillCardInfoArr(ISFSArray cardInfoArr,CardSiteBean siteBean,int sendId){
		ConcurrentHashMap<Integer, CardBean> cardMap = siteBean.getCardMap();
		if(cardMap==null)
			return;

		 for (Iterator<CardBean> iter = cardMap.values().iterator(); iter.hasNext(); )
		{
			 CardBean card = (CardBean)iter.next();
			 ISFSObject cardInfoObj = GenCardInfoObj(card,siteBean.getPlayerID(),sendId);
			 if(cardInfoObj!=null)
				 cardInfoArr.addSFSObject(cardInfoObj);
		}
	}
	public  ISFSObject GenCardInfoObj(CardBean card,int playerID,int sendId)
	{
		ISFSObject cardInfo = new SFSObject();
		cardInfo.putInt("realID", card.getRealID());
		cardInfo.putInt("cardID", card.getClientCardID(playerID==sendId));
		cardInfo.putInt("slot", card.getSlotID());
		cardInfo.putInt("side", card.getSide());
		cardInfo.putInt("turn", card.getTurn());
		cardInfo.putInt("playerID", playerID);
		if(card.getHpDirty()==true)
			cardInfo.putInt("hp", card.getHp());
		if(card.getAtkDirty()==true)
			cardInfo.putInt("atk", card.getAtk());
		if(card.getDefDirty()==true)
			cardInfo.putInt("def", card.getDef());
		return cardInfo;
	}

}

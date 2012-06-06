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
}

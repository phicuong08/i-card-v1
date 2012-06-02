package sfs2x.extensions.icard.main.commandHandler;

import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;
import com.smartfoxserver.v2.entities.data.*;
import sfs2x.extensions.icard.utils.*;

public class ICardClientRequestHandler extends BaseClientRequestHandler {

	@Override
	public void handleClientRequest(User paramUser, ISFSObject paramISFSObject) {
	
	}
	
	public void SendErrorMsg(User sender,String msg){
			ISFSObject errObj = new SFSObject();;
			errObj.putUtfString("note",msg);
			send(Commands.CMD_S2C_ERROR, errObj, sender);
	}
	

}

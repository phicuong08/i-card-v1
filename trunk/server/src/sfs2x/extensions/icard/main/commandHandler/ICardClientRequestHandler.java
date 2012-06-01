package sfs2x.extensions.icard.main.commandHandler;

import com.icard.user.CardUser;
import com.icard.user.CardUserManager;
import com.smartfoxserver.v2.core.SFSEventParam;
import com.smartfoxserver.v2.entities.Room;
import com.smartfoxserver.v2.entities.User;
import com.smartfoxserver.v2.entities.data.ISFSObject;
import com.smartfoxserver.v2.extensions.BaseClientRequestHandler;

public class ICardClientRequestHandler extends BaseClientRequestHandler {

	public void SendErrorMsg(User sender,String msg){
			ISFSObject errObj = new SFSObject();;
			errObj.putUtfString("note",msg);
			send(Commands.CMD_S2C_ERROR, errObj, sender);
	}
	

}

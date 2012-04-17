package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.v2.entities.Email;

public abstract interface IMailerCallbackHandler
{
  public abstract void onError(Email paramEmail, Exception paramException);

  public abstract void onSuccess(Email paramEmail);
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IMailerCallbackHandler
 * JD-Core Version:    0.6.0
 */
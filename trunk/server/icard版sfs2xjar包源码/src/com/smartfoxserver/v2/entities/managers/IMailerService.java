package com.smartfoxserver.v2.entities.managers;

import com.smartfoxserver.bitswarm.service.IService;
import com.smartfoxserver.v2.config.ServerSettings.MailerSettings;
import com.smartfoxserver.v2.entities.Email;
import javax.mail.MessagingException;

public abstract interface IMailerService extends IService
{
  public abstract void sendMail(Email paramEmail)
    throws MessagingException;

  public abstract void sendMail(Email paramEmail, IMailerCallbackHandler paramIMailerCallbackHandler)
    throws MessagingException;

  public abstract void sendMail(Email paramEmail, IMailerCallbackHandler paramIMailerCallbackHandler, int paramInt)
    throws MessagingException;

  public abstract ServerSettings.MailerSettings getConfiguration();
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.entities.managers.IMailerService
 * JD-Core Version:    0.6.0
 */
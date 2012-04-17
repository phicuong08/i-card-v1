package com.smartfoxserver.v2.controllers;

import com.smartfoxserver.bitswarm.io.IRequest;
import com.smartfoxserver.v2.exceptions.SFSRequestValidationException;

public abstract interface IControllerCommand
{
  public abstract boolean validate(IRequest paramIRequest)
    throws SFSRequestValidationException;

  public abstract Object preProcess(IRequest paramIRequest)
    throws Exception;

  public abstract void execute(IRequest paramIRequest)
    throws Exception;
}

/* Location:           C:\work\card\server\jars\sfs2x.jar
 * Qualified Name:     com.smartfoxserver.v2.controllers.IControllerCommand
 * JD-Core Version:    0.6.0
 */
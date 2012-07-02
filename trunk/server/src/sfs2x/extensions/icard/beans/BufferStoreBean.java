package sfs2x.extensions.icard.beans;

import java.util.HashMap;

/**
 * GameMapBean: class describing a map associated to a game match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class BufferStoreBean
{
	private HashMap<Integer, BufferBean> _bufferMap =new HashMap<Integer, BufferBean>();
	private int _idInc = 0;
	public BufferStoreBean(){
	}
	public void AddBuf(int type,int src,int val,int loopNum){
		int curID=0;
		synchronized (this){
			curID = _idInc++;
		}
		BufferBean newBuf = new BufferBean(curID,type,src,val,loopNum);
		_bufferMap.put(curID,newBuf);
	}

}

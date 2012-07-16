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
	public BufferStoreBean(){
	}

	public void AddBuf(CardAbilityBean ability,int realID){
		BufferBean newBuf = new BufferBean(ability,realID);
		_bufferMap.put(realID,newBuf);
	}
	public HashMap<Integer, BufferBean> getBufMap(){
		return _bufferMap;
	}
	public Vector<CardAbilityBean> getAbilityOnWhen(int when){
		if(_bufferMap.size()==0)
			return null;
		Vector<CardAbilityBean> vec = new Vector<CardAbilityBean>;
		for(BufferBean buf:_bufferMap.values()){
			if(buf.getWhen()==when)
				vec.add(buf.getAbility());
		}
	}
}

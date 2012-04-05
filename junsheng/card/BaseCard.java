package sfs2x.extensions.games.battlefarm.card;

public class BaseCard {
	private String mCardName;
	private int mRecourcePoints;
	public BaseCard(String name,int resoucepoints)
	{
		this.mCardName = name;
		this.mRecourcePoints = resoucepoints;
	}
	
	public String getCardName()
	{
		return mCardName;
	}
	
	public int GetResourcePoints()
	{
		return mRecourcePoints;
	}
	
}

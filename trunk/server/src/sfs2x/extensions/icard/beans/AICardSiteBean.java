package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.bsn.BattleAIBsn;
import sfs2x.extensions.icard.main.ICardExtension;


/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class AICardSiteBean extends CardSiteBean
{
	public final static  int	THINK_TIME = 20;
	private int _thinkNeed;
	public AICardSiteBean(int player) {
		super(player,null);
		setThinkNeed();
	}
	
	@Override
	public void gameTick(CardGameBean game,ICardExtension ext){
		if(thinkNeed>0){
			thinkNeed--;
		}
		else{
			BattleAIBsn.RunBattleAI(game, this, ext);
			thinkNeed = THINK_TIME;
		}
	}
}
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
	public AICardSiteBean(int player) {
		super(player,null);
	}
	
	@Override
	public void gameTick(CardGameBean game,ICardExtension ext){
		BattleAIBsn.RunBattleAI(game, this, ext);
	}
}
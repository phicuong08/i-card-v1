package sfs2x.extensions.icard.beans;

import sfs2x.extensions.icard.bsn.BattleAIBsn;
import sfs2x.extensions.icard.main.ICardExtension;


/**
 * PlayerBean: class describing a player in a match
 * 
 * @author Ing. Ignazio Locatelli
 * @version 1.0
 */
public class AICardDeckBean extends CardDeckBean
{
	public final static  int	THINK_TIME = 20;
	private int _thinkNeed;
	public AICardDeckBean(int player) {
		super(player,null);
		setThinkNeed();
	}
	public void setThinkNeed(){
		_thinkNeed = THINK_TIME;
	}
	public int getThinkNeed(){
		return _thinkNeed;
	}
	public void decThinkNeed(){
		_thinkNeed--;
	}
	@Override
	public void gameTick(CardGameBean game,ICardExtension ext){
		if(_thinkNeed>0){
			_thinkNeed--;
		}
		else{
			BattleAIBsn.RunBattleAI(game, this, ext);
			_thinkNeed = THINK_TIME;
		}
	}
}
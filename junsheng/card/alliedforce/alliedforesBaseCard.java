package sfs2x.extensions.games.battlefarm.card.alliedforce;

import java.util.ArrayList;
import java.util.List;

import sfs2x.extensions.games.battlefarm.card.BaseCard;
import sfs2x.extensions.games.battlefarm.card.alliedforce.ability.abilityBase;

public class alliedforesBaseCard extends BaseCard {
	
	private String mRacial;
	private String mCareer;
	private int mAttackPoints;
	private int mLifePoints;
	protected List<? super abilityBase> ablitylist = new ArrayList<abilityBase>();
	
	public alliedforesBaseCard(String name, int resourcepoints,
			String racial, String career,
			int attackpoints, int lifepoints){
		super(name, resourcepoints);
		this.mRacial = racial;
		this.mCareer = career;
		this.mAttackPoints = attackpoints;
		this.mLifePoints = lifepoints;
	}
	
	public String getRacial(){
		return mRacial;
	}
	
	public String getCareer(){
		return mCareer;
	}
	
	
	public String getAlliedforesDescription(){
		return String.format("ÃË¾ü - %s %s", this.mRacial, this.mCareer);
	}
	
	
	public int getAttackPoints(){
		return this.mAttackPoints;
	}
	
	public int getLifePoints(){
		return this.mLifePoints;
	}
	
	public void beAttacked(int points, attackType attacktype){
		this.mLifePoints -= points;
	}
	
}

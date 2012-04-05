package sfs2x.extensions.games.battlefarm.card.alliedforce.ability;

import sfs2x.extensions.games.battlefarm.card.alliedforce.alliedforesBaseCard;

public class abilityBase {
	private String mAbilityName;
	private String mAbilityDescription;

	public abilityBase(){
		
	}
	
	public abilityBase(String abilityname, String description){
		this.mAbilityName = abilityname;
		this.mAbilityDescription = description;
	}
	
	public String getAbilityName(){
		return this.mAbilityName;
	}
	
	public String GetAbilityDescription(){
		return this.mAbilityDescription;
	}
	
	public void ActionHanler(alliedforesBaseCard mySelf, alliedforesBaseCard enemy){
		
	}
}

package sfs2x.extensions.games.battlefarm.card.alliedforce;

import sfs2x.extensions.games.battlefarm.card.alliedforce.ability.hiddenAbility;

public class SIWOXUDUIZHANGCard extends alliedforesBaseCard {

	public SIWOXUDUIZHANGCard(){
		super("斯沃许队长",1,"兽人","盗贼",1,1);
		this.ablitylist.add(new hiddenAbility());
	}
		
	public void beAttacked(int points, attackType attacktype){
		
		//我们有隐身功能，忽视物理攻击，这个地方的攻击类别肯定不是物理。。
		if(attacktype == attackType.PHYSICAL)
			return;
		
		super.beAttacked(points, attacktype);
	}
	
	public void Attrack(alliedforesBaseCard enemy){
		enemy.beAttacked(this.getAttackPoints(), attackType.PHYSICAL);
	}
	
}

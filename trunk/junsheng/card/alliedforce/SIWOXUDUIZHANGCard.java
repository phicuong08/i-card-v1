package sfs2x.extensions.games.battlefarm.card.alliedforce;

import sfs2x.extensions.games.battlefarm.card.alliedforce.ability.hiddenAbility;

public class SIWOXUDUIZHANGCard extends alliedforesBaseCard {

	public SIWOXUDUIZHANGCard(){
		super("˹����ӳ�",1,"����","����",1,1);
		this.ablitylist.add(new hiddenAbility());
	}
		
	public void beAttacked(int points, attackType attacktype){
		
		//�����������ܣ�����������������ط��Ĺ������϶�����������
		if(attacktype == attackType.PHYSICAL)
			return;
		
		super.beAttacked(points, attacktype);
	}
	
	public void Attrack(alliedforesBaseCard enemy){
		enemy.beAttacked(this.getAttackPoints(), attackType.PHYSICAL);
	}
	
}

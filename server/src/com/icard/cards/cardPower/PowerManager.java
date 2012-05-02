package com.icard.cards.cardPower;

import com.icard.cards.BaseCard;

public class PowerManager {
	private static PowerManager mInstance =null;
	private PowerManager(){
		Init();
	}
	private void Init(){
		
	}
	public static PowerManager GetInstance(){
		if(mInstance==null){
			mInstance = new PowerManager();
		}
		return 	mInstance;
	}
	public CardPower GetPower(BaseCard baseCard){
		return null;
	}
	
}

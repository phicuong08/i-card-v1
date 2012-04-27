package com.icard.cards.cardPower;

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
	public CardPower GetPower(int Id){
		return null;
	}
	
}

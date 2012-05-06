//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface ICardDB {
			function CreateCard(realID:int,info:Array):MovieClip;
			function CreateBackCard(realID:int,cardID:int=0,hp:int=0):MovieClip;
			function SetHp(card:MovieClip,hp:int):Boolean;
			function SetAtk(card:MovieClip,atk:int):Boolean;
	}
}//package com.assist.view.interfaces 

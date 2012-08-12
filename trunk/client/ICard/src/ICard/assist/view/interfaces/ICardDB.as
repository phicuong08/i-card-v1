//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist.view.interfaces {
    import flash.display.*;

    public interface ICardDB {
			function CreateCard(info:Object):MovieClip;
			function SetHp(card:MovieClip,hp:int):Boolean;
			function SetAtk(card:MovieClip,atk:int):Boolean;
			function UpdateAttr(card:MovieClip,info:Object):Boolean;
			function AddCardBuf(card:MovieClip,bufId:int):MovieClip;
	}
}//package com.assist.view.interfaces 

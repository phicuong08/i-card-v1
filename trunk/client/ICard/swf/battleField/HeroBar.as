﻿package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class HeroBar extends SlotBar {
        public function HeroBar():void{
            super();
        }
	
 		override public function AddCard(card:MovieClip):void{
			RemoveAllCard();
			super.AddCard(card);
		}
	
    }
}//package 
package {
    import flash.display.*;
	import flash.utils.*;
    import flash.text.*;
	import ICard.assist.view.interfaces.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class fightpanel extends MovieClip implements IFightPanel{
		
        public function fightpanel(){
			//var cardInfo:Array = [30001,"上古骨弓"        ,"中立","种族",   3,   2,       2,     "当你使用上古骨弓进行打击时，你的英雄在此次战斗中具有远程攻击（防御者不会对你造成战斗伤害）。"];
			
			//var info:Object={realID:1,cardID:40001,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			//var card1:MovieClip =CreateCard(info);
			//card1.x = card1.width/2;
			//card1.y = card1.height/2;
			//SetAtk(card1,87);
			//addChild(card1);

		}
		
		public function CreateCard(info:Object):MovieClip{
			var typeId:int = info["cardID"]/1000;
			var cardMC:MovieClip;
			var title:String = "c_" + info["cardID"].toString();
	
			return cardMC;
		}
	    public function get content():MovieClip{
            return (this);
        }

    }
}//package 

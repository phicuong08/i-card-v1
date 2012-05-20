package {
    import flash.display.*;
	import flash.utils.*;
    import flash.text.*;
	import ICard.assist.view.interfaces.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class fightpanel extends MovieClip implements IFightPanel{
		
        public function fightpanel(){
			
			
			var info:Object={realID:1,cardID:40001,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			var card0:MovieClip = cardFactory.CreateCard(info);
			AddObject(card0);
			var card1:MovieClip = cardFactory.CreateIcon(true);
			AddObject(card1);
			var card2:MovieClip = cardFactory.CreateCard(info);
			AddObject(card2);
			AddObject(cardFactory.CreateCard(info));
			AddObject(cardFactory.CreateCard(info));
		}
		public function show(srcID:int,targets:Array,oldCards:Array,bEnemy:Boolean):void{
			var cardSrc:MovieClip = CreateSrcCard(srcID,oldCards);
			AddObject(cardSrc);
		}
	    public function get content():MovieClip{
            return (this);
        }
		private function GetCardObj(realID:int,Cards:Array):Object{
			for each(var card:Object in Cards)
			{
				if(card["realID"]==realID)
					return card;
			}
			return null;
		}
		private function CreateSrcCard(srcID:int,oldCards:Array):MovieClip{
			var srcCard:Object = GetCardObj(srcID,oldCards);
			if(srcCard==null)
				return null;
			return cardFactory.CreateCard(srcCard);
		}
		public function AddObject(obj:MovieClip):void{
			this.addChild(obj);
			UpdatePos();
		}
		private function UpdatePos():void{
			
			var index:int = 0;
	
			var totalWidth:Number = 0;
			while(index <this.numChildren)
			{
				var obj:MovieClip = (getChildAt(index) as MovieClip);
				obj.x = obj.width/2 + totalWidth;
				totalWidth = totalWidth + obj.width + 10;
				obj.y = 0;
				trace("total width",totalWidth,"obj width",obj.width);
				index++;
			}
			trace("Update Over");
		}
		
    }
}//package 

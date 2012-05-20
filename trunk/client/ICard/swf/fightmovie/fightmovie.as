package {
    import flash.display.*;
	import flash.utils.*;
    import flash.text.*;
	import ICard.assist.view.interfaces.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class fightmovie extends MovieClip implements IFightMovie{
		
        public function fightmovie(){
			var card1:Object= {realID:1,cardID:40001,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			var card2:Object={realID:2,cardID:40002,hp:18,cost:3,turncost:1,atk:2,def:0,side:false,turn:false};
			var card3:Object={realID:3,cardID:30001,hp:18,cost:32,turncost:12,atk:22,def:0,side:false,turn:false};
			
			show(1,[card1,card2,card3],[card1,card2,card3],true);
		}
		public function show(srcID:int,targets:Array,oldCards:Array,bEnemy:Boolean):void{
			AddObject(CreateSrcCard(srcID,oldCards));
			var fightIcon:MovieClip = cardFactory.CreateIcon(bEnemy);
			AddObject(fightIcon);
			for each(var target:Object in targets)
			{
				if(target["realID"]!=srcID)
				{
					AddObject(CreateSrcCard(target["realID"],oldCards));
				}
			}
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
			if(!obj)
				return;
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
				index++;
			}
		}
		
    }
}//package 

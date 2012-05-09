package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
		import ICard.assist.view.interfaces.*;
		
    public class SlotBar extends MovieClip {
    private var _tip:ITip;
		private var _widthMax:int;
		private var _cardWidth:int;
		public var _selCard:MovieClip;
		public var _slotID:int;
        public function SlotBar():void{
            super();
        }
		public function Init(slotId:int,x:int,y:int,widthMax:int)
		{
			_slotID = slotId;
			_widthMax = widthMax;
			this.x =x;
			this.y =y;
		}
		public function FindCardIndex(realID:int):int{
			var ret:int = -1;
			var index:int = 0;
			while(index <this.numChildren)
			{
				var card:MovieClip = (getChildAt(index) as MovieClip);
				if(card.realID==realID)
				{
					ret = index;
					break;
				}
				index++;
			}
			return ret;
		}
		public function RemoveCard(realID:int):MovieClip{
			var index:int = FindCardIndex(realID);
			if(index >=0)
			{
				RemoveCardTip(getChildAt(index) as MovieClip);
				this.removeChildAt(index);
				UpdatePos();
			}
			return delCard;
		}
			
  	public function AddCard(card:MovieClip,tipInfo:String):void{
			this.addChild(card);
			UpdatePos();
		}
		public function RemoveAllCard():void{
			while(this.numChildren)
			{
				RemoveCardTip(getChildAt(index) as MovieClip);
				removeChild(this.getChildAt(0));
			}
		}
		public function SetCardTip(card:MovieClip,tipInfo:String):void{
				if(!_tip || !card)
					return;
				var pos:Point = card.localToGlobal(new Point(0,card.height/2));
				_tip->addFixedTarget(card, tipInfo, pos);
		}
		
		public function RemoveCardTip(card:MovieClip):void{
			if(_tip && card)
				_tip->removeTarget(card);
		}
		public function set tip(_arg1:ITip):void{
		  _tip = _arg1;
		}
		
		public function UpdatePos():void{
			if(this.numChildren<1)
				return;
			var index:int = 0;
			var card0:MovieClip = (getChildAt(0) as MovieClip);
			if(!card0)
				return;

			var cardWidth:Number = (card0.width*this.numChildren < _widthMax)? card0.width: (_widthMax/this.numChildren);
			while(index <this.numChildren)
			{
				var card:MovieClip = (getChildAt(index) as MovieClip);
				card.x = card.width/2 +cardWidth*index;
				card.y = card.height/2;
				index++;
			}
		}
    }
}//package 

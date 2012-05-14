package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class ResourceBar extends SlotBar {
		private var _use_but:SimpleButton;
        public function ResourceBar():void{
            super();
        }
	
 		override public function AddCard(card:MovieClip):void{
			
			if(card.turn==true && this.numChildren>0)
			{
				var elem0:MovieClip = (this.getChildAt(0) as MovieClip);
				if(elem0.turn==true)  //只会加一个背面的
					return;
				this.addChildAt(card,0);
				UpdatePos();
			}
			else
			{
				AddNewTaskCard(card);
			}
		}
		
		private function AddNewTaskCard(card:MovieClip):void{
			super.AddCard(card);
			
			var handleMouseOverCard:* = function(e:MouseEvent):void{
				card.y = card.height/2 -4;
				_selCard = card;
				ShowCardUseMenu(card);
				SetCardTip(card);
			}
			var handleMouseOutCard:* = function(e:MouseEvent):void{
				card.y = card.height/2;
				_selCard = null;
				HideCardUseMenu(card);
				RemoveCardTip(card);
			}
			card.addEventListener(MouseEvent.ROLL_OVER,handleMouseOverCard);
			card.addEventListener(MouseEvent.ROLL_OUT,handleMouseOutCard);
		}
		
		private function HideCardUseMenu(card:MovieClip):void{
			_use_but.removeEventListener(MouseEvent.CLICK,OnCardUse);
			card.removeChild(_use_but);
			_use_but = null;
		}
		
		private function ShowCardUseMenu(card:MovieClip):void{
			if(_use_but)
				return;
			_use_but = new card_use_but;
			_use_but.x = 0;
			_use_but.y = 0;
			_use_but.addEventListener(MouseEvent.CLICK,OnCardUse);
			card.addChild(_use_but);
		}
		public function OnCardUse(e:MouseEvent):void{
			battleField._TurnCardFunc(_selCard.realID);	
		}
    }
}//package 

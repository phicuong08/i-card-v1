package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class MyHandBar extends SlotBar {
		private var _cardMenu:MovieClip;
        public function MyHandBar():void{
            super();
        }
	
		override public function AddCard(card:MovieClip):void{
			super.AddCard(card);
				
			var handleMouseOverCard:* = function(e:MouseEvent):void{
				card.y = card.height/2 -4;
				_selCard = card;
				ShowCardActionMenu(card);
			}
			var handleMouseOutCard:* = function(e:MouseEvent):void{
				card.y = card.height/2;
				_selCard = null;
				HideCardActionMenu(card);
			}
			card.addEventListener(MouseEvent.ROLL_OVER,handleMouseOverCard);
			card.addEventListener(MouseEvent.ROLL_OUT,handleMouseOutCard);
		}
		private function HideCardActionMenu(card:MovieClip):void{
			_cardMenu.fight_but.removeEventListener(MouseEvent.CLICK,OnCardToEnter);
			_cardMenu.res_but.removeEventListener(MouseEvent.CLICK,OnCardToRes);
			_cardMenu.exit_but.removeEventListener(MouseEvent.CLICK,OnCardToTomb);
			card.removeChild(_cardMenu);
			_cardMenu = null;
		}
		private function ShowCardActionMenu(card:MovieClip):void{
			if(_cardMenu)
				return;
			_cardMenu = new card_menu;
			_cardMenu.x = 0;
			_cardMenu.y = -42;
			_cardMenu.fight_but.addEventListener(MouseEvent.CLICK,OnCardToEnter);
			_cardMenu.res_but.addEventListener(MouseEvent.CLICK,OnCardToRes);
			_cardMenu.exit_but.addEventListener(MouseEvent.CLICK,OnCardToTomb);
			card.addChild(_cardMenu);
		}
		public function OnCardToEnter(e:MouseEvent):void{
			trace(_selCard.realID,"To Enter!");
		}
		public function OnCardToRes(e:MouseEvent):void{
			trace(_selCard.realID,"To Res!");
		}
		public function OnCardToTomb(e:MouseEvent):void{
			trace(_selCard.realID,"To Tomb!");
		}
    }
}//package 

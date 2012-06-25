package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
	import flash.geom.*;
	import ICard.assist.view.interfaces.*;
	import ICard.assist.data.IBattleStage;
		
    public class SlotBar extends MovieClip {
		private var _tip:ITip;
		public var _battleStage:IBattleStage;
		private var _widthMax:int;
		private var _cardWidth:int;
		private var _cardMenu:MovieClip;
		public var _selCard:MovieClip;
		private var _battleField:battleField;
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
		public function FindCard(realID:int):MovieClip{
			var ret:int = -1;
			var index:int = 0;
			while(index <this.numChildren)
			{
				var card:MovieClip = (getChildAt(index) as MovieClip);

				if(card.realID==realID)
				{
					return card;
				}
				index++;
			}
			return null;
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
		public function RemoveCard(realID:int):void{
			var index:int = FindCardIndex(realID);
			if(index >=0)
			{
				RemoveCardTip(getChildAt(index) as MovieClip);
				this.removeChildAt(index);
				UpdatePos();
			}
		}
			
		public function AddCard(card:MovieClip):void{
			this.addChild(card);
			UpdatePos();
			
			var handleMouseOverCard:* = function(e:MouseEvent):void{
				
				_selCard = card;
				ShowCardActionMenu(card);
				if(_cardMenu && _cardMenu.numChildren>0)
					card.y = card.baseY -4;
				SetCardTip(card);
			}
			var handleMouseOutCard:* = function(e:MouseEvent):void{
				card.y = card.baseY;
				_selCard = null;
				HideCardActionMenu(card);
				RemoveCardTip(card);
			}
			var handleMouseClickCard:* = function(e:MouseEvent):void{
				_battleField.onClickCard(card.realID);
			}
			
			card.addEventListener(MouseEvent.ROLL_OVER,handleMouseOverCard);
			card.addEventListener(MouseEvent.ROLL_OUT,handleMouseOutCard);
			card.addEventListener(MouseEvent.CLICK,handleMouseClickCard);
		}
		public function RemoveAllCard():void{
			while(this.numChildren)
			{
				RemoveCardTip(getChildAt(0) as MovieClip);
				removeChild(this.getChildAt(0));
			}
		}
		public function SetCardTip(card:MovieClip):void{
				
				if(!card || !card.tipInfo)
					return;	
				trace("tip info",card.tipInfo);	
				var pos:Point = (_slotID<=6)?card.localToGlobal(new Point(-100,-card.height/2-40)):card.localToGlobal(new Point(-100,card.height+8));
				if((pos.x +380)>1200)
					pos.x = 1200 -380;
				
				
				_tip.addFixedTarget(card, card.tipInfo, pos);
		}
		
		public function RemoveCardTip(card:MovieClip):void{
			if(_tip && card)
				_tip.removeTarget(card);
		}
		public function set tip(_arg1:ITip):void{
		  _tip = _arg1;
		}
		public function set BattleStage(_arg1:IBattleStage):void{
		  _battleStage = _arg1;
		}
		public function set BattleField(arg1:battleField):void{
			_battleField = arg1;
		}
		private function HideCardActionMenu(card:MovieClip):void{
			if(!_cardMenu)
				return;
			card.removeChild(_cardMenu);
			while(_cardMenu.numChildren)
			{
				var obj:SimpleButton = _cardMenu.getChildAt(0) as SimpleButton;
				obj.removeEventListener(MouseEvent.CLICK,obj["func"]);
				_cardMenu.removeChild(obj);
			}
			_cardMenu = null;
		}
		
		public function SideCard(info:Object):Boolean{
				var cardMC = FindCard(info["realID"]);
				if(cardMC==null)
						return false;
				battleAssis.SideCard(info["side"]==1,cardMC);
				return true;
		}
		
		
		public function ShowCardActionMenu(card:MovieClip):void{
			HideCardActionMenu(card);
			var flagObj:Object = _battleStage.CardMenuFlag(card.realID);
			if(!flagObj)
				return;
			_cardMenu = new MovieClip;	
			if(	flagObj["enter"]==true)
				AddMenuBut(card_enter_but,OnCardToEnter);
			if(flagObj["cast"]==true)
				AddMenuBut(card_cast_but,OnCardToCast);
			if(flagObj["res"]==true)
				AddMenuBut(card_res_but,OnCardToRes);
			if(flagObj["task"]==true)
				AddMenuBut(card_cast_but,OnCardToTask);
			if(flagObj["fight"]==true)
				AddMenuBut(card_fight_but,OnCardToFight);
			if(flagObj["turn"]==true)
				AddMenuBut(card_cast_but,OnCardToTurn);
			_cardMenu.x = -_cardMenu.width/2 +5;
			_cardMenu.y = -28;
			card.addChild(_cardMenu);
		}
		
		private function AddMenuBut( classType:Class,func:Function):void{
			var addBut:SimpleButton = new classType;
			addBut["func"] = func;
			addBut.addEventListener(MouseEvent.CLICK,func);
			addBut.x = _cardMenu.width + 10;
			_cardMenu.addChild(addBut);
		}
		
		public function OnCardToEnter(e:MouseEvent):void{
			_battleStage.AskCard2FightSlot(_selCard.realID);	
		}
		public function OnCardToRes(e:MouseEvent):void{
			_battleStage.AskCard2ResSlot(_selCard.realID);
		}
		public function OnCardToCast(e:MouseEvent):void{
			trace(_selCard.realID,"To cast!");
		}
		public function OnCardToTask(e:MouseEvent):void{
			trace(_selCard.realID,"To task!");
		}
		public function OnCardToFight(e:MouseEvent):void{
			_battleStage.InitialFight(_selCard.realID);
			_battleField.onInitalFight(_selCard.realID);
			//trace(_selCard.realID,"To fight!");
		}
		public function OnCardToTurn(e:MouseEvent):void{
			trace(_selCard.realID,"To turn!");
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
				card.baseY = card.y;
				index++;
			}
		}
    }
}//package 

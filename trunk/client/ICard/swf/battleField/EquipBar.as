package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class EquipBar extends SlotBar {

	public function EquipBar():void{
            super();
        }
		private function CreateEquipMC(card:MovieClip):MovieClip{
			var newCard = new MovieClip;
			var cardInfo:Object =_battleStage.CardInfo(card.realID);
			if(!cardInfo)
				return;
			var typeId = info["cardID"]/1000;
			var iconMC:MovieClip = (typeId==30)? (new _weapon_small_icon) : (new _def_small_icon);
			iconMC.x = -80;
			newCard.addChildAt(titlePic,0);
			
			var title:String = "e_" + info["cardID"].toString();
			var classTitle:Class = getDefinitionByName(title) as Class;
			if(!classTitle)
				return;
			var titlePic:MovieClip = new classTitle;
			newCard.addChildAt(titlePic,1);						
			newCard.tipInfo = card.tipInfo;
			return newCard;
		}
		
		override public function SideCard(info:Object):Boolean{
				var cardMC = FindCard(info["realID"]);
				if(cardMC==null)
						return false;
				var icon:MovieClip = cardMC.getChildAt(0) as MovieClip;
				icon.visible = (info["side"]==1)? false:true;		
				return true;
		}
		
		override public function AddCard(card:MovieClip):void{
			var newCard = CreateEquipMC(card);
			if(newCard)
				super.AddCard(newCard);
		}
		
		override	public function UpdatePos():void{
			if(this.numChildren<1)
				return;
			var index:int = 0;
			var yOff:int = 0;
			while(index <this.numChildren)
			{
				var card:MovieClip = (getChildAt(index) as MovieClip);
				card.x = -card.width/2;
				card.y = yOff - 100;
				yOff += card.height;
				index++;
			}
		}
		
	}
}//package 

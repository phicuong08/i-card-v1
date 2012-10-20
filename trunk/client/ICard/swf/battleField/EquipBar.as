package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
	import ICard.assist.view.controls.BattleFieldType;
    public class EquipBar extends SlotBar {

		public function EquipBar():void{
						_slotId = BattleFieldType.EquipSlotId;
            super();
        }
		
		override public function SideCard(info:Object):Boolean{
				
				var cardMC:MovieClip = FindCard(info["realID"]);
				if(cardMC==null)
				{
					return false;
				}
				var icon:MovieClip = cardMC.getChildByName("icon") as MovieClip;
				icon.visible = (info["side"]==1)? false:true;
				return true;
		}
		
		override public function AddCard(card:MovieClip,cardInfo:Object):void{
			var newCard:MovieClip = new equip_bar;
			var cardInfo:Object =_battleStage.CardInfo(card.realID);
			if(!cardInfo)
				return;
			var typeId = cardInfo["cardID"]/1000;
			var iconMC:MovieClip = (typeId==30)? (new _weapon_small_icon) : (new _def_small_icon);
			iconMC.x = -80;
			iconMC.name ="icon";
			//newCard.addChildAt(iconMC,0);
			newCard.addChild(iconMC);
			
			var title:String = "e_" + cardInfo["cardID"].toString();
			var classTitle:Class = getDefinitionByName(title) as Class;
			if(!classTitle)
				return;
			var titlePic:MovieClip = new classTitle;
			//newCard.addChildAt(titlePic,1);						
			newCard.addChild(titlePic);						
			newCard.tipInfo = card.tipInfo;
			newCard.realID = card.realID;

			var valMC:ResNumMC = new ResNumMC;
			valMC.scaleX = valMC.scaleY = 0.6
			if(cardInfo.hasOwnProperty("atk"))
				valMC.setVal(cardInfo["atk"]);
			else
				valMC.setVal(cardInfo["def"]);
			valMC.x = -70;
			newCard.addChild(valMC);
			super.AddCard(newCard,cardInfo);
			SideCard(cardInfo);	
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
				card.y = yOff - card.height/2;
				card.baseY = card.y;
				yOff += card.height;
				index++;
			}
		}
		
	}
}//package 

package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class ResourceBar extends SlotBar {

	public function ResourceBar():void{
            super();
        }
	
 		override public function AddCard(card:MovieClip):void{
			trace("turn",card.turn);
			if(card.turn==true)
			{
				if( this.numChildren>0)
				{
					var elem0:MovieClip = (this.getChildAt(0) as MovieClip);
					if(elem0 && elem0.turn==true)  //只会加一个背面的
						return;
				}
				this.addChildAt(card,0);
				UpdatePos();
			}
			else
			{
				super.AddCard(card);
			}
		}
		
	}
}//package 

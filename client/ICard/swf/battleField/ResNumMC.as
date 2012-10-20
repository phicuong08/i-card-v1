package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
	import flash.geom.*;
	import ICard.assist.view.interfaces.*;
	import ICard.assist.data.IBattleStage;
		
    public class ResNumMC extends MovieClip {
		
		public var _val:int=-1;
        public function ResNumMC():void{
            super();
        }
		public function decVal():void{
			if(_val==0)
			{
				return;
			}
			setVal(_val-1);
		}
		public function setVal(val:int):void{
			if(_val==val)
				return;
			_val = val;	
			while(this.numChildren>0){
				this.removeChildAt(0);
			}
			
			var lowVal:int =val%10;
			var highVal:int = val/10;
			var offSet:int = 14;
			if(highVal>0)
			{
				var classVal:Class = getDefinitionByName("num_"+highVal) as Class;
				var highPic:MovieClip = new classVal;
				this.addChild(highPic);
				offSet = 28;
			}
			var classVal2:Class = getDefinitionByName("num_"+lowVal) as Class;
			var lowPic:MovieClip = new classVal2;
			lowPic.x = offSet;
			this.addChild(lowPic);
		}
    }
}//package 

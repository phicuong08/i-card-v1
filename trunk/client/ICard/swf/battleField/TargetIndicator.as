package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
		import flash.geom.*;
		
    public class TargetIndicator{
		
			private var _indicatorArr:Array;
			private var _maxTargetNum:int = 10;
			private var _freeIndex:int = 0;
	    public function TargetIndicator():void{
		    _indicatorArr = [];
		    var n:int = 0;
		    while(n<_maxTargetNum){
		    	var tt:MovieClip = new indicate;
		    	_indicatorArr.push(tt);
		    	n++;
		    }
	    }
	    public function get Size():int{
	    	return _freeIndex;
	    }
	    public function IsTarget(realID:int):Boolean{
	    	 var n:int = 0;
		    while(n<_freeIndex){
		    	var tt:MovieClip = _indicatorArr[n];
		    	if(tt.realID == realID)
		    		return true;
		    	n++;
		    }
		    return false;
	    }
		
	    public function AddIndicator(card:MovieClip):void{
	    	if(_freeIndex>=_maxTargetNum)
	    		return;
	    	var indicator:MovieClip = _indicatorArr[_freeIndex];
			indicator.realID = card.realID;
			card.addChild(indicator);
	    	_freeIndex++;
	    }
			public function Empty():void{
				var n:int = 0;
				while(n<_freeIndex){
					var indicator:MovieClip = _indicatorArr[n] as MovieClip;
					indicator.parent.removeChild(indicator);
					n++;
				}
				_freeIndex = 0;
			}
	  
	
    }
}//package 

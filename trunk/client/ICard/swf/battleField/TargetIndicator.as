package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
		import flash.geom.*;
		
    public class TargetIndicator{
		
			private var _indicatorArr:Array;
			private var _maxTargetNum:int = 10;
			private var _parent:MovieClip;
			private var _freeIndex:int = 0;
	    public function TargetIndicator(parent:MovieClip):void{
		    _indicatorArr = [];
		    _parent = parent;
		    var n:int = 0;
		    while(n<_maxTargetNum){
		    	var tt:MovieClip = new indicate;
		    	_indicatorArr.push(tt);
		    	n++;
		    }
	    }
	    public function AddIndicator(card:MovieClip):void{
	    	if(_freeIndex>=_maxTargetNum)
	    		return;
	    	var indicator:MovieClip = _indicatorArr[_freeIndex];
	    	indicator.x = card.x;
	    	indicator.y = card.y;
	    	_parent.addChild(indicator);
	    	_freeIndex++;
	    }
			public function Empty():void{
				var n:int = 0;
				while(n<_freeIndex){
					_parent.removeChild(_indicatorArr[n]);
				}
				_freeIndex = 0;
			}
	  
	
    }
}//package 

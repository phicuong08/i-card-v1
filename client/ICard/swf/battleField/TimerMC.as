package {
    import flash.utils.*;
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;
	import flash.geom.*;
	import ICard.assist.view.interfaces.*;
	import ICard.assist.data.IBattleStage;
		
    public class TimerMC  {
		
		private var _battleStage:IBattleStage;
		private var _timer_but:MovieClip;
		private static var _timer_base_x:int;
		private static var _timer_base_y:int;
		public  var _secondTick:Timer; 
        public function TimerMC(but:MovieClip):void{
			_timer_but = but;
			_timer_but.visible=false;
        }
		public function Init(battleStage:IBattleStage):void{
			_battleStage = battleStage;
		}
		public  function InitTimeMC(val:int):void{
			var _tmp:ResNumMC = _timer_but.getChildByName("num") as ResNumMC;
			if(!_tmp)
				_tmp = new ResNumMC;
			_tmp.setVal(val);
			_tmp.x = -10;
			_tmp.name="num";
			_timer_but.visible=true;
			_timer_base_x = _timer_but.x;
			_timer_base_y = _timer_but.y;
			_timer_but.addChild(_tmp);
			if(_secondTick)
				_secondTick.removeEventListener(TimerEvent.TIMER, onSecondTick);
			
			var handleMouseOverTimer:* = function(e:MouseEvent):void{
				_timer_but.x = _timer_base_x -2;
				_timer_but.y = _timer_base_y -2;
			}
			var handleMouseOutTimer:* = function(e:MouseEvent):void{
				_timer_but.x = _timer_base_x;
				_timer_but.y = _timer_base_y;
			}
			var handleMouseClickTimer:* = function(e:MouseEvent):void{
				_battleStage.QueryEndOp();
			}
			_timer_but.addEventListener(MouseEvent.MOUSE_OVER,handleMouseOverTimer);
			_timer_but.addEventListener(MouseEvent.MOUSE_OUT,handleMouseOutTimer);
			_timer_but.addEventListener(MouseEvent.CLICK,handleMouseClickTimer);
			
			_secondTick = new Timer(1000,val);
			_secondTick.addEventListener(TimerEvent.TIMER, onSecondTick);
			_secondTick.start();
		}
		public function onEndOpOk():void{
			_timer_but.visible = false;
			_secondTick.stop();
		}
		public function onSecondTick(evt:TimerEvent):void{
			
			var tmp:ResNumMC = _timer_but.getChildByName("num") as ResNumMC;//_timer_but.getChildAt(1) as ResNumMC;
			if(tmp)
			{
				tmp.decVal();
				if(tmp._val==0)
				{
					_timer_but.visible=false;
					_timer_but.removeChildAt(1);
				}
			}
      }
	  
	
    }
}//package 

package {
    import flash.display.*;
 
    import flash.text.*;
	import flash.events.MouseEvent;
    public class roomsel_bar extends MovieClip {
		
        public function roomsel_bar(){
			stop();
			this.addEventListener(MouseEvent.MOUSE_OVER,HandleMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT,HandleMouseOut);
		}
        private function HandleMouseOver(e:MouseEvent):void{
			gotoAndStop(2);
		}
		private function HandleMouseOut(e:MouseEvent):void{
			gotoAndStop(1);
		}

		public function InitCallback(arg1:Function,arg2:Function,arg3:int):void{
			var onWatch:* = function(e:MouseEvent):void{
				arg1(arg3);
			};
			var onJoin:* = function(e:MouseEvent):void{
				arg2(arg3);
			};
			_watch_but.addEventListener(MouseEvent.MOUSE_UP,onWatch);
			_join_but.addEventListener(MouseEvent.MOUSE_UP,onJoin);
		}
    }
}//package 

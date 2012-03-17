package 
{
	import com.greensock.easing.Bounce;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	import flash.text.TextField;

	/**
	 * 被旋转的东西
	 * @author Tiger 1748055943@qq.com
	 * 2011-6-18 9:15
	 */
	public class mm extends MovieClip 
	{
		public var Angle:Number;
		private var _mID:int;
		public var stepAngle:Number;
		
		public function mm(id:int)
		{
			Angle = 0;
			stepAngle = 0;
			mID = id;
			stop();
			initMouseEvent();
		}
		
		private function initMouseEvent():void
		{
			this.buttonMode = true;
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
		}
		
		private function mouseHandler(e:MouseEvent):void 
		{
			switch(e.type)
			{
				case MouseEvent.MOUSE_OVER:
					TweenLite.to(this, .6, { scaleX:1.2, scaleY:1.2, ease: Bounce.easeOut } );
					break;
				case MouseEvent.MOUSE_OUT:
					TweenLite.to(this, .6, {scaleX:1,scaleY:1,ease:Bounce.easeOut } );
					break;
				case MouseEvent.MOUSE_DOWN:
					dispatchEvent(new DataEvent("selectItem", false, false, String(mID)));
					break;
			}
		}
		
		public function get mID():int { return _mID; }
		
		public function set mID(value:int):void 
		{
			_mID = value;
			gotoAndStop(value + 1);
		}
	}
	
}
package 
{
	import flash.display.MovieClip;
	import flash.events.DataEvent;
	import flash.events.MouseEvent;
	
	/**
	 * 本次用到的按钮
	 * @author Tiger 1748055943@qq.com
	 * 2011-6-18 9:55
	 */
	public class CircleBtn extends MovieClip 
	{
		private var _cBtnUseable:Boolean;
		private var canBeUse:Boolean = false;
		private var _isStateBtn:Boolean = false;					//是否为普通按钮(此法不规范，慎学)
		private var _isOpen:Boolean = false;						//状态按钮是否展开(此法不规范，慎学)
		
		public function CircleBtn()
		{
			initEvent();
		}
		
		private function initEvent():void
		{
			if (!canBeUse)
			{
				this.addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
				this.addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
				this.addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
				this.addEventListener(MouseEvent.MOUSE_UP, mouseHandler);
				jump(1);
				canBeUse = true;
				this.buttonMode = true;
			}
			
		}
		
		public function deletEvent():void
		{
			if (canBeUse)
			{
				this.removeEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
				this.removeEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
				this.removeEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
				this.removeEventListener(MouseEvent.MOUSE_UP, mouseHandler);
				canBeUse = false;
				jump(this.totalFrames);
			}
			
		}
		
		private function mouseHandler(e:MouseEvent):void 
		{
			switch(e.type)
			{
				case MouseEvent.MOUSE_DOWN:
					sendEvent(0);
					//isStateBtn?jump(3);
					break;
				case MouseEvent.MOUSE_OVER:
					isStateBtn?jump(isOpen?2:1):bPlay("rollOver");
					break;
				case MouseEvent.MOUSE_OUT:
					isStateBtn?jump(isOpen?2:1):bPlay("rollOut");
					break;
				case MouseEvent.MOUSE_UP:
					isStateBtn?jump(isOpen?2:1):jump(7);
					sendEvent(1);
					break;
			}
		}
		
		private function jump(frame:int):void
		{
			this.gotoAndStop(frame);
		}
		private function bPlay(label:String):void
		{
			this.gotoAndPlay(label);
		}
		
		private function sendEvent(kind:int):void
		{
			var midEvt:DataEvent = new DataEvent("btnMouse");
			midEvt.data = String(kind);
			dispatchEvent(midEvt);
		}
		
		public function get cBtnUseable():Boolean { return _cBtnUseable; }
		
		public function set cBtnUseable(value:Boolean):void 
		{
			_cBtnUseable = value;
			if (value)
			{
				initEvent();
			}
			else
			{
				deletEvent();
			}
		}
		
		public function get isStateBtn():Boolean { return _isStateBtn; }
		
		public function set isStateBtn(value:Boolean):void 
		{
			_isStateBtn = value;
		}
		
		public function get isOpen():Boolean { return _isOpen; }
		
		public function set isOpen(value:Boolean):void 
		{
			_isOpen = value;
			jump(value?2:1);
		}
	}
	
}
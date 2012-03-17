package{
	
	import org.effects.DockButton;
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	import com.greensock.TweenLite;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TintPlugin;
	
	public class OverButton extends DockButton{
		
		private var _object:DisplayObject;
		
		public function OverButton():void{
			_object=this.getChildAt(0);
			this.addEventListener(MouseEvent.MOUSE_OVER,mouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT,mouseOut);
			TweenPlugin.activate([TintPlugin]);
		}
		
		private function mouseOver(e:MouseEvent):void{
			new TweenLite(_object,.5,{tint:0x990099});
		}
		
		private function mouseOut(e:MouseEvent):void{
			new TweenLite(_object,.5,{tint:null});
		}
	}
}
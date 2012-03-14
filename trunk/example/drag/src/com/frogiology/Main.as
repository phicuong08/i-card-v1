package com.frogiology {
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Main extends Sprite {
	//	public var mc1:MovieClip;
	//	public var mc2:MovieClip;
		public var m1:mc1;
		public var m2:mc2;
		private var offset:Point;
		
		public function Main() {
			m1 = new mc1;
			m1.z = 0;
			m2 = new mc2;
			m2.z = 10;
			//var t1:mc1 = new mc1;
			addChild(m1);
			addChild(m2);

			m1.buttonMode = true;
			m1.addEventListener(MouseEvent.MOUSE_DOWN, this.onMc1MouseDown);
			m1.addEventListener(MouseEvent.MOUSE_UP, this.onMc1MouseUp);
			m1.addEventListener(MouseEvent.MOUSE_OVER, this.onMc1MouseOver);
			m1.addEventListener(MouseEvent.MOUSE_OUT, this.onMc1MouseOut);
			
			m2.buttonMode = true;
			m2.addEventListener(MouseEvent.MOUSE_DOWN, this.onMc2MouseDown);
			m2.addEventListener(MouseEvent.MOUSE_UP, this.onMc2MouseUp);
		}
		
		//for mc1
		private function onMc1MouseDown(e:MouseEvent):void {
			m1.startDrag();
			
		}
		
		private function onMc1MouseOver(e:MouseEvent):void {
			Tweener.addTween(m1, {
				scaleX: 1.1,
				scaleY: 1.1,
				scaleZ: 1.1,
				time: 1,
				transition: "easeOutElastic"
			});
			
		}
		private function onMc1MouseOut(e:MouseEvent):void {
			Tweener.addTween(m1, {
				scaleX: 1,
				scaleY: 1,
				scaleZ: 1,
				time: 1,
				transition: "easeOutElastic"
			});
			
		}
		
		private function onMc1MouseUp(e:MouseEvent):void {
			m1.stopDrag();
		}
		
		//for mc2
		private function onMc2MouseDown(e:MouseEvent):void {
			

		
			stage.addEventListener(MouseEvent.MOUSE_MOVE, this.onMc2MouseMove);
			stage.addEventListener(MouseEvent.MOUSE_UP, this.onMc2MouseUp);
			
			this.offset = new Point(-this.m2.mouseX, -this.m2.mouseY);
		
		}
		
		private function onMc2MouseMove(e:MouseEvent):void {
			
			
			Tweener.addTween(m2, {
				x: this.mouseX + this.offset.x,
				y: this.mouseY + this.offset.y,
				time: 1
			});
		
		}
		
		private function onMc2MouseUp(e:MouseEvent):void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, this.onMc2MouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMc2MouseUp);
		}
	}
}
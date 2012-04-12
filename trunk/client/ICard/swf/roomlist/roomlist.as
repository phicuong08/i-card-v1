package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
		import flash.events.MouseEvent;
    public class roomlist extends MovieClip implements IRoomList{
        public var _fresh_but:SimpleButton;
		public var _quick_but:SimpleButton;
		
        public function roomlist(){
						//InitCallback(f1,f2);
						var index:int= 1;
						while(index <=7)
						{
								InitBar(this["_bar" + index++] as Object);
						}
//						InitBar(_bar1);
//						InitBar(_bar2);
//						InitBar(_bar3);
//						InitBar(_bar4);
//						InitBar(_bar5);
//						InitBar(_bar6);
//						InitBar(_bar7);
					
				}
        public function get content():MovieClip{
            return (this);
        }
				public function InitCallback(arg1:Function,arg2:Function,arg3:Function,arg4:Function):void
				{
						var index:int= 1;
						while(index <=7)
						{
								InitBarCallback(this["_bar" + index] as Object,arg1,arg2,index++);
						}
//						InitBarCallback(_bar1,arg1,arg2,1);
//						InitBarCallback(_bar2,arg1,arg2,2);
//						InitBarCallback(_bar3,arg1,arg2,3);
//						InitBarCallback(_bar4,arg1,arg2,4);
//						InitBarCallback(_bar5,arg1,arg2,5);
//						InitBarCallback(_bar6,arg1,arg2,6);
//						InitBarCallback(_bar7,arg1,arg2,7);
						_fresh_but.addEventListener(MouseEvent.CLICK,arg3);
						_quick_but.addEventListener(MouseEvent.CLICK,arg4);
				}
				private function InitBar(bar:Object):void{
						bar.stop();
						var handleMouseOver:* = function(e:MouseEvent):void{
							bar.gotoAndStop(2);
						}
						var handleMouseOut:* = function(e:MouseEvent):void{
							bar.gotoAndStop(1);
						}
						bar.addEventListener(MouseEvent.MOUSE_OVER,handleMouseOver);
						bar.addEventListener(MouseEvent.MOUSE_OUT,handleMouseOut);
				}
		
				private function InitBarCallback(bar:Object,arg1:Function,arg2:Function,arg3:int):void{
						var onWatch:* = function(e:MouseEvent):void{
							arg1(arg3);
						};
						var onJoin:* = function(e:MouseEvent):void{
							arg2(arg3);
						};
						bar._watch_but.addEventListener(MouseEvent.MOUSE_UP,onWatch);
						bar._join_but.addEventListener(MouseEvent.MOUSE_UP,onJoin);
				}
	
				public function UpdateRoom(id:int,owner:String,slotInfo:String,
															joinAble:Boolean,watchAble:Boolean,started:Boolean):void{
						var bar:Object = this["_bar" + id] as Object;
						bar._watch_but.enabled  = watchAble;
						bar._join_but.enabled = joinAble;
				}
		
		
    }
}//package 

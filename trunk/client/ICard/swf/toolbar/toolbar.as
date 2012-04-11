package {
    import flash.display.*;
	import flash.geom.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class toolbar extends Sprite implements IToolbar{

       	private var _tip:ITip;
		
        public function toolbar(){
		}
        public function get content():Sprite{
            return (this);
        }
		public function init():void{
			
		}
		public function reposition(_arg1:int, _arg2:int, _arg3:int, _arg4:int, _arg5:Point):void{
        //    _arg3 = Math.min(_arg3, stage.stageWidth);
//            _arg4 = Math.min(_arg4, stage.stageHeight);
//            this._MiniMap.x = Math.max((this._miniMapXY[0] - _arg5.x), (_arg3 - (_arg1 - this._miniMapXY[0])));
//            this._QuestTrace.x = Math.max((this._questTraceXY[0] - _arg5.x), (_arg3 - (_arg1 - this._questTraceXY[0])));
//            this._FunctionBar.x = Math.max((this._functionBarXY[0] - _arg5.x), (_arg3 - (_arg1 - this._functionBarXY[0])));
//            this._FunctionBar.y = Math.max((this._functionBarXY[1] - _arg5.y), (_arg4 - (_arg2 - this._functionBarXY[1])));
//            this.switchBubble(this._messageCount);
        }
		public function set onExit(_arg1:Function):void
		{
			_tip.addTarget(_toolbar._exit_but, "Exit");
			_toolbar._exit_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onSet(_arg1:Function):void
		{
			_toolbar._set_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onGold(_arg1:Function):void
		{
			_toolbar._gold_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onFriend(_arg1:Function):void
		{
			_toolbar._friend_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onTask(_arg1:Function):void
		{
			_toolbar._task_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onPack(_arg1:Function):void
		{
			_toolbar._pack_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onGuy(_arg1:Function):void
		{
			_toolbar._guy_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
				
		public function set tip(_arg1:ITip):void{
		    _tip = _arg1;
		}
    }
}//package 

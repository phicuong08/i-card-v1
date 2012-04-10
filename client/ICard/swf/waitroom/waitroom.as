package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class waitroom extends MovieClip implements IWaitRoom{

       	public var _battle_but:SimpleButton;
		public var _exit:MovieClip;
		
        public function waitroom(){
			InitPanel(true,true);
			InitPanel(false,false);
			
			
		}
        public function get content():MovieClip{
            return (this);
        }
		private function InitPanel(bUpPanel:Boolean,bOwner:Boolean):void
		{
			
			if(bUpPanel)
			{
				if(bOwner)
				{
					_panel_up._cardgroup.visible = true;
					_panel_up._ready_mc.visible = false;
					_panel_up._start_but.visible = true;
				}
				else
				{
					_panel_up._cardgroup.visible = false;
					_panel_up._ready_mc.visible = true;
					_panel_up._start_but.visible = false;
				}
			}
			else
			{
				if(bOwner)
				{
					_panel_down._cardgroup.visible = true;
					_panel_down._ready_mc.visible = false;
					_panel_down._start_but.visible = true;
				}
				else
				{
					_panel_down._cardgroup.visible = false;
					_panel_down._ready_mc.visible = true;
					_panel_down._start_but.visible = false;
				}
			}
		}
		public function set onInvite(_arg1:Function):void{
				_top_bar._invite_but.addEventListener(MouseEvent.CLICK,_arg1);
    	}
    	public function set onBye(_arg1:Function):void{
    		_top_bar._bye_but.addEventListener(MouseEvent.CLICK,_arg1);
   		}
    	public function set onLock(_arg1:Function):void{
    		_top_bar._lock_but.addEventListener(MouseEvent.CLICK,_arg1);
    	}
  		public function set onStart(_arg1:Function):void{
  			_panel_up._start_but.addEventListener(MouseEvent.CLICK,_arg1);
  			_panel_down._start_but.addEventListener(MouseEvent.CLICK,_arg1);
  		}
	
    }
}//package 

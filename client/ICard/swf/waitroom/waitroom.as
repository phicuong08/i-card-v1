package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class waitroom extends MovieClip implements IWaitRoom{

       	public var _battle_but:SimpleButton;
		public var _exit:MovieClip;
		
        public function waitroom(){
			clearRoom();
		}
		private function clearRoom():void
		{
			_panel_up._cardgroup.visible = false;
			_panel_up._ready_mc.visible = false;
			_panel_up._start_but.visible = false;
			_panel_up._guy_text.text = "";
			_panel_up._lev_text.text = "";
			
			_panel_down._cardgroup.visible = false;
			_panel_down._ready_mc.visible = false;
			_panel_down._start_but.visible = false;
			_panel_down._guy_text.text = "";
			_panel_down._lev_text.text = "";
		}
        public function get content():MovieClip{
            return (this);
        }
		public function UpdatePlayerList(players:Array):void{
			clearRoom();
			var info:Object;
			var bUp:Boolean = true;
			for each(info in players)
			{
				if(info.bPlayer==false)
				{
					continue;
				}
				InitPanel(bUp,info);
				bUp = false;
			}
			
		}
		private function InitPanel(bUpPanel:Boolean,info:Object):void{
			var panel:MovieClip = (bUpPanel)? _panel_up:_panel_down;
			panel._cardgroup.visible = (info.bOwner)?true:false;
			panel._guy_text.text = info.guyname;
			panel._lev_text.text = info.guylev;
			if(info.bReady)
			{
				panel._ready_mc.visible = true;
				panel._start_but.visible = false;
			}
			else
			{
				panel._ready_mc.visible = false;
				panel._start_but.visible = (info.bOwner)?true:false;
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

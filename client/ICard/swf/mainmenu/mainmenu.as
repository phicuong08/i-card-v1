package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class mainmenu extends MovieClip implements IMainMenu{

        public var _battle_but:SimpleButton;
		public var _train_but:SimpleButton;
        public var _vs_but:SimpleButton;
        public var _race_but:SimpleButton;
        public var _card_but:SimpleButton;
		public var _shop_but:SimpleButton;
		
		public var _exit:MovieClip;
		
        public function mainmenu(){

			
//			_battle_but.enabled = false;
		}
        public function get content():MovieClip{
            return (this);
        }
		public function ShowMainBut(arg1:Boolean):void
		{
			_battle_but.visible = arg1;
			_train_but.visible = arg1;
			_vs_but.visible = arg1;
			_race_but.visible = arg1;
			_card_but.visible = arg1;
			_shop_but.visible = arg1;
		}
		public function set onExit(_arg1:Function):void
		{
			_exit._exit_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onSet(_arg1:Function):void
		{
			_exit._set_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onGold(_arg1:Function):void
		{
			_exit._gold_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onFriend(_arg1:Function):void
		{
			_exit._friend_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onTask(_arg1:Function):void
		{
			_exit._task_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onPack(_arg1:Function):void
		{
			_exit._pack_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onGuy(_arg1:Function):void
		{
			_exit._guy_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onBattle(_arg1:Function):void
		{
			_battle_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onTrain(_arg1:Function):void
		{
			_train_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onVS(_arg1:Function):void
		{
			_vs_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onRace(_arg1:Function):void
		{
			_race_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onCard(_arg1:Function):void
		{
			_card_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onShop(_arg1:Function):void
		{
			_shop_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
    }
}//package 

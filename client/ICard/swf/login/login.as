package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class login extends MovieClip implements ILogin{

        public var _usr_input:TextField;
        public var _pwd_input:TextField;
        public var _login_but:SimpleButton;
        public var _reg_but:SimpleButton;

        public function login(){
		}
        public function get content():MovieClip{
            return (this);
        }
        
        function frame1(){
            stop();
        }
		public function set onLogin(_arg1:Function):void
		{
			_login_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function set onReg(_arg1:Function):void
		{
			_reg_but.addEventListener(MouseEvent.CLICK,_arg1);
		}
		public function get usrName():String{
			return _usr_input.text;
		}
		public function get usrPwd():String{
			return _pwd_input.text;
		}
    }
}//package 

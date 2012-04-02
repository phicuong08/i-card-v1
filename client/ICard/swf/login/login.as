package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;

    public class login extends MovieClip implements ILogin{

        public var _usr_input:TextField;
        public var _pwd_input:TextField;
        public var _ok_but:SimpleButton;
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
		}
		public function set onReg(_arg1:Function):void
		{
		}
		public function get usrName():String{
			return _usr_input.text;
		}
		public function get usrPwd():String{
			return _pwd_input.text;
		}
    }
}//package 

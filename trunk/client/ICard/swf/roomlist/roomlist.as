package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.events.MouseEvent;
    public class roomlist extends MovieClip implements IRoomList{

        public var _fresh_but:SimpleButton;
		public var _quick_but:SimpleButton;
     	public var _bar1:roomsel_bar;
		
		
		
        public function roomlist(){
			InitCallback(f1,f2);
		}
        public function get content():MovieClip{
            return (this);
        }
		public function InitCallback(arg1:Function,arg2:Function):void
		{
			_bar1.InitCallback(arg1,arg2,1);
			_bar2.InitCallback(arg1,arg2,2);
			_bar3.InitCallback(arg1,arg2,3);
			_bar4.InitCallback(arg1,arg2,4);
			_bar5.InitCallback(arg1,arg2,5);
			_bar6.InitCallback(arg1,arg2,6);
			_bar7.InitCallback(arg1,arg2,7);
		}
		
    }
}//package 

package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;

    public class InitLoading extends MovieClip implements IInitLoading {

        public var _Tip:TextField;
        public var _loadTxt:TextField;
        public var _loadBar:MovieClip;
        public var _loadBall:MovieClip;

        public function InitLoading(){
			_loadTxt = new TextField;
			
            addFrameScript(0, this.frame1);

			_Tip.text = "Tryp to loading";
			render("abc",5);
        }
        public function get content():MovieClip{
            return (this);
        }
        public function set tip(_arg1:String):void{
            this._Tip.text = _arg1;
        }
        public function render(_arg1:String, _arg2:int):void{
 //           this._loadBar.width = (3.84 * _arg2);
 //           this._loadBall.x = (this._loadBar.width + this._loadBar.x);
            this._loadTxt.text = _arg1;
        }
        function frame1(){
            stop();
        }

    }
}//package 

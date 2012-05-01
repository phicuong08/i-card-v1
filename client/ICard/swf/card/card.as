package {
    import flash.display.*;
    //import ICard.assist.view.interfaces.*;
    import flash.text.*;
	import flash.display.BitmapData;
	import flash.events.MouseEvent;
    public class card extends MovieClip{
        public function card(){
			
			var bitmapdata:c_50009 = new c_50009;
			addChild(bitmapdata);

		}
        public function get content():MovieClip{
            return (this);
        }

    }
}//package 

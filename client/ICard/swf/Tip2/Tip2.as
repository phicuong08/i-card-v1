//Created by Action Script Viewer - http://www.buraks.com/asv
package {
    import flash.display.*;
    import ICard.assist.view.interfaces.*;
    import flash.text.*;
    import flash.geom.*;

    public class Tip2 extends TipBase implements ITip2 {

        public var _Icon:MovieClip;
        public var _Content:TextField;
        public var _Background:MovieClip;
        public var _Title:TextField;

        public function Tip2(){
            _title = this._Title;
            _content = this._Content;
            _icon = this._Icon;
            this._Background.scale9Grid = new Rectangle(10, 10, (this._Background.width - 20), (this._Background.height - 20));
        }
        override public function show(_arg1:String, _arg2:String, _arg3:int):void{
            super.show(_arg1, _arg2, _arg3);
            _title.autoSize = TextFieldAutoSize.LEFT;
            _content.autoSize = TextFieldAutoSize.LEFT;
            var _local4:Number = Math.max(_title.width, _content.width);
            var _local5:Number = Math.min(_title.x, _content.x);
            this._Background.width = Math.max(((_local5 + _local4) + 23), 272);
        }

    }
}//package 

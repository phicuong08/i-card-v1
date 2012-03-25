//Created by Action Script Viewer - http://www.buraks.com/asv
package chat_system {
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;

    public class ChatWindowNameSprite extends Sprite {

        public function ChatWindowNameSprite(_arg1:String, _arg2:String, _arg3:uint=0xFFFFFF){
            this.mouseEnabled = false;
            this.mouseChildren = false;
            this.y = 4;
            switch (_arg2){
                case "vip":
                    this.graphics.beginFill(0xFFCC00);
                    _arg3 = 13843199;
                    break;
                case "purple":
                    this.graphics.beginFill(13843199, 0.5);
                    break;
                case "system":
                    this.graphics.beginFill(0xFF9600, 0.5);
                    break;
                default:
                    this.graphics.beginFill(0xA2FF00, 0.5);
            };
            var _local4:ByteArray = new ByteArray();
            _local4.writeMultiByte(_arg1, "gb2312");
            var _local5:Number = ((_local4.length * 6) + 8);
            var _local6:Number = 17;
            this.graphics.drawRoundRect(0, 1, _local5, _local6, 5, 5);
            this.graphics.beginFill(0, 0);
            this.graphics.drawRect(_local5, 1, 5, _local6);
            this.graphics.endFill();
            var _local7:TextField = new TextField();
            _local7.selectable = false;
            _local7.defaultTextFormat = new TextFormat(null, 12, _arg3, null, null, null, null, null, "center");
            _local7.text = _arg1;
            _local7.width = _local5;
            _local7.height = _local6;
            this.addChild(_local7);
        }
    }
}//package chat_system 

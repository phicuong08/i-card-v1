//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.assist {
    import flash.events.*;
    import flash.display.*;
    import flash.text.*;

    public class ClickTipList extends Sprite {

        private static const fun:Function = new Function();

        public var maxW:int = 0;
        public var onTextClick:Function;
        public var onRemoveStage:Function;
        public var datas:Array;
        public var tfList:Array;

        public function ClickTipList(_arg1:Array, _arg2:Array=null, _arg3:Function=null):void{
            var _local5:TextField;
            var _local6:String;
            this.datas = [];
            this.tfList = [];
            super();
            this.onRemoveStage = fun;
            this.datas = ((_arg2) || (_arg1));
            this.onTextClick = ((_arg3) || (fun));
            this.maxW = 30;
            var _local4:int;
            for each (_local6 in _arg1) {
                _local5 = new TextField();
                _local5.width = 100;
                _local5.height = 18;
                _local5.htmlText = (("<P ALIGN=\"center\"><font color=\"#fffffff\">" + _local6) + "</font></P>");
                _local5.name = (_local4 + "");
                _local5.selectable = false;
                _local5.y = (_local4 * 19);
                _local5.addEventListener(MouseEvent.CLICK, this.textClick);
                _local5.addEventListener(MouseEvent.MOUSE_OVER, this.onTextMouseOver);
                this.addChild(_local5);
                if (this.maxW < (_local5.textWidth + 3)){
                    this.maxW = (_local5.textWidth + 3);
                };
                this.tfList.push(_local5);
                _local4++;
            };
            for each (_local5 in this.tfList) {
                _local5.width = this.maxW;
            };
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.removeStageHandler, true);
        }
        private function removeStageHandler(_arg1:Event):void{
            this.onRemoveStage();
        }
        private function textClick(_arg1:Event):void{
            var _local2:int = int(_arg1.currentTarget.name);
            this.onTextClick(this.datas[_local2]);
        }
        private function onTextMouseOver(_arg1:Event):void{
            this.graphics.clear();
            this.graphics.beginFill(6113324, 1);
            this.graphics.drawRect(0, (_arg1.currentTarget.y + 1), this.maxW, 18);
        }
        private function onTextMouseOut(_arg1:Event):void{
            this.graphics.clear();
        }

    }
}//package com.assist 

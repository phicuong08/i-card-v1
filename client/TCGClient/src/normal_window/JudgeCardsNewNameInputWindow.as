//Created by Action Script Viewer - http://www.buraks.com/asv
package normal_window {
    import mx.events.*;
    import flash.events.*;
    import ui_element.*;

    public class JudgeCardsNewNameInputWindow extends TextInputWindow {

        private var dealFunc:Function;

        public function JudgeCardsNewNameInputWindow(_arg1:Function){
            this.dealFunc = _arg1;
        }
        override protected function confirmBtn_clickHandler(_arg1:MouseEvent):void{
            var _local2:* = this.dealFunc(textInput.text);
            if (_local2 == true){
                textInput.text = "";
                removeSelf();
            };
            if ((_local2 is String)){
                confirmBtn.toolTip = null;
                confirmBtn.toolTip = _local2;
            };
        }
        protected function mouseOutHandler(_arg1:MouseEvent):void{
            confirmBtn.toolTip = null;
        }
        override protected function group_creationCompleteHandler(_arg1:FlexEvent):void{
            descText.text = "请输入新的卡组名称：";
            confirmBtn.addEventListener(MouseEvent.ROLL_OUT, this.mouseOutHandler);
            textInput.setFocus();
        }

    }
}//package normal_window 

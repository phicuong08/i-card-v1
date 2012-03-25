//Created by Action Script Viewer - http://www.buraks.com/asv
package player_view {
    import mx.events.*;
    import flash.events.*;
    import normal_window.*;
    import ui_element.*;
    import combat_element_script.*;

    public class SearchPlayerWindow extends TextInputWindow {

        public function SearchPlayerWindow(){
            this.addEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
            TCGClient.getInstance().addEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stageChangeHandler);
        }
        override protected function group_creationCompleteHandler(_arg1:FlexEvent):void{
            depth = 150;
            descText.text = "请输入玩家昵称：";
            confirmBtn.label = "查找";
            textInput.addEventListener(KeyboardEvent.KEY_DOWN, this.txtInput_keyDownHandler);
            textInput.setFocus();
        }
        protected function stageChangeHandler(_arg1:CustomStateChangeEvent):void{
            removeSelf();
        }
        protected function removeFromStageHandler(_arg1:Event):void{
            this.removeEventListener(Event.REMOVED_FROM_STAGE, this.removeFromStageHandler);
            TCGClient.getInstance().removeEventListener(CustomStateChangeEvent.CURRENT_STATE_CHANGE, this.stageChangeHandler);
            if (PlayViewMgr.getInstance().searchPlayerWindow == this){
                PlayViewMgr.getInstance().searchPlayerWindow = null;
            };
        }
        override protected function confirmBtn_clickHandler(_arg1:MouseEvent):void{
            this.startSearch();
        }
        protected function startSearch():void{
            var _local1:*;
            if (((textInput.text) && ((textInput.text.length > 0)))){
                _local1 = UserObject.checkUserName(textInput.text);
                if (_local1 != true){
                    confirmBtn.toolTip = _local1;
                } else {
                    PlayViewMgr.getInstance().getDetailInfo(textInput.text);
                    removeSelf();
                };
            };
        }
        protected function txtInput_keyDownHandler(_arg1:KeyboardEvent):void{
            if (_arg1.charCode == 13){
                this.startSearch();
            };
        }

    }
}//package player_view 

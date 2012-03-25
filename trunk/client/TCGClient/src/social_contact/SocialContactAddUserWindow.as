//Created by Action Script Viewer - http://www.buraks.com/asv
package social_contact {
    import mx.events.*;
    import flash.events.*;
    import ui_element.*;
    import combat_element_script.*;

    public class SocialContactAddUserWindow extends TextInputWindow {

        public var isFriendMode:Boolean = true;

        public function SocialContactAddUserWindow(_arg1:Boolean){
            this.isFriendMode = _arg1;
            super();
        }
        override protected function group_creationCompleteHandler(_arg1:FlexEvent):void{
            depth = 5;
            descText.text = (this.isFriendMode) ? "输入好友玩家昵称：" : "输入忽略玩家昵称：";
            confirmBtn.label = "确定";
            textInput.addEventListener(KeyboardEvent.KEY_DOWN, this.txtInput_keyDownHandler);
            textInput.setFocus();
        }
        override protected function confirmBtn_clickHandler(_arg1:MouseEvent):void{
            this.doAdd();
        }
        protected function doAdd():void{
            var _local1:*;
            if (((textInput.text) && ((textInput.text.length > 0)))){
                _local1 = UserObject.checkUserName(textInput.text);
                if (_local1 != true){
                    confirmBtn.toolTip = _local1;
                } else {
                    if (this.isFriendMode){
                        SocialContactMgr.getInstance().tryAddFriend(textInput.text);
                    } else {
                        SocialContactMgr.getInstance().tryAddIgnore(textInput.text);
                    };
                    removeSelf();
                };
            };
        }
        protected function txtInput_keyDownHandler(_arg1:KeyboardEvent):void{
            if (_arg1.charCode == 13){
                this.doAdd();
            };
        }

    }
}//package social_contact 

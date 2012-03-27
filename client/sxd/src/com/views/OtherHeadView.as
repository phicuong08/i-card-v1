//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import flash.display.*;
    import com.assist.view.info.*;
    import com.haloer.display.*;
    import flash.text.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class OtherHeadView extends Base implements IView {

        public var info:PlayerInfo;
        private var _target:MovieClip;
        private var _pid:int = 0;
        private var _icon:Sprite;

        public function OtherHeadView(){
            this._icon = new Sprite();
            super();
        }
        override public function get inStage():Boolean{
            return (((this._target) && (!((this._target.stage == null)))));
        }
        public function show():void{
            if ((((this.info == null)) || ((this.info.isMine == true)))){
                this.info = null;
                this.close();
            } else {
                if (this._pid != this.info.id){
                    this._pid = this.info.id;
                    loadAssets("OtherHead", null, OtherHeadViewLang.LoadInfo, true, false, this.loadComplete);
                };
            };
        }
        public function close():void{
            this._pid = 0;
            if (((this._target) && (this._target.parent))){
                this._target.parent.removeChild(this._target);
            };
        }
        public function clear():void{
        }
        private function loadComplete():void{
            var _local1:Shape;
            if (this._target == null){
                _local1 = new Shape();
                _local1.graphics.beginFill(0, 1);
                _local1.graphics.drawCircle(36, 37, 37);
                _local1.x = 14;
                _local1.y = 14;
                this._icon.x = 13;
                this._icon.y = 14;
                this._icon.graphics.clear();
                this._icon.graphics.beginFill(0, 1);
                this._icon.graphics.drawRect(0, 0, 76, 76);
                this._icon.mask = _local1;
                this._target = (_view.getAssetsObject("OtherHead", "MCHead") as MovieClip);
                this._target.addChildAt(this._icon, 2);
                this._target.addChildAt(_local1, 3);
                this._target.BtnMsg.addEventListener(MouseEvent.CLICK, this.clickMsg);
                this._target.BtnFocus.addEventListener(MouseEvent.CLICK, this.clickFocus);
                this._target.BtnTalk.addEventListener(MouseEvent.CLICK, this.clickTalk);
                this._target.BtnFlower.addEventListener(MouseEvent.CLICK, this.clickFlower);
                this._target.x = 250;
                this._target.y = 5;
            };
            if (this._pid == 0){
                return;
            };
            _popup.addChild(this._target);
            _data.call(Mod_Player_Base.get_other_player_info, this.get_other_player_info_back, [this._pid]);
            this._target.TFName.text = this.info.name;
            this.headImgUrl = this.info.fullHeadUrl;
            this.FlowerVisible = FunctionType.isOpened(FunctionType.SendFlower);
            this.FriendVisible = FunctionType.isOpened(FunctionType.Friend);
            _view.tip.iTip.removeTarget(this._icon);
            this.player_info_contrast();
        }
        private function set FlowerVisible(_arg1:Boolean):void{
            this._target.BtnFlower.visible = _arg1;
            this._target.BtnTalk.x = (_arg1) ? 156 : 96;
        }
        private function set FriendVisible(_arg1:Boolean):void{
            this._target.BtnFocus.visible = _arg1;
            this._target.BtnTalk.visible = _arg1;
        }
        private function set headImgUrl(_arg1:String):void{
            while (this._icon.numChildren) {
                this._icon.removeChildAt(0);
            };
            this._icon.addChild(new Image(_arg1));
        }
        private function clickFocus(_arg1:Event):void{
            _view.friendList.addFriend("", this.info.id);
        }
        private function clickMsg(_arg1:Event):void{
            _view.otherRoleMsg.init(this.info.id, this.info.name);
            _view.otherRoleMsg.show();
        }
        private function clickFlower(_arg1:Event):void{
            this._view.sendFlower.sendPlayerID = this._pid;
            this._view.sendFlower.show();
        }
        private function clickTalk(_arg1:Event):void{
            _view.friendChat.get_friendinfo_chatrecord_list(this.info.id);
        }
        private function get_other_player_info_back():void{
            this._target.TFLevel.text = (_ctrl.player.otherPlayerLv + "");
        }
        private function player_info_contrast():void{
            if (_view.toolbar.isShowPlayerInfo == false){
                return;
            };
            _data.call(Mod_Player_Base.player_info_contrast, this.player_info_contrast_back, [this._pid], false);
        }
        private function player_info_contrast_back():void{
            var _local1:Object = this._ctrl.player.playerInfoContrastData;
            var _local2:String = (((((((((((((((((OtherHeadViewLang.RankIng + _local1.rankIng) + "\n") + ((_local1.factionName)=="") ? "" : ((OtherHeadViewLang.FactionName + _local1.factionName) + "\n")) + OtherHeadViewLang.Combat) + _local1.combat) + "\n") + OtherHeadViewLang.Fame) + _local1.fame) + "\n") + OtherHeadViewLang.AchievmentPoints) + _local1.achievmentPoints) + "\n") + OtherHeadViewLang.FirstAttack) + _local1.firstAttack) + "\n") + OtherHeadViewLang.FlowerCount) + _local1.flowerCount);
            _local2 = (("<textformat leading='8'><font color='#ffffff'>" + _local2) + "</font></textformat>");
            var _local3:TextField = new TextField();
            _local3.mouseEnabled = false;
            _local3.wordWrap = true;
            _local3.multiline = true;
            _local3.textColor = 0xFFFFFF;
            _local3.htmlText = _local2;
            _local3.width = (_local3.textWidth + 5);
            _local3.height = (_local3.textHeight + 5);
            _view.tip.iTip.addTarget(this._icon, _local3);
        }

    }
}//package com.views 

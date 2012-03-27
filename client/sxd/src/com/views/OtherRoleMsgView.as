//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.view.map.*;
    import com.assist.view.pack.*;
    import com.assist.view.toolbar.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.text.*;

    public class OtherRoleMsgView extends Base implements IView {

        private var _playerName:String = "";
        private var _playerid:int = 0;
        private var _target:IRoleMsgSee;
        private var _boxlist:Array;
        private var _frameSprite:IFrameSprite;
        private var _clickBox:BoxGrid;

        public function OtherRoleMsgView(){
            this._boxlist = [];
            super();
        }
        public function show():void{
            this.get_role_list(this._playerid);
            if (_view.immortalityMsg.inStage){
                _view.immortalityMsg.close();
            };
        }
        public function close():void{
            _popup.closeView(this);
            if (_view.immortalityMsg.inStage){
                _view.immortalityMsg.close();
            };
        }
        public function clear():void{
        }
        public function init(_arg1:int, _arg2:String):void{
            this._playerid = _arg1;
            this._playerName = _arg2;
            if (_arg2 == null){
                this._playerName = "";
            };
        }
        private function loadComplete():void{
            var _local1:BoxGrid;
            var _local2:int;
            var _local3:Array;
            var _local4:RoleInfo;
            if (this._target == null){
                this._target = (_view.getAssetsObject("RoleMsgSee", "MCRoleMsgSee") as IRoleMsgSee);
                this._target.onClose = this.close;
                this._target.onLabel = this.nameLabelClick;
                this._target.onSeeRoleInfo = this.onSeeRoleInfo;
                this._target.onStrength = this.onStrength;
                this._target.onFlowers = this.onFlowers;
                this._target.onTip = this.onTip;
                this._frameSprite = MapStatic.mapInstance.frame;
                this._target.bodyCanvas.addChild(this._frameSprite.content);
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _local3 = this._target.boxList;
                _local2 = 0;
                while (_local2 < 6) {
                    _local1 = new BoxGrid((BoxGrid.idRole + _local2), BoxGrid.typeRole, _local3[_local2]);
                    _local1.onClick = this.boxClick;
                    this._boxlist[_local1.id] = _local1;
                    _local2++;
                };
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            _local3 = _ctrl.rolemsg.otherRoleList;
            for each (_local4 in _local3) {
                _local4.showOtherStrength = _view.toolbar.isShowPlayerInfo;
                _local4.showOtherFlowers = FunctionType.isOpened(FunctionType.SendFlower);
                if (_local4.ismain){
                    this._playerName = _local4.name;
                };
            };
            this._target.initHeroNameList(_local3);
            this.nameLabelClick();
            _view.addToFrameProcessList(String(this), this.enterFrameHandler);
        }
        private function onTip(_arg1:DisplayObject, _arg2:Object=null):void{
            if (_arg1 == null){
                return;
            };
            if ((((_arg2 == null)) || ((_arg2 == "")))){
                _view.tip.iTip.removeTarget(_arg1);
            } else {
                _view.tip.iTip.addTarget(_arg1, _arg2);
            };
        }
        private function boxClick(_arg1:BoxGrid):void{
            if (_arg1.itemId == 0){
                return;
            };
            this.showClickTip(_arg1, [OtherRoleMsgViewLang.Show]);
        }
        private function showClickTip(_arg1:BoxGrid, _arg2:Array):void{
            if (_arg2.length == 0){
                return;
            };
            this._clickBox = _arg1;
            this._clickBox.lockLight = true;
            var _local3:ClickTipList = new ClickTipList(_arg2, _arg2, this.onTextClick);
            _local3.onRemoveStage = this.tipRemoveStageHandler;
            _view.tip.iTip.clickToOpen(_local3);
        }
        private function onTextClick(_arg1:String):void{
            _view.chat.showMsg([ChatMsgType.Item, this._clickBox.itemId, this._clickBox.item.upgradeLevel, this._clickBox.playerItemId, this._clickBox.item.goldId, this._playerName]);
        }
        private function tipRemoveStageHandler():void{
            this._clickBox.lockLight = false;
        }
        private function enterFrameHandler():void{
            if (inStage == false){
                _view.removeFromFrameProcessList(String(this));
                return;
            };
            this._frameSprite.pass(_view.time2);
        }
        private function nameLabelClick():void{
            this._target.updateRoleMsg();
            this._frameSprite.initUrl(this._target.selected.sign, "stand");
            this._frameSprite.dir = 1;
            this._frameSprite.petLv = this._target.selected.petLv;
            if (_ctrl.rolemsg.flowersTips != ""){
                _view.tip.iTip.addTarget(this._target.mcFlowers, _ctrl.rolemsg.flowersTips);
            } else {
                _view.tip.iTip.removeTarget(this._target.mcFlowers);
            };
            if (_view.roleDetailInfo.inStage){
                this._view.roleDetailInfo.updateDetailInfo(this._target.selected.playerRoleId, this._target.selected.name);
            };
            this.dujie_info(this.playerRoleId);
            this.get_player_role_equip_list(this._target.selected.playerRoleId);
            this.get_role_fate_list();
        }
        private function onSeeRoleInfo():void{
            if (_view.roleDetailInfo.inStage){
                this._view.roleDetailInfo.updateDetailInfo(this._target.selected.playerRoleId, this._target.selected.name);
            } else {
                this._view.roleDetailInfo.playerRoleId = this._target.selected.playerRoleId;
                this._view.roleDetailInfo.playerName = this._target.selected.name;
                this._view.roleDetailInfo.show();
            };
        }
        public function get playerRoleId():int{
            if ((((this._target == null)) || ((inStage == false)))){
                return (0);
            };
            return (this._target.selected.playerRoleId);
        }
        private function onStrength():void{
            this._view.playerCompare.myPlayerId = this._ctrl.player.playerId;
            this._view.playerCompare.myName = this._ctrl.player.nickname;
            this._view.playerCompare.anotherPlayerId = this._playerid;
            this._view.playerCompare.anotherName = this._playerName;
            this._view.playerCompare.switchSelf();
        }
        private function onFlowers():void{
            this._view.sendFlower.sendPlayerID = this._playerid;
            this._view.sendFlower.switchSelf();
        }
        private function get_player_role_equip_list(_arg1:int):void{
            _data.call(Mod_Item_Base.get_player_role_equip_list, this.get_player_role_equip_list_back, [_arg1]);
        }
        private function get_player_role_equip_list_back():void{
            var _local2:BoxGrid;
            if (inStage == false){
                return;
            };
            var _local1:Array = _ctrl.item.gridsRoleOther;
            for each (_local2 in this._boxlist) {
                _local2.item = _local1[_local2.id];
            };
        }
        private function get_role_list(_arg1:int):void{
            _data.call(Mod_Role_Base.get_role_list, this.get_role_list_back, [_arg1]);
        }
        private function get_role_list_back():void{
            loadAssets("RoleMsgSee", null, OtherRoleMsgViewLang.LoadTip, false, false, this.loadComplete);
        }
        private function get_role_fate_list():void{
            _data.call(Mod_Fate_Base.get_role_fate_list, this.get_role_fate_list_back, [this.playerRoleId]);
        }
        private function get_role_fate_list_back():void{
            var _local4:Object;
            var _local5:TextField;
            var _local1:String = "";
            var _local2:Array = _ctrl.fate.roleFateData.fateList;
            var _local3:Array = [];
            for each (_local4 in _local2) {
                if (_local4.isEmpty == false){
                    _local1 = ((("\n" + HtmlText.format(((_local4.fateName + "  Lv.") + _local4.fateLevel), _local4.color)) + "  ") + HtmlText.format((_local4.info + _local4.addValue), 0xFF6600));
                    _local3.push({
                        p:((_local4.quality * 1000) + _local4.fateLevel),
                        s:_local1
                    });
                };
            };
            _local3.sortOn("p", (Array.NUMERIC | Array.DESCENDING));
            _local1 = "";
            for each (_local4 in _local3) {
                _local1 = (_local1 + _local4.s);
            };
            if (_local1 == ""){
                this._target.mcFate.visible = false;
                _view.tip.iTip.removeTarget(this._target.mcFate);
            } else {
                _local1 = (((("<b><font size=\"14\" color=\"#ffffff\">" + OtherRoleMsgViewLang.Fate) + _ctrl.fate.roleFateData.fatePower) + "</font></b>") + _local1);
                _local1 = (("<textformat leading='6'>" + _local1) + "</textformat>");
                _local5 = new TextField();
                _local5.autoSize = TextFieldAutoSize.LEFT;
                _local5.htmlText = _local1;
                _local5.width = (_local5.textWidth + 5);
                _local5.height = (_local5.textHeight + 5);
                _view.tip.iTip.addTarget(this._target.mcFate, _local5);
                this._target.mcFateText.text = (_ctrl.fate.roleFateData.fatePower + "");
                this._target.mcFate.visible = true;
            };
        }
        private function dujie_info(_arg1:int):void{
            this._target.tfDuJie.text = "";
            _data.call(Mod_Dujie_Base.dujie_info, this.dujie_info_back, [_arg1]);
        }
        private function dujie_info_back():void{
            if (_ctrl.dujie.playerRoleId == this.playerRoleId){
                this._target.tfDuJie.htmlText = _ctrl.dujie.dujieName;
            };
        }

    }
}//package com.views 

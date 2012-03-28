//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.guide.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.interfaces.map.*;
    import com.assist.view.map.*;
    import com.assist.view.pack.*;
    import com.assist.view.sound.*;
    import com.assist.view.toolbar.*;
    import com.controllers.*;
    import com.haloer.display.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;

    public class RoleMsgView extends com.views.Base implements IView {

        private var _target:IRoleMsg;
        private var _boxlist:Array;
        private var _boxTypeList:Array;
        private var _frameSprite:IFrameSprite;
        private var _autoEQ:Array;
        private var _clickTime:int = 0;
        private var _clickBox:BoxGrid;
        private var _lockList:Array;
        private var _fireeId:int = 0;
        private var _dujieLei:Image;

        public function RoleMsgView(){
            this._boxlist = [];
            this._boxTypeList = [];
            this._autoEQ = [];
            this._lockList = [];
            super();
        }
        public function show():void{
            if (this.inStage){
                return;
            };
            if (_view.factionWarMap.isFactionWarStart == true){
                return;
            };
            this.get_role_list();
            if (_view.pack.inStage == false){
                _data.call(Mod_Item_Base.get_player_pack_item_list, null, [], false);
            };
        }
        public function close():void{
            _view.removeFromFrameProcessList(sign);
            _popup.closeView(this);
            BoxGrid.eqList = null;
            ItemInfo.roleJobId = 0;
            ItemInfo.roleLv = 0;
            _view.pack.changeRole(false);
            if (_view.training.inStage){
                _view.training.close();
            };
            if (_view.immortalityMsg.inStage){
                _view.immortalityMsg.close();
            };
            this._view.guide.closeRoleMsgGuides();
        }
        public function clear():void{
        }
        private function get item():ItemController{
            return (_ctrl.item);
        }
        private function get rolemsg():RoleMsgController{
            return (_ctrl.rolemsg);
        }
        private function get player():PlayerController{
            return (_ctrl.player);
        }
        public function get playerRoleId():int{
            if (this._target == null){
                return (0);
            };
            return (this._target.selected.playerRoleId);
        }
        public function get roleJobId():int{
            if (this._target == null){
                return (0);
            };
            return (this._target.selected.jobId);
        }
        public function get roleName():String{
            if (this._target == null){
                return ("");
            };
            return (this._target.selected.name);
        }
        public function get roleLv():int{
            if (this._target == null){
                return (0);
            };
            return (this._target.selected.lv);
        }
        public function get content():Sprite{
            return (this._target.content);
        }
        override public function get inStage():Boolean{
            return (((this._target) && (!((this._target.content.stage == null)))));
        }
        private function loadComplete():void{
            var _local1:BoxGrid;
            var _local2:int;
            var _local3:Array;
            var _local4:Array;
            if (this._target == null){
                this._target = (_view.getAssetsObject("RoleMsg", "MCRoleMsg") as IRoleMsg);
                this._target.onClose = this.close;
                this._target.onLabel = this.onLabel;
                this._target.onTraining = this.onTraining;
                this._target.onFire = this.onFire;
                this._target.onTip = this.onTip;
                this._target.onFate = this.onFate;
                this._target.onGenSui = this.onGenSui;
                this._target.onDanYao = this.onDanYao;
                this._target.onFlower = this.onFlower;
                this._target.onChuanCheng = this.onChuanCheng;
                this._target.onSeeRoleInfo = this.onSeeRoleInfo;
                this._target.onDuJie = this.onDuJie;
                this._target.onDuJieAdd = this.onDuJieAdd;
                this._target.onYaoQing = this.onYaoQing;
                this._frameSprite = MapStatic.mapInstance.frame;
                this._target.bodyCanvas.addChild(this._frameSprite.content);
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                _local4 = [RoleMsgViewLang.TouKui, RoleMsgViewLang.WuQi, RoleMsgViewLang.HunQi, RoleMsgViewLang.YiFu, RoleMsgViewLang.HuFu, RoleMsgViewLang.XieZi];
                _local3 = this._target.boxList;
                _local2 = 0;
                while (_local2 < 6) {
                    _local1 = new BoxGrid((BoxGrid.idRole + _local2), BoxGrid.typeRole, _local3[_local2]);
                    _local1.onClick = this.boxClick;
                    _local1.onDoubleClick = this.boxDoubleClick;
                    _local1.onDrag = this.boxDrag;
                    _local1.onDragView = this.boxDragView;
                    _local1.can = [(_local2 + 1)];
                    _local1.defaultTips = _local4[_local2];
                    _local1.onEqUpdate = this.onEqUpdate;
                    _local1.onGoldUpdate = this.onGoldUpdate;
                    _view.tip.iTip.addTarget(_local1.btnUpdate, RoleMsgViewLang.UpdateEQ);
                    _view.tip.iTip.addTarget(_local1.btnGold, RoleMsgViewLang.UpdateGold);
                    this._boxlist[_local1.id] = _local1;
                    this._boxTypeList[(_local2 + 1)] = _local1;
                    _local2++;
                };
            };
            if (this.inStage == false){
                _popup.addView(this, this._target.content);
            };
            this._target.initHeroNameList(this.rolemsg.roleList);
            this.onLabel();
            _view.addToFrameProcessList(String(this), this.enterFrameHandler);
            this._view.guide.trackTraining(2, this._target.content, (this._target.btnTraining.x + 10), (this._target.btnTraining.y + 8));
            this.now_and_next_Recommend_role_list();
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
        private function enterFrameHandler():void{
            if (this.inStage == false){
                _view.removeFromFrameProcessList(String(this));
                return;
            };
            this._frameSprite.pass(_view.time2);
        }
        private function onLabel():void{
            this._target.updateRoleMsg();
            this._frameSprite.initUrl(this._target.selected.sign, "stand");
            this._frameSprite.dir = 1;
            this._frameSprite.petLv = this._target.selected.petLv;
            switch (this._target.selected.sign){
                case RoleType.SaFeiLuoSi:
                case RoleType.HeiYiFeiYu:
                    this._frameSprite.content.y = 28;
                    break;
                case RoleType.HeBo:
                    this._frameSprite.content.y = 20;
                    break;
                default:
                    this._frameSprite.content.y = 0;
            };
            if (_view.training.inStage){
                _view.training.roleInfo = this._target.selected;
                _view.training.show();
            };
            if (_view.immortalityMsg.inStage){
                _view.immortalityMsg.playerRoleId = this.playerRoleId;
                _view.immortalityMsg.roleName = this.roleName;
                _view.immortalityMsg.roleLv = this.roleLv;
                _view.immortalityMsg.show();
            };
            if (_view.roleDetailInfo.inStage){
                this._view.roleDetailInfo.updateDetailInfo(this.playerRoleId, this.roleName);
            };
            if (_view.dujie.inStage){
                _view.dujie.close();
            };
            BoxGrid.eqList = this._boxTypeList;
            ItemInfo.playerlv = this.player.level;
            ItemInfo.roleLv = this.roleLv;
            ItemInfo.roleJobId = this.roleJobId;
            this.updateDuJie();
            this.updateEquipList();
            this.updateFate();
            this._view.guide.setPoint(GuideType.Training, (this._target.btnTraining.x + 10), (this._target.btnTraining.y + 8));
        }
        private function onFate():void{
            if (_view.fate.inStage == false){
                _view.fate.showRoleId = this.playerRoleId;
                _view.fate.show();
            };
        }
        private function onTraining():void{
            if (_view.training.inStage){
                _view.training.close();
            } else {
                _view.training.roleInfo = this._target.selected;
                _view.training.show();
            };
        }
        private function onFire():void{
            _view.alert.showYesNoMsg(Lang.sprintf(RoleMsgViewLang.Leave, this.roleName), RoleMsgViewLang.Yes, RoleMsgViewLang.No, function (_arg1:uint):void{
                if (_arg1 == AlertButtonType.Yes){
                    down_partners();
                };
            });
        }
        private function onFlower():void{
            this._view.myFlowerRecord.switchSelf();
        }
        private function onChuanCheng():void{
            this._view.inherit.playerRoleId = this.playerRoleId;
            this._view.inherit.show();
        }
        private function onSeeRoleInfo():void{
            if (_view.roleDetailInfo.inStage){
                this._view.roleDetailInfo.updateDetailInfo(this.playerRoleId, this.roleName);
            } else {
                this._view.roleDetailInfo.playerRoleId = this.playerRoleId;
                this._view.roleDetailInfo.playerName = this.roleName;
                this._view.roleDetailInfo.show();
            };
        }
        private function onDanYao():void{
            if (_view.immortalityMsg.inStage){
                _view.immortalityMsg.close();
            } else {
                _view.immortalityMsg.playerRoleId = this.playerRoleId;
                _view.immortalityMsg.roleName = this.roleName;
                _view.immortalityMsg.roleLv = this.roleLv;
                _view.immortalityMsg.show();
            };
            if (_view.otherRoleMsg.inStage){
                _view.otherRoleMsg.close();
            };
        }
        private function onGenSui():void{
            var _local1:RoleInfo = this._target.selected;
            var _local2:int = (this.player.playerInfo.followRoleId = (_local1.isFollow) ? 0 : _local1.roleId);
            this._target.updateRoleMsg();
            _view.missionMap.showFollow(this.player.playerId, _local2);
            _data.call(Mod_Role_Base.set_follow_role, null, [((_local2)==0) ? 0 : _local1.playerRoleId]);
        }
        private function onEqUpdate(_arg1:BoxGrid):void{
            this._clickTime = (getTimer() + 500);
            var _local2:Object = this.item.hasReelList[_arg1.itemId];
            _view.refine.initdata(_local2.item_id, _local2.player_item_id, _arg1.item.goldId, _arg1.item.playerItemId);
            _view.refine.show();
        }
        private function onGoldUpdate(_arg1:BoxGrid):void{
            this._clickTime = (getTimer() + 500);
            var _local2:Object = this.item.hasGoldList[_arg1.item.goldId];
            _view.armsGold.selectPlayerItemId = _arg1.playerItemId;
            _view.armsGold.goldId = _local2.item_id;
            _view.armsGold.playerItemId = _local2.player_item_id;
            _view.armsGold.show();
        }
        private function boxClick(_arg1:BoxGrid):void{
            if (this._clickTime > getTimer()){
                return;
            };
            if (_arg1.itemId != 0){
                this.showClickTip(_arg1, [RoleMsgViewLang.Show, RoleMsgViewLang.Unload]);
            } else {
                if (this._autoEQ[_arg1.id] != 0){
                    _view.pack.autoEQAtPlayerItemId(this._autoEQ[_arg1.id], this.playerRoleId);
                };
            };
        }
        private function showClickTip(_arg1:BoxGrid, _arg2:Array):void{
            if (_arg2.length == 0){
                return;
            };
            this._clickBox = _arg1;
            this._clickBox.lockLight = true;
            this._lockList.push(this._clickBox);
            var _local3:ClickTipList = new ClickTipList(_arg2, _arg2, this.onTextClick);
            _local3.onRemoveStage = this.releaseLock;
            _view.tip.iTip.clickToOpen(_local3);
        }
        private function onTextClick(_arg1:String):void{
            if (_arg1 == RoleMsgViewLang.Unload){
                this.boxDoubleClick(this._clickBox);
            } else {
                if (_arg1 == RoleMsgViewLang.Show){
                    _view.chat.showMsg([ChatMsgType.Item, this._clickBox.itemId, this._clickBox.item.upgradeLevel, this._clickBox.playerItemId, this._clickBox.item.goldId, this.player.nickname]);
                };
            };
        }
        private function boxDoubleClick(_arg1:BoxGrid):void{
            this.remove_player_role_equipment(_arg1, null);
            if (_view.pack.inStage == false){
                _view.pack.show();
            };
        }
        private function boxDrag(_arg1:BoxGrid, _arg2:BoxGrid):void{
            if (_arg2.isPackBox == false){
                return;
            };
            this.remove_player_role_equipment(_arg1, _arg2);
        }
        private function boxDragView(_arg1:BoxGrid, _arg2:Object):void{
            if (_arg2 === _view.pack.target){
                this.remove_player_role_equipment(_arg1, null);
            };
        }
        private function onDuJie():void{
            var _local2:RoleInfo;
            var _local4:Object;
            var _local1:Array = [];
            var _local3:Object = {
                label:RoleMsgViewLang.SelectHelp,
                id:0,
                headUrl:"",
                lv:0
            };
            for each (_local2 in this.rolemsg.roleList) {
                if (_local2.playerRoleId != this.playerRoleId){
                    _local4 = {
                        label:_local2.name,
                        id:_local2.playerRoleId,
                        headUrl:_local2.headUrl,
                        lv:_local2.lv
                    };
                    _local4.label = Lang.sprintf(RoleMsgViewLang.LvString, _local4.label, _local2.lv, RoleType.getJobName(_local2.jobId));
                    _local1.push(_local4);
                    if (_local3.lv < _local2.lv){
                        _local3 = _local4;
                    };
                };
            };
            _local2 = this._target.selected;
            _view.dujie.roleList = _local1;
            _view.dujie.defaultObj = _local3;
            _view.dujie.roleObj = {
                label:_local2.name,
                id:_local2.playerRoleId,
                headUrl:_local2.headUrl
            };
            _view.dujie.show();
        }
        private function onDuJieAdd():void{
            this.add_player_role_state_point();
        }
        private function onYaoQing():void{
            _view.partners.show();
        }
        private function updateGrids():void{
            var _local2:BoxGrid;
            var _local3:ItemInfo;
            if (this.inStage == false){
                return;
            };
            var _local1:Array = this.item.gridsRole;
            for each (_local2 in this._boxlist) {
                _local2.item = (_local1[_local2.id] as ItemInfo);
                this.updateEQBoxBtn(_local2);
                this._autoEQ[_local2.id] = 0;
                if (_local2.itemId == 0){
                    _local3 = _view.pack.getBestEQ(((_local2.can[0]) || (0)), this.roleLv, this.roleJobId);
                    if (_local3 != null){
                        this._autoEQ[_local2.id] = _local3.playerItemId;
                        _view.tip.iTip.addTarget(_local2.content, _local3.getTipsSprite1(HtmlText.format(RoleMsgViewLang.BestEQ, 8623050), HtmlText.format(RoleMsgViewLang.ClickEQ, 0x999999)));
                    };
                };
            };
            if (this._target.selected.ismain){
                _local2 = this._boxTypeList[ItemType.YiFu];
                this.player.playerInfo.signSuffix = ItemType.getItemSuffix(_local2.itemId);
                _view.missionMap.change_equip_main();
            };
        }
        private function updateEQBoxBtn(_arg1:BoxGrid):void{
            _arg1.eqUpdateVisible = (_arg1.goldVisible = false);
            var _local2:Object = this.item.hasReelList[_arg1.itemId];
            if (((!((_local2 == null))) && ((this.roleLv >= _local2.need_lv)))){
                _arg1.eqUpdateVisible = true;
            } else {
                _local2 = this.item.hasGoldList[_arg1.item.goldId];
                if (((((!((_local2 == null))) && ((_arg1.item.basic.require >= _local2.require)))) && ((_arg1.item.quality >= 4)))){
                    _arg1.goldVisible = true;
                };
            };
        }
        public function updateFate():void{
            if ((((this.inStage == false)) || ((this._target == null)))){
                return;
            };
            this.get_role_fate_list();
        }
        public function updateEquipList():void{
            if ((((this.inStage == false)) || ((this._target == null)))){
                return;
            };
            this.player_reel_need_item();
            this.get_role_equip_list();
            this.get_role_list_simpe();
        }
        public function updateDuJie():void{
            if ((((this.inStage == false)) || ((this._target == null)))){
                return;
            };
            this.dujie_info();
        }
        public function updateSimpe():void{
            if ((((this.inStage == false)) || ((this._target == null)))){
                return;
            };
            this.get_role_list_simpe();
        }
        public function equipLock(_arg1:int):void{
            var _local2:ItemBasically = ItemBasically.getBasic(_arg1);
            var _local3:BoxGrid = this._boxTypeList[_local2.type_id];
            if (((_local3) && ((_local2.jobArr[this.roleJobId] == 1)))){
                _local3.lockLight = true;
                this._lockList.push(_local3);
            };
        }
        public function releaseLock():void{
            while (this._lockList.length) {
                (this._lockList.pop() as BoxGrid).lockLight = false;
            };
        }
        private function get_role_list():void{
            _data.call(Mod_Role_Base.get_role_list, this.get_role_list_back, [this.player.playerId], false);
        }
        private function get_role_list_back():void{
            loadAssets("RoleMsg", this.loadComplete, RoleMsgViewLang.LoadTip);
        }
        private function get_role_equip_list():void{
            _data.call(Mod_Item_Base.get_role_equip_list, this.get_role_equip_list_back, [this.playerRoleId]);
        }
        private function get_role_equip_list_back():void{
            if (this.inStage == false){
                return;
            };
            this.updateGrids();
            _view.pack.changeRole(true);
        }
        private function remove_player_role_equipment(_arg1:BoxGrid, _arg2:BoxGrid):void{
            _data.call(Mod_Item_Base.remove_player_role_equipment, this.remove_player_role_equipment_back, [this.playerRoleId, _arg1.id, ((_arg2 == null)) ? 0 : _arg2.id]);
            this.item.pushRole(_arg1.id);
            _arg1.hideItem();
        }
        private function remove_player_role_equipment_back():void{
            this.updateGrids();
            if (this.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _view.pack.updateGrids();
                _view.pack.updateGridsTips();
                this.updateEquipList();
                SoundEffect.play(SoundEffect.Equip);
            } else {
                if (this.item.result == Mod_Item_Base.UN_AVALIABLE_GRID){
                    _view.showTip(RoleMsgViewLang.PageFull);
                } else {
                    _view.showTip(RoleMsgViewLang.UnloadFails);
                };
            };
        }
        private function down_partners():void{
            this._fireeId = this.playerRoleId;
            _data.call(Mod_Role_Base.down_partners, this.down_partners_back, [this.playerRoleId]);
        }
        private function down_partners_back():void{
            var _local1:Array;
            var _local2:int;
            var _local3:RoleInfo;
            if (this.rolemsg.result == Mod_Role_Base.SUCCEED){
                _local1 = this.rolemsg.roleList;
                _local2 = 0;
                for each (_local3 in _local1) {
                    if (_local3.playerRoleId == this._fireeId){
                        break;
                    };
                    _local2++;
                };
                if (_local3 != null){
                    if (_local3.isFollow){
                        this.player.playerInfo.followRoleId = 0;
                        _view.screen.currentMap.showFollow(this.player.playerId, 0);
                    };
                    _view.showTip(RoleMsgViewLang.UnloadSuccess, "", TipType.Success);
                    _local1.splice(_local2, 1);
                    this._target.initHeroNameList(_local1);
                    this.onLabel();
                    return;
                };
            };
        }
        private function get_role_list_simpe():void{
            _data.call(Mod_Role_Base.get_role_list_simpe, this.get_role_list_simpe_back, [this.playerRoleId]);
        }
        private function get_role_list_simpe_back():void{
            this._target.updateRoleMsg();
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
                _local1 = (htmlFormat((RoleMsgViewLang.Fate + _ctrl.fate.roleFateData.fatePower), 14, 0xFFFFFF) + _local1);
                _local1 = (("<textformat leading='6'>" + _local1) + "</textformat>");
                _local5 = new TextField();
                _local5.autoSize = TextFieldAutoSize.LEFT;
                _local5.htmlText = _local1;
                _local5.width = (_local5.textWidth + 5);
                _local5.height = (_local5.textHeight + 5);
                _view.tip.iTip.addTarget(this._target.mcFate, _local5);
                this._target.tfFate.text = (_ctrl.fate.roleFateData.fatePower + "");
                this._target.mcFate.visible = true;
            };
        }
        private function player_reel_need_item():void{
            _data.call(Mod_Item_Base.player_reel_need_item, this.player_reel_need_item_back, []);
        }
        private function player_reel_need_item_back():void{
            var _local1:BoxGrid;
            if (this.inStage == false){
                return;
            };
            for each (_local1 in this._boxTypeList) {
                this.updateEQBoxBtn(_local1);
            };
        }
        private function dujie_info():void{
            if (((this._dujieLei) && (this._dujieLei.parent))){
                this._dujieLei.parent.removeChild(this._dujieLei);
            };
            if (_ctrl.dujie.playerRoleId != this.playerRoleId){
                this._target.resetDuJie();
            };
            if (FunctionType.isOpened(FunctionType.DuJie) == false){
                return;
            };
            _data.call(Mod_Dujie_Base.dujie_info, this.dujie_info_back, [this.playerRoleId]);
        }
        private function dujie_info_back():void{
            var _local1:int;
            var _local2:int;
            var _local3:String;
            var _local4:String;
            if (_ctrl.dujie.playerRoleId == this.playerRoleId){
                _local1 = _ctrl.dujie.dujieState;
                _local2 = _ctrl.dujie.pointState;
                _local3 = _ctrl.dujie.dujieTip;
                _local4 = _ctrl.dujie.pointTip;
                if (_ctrl.dujie.playerRoleLv > this.roleLv){
                    if (_local2 == 1){
                        _local2 = 2;
                    };
                    if (_local1 == 1){
                        _local1 = 2;
                    };
                    _local3 = HtmlText.red((RoleMsgViewLang.LvReq + _ctrl.dujie.playerRoleLv));
                    _local4 = HtmlText.red((RoleMsgViewLang.LvReq + _ctrl.dujie.playerRoleLv));
                };
                this._target.updateDuJie(_local1, _ctrl.dujie.dujieName, _local2);
                if (_local1 == 1){
                    this._dujieLei = ((this._dujieLei) || (new Image((MapStatic.FolderEffects + "DuJieLei.swf"))));
                    this._dujieLei.x = -200;
                    this._dujieLei.y = -200;
                    this._target.bodyCanvas.addChild(this._dujieLei);
                    _local3 = (RoleMsgViewLang.ClickDujie + _local3);
                };
                _view.tip.iTip.addTarget(this._target.btnDueJie, _local3);
                _view.tip.iTip.addTarget(this._target.btnPoint, _local4);
            };
        }
        private function add_player_role_state_point():void{
            _data.call(Mod_Dujie_Base.add_player_role_state_point, this.add_player_role_state_point_back, [this.playerRoleId]);
        }
        private function add_player_role_state_point_back():void{
            if (_ctrl.dujie.result == Mod_Dujie_Base.SUCCESS){
                this.dujie_info();
                _view.showTip(RoleMsgViewLang.StateSuccess, null, TipType.Success);
            } else {
                if (_ctrl.dujie.result == Mod_Dujie_Base.ENOUGTH_PLAYER_ROLE_STATE_POINT){
                    _view.showTip(RoleMsgViewLang.StateFails);
                } else {
                    if (_ctrl.dujie.result == Mod_Dujie_Base.NOT_ENOGUTH_PLAYER_STATE_POINT){
                        _view.showTip(RoleMsgViewLang.StateLack);
                    };
                };
            };
        }
        private function now_and_next_Recommend_role_list():void{
            _data.call(Mod_Partners_Base.now_and_next_Recommend_role_list, this.now_and_next_Recommend_role_list_back, []);
        }
        private function now_and_next_Recommend_role_list_back():void{
            var _local1:String = _ctrl.partners.recommend;
            if (_local1 == ""){
                _view.tip.iTip.removeTarget(this._target.tfFame);
            } else {
                _view.tip.iTip.addTarget(this._target.tfFame, _ctrl.partners.recommend);
            };
        }

    }
}//package com.views 

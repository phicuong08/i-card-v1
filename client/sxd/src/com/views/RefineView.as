//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.info.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.pack.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;
    
    import flash.display.*;

    public class RefineView extends Base implements IView {

        private var _target:IRefine;
        public var reelItemId:int;
        public var reelPlayerItemId:int;
        public var eqGoldId:int;
        public var eqPlayerItemId:int;
        private var outItem:ItemInfo;
        private var cookieId:int = 0;
        private var isAuto:Boolean = false;
        private var materialList:Array;
        private var reelIngot:int = 0;
        private var reelMaterialEnough:Boolean = false;

        public function RefineView(){
            this.materialList = [];
            super();
        }
        public function initdata(_arg1:int, _arg2:int, _arg3:int, _arg4:int):void{
            this.reelItemId = _arg1;
            this.reelPlayerItemId = _arg2;
            this.eqGoldId = _arg3;
            this.eqPlayerItemId = _arg4;
        }
        public function close():void{
            this.reelItemId = (this.reelPlayerItemId = (this.eqGoldId = (this.eqPlayerItemId = 0)));
            _popup.closeView(this);
        }
        public function clear():void{
        }
        public function show():void{
            this.isAuto = false;
            this.get_facture_reel_data(this.reelItemId);
        }
        public function autoMerge():void{
            this.isAuto = true;
            this.get_facture_reel_data(this.reelItemId);
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("Refine", "MCRefine") as IRefine);
                this._target.onClose = this.close;
                this._target.onLianZhi = this.onLianZhi;
                this._target.onAutoMission = this.onAutoMission;
                this._target.onTip = this.onTip;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            if (inStage == false){
                _popup.addView(this, this._target.content);
            };
            var _local1:String = ((this.reelIngot > 0)) ? Lang.sprintf(RefineViewLang.SpendIngot, HtmlText.yellow2((this.reelIngot + ""))) : "";
            this._target.initList(this.materialList, _local1);
            this._target.itemUrl = this.outItem.iconUrl;
            this._target.itemMsg = this.outItem.easyMsg;
            this._target.itemNum = this.outItem.num;
            if (this.outItem.basic.type_id == ItemType.LianDanJuanZhou){
                this._target.showLianDan();
            } else {
                if (this.outItem.basic.type_id == ItemType.LianQiJuanZhou){
                    this._target.showLianZhi();
                };
            };
            _view.tip.iTip.addTarget(this._target.itemBox, this.outItem.getTipsSprite1("", ""));
        }
        private function onTip(_arg1:DisplayObject, _arg2:Object):void{
            if (_arg1 == null){
                return;
            };
            if ((((_arg2 == "")) || ((_arg2 == null)))){
                _view.tip.iTip.removeTarget(_arg1);
            } else {
                _view.tip.iTip.addTarget(_arg1, _arg2);
            };
        }
        private function parseData(_arg1:Array):void{
            var _local3:Array;
            var _local4:Object;
            var _local5:ItemBasically;
            var _local6:Array;
            this.reelIngot = _arg1[5];
            if (this.eqPlayerItemId != 0){
                _arg1[6] = this.eqPlayerItemId;
                _arg1[7] = this.eqGoldId;
            };
            this.outItem = new ItemInfo();
            this.outItem.parseSee(_arg1[1], _arg1[2], _arg1[7]);
            this.outItem.num = _arg1[3];
            this.outItem.playerItemId = _arg1[6];
            var _local2:int = _arg1[7];
            this.materialList = [];
            this.reelMaterialEnough = true;
            for each (_local3 in _arg1[4]) {
                _local4 = {};
                _local5 = ItemBasically.getBasic(_local3[0]);
                _local4.max = _local3[1];
                _local4.num = _local3[4];
                _local4.itemid = _local5.item_id;
                if (_local5.isEquip){
                    _local4.url = _local5.getImgUrl(_local2);
                    _local4.des = (HtmlText.format(_local5.getItemName(_local2), _local5.getItemColor(_local2)) + "\n");
                    if (this.eqPlayerItemId != 0){
                        _local4.num = 1;
                    };
                } else {
                    _local4.url = _local5.getImgUrl(0);
                    _local4.des = (HtmlText.format(_local5.getItemName(0), _local5.getItemColor(0)) + "\n");
                };
                _local4.tip = ((((_local5.getItemName(_local2) + " ") + _local4.num) + "/") + _local4.max);
                if (_local4.num >= _local4.max){
                    _local4.num = _local4.max;
                    _local4.tip = HtmlText.format(_local4.tip, 0xFF00);
                } else {
                    this.reelMaterialEnough = false;
                    _local4.tip = HtmlText.format(_local4.tip, 0xEEEEEE);
                };
                this.materialList.push(_local4);
                _local6 = _local3[3].split(",");
                if (_local6.length == 1){
                    _local4.mission = int(_local6[0]);
                } else {
                    if (FactionType.campSign(_ctrl.player.campId) == FactionType.ShuShanCheng){
                        _local4.mission = int(_local6[0]);
                    } else {
                        _local4.mission = int(_local6[1]);
                    };
                };
                _local4.town = MissionType.getTownIdByMissionId(_local4.mission);
                if (_local4.town != 0){
                    _local4.des = ((((_local4.des + TownType.getName(_local4.town)) + _local3[2]) + "\n") + HtmlText.format(RefineViewLang.AutoPathfinding, 0x888888));
                } else {
                    _local4.des = (_local4.des + _local3[2]);
                };
            };
        }
        private function onLianZhi(_arg1:int):void{
            var type:* = _arg1;
            if (type == 0){
                this.player_use_grid_reel(0);
            } else {
                if (_view.ingotEnough(this.reelIngot)){
                    this.checkBoxSelect(this.cookieId, Lang.sprintf(RefineViewLang.AskJuanZhou, HtmlText.yellow((this.reelIngot + RefineViewLang.Ingot))), function ():void{
                        player_use_grid_reel(type);
                    });
                };
            };
        }
        private function onAutoMission(_arg1:int, _arg2:int):void{
            if ((((_arg1 == 0)) || ((_arg2 == 0)))){
                return;
            };
            if (_view.townMap.inStage == false){
                _view.showTip(RefineViewLang.MustGoToTown);
                return;
            };
            if (MissionType.isHeroMission(_arg2)){
                _view.heroMission.autoMissionId(_arg1, _arg2, RefineViewLang.MaterialsFalling);
                _view.heroMission.show();
            } else {
                _view.chooseMission.autoMissionId(_arg2, RefineViewLang.MaterialsFalling);
                _view.chooseMission.showTownMission = _arg1;
            };
        }
        private function checkBoxSelect(_arg1:int, _arg2:String, _arg3:Function):void{
            var cookieId:* = _arg1;
            var msg:* = _arg2;
            var callback:* = _arg3;
            if (_view.consumeAlertSetting.isAlert(cookieId)){
                callback();
            } else {
                _view.alert.iAlert.hasCheckbox = true;
                _view.alert.showYesNoMsg(msg, RefineViewLang.Yes, RefineViewLang.No, function (_arg1:int):void{
                    if (_arg1 == AlertButtonType.Yes){
                        callback();
                        if (_view.alert.iAlert.checked == true){
                            _view.consumeAlertSetting.saveSetting(cookieId, true);
                        };
                    };
                });
            };
        }
        private function get_facture_reel_data(_arg1:int):void{
            this.cookieId = ((ItemBasically.getBasic(_arg1).type_id)==1001) ? ConsumeAlertSetType.RefineZhiZhuo1001 : ConsumeAlertSetType.RefineZhiZhuo1002;
            if (this.eqPlayerItemId == 0){
                _data.call(Mod_Item_Base.get_facture_reel_data, this.get_facture_reel_data_back, [_arg1]);
            } else {
                _data.call(Mod_Item_Base.get_player_item_facture_reel_data, this.get_facture_reel_data_back, [this.eqPlayerItemId, _arg1]);
            };
        }
        private function get_facture_reel_data_back():void{
            this.parseData(_ctrl.item.reelData);
            if (this.isAuto){
                if (this.reelIngot > 0){
                    if (_view.ingotEnough(this.reelIngot)){
                        this.checkBoxSelect(this.cookieId, Lang.sprintf(RefineViewLang.AskJuanZhou, HtmlText.yellow((this.reelIngot + RefineViewLang.Ingot))), function ():void{
                            player_use_grid_reel(1);
                        });
                    };
                } else {
                    if (this.reelMaterialEnough == true){
                        this.player_use_grid_reel(0);
                    } else {
                        _view.showTip(RefineViewLang.ShortageMaterials);
                    };
                };
            } else {
                loadAssets("Refine", null, RefineViewLang.LaodingRefineTip, false, false, this.loadComplete);
            };
        }
        private function player_use_grid_reel(_arg1:int):void{
            if (this.eqPlayerItemId != 0){
                _data.call(Mod_Item_Base.player_equip_use_reel, this.player_use_grid_reel_back, [this.eqPlayerItemId, this.reelPlayerItemId, _arg1]);
            } else {
                _data.call(Mod_Item_Base.player_use_grid_reel, this.player_use_grid_reel_back, [this.reelPlayerItemId, _arg1]);
            };
        }
        private function player_use_grid_reel_back():void{
            var _local1:String;
            if (_ctrl.item.result == Mod_Item_Base.ACTION_SUCCESS){
                _local1 = "";
                _local1 = Lang.sprintf(RefineViewLang.Synthesis, HtmlText.format(this.outItem.name, this.outItem.color, 12, "", true));
                _view.showTip(_local1, "", TipType.Success);
                if (this.eqPlayerItemId != 0){
                    _view.roleMsg.updateEquipList();
                } else {
                    _view.toolbar.playGoodsEffect(this.outItem.iconUrl);
                    _view.pack.updateGrids();
                };
                this.close();
            } else {
                if (_ctrl.item.result == Mod_Item_Base.MATERIAL_NOT_ENOUGH){
                    _view.showTip(RefineViewLang.ShortageMaterials);
                } else {
                    if (_ctrl.item.result == Mod_Item_Base.PACK_FULL){
                        _view.showTip(RefineViewLang.PageBoxLack);
                    } else {
                        _view.showTip(RefineViewLang.SynthesisFailure);
                    };
                };
            };
        }

    }
}//package com.views 

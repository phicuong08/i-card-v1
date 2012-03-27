//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;
    import com.assist.view.guide.*;

    public class NPCDialogView extends Base implements IView {

        private var _dialog:INPCDialog;
        private var _questId:int;
        public var npcSign:String;
        public var townNPCId:int;
        public var relatedView:IView;
        private var _acceptList:Object;
        private var _completeList:Object;

        public function NPCDialogView(){
            this._acceptList = {};
            this._completeList = {};
            super();
        }
        public function show():void{
            if (((((((_view.world.inStage) || (_view.takeBibleRoad.inStage))) || (_view.superSport.inStage))) || (_view.lodge.inStage))){
                return;
            };
            this._completeList = {};
            this.npc_info_by_npcid();
        }
        public function clear():void{
            if (this._dialog){
                this._dialog.clear();
                this._dialog = null;
            };
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        override public function get inStage():Boolean{
            return (((super.inStage) && (((((this._dialog) && ((this._dialog.npcId == this.townNPCId)))) || (true)))));
        }
        public function npc_info_by_npcid():void{
            _data.call(Mod_Quest_Base.npc_info_by_npcid, this.loadResources, [this.townNPCId]);
        }
        public function recall_npc_info_by_npcid(_arg1:Function=null):void{
            var callback:Function = _arg1;
            var handler:* = function ():void{
                renderData();
                if ((callback is Function)){
                    callback();
                };
            };
            _data.call(Mod_Quest_Base.npc_info_by_npcid, handler, [this.townNPCId]);
        }
        private function loadResources():void{
            loadAssets("NPCDialog", this.render, NPCDialogViewLang.LoadInfo);
        }
        public function render():void{
            this._dialog = (_view.getAssetsObject("NPCDialog", "NPCDialog") as INPCDialog);
            _popup.addView(this, this._dialog.content);
            this._dialog.content.x = 100;
            this._dialog.content.y = 100;
            this._dialog.iconUrl = (((URI.assetsUrl + "icons/npc_dialog/") + this.npcSign) + ".swf");
            this._dialog.npcId = this.townNPCId;
            this._dialog.npcSign = this.npcSign;
            this._dialog.npcName = NPCType.getNameBySign(this.npcSign);
            this._dialog.npcMessage = NPCType.getDialogBySign(this.npcSign);
            this.addFeature();
            this.addSlaveFeature();
            this._dialog.onClose = this.close;
            this._dialog.onFeature = this.onFeature;
            this._dialog.onSlaveFeature = this.onSlaveFeature;
            this._dialog.onAccept = this.onAccept;
            this._dialog.onComplete = this.onComplete;
            this._dialog.onAcceptNextForGuide = this.onAcceptNextForGuide;
            this._dialog.onAcceptLastForGuide = this.onAcceptLastForGuide;
            this.renderData();
        }
        private function addFeature():void{
            var _local1:String = NPCType.getFeatureBySign(this.npcSign);
            this._dialog.npcFeature = _local1;
        }
        private function addSlaveFeature():void{
            if ((((((NPCType.getFunctionBySign(this.npcSign) == NPCType.CardBuyNPC)) && ((TownNPCType.getNPCSoulIdList(this.townNPCId).length > 0)))) && (TownType.isOpened(TownType.YangZhouCheng)))){
                this._dialog.npcSlaveFeature = NPCDialogViewLang.ReplaceSoul;
            };
        }
        private function renderData():void{
            if (!this._dialog){
                return;
            };
            var _local1:Array = _ctrl.quest.npcInfoByNPCId;
            this._dialog.data = _local1;
            this._dialog.show();
            _view.center(sign, this._dialog.content);
            switch (this.npcSign){
                case NPCType.LiDaNiang:
                    _view.guide.trackPartners(2, this._dialog.content);
                    break;
                case NPCType.ShuiLing:
                    _view.guide.trackBeginner(2, this._dialog.content);
                    break;
                case NPCType.CunZhang:
                    _view.guide.trackBeginner(5, this._dialog.content);
                    break;
                case NPCType.TieSuanPan:
                    _view.guide.setPartnersIndex2(_ctrl.quest.npcInfoByNPCId.length);
                    _view.guide.trackPartners2(2, this._dialog.content);
                    break;
            };
        }
        private function onFeature():void{
            var _local1:String = TownType.getNPCSign(_ctrl.player.mapId, this.townNPCId);
            var _local2:int = NPCType.getFunctionBySign(_local1);
            this.relatedView = null;
            var _local3:String = "";
            switch (_local2){
                case NPCType.ItemShopNPC:
                case NPCType.EquiShopNPC:
                case NPCType.CardBuyNPC:
                    _view.shop.shopNpcId = this.townNPCId;
                    _view.shop.show();
                    this.relatedView = _view.shop;
                    break;
                case NPCType.WarehouseNPC:
                    if (FunctionType.isOpened(FunctionType.Warehouse) == false){
                        _local3 = Lang.sprintf(NPCDialogViewLang.ZhuYinShang, (MissionType.getSectionNameBySign(MissionType.XuYuHuanJing_1) + "1"));
                        _view.alert.confirm(_local3);
                    } else {
                        _view.warehouse.npcId = this.townNPCId;
                        _view.warehouse.show();
                        this.relatedView = _view.warehouse;
                    };
                    break;
                case NPCType.PartnersNPC:
                    _view.partners.switchSelf();
                    this.relatedView = _view.partners;
                    break;
                case NPCType.ChooseCampNPC:
                    _view.chooseCamp.switchSelf();
                    this.relatedView = _view.chooseCamp;
                    break;
                case NPCType.ActivationKeysNPC:
                    _view.activationKeys.show();
                    break;
                case NPCType.FateNPC:
                    if (FunctionType.isOpened(FunctionType.Fate)){
                        _view.lodge.switchSelf();
                    } else {
                        _local3 = Lang.sprintf(NPCDialogViewLang.XuYuHuanJing8, MissionType.getSectionNameBySign(MissionType.XuYuHuanJing_1));
                        _view.alert.confirm(_local3);
                    };
                    break;
                case NPCType.LuckyShopNPC:
                    if (FunctionType.isOpened(FunctionType.LuckyShop)){
                        _view.luckyShop.show();
                    } else {
                        _local3 = Lang.sprintf(NPCDialogViewLang.XuYuHuanJing2, MissionType.getSectionNameBySign(MissionType.XuYuHuanJing_1));
                        _view.alert.confirm(_local3);
                    };
                    break;
            };
            this.close();
        }
        private function onSlaveFeature():void{
            if ((((((NPCType.getFunctionBySign(this.npcSign) == NPCType.CardBuyNPC)) && ((TownNPCType.getNPCSoulIdList(this.townNPCId).length > 0)))) && (TownType.isOpened(TownType.YangZhouCheng)))){
                this._view.sealShop.npcId = this.townNPCId;
                this._view.sealShop.show();
            };
            this.close();
        }
        private function onAccept(_arg1:int, _arg2:String, _arg3:int, _arg4:int, _arg5:int):void{
            var questId:* = _arg1;
            var questName:* = _arg2;
            var npcTalk:* = _arg3;
            var endTownId:* = _arg4;
            var endNPCId:* = _arg5;
            if (this._acceptList[questId]){
                return;
            };
            this._acceptList[questId] = 1;
            this._questId = questId;
            var callback:* = function ():void{
                if (QuestType.FavoriteQuestId == questId){
                    close();
                    _view.addToFavorite();
                    _view.toolbar.loadQuestTrace();
                    delete _acceptList[questId];
                    return;
                };
                _view.chat.addSystemMessage(Lang.sprintf(NPCDialogViewLang.AcceptQuest, questName), 0xFFF200);
                var handler:* = function ():void{
                    delete _acceptList[questId];
                };
                if (1 == npcTalk){
                    _view.quest.markWayFinding();
                    if (60 == questId){
                        _view.townMap.playShuShangDrama();
                    } else {
                        if (endTownId != _ctrl.player.mapId){
                            _view.quest.wayFinding(((("npc," + endTownId) + ",") + endNPCId));
                        } else {
                            if (QuestType.getType(questId) == QuestType.Master){
                                _view.quest.moveToNPC(endTownId, endNPCId);
                                close();
                                handler();
                                return;
                            };
                        };
                    };
                } else {
                    if (QuestType.getType(questId) == QuestType.Master){
                        _view.quest.markWayFinding();
                        _view.quest.moveToMission(endTownId, QuestType.getMissionId(questId));
                        close();
                        handler();
                        return;
                    };
                };
                if (_ctrl.quest.isTwoCanOperate){
                    recall_npc_info_by_npcid(handler);
                } else {
                    close();
                    handler();
                };
            };
            _view.quest.accept_quest(questId, callback);
        }
        private function onComplete(_arg1:int, _arg2:String):void{
            var questId:* = _arg1;
            var questName:* = _arg2;
            this._questId = questId;
            if (this._completeList[questId]){
                return;
            };
            this._completeList[questId] = 1;
            var callback:* = function ():void{
                var _local1:int;
                _view.toolbar.loadQuestTrace();
                switch (_ctrl.quest.completedState){
                    case 0:
                        _view.showTip(NPCDialogViewLang.PackFull);
                        close();
                        break;
                    case -1:
                        _view.showTip(NPCDialogViewLang.QuestItem);
                        close();
                        break;
                    default:
                        _local1 = _ctrl.quest.awardItemId;
                        if (_local1 > 0){
                            _view.toolbar.playGoodsEffect(((URI.goodsIconUrl + _local1) + ".png"));
                            _view.chat.addSystemMessage(Lang.sprintf(NPCDialogViewLang.QuestAward, ItemType.getName(_local1)));
                        };
                        completeQuestCallback(questId, questName);
                        return;
                };
                delete _completeList[questId];
                _view.guide.hideAlongGuide();
            };
            _view.quest.complete_quest(questId, callback);
        }
        private function completeQuestCallback(_arg1:int, _arg2:String):void{
            var questId:* = _arg1;
            var questName:* = _arg2;
            _view.chat.addSystemMessage(Lang.sprintf(NPCDialogViewLang.QuestCompleted, questName), 0xFFF200);
            _view.townMap.showQuestOk();
            var callback:* = function ():void{
                delete _completeList[questId];
            };
            if (((_ctrl.quest.hasQuestForNPC) || (_ctrl.quest.isTwoCanOperate))){
                this.recall_npc_info_by_npcid(callback);
            } else {
                callback();
                this.close();
            };
        }
        private function onAcceptNextForGuide():void{
            this._view.guide.hideTrack(GuideType.Partners2);
        }
        private function onAcceptLastForGuide():void{
            if (this.npcSign == NPCType.ShuiLing){
                _view.guide.trackBeginner(3, this._dialog.content);
            };
            if (this.npcSign == NPCType.CunZhang){
                _view.guide.trackBeginner(6, this._dialog.content);
            };
        }

    }
}//package com.views 

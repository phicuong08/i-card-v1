//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import flash.display.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class LodgeView extends Base implements IView {

        private var _isUser:Boolean = false;
        private var _tempFateIdData:Object;
        private var isErr:Boolean = false;
        private var _summerNpcId:int = 0;
        private var _isFrist:Boolean = true;
        private var _isTopNpc:Boolean = false;
        private var _lodge:ILodge;
        private var _newNpcId:int = 0;
        private var _grid:int = 0;
        private var _gridLen:int = 0;
        private var _sellType:String = "";
        private var _sellData:Object;
        private var _buyNpcData:Object;
        private var _isFastFate:Boolean = false;

        public function LodgeView(){
            this._tempFateIdData = {};
            this._sellData = {};
            this._buyNpcData = {};
            super();
        }
        private function get_fate_npc():void{
            _data.call(Mod_Fate_Base.get_fate_npc, this.getFateNpcCallBack, []);
        }
        private function get_temp_fate():void{
            _data.call(Mod_Fate_Base.get_temp_fate, this.getTempFateCallBack, []);
        }
        private function pickup_fate(_arg1:Array):void{
            var _local2:Array = this.checkId(_arg1);
            if (_local2.length <= 0){
                return;
            };
            this._isUser = true;
            _data.call(Mod_Fate_Base.pickup_fate, this.pickupFateCallBack, [_arg1]);
        }
        private function sale_temp_fate(_arg1:Array):void{
            var _local2:Array = this.checkId(_arg1, true);
            if (_local2.length <= 0){
                return;
            };
            this._isUser = true;
            _data.call(Mod_Fate_Base.sale_temp_fate, new Function(), [_local2]);
            this.saleTempFateCallBack();
        }
        private function checkId(_arg1:Array, _arg2:Boolean=false):Array{
            var _local6:int;
            var _local7:int;
            var _local8:int;
            var _local3:int = _arg1.length;
            var _local4:Array = [];
            var _local5:int;
            while (_local5 < _local3) {
                _local6 = _arg1[_local5][0];
                if (this._tempFateIdData[_local6] == null){
                    _local4.push([_local6]);
                } else {
                    this.isErr = true;
                };
                _local5++;
            };
            if (this.isErr){
                this.get_temp_fate();
                return ([]);
            };
            if (_arg2){
                _local7 = _local4.Length;
                _local5 = 0;
                while (_local5 < _local3) {
                    _local8 = _local4[_local5];
                    this._tempFateIdData[_local6] = _local8;
                    _local5++;
                };
            };
            return (_local4);
        }
        private function saveCheckId(_arg1:Array):void{
            var _local4:int;
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = _arg1[_local3][0];
                if (this._tempFateIdData[_local4] == null){
                    this._tempFateIdData[_local4] = _local4;
                };
                _local3++;
            };
        }
        private function appoint_fate_npc(_arg1:int):void{
            this._newNpcId = _arg1;
            _data.call(Mod_Fate_Base.appoint_fate_npc, this.appointFateNpcCallBack, [_arg1]);
        }
        private function buy_fate_npc(_arg1:int):void{
            this._summerNpcId = _arg1;
            _data.call(Mod_Fate_Base.buy_fate_npc, this.buyFateNpcCallBack, [_arg1]);
        }
        private function getFateNpcCallBack():void{
            if (this.inStage == false){
                this.renderShow();
                return;
            };
            var _local1:Object = this._ctrl.fate.fateNpc;
            this._lodge.fateNpcList = _local1.fateNpcList;
            this._lodge.freeAppointTimes = _local1.freeAppointTimes;
        }
        private function getTempFateCallBack():void{
            if (this.inStage == false){
                return;
            };
            this._lodge.lootFateList = this._ctrl.fate.tempFate;
            _view.guide.trackFateLodge(2, this._lodge.lodgePlayer);
            this._isUser = false;
            this.isErr = false;
        }
        private function renderShow():void{
            loadAssets("Lodge", this.render, LodgeViewLang.LoadAssets);
        }
        private function appointFateNpcCallBack():void{
            if ((((this.inStage == false)) || ((this._lodge == null)))){
                return;
            };
            var _local1:Object = this._ctrl.fate.appointFateNpc;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                if (this._isFastFate){
                    if (_local1.fateNpcId != 5){
                        this.appoint_fate_npc(_local1.fateNpcId);
                    } else {
                        this._isFastFate = false;
                    };
                } else {
                    this._isUser = false;
                };
                if (_local1.fateNpcId == 5){
                    this.get_temp_fate();
                    _view.showTip(LodgeViewLang.FoundJZY, LodgeViewLang.SystemGo, TipType.Success);
                };
                this._lodge.freeAppointTimes = 0;
                if (_local1.type == "success"){
                    this._lodge.addDesignated = _local1;
                    if ((((_local1.fateNpcId == 1)) && ((this._newNpcId > 1)))){
                        _local1.fateNpcId = this._newNpcId;
                    };
                    this._lodge.setTextAnimation(_local1.fateNpcId, _local1.mainInfo);
                } else {
                    _view.showTip(LodgeViewLang.Fail, _local1.info, TipType.Failure);
                };
                this.get_fate_npc();
            } else {
                this.renderMsg(_local1.msg);
            };
            this._newNpcId = 0;
        }
        private function pickupFateCallBack():void{
            var _local2:Array;
            var _local1:Object = this._ctrl.fate.pickupFate;
            if ((((_local1.msg == Mod_Fate_Base.SUCCESS)) || ((_local1.msg == Mod_Fate_Base.BAG_FULL)))){
                _local2 = [];
                this.sortList(_local1.gridList);
                this.saveCheckId(_local1.gridList);
                this._lodge.pickUpAllFate = _local1.gridList;
                if (_view.fate.inStage){
                    _view.fate.refreshFate();
                };
                if (_local1.msg == Mod_Fate_Base.BAG_FULL){
                    _view.showTip(LodgeViewLang.BagFull);
                };
            } else {
                this.renderMsg(_local1.msg);
            };
            this.get_temp_fate();
            this._grid = 0;
        }
        private function sortList(_arg1:Array):void{
            var _local4:int;
            var _local5:Array;
            var _local2:int = _arg1.length;
            var _local3:int = 1;
            while (_local3 < _local2) {
                _local4 = 0;
                while (_local4 < (_local2 - 1)) {
                    if (_arg1[_local4][0] < _arg1[(_local4 + 1)][0]){
                        _local5 = _arg1[_local4];
                        _arg1[_local4] = _arg1[(_local4 + 1)];
                        _arg1[(_local4 + 1)] = _local5;
                    };
                    _local4++;
                };
                _local3++;
            };
        }
        private function saleTempFateCallBack():void{
            if (this._sellType == "all"){
                this._lodge.sellAllFate();
            } else {
                this._lodge.lootFateTempFateId(this._grid, "sell");
                this._lodge.clearDesignated = this._grid;
            };
            this.get_temp_fate();
        }
        private function buyFateNpcCallBack():void{
            var _local1:Object = _ctrl.fate.buyFateNpc;
            if (_local1.msg == Mod_Fate_Base.SUCCESS){
                this.get_fate_npc();
                this.appoint_fate_npc(this._summerNpcId);
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_Fate_Base.INVALID_FATE_NPC_ID:
                    break;
                case Mod_Fate_Base.FULL_TEMP_BAG:
                    _view.showTip(LodgeViewLang.FullTempBag);
                    this.get_temp_fate();
                    break;
                case Mod_Fate_Base.NOT_ENOUGH_COIN:
                    _view.showTip(LodgeViewLang.NotEnoughCoin);
                    break;
                case Mod_Fate_Base.BAG_FULL:
                    _view.showTip(LodgeViewLang.BagFull);
                    this.get_temp_fate();
                    break;
                case Mod_Fate_Base.FATE_CAN_PICK_UP:
                    _view.showTip(LodgeViewLang.FateCanPickUp);
                    break;
                case Mod_Fate_Base.INVALID_GRID:
                    _view.showTip(LodgeViewLang.InvalidGrid);
                    break;
                case Mod_Fate_Base.NOT_ENOUGH_INGOT:
                    _view.showTip(LodgeViewLang.NotEnoughIngot);
                    break;
                case Mod_Fate_Base.FULL_BUY_TIMES:
                    _view.showTip(LodgeViewLang.FullBuyTimes);
                    break;
            };
            this._isFastFate = false;
            this._isUser = false;
        }
        public function show():void{
            if (FunctionType.isOpened(FunctionType.Fate) == false){
                return;
            };
            if (_view.multiMission.isMinimumWithTip){
                return;
            };
            if (_view.missionPractice.inStageWithTip){
                return;
            };
            if (_view.heroPractice.inStageWithTip){
                return;
            };
            if (_view.zodiac.inStageWithTip){
                return;
            };
            this.get_fate_npc();
        }
        public function render():void{
            this._lodge = (_view.getAssetsObject("Lodge", "Lodge") as ILodge);
            _popup.addView(this, this._lodge.content);
            this._lodge.loadImage = _view.toolbar.getLoadEffectCircle;
            this._lodge.tip = _view.tip.iTip;
            this.renderLodge();
        }
        private function renderLodge():void{
            this._newNpcId = 0;
            this._grid = 0;
            this._isFrist = true;
            this.get_temp_fate();
            this.getFateNpcCallBack();
            this._lodge.renderIngot = this._ctrl.player.ingot;
            this._lodge.renderCoins = this._ctrl.player.coins;
            this._lodge.isVip5 = ((VIPType.check(VIPType.Level5)) || ((this._ctrl.player.level >= 90)));
            this._lodge.onOpenFate = function ():void{
                _view.fate.switchSelf();
                _view.guide.stopFateLodgeGuide(_lodge.lodgePlayer);
            };
            this._lodge.onClose = function ():void{
                close();
            };
            this._lodge.onStartFate = function (_arg1:int):void{
                if (_newNpcId == 0){
                    _isFastFate = false;
                    appoint_fate_npc(_arg1);
                };
                _view.guide.trackFateLodge(3, _lodge.fateMc);
            };
            this._lodge.onFastFate = function (_arg1:int):void{
                if (((_isUser) || (_isFastFate))){
                    _view.showTip(LodgeViewLang.InUse);
                } else {
                    _isUser = true;
                    _isFastFate = true;
                    appoint_fate_npc(_arg1);
                };
            };
            this._lodge.onAllSellFate = function (_arg1:Array):void{
                if (_isUser){
                    _view.showTip(LodgeViewLang.InUse);
                } else {
                    _sellType = "all";
                    sale_temp_fate(_arg1);
                };
            };
            this._lodge.onSellFate = function (_arg1:Object):void{
                var _local2:String;
                if (_isUser){
                    _view.showTip(LodgeViewLang.InUse);
                } else {
                    _sellData = _arg1;
                    if (_arg1.quality > 4){
                        _local2 = ((((((("<font color=\"#ffffff\">" + LodgeViewLang.SellFate) + "</font>") + "<font color=\"#") + _arg1.color.toString(16)) + "\">") + _arg1.fateName) + "</font>");
                        _view.alert.showYesNoMsg(_local2, LodgeViewLang.Sure, LodgeViewLang.Cancel, onOneSell);
                        return;
                    };
                    sellFate();
                };
            };
            this._lodge.onPickUpFate = function (_arg1:Array):void{
                if (_isUser){
                    _view.showTip(LodgeViewLang.InUse);
                } else {
                    pickup_fate(_arg1);
                    _view.guide.stopFateLodgeGuide(_lodge.lodgePlayer);
                };
            };
            this._lodge.onBuyNpc = function (_arg1:Object):void{
                var callback:* = null;
                var data:* = _arg1;
                if (data.canBuyTimer <= 0){
                    _view.showTip(LodgeViewLang.SummerEnd);
                    return;
                };
                _buyNpcData = data;
                if (_view.ingotEnough(data.buyPrice) == false){
                    return;
                };
                if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.BuyFateNpc)){
                    dialog.yesLabel = LodgeViewLang.Sure;
                    dialog.cancelLabel = LodgeViewLang.Cancel;
                    dialog.hasCheckbox = true;
                    callback = function (_arg1:uint):void{
                        if (_arg1 == AlertButtonType.Yes){
                            buy_fate_npc(_buyNpcData.fateNpcId);
                        };
                        if (dialog.checked){
                            _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.BuyFateNpc, true);
                        };
                    };
                    dialog.show(Lang.sprintf(LodgeViewLang.SummerNpc, HtmlText.yellow((data.buyPrice + LodgeViewLang.Ingot)), data.npcName), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
                } else {
                    buy_fate_npc(_buyNpcData.fateNpcId);
                };
            };
            this.reposition();
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function sellFate():void{
            var _local1:int = this._sellData.tempFateId;
            this._sellType = "one";
            this._grid = _local1;
            this.sale_temp_fate([[_local1]]);
            _view.guide.stopFateLodgeGuide(this._lodge.lodgePlayer);
        }
        public function reposition(_arg1:Boolean=true):void{
            if (this.inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._lodge.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight);
            };
        }
        public function onOneSell(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.sellFate();
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function onBuyNpc(_arg1:uint):void{
            switch (_arg1){
                case AlertButtonType.Yes:
                    this.buy_fate_npc(this._buyNpcData.fateNpcId);
                    break;
                case AlertButtonType.No:
                    break;
            };
        }
        public function set renderIngot(_arg1:Number):void{
            if (this.inStage){
                this._lodge.renderIngot = _arg1;
            };
        }
        public function set renderCoins(_arg1:Number):void{
            if (this.inStage){
                this._lodge.renderCoins = _arg1;
            };
        }
        public function clear():void{
            Helper.gc();
        }
        public function close():void{
            this._tempFateIdData = {};
            this._isFastFate = false;
            this._isUser = false;
            this.clear();
            this._lodge.close();
            _popup.closeView(this);
            this._lodge = null;
            _view.guide.stopFateWearGuide();
        }
        override public function get inStage():Boolean{
            return (((this._lodge) && (this._lodge.content.parent)));
        }
        public function get content():Sprite{
            if (this._lodge == null){
                return (null);
            };
            return (this._lodge.content);
        }
        public function get lodgePlayer():Sprite{
            if (this._lodge == null){
                return (null);
            };
            return (this._lodge.lodgePlayer);
        }

    }
}//package com.views 

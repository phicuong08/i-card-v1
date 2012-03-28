//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class MyFlowerRecordView extends Base implements IView {

        private var _myFlowerRecord:IMyFlowerRecord;

        public function show():void{
            if (!FunctionType.isOpened(FunctionType.SendFlower)){
                return;
            };
            this.loadData();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._myFlowerRecord.clear();
        }
        private function showUI():void{
            _popup.addView(this, this._myFlowerRecord.content);
            _view.center(sign, this._myFlowerRecord.content);
        }
        private function render():void{
            var _local1:Object = this._ctrl.sendFlower.sendFlowerInfo();
            if (_local1["result"] == Mod_SendFlower_Base.FUN_OPENED){
                this._view.showTip(this.message(_local1["result"]));
                return;
            };
            if (this._myFlowerRecord == null){
                this._myFlowerRecord = (_view.getAssetsObject("SendFlower", "MyFlowerRecord") as IMyFlowerRecord);
            };
            this.init();
            this._myFlowerRecord.init();
            this.playerSendFlowerInfoCallBack();
            this.showUI();
        }
        private function init():void{
            this._myFlowerRecord.tip = this._view.tip.iTip;
            this._myFlowerRecord.drag = this._view.drag.iDrag;
            this._myFlowerRecord.onClose = this.close;
            this._myFlowerRecord.onTextLink = this._view.toolbar.onTextLink;
            this._myFlowerRecord.onQueryFlower = this.send_flower_ranking;
        }
        private function loadData():void{
            _data.call(Mod_SendFlower_Base.player_send_flower_info, this.loadDataCallBack, [this._ctrl.player.playerId]);
        }
        private function loadDataCallBack():void{
            loadAssets("SendFlower", this.render, MyFlowerRecordViewLang.LoadInfo);
        }
        private function playerSendFlowerInfoCallBack():void{
            var _local1:Object = this._ctrl.sendFlower.sendFlowerInfo();
            if (_local1["result"] == Mod_SendFlower_Base.FUN_OPENED){
                this._view.showTip(this.message(_local1["result"]));
                return;
            };
            var _local2:Array = this._ctrl.sendFlower.sendFlowerRecord();
            this._myFlowerRecord.renderMyFlowerRecord(_local1, _local2);
        }
        private function send_flower_ranking():void{
            _data.call(Mod_SendFlower_Base.send_flower_ranking, this.sendFlowerRankingCallBack, []);
        }
        private function sendFlowerRankingCallBack():void{
            var _local1:Array = this._ctrl.sendFlower.sendFlowerRanking();
            this._myFlowerRecord.renderSendFlowerRanking(_local1);
        }
        private function message(_arg1:int):String{
            var _local2:String = "";
            switch (_arg1){
                case Mod_SendFlower_Base.SUCCESS:
                    _local2 = MyFlowerRecordViewLang.Success;
                    break;
                case Mod_SendFlower_Base.FUN_OPENED:
                    _local2 = MyFlowerRecordViewLang.FunOpened;
                    break;
                case Mod_SendFlower_Base.NOT_ENOUGH_INGOT:
                    _local2 = MyFlowerRecordViewLang.NotEnoughIngot;
                    break;
                case Mod_SendFlower_Base.NOT_ENOUGH_COIN:
                    _local2 = MyFlowerRecordViewLang.NotEnoughCoin;
                    break;
                case Mod_SendFlower_Base.SAME_SEX:
                    _local2 = MyFlowerRecordViewLang.SameSex;
                    break;
                case Mod_SendFlower_Base.SEND_SELF:
                    _local2 = MyFlowerRecordViewLang.SendSelf;
                    break;
                default:
                    _local2 = (MyFlowerRecordViewLang.Error + _arg1);
            };
            return (_local2);
        }

    }
}//package com.views 

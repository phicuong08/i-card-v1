//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.*;
    import com.controllers.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.info.*;
    import com.haloer.display.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.lang.client.com.views.*;
    import com.assist.view.guide.*;

    public class TrainingView extends com.views.Base implements IView {

        private var _target:ITraining;
        public var roleInfo:RoleInfo;

        public function show():void{
            this.panel_show();
        }
        public function close():void{
            _popup.closeView(this);
            this.onCancelForGuide();
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("Training", "MCTraining") as ITraining);
                this._target.onClose = this.close;
                this._target.onPeiyang = this.onPeiyang;
                this._target.onSave = this.onSave;
                this._target.onCancel = this.onCancel;
                this._target.tfIngot1.htmlText = (TrainingViewLang.Training1 + HtmlText.format(TrainingViewLang.Ingot2, 0xF39700));
                this._target.tfIngot2.htmlText = (TrainingViewLang.Training2 + HtmlText.format(TrainingViewLang.Ingot10, 0xF39700));
                this._target.tfIngot3.htmlText = (TrainingViewLang.Training3 + HtmlText.format(TrainingViewLang.Ingot20, 0xF39700));
                this._target.tfIngot4.htmlText = (TrainingViewLang.Training4 + HtmlText.format(TrainingViewLang.Ingot100, 0xF39700));
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
            };
            _popup.addView(this, this._target.content);
            var _local1:Image = new Image(this.roleInfo.headUrl);
            _local1.onComplete = this.laodHeadIconComplete;
            this._target.headIcon = _local1;
            this._target.tfName.text = this.roleInfo.name;
            this._target.tfLv.text = (this.roleInfo.lv + TrainingViewLang.Lv);
            this._target.tfCoin.htmlText = ((TrainingViewLang.Training0 + this.rolemsg.coin) + TrainingViewLang.Coin);
            this._target.radio = this.rolemsg.radio;
            this.updateOldProperty(this.rolemsg.trainingBase, this.rolemsg.trainingOld, this.rolemsg.trainingNew);
            this._view.guide.trackTraining(3, this._target.content);
        }
        private function laodHeadIconComplete(_arg1:Image):void{
            _arg1.width = (_arg1.height = 50);
        }
        private function updateOldProperty(_arg1:Array, _arg2:Array, _arg3:Array):void{
            this.roleInfo.pWuLi = (_arg1[0] + _arg2[0]);
            this.roleInfo.pJueJi = (_arg1[1] + _arg2[1]);
            this.roleInfo.pFaShu = (_arg1[2] + _arg2[2]);
            var _local4:int = ((this.roleInfo.lv * 2) + 20);
            var _local5:Boolean;
            var _local6:Array = ["", "", ""];
            var _local7:Array = ["", "", ""];
            var _local8:Array = [3, 3, 3];
            var _local9:int;
            while (_local9 < 3) {
                if (_arg2[_local9] == _local4){
                    _local6[_local9] = ((_arg1[_local9] + HtmlText.green(("+" + _arg2[_local9]))) + HtmlText.yellow2(TrainingViewLang.Full));
                } else {
                    _local6[_local9] = (_arg1[_local9] + HtmlText.green(("+" + _arg2[_local9])));
                    _local5 = false;
                };
                _local9++;
            };
            _local9 = _arg3.length;
            while (_local9 > 0) {
                _local9--;
                if (_arg3[_local9] > _arg2[_local9]){
                    _local8[_local9] = 2;
                    _local7[_local9] = (_arg1[_local9] + HtmlText.green(("+" + _arg3[_local9])));
                } else {
                    if (_arg3[_local9] < _arg2[_local9]){
                        _local8[_local9] = 1;
                        _local7[_local9] = (_arg1[_local9] + HtmlText.red(("+" + _arg3[_local9])));
                    } else {
                        _local7[_local9] = (_arg1[_local9] + HtmlText.green(("+" + _arg3[_local9])));
                    };
                };
                if (_arg3[_local9] == _local4){
                    _local7[_local9] = ((_arg1[_local9] + HtmlText.green(("+" + _arg3[_local9]))) + HtmlText.yellow2(TrainingViewLang.Full));
                };
            };
            this._target.setProperty(_local6[0], _local6[1], _local6[2], _local7[0], _local7[1], _local7[2], _local8[0], _local8[1], _local8[2], _local5);
        }
        private function onPeiyang():void{
            this.training(this._target.radioIdx);
            this.onTrainingForGuide();
        }
        private function onSave():void{
            var cookie:* = null;
            var checked:* = false;
            if (_ctrl.rolemsg.hasLower == true){
                cookie = (this + "Save");
                checked = (_view.getCookie(cookie) == 1);
                if (checked == true){
                    this.modify_role_data();
                } else {
                    _view.alert.iAlert.hasCheckbox = true;
                    _view.alert.showYesNoMsg(TrainingViewLang.SaveShuXing, TrainingViewLang.Yes, TrainingViewLang.No, function (_arg1:int):void{
                        if (_arg1 == AlertButtonType.Yes){
                            modify_role_data();
                            if (_view.alert.iAlert.checked == true){
                                _view.setCookie(cookie, 1);
                            };
                        } else {
                            updateOldProperty(rolemsg.trainingBase, rolemsg.trainingOld, rolemsg.trainingNew);
                        };
                    });
                };
            } else {
                this.modify_role_data();
            };
        }
        private function onCancel():void{
            this.onCancelForGuide();
            this.updateOldProperty(this.rolemsg.trainingBase, this.rolemsg.trainingOld, []);
        }
        private function get rolemsg():RoleMsgController{
            return (_ctrl.rolemsg);
        }
        private function panel_show():void{
            _data.call(Mod_Training_Base.panel_show, this.panel_show_back, [this.roleInfo.playerRoleId]);
        }
        private function panel_show_back():void{
            loadAssets("Training", null, TrainingViewLang.LoadTrainingTip, false, false, this.loadComplete);
        }
        private function training(_arg1:int):void{
            _data.call(Mod_Training_Base.training, this.training_back, [this.roleInfo.playerRoleId, _arg1]);
        }
        private function training_back():void{
            this.updateOldProperty(this.rolemsg.trainingBase, this.rolemsg.trainingOld, this.rolemsg.trainingNew);
            if (this.rolemsg.result == Mod_Training_Base.SUCCEED){
            } else {
                if (this.rolemsg.result == Mod_Training_Base.NOENOUGHCOINS){
                    _view.showTip(TrainingViewLang.CoinLack);
                } else {
                    if (this.rolemsg.result == Mod_Training_Base.NOENOUGHINGOT){
                        _view.showTip(TrainingViewLang.IngotLack);
                    } else {
                        _view.showTip(TrainingViewLang.TrainingFails);
                    };
                };
            };
        }
        private function modify_role_data():void{
            _data.call(Mod_Training_Base.modify_role_data, this.modify_role_data_back, [this.roleInfo.playerRoleId]);
        }
        private function modify_role_data_back():void{
            if (this.rolemsg.result == Mod_Training_Base.SUCCEED){
                _view.showTip(TrainingViewLang.SaveSucess, "", TipType.Success);
                this.updateOldProperty(this.rolemsg.trainingBase, this.rolemsg.trainingOld, this.rolemsg.trainingNew);
                this._target.playSaveOK();
                this._view.roleMsg.updateSimpe();
                this.onCancelForGuide();
            } else {
                _view.showTip(TrainingViewLang.TrainingFails);
            };
        }
        private function onTrainingForGuide():void{
            this._view.guide.trackTraining(4, this._target.content);
        }
        private function onCancelForGuide():void{
            _view.guide.setCookie(GuideType.Training);
            _view.guide.stopTrainingGuides();
        }

    }
}//package com.views 

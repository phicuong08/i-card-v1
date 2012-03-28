//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.assist.server.*;
    import com.assist.view.*;
    import com.assist.view.controls.*;
    import com.assist.view.interfaces.*;
    import com.lang.client.com.views.*;
    import com.protocols.*;

    public class TravelEventView extends Base implements IView {

        public var onActivityInfo:Function;
        private var _cdIngot:int = 0;
        private var _answerValue:Array;
        private var _cdTime:int = 0;
        private var _lastIngot:int = 120;
        private var _travelEvent:ITravelEvent;
        private var _autoClearCdBool:Boolean = false;

        public function TravelEventView(){
            this.onActivityInfo = new Function();
            super();
        }
        public function get_activity_info():void{
            if (FunctionType.isOpened(FunctionType.TravelEvent) == false){
                return;
            };
            _data.call(Mod_TravelEvent_Base.get_activity_info, this.activityInfoCallBack, []);
        }
        private function get_event_and_answer():void{
            _data.call(Mod_TravelEvent_Base.get_event_and_answer, this.eventCallBack, []);
        }
        private function answer_travel_event(_arg1:int, _arg2:int):void{
            _data.call(Mod_TravelEvent_Base.answer_travel_event, this.answerCallBack, [_arg1, _arg2]);
        }
        public function cancel_cd():void{
            _data.call(Mod_TravelEvent_Base.cancel_cd, this.cancelCdCallBack, []);
        }
        private function activityInfoCallBack():void{
            var _local1:Object = this._ctrl.travelEvent.activityInfo;
            this.onActivityInfo(_local1);
            this.leftQuickly(_local1);
        }
        private function eventCallBack():void{
            var _local1:Object = this._ctrl.travelEvent.eventAndAnswer;
            if (_local1.msg == Mod_TravelEvent_Base.SUCCESS){
                this._travelEvent.eventInfo = _local1;
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function answerCallBack():void{
            var _local1:Object = this._ctrl.travelEvent.answer;
            this._answerValue = [];
            this._answerValue = _local1.answerValue;
            this._travelEvent.awardInfo = _local1.answer;
            this.onActivityInfo(_local1.activityInfo);
            this.leftQuickly(_local1.activityInfo);
            if (this._autoClearCdBool){
                this.cancel_cd();
            };
        }
        private function leftQuickly(_arg1:Object):void{
            this._lastIngot = Math.ceil(((120 + (_arg1.joinCount * 180)) / 60));
            var _local2:Boolean = (_arg1.joinCount < (_arg1.totalCount - 1));
            if (_arg1.joinCount >= _arg1.totalCount){
                this._autoClearCdBool = false;
                this._lastIngot = 0;
            };
            if (this.inStage){
                this._travelEvent.getClearIngo = this._lastIngot;
                this._travelEvent.visibleIngot = _local2;
            };
            var _local3:int = (_arg1.cdTimer * 1000);
            this._view.toolbar.travelEventEndTime = (new Date().time + _local3);
            this._view.toolbar.travelEventJoinCount = _arg1.joinCount;
            this._view.toolbar.travelEventTotalCount = _arg1.totalCount;
            this._view.toolbar.renderTravelEventTip(_arg1.cdIngot);
            this._view.toolbar.setFunctionLinkPoint();
            this._cdIngot = _arg1.cdIngot;
            this._cdTime = _arg1.cdTimer;
        }
        private function downTime():void{
            if (this._cdTime > 0){
                this._cdTime--;
            };
        }
        private function cancelCdCallBack():void{
            var _local1:Object = this._ctrl.travelEvent.cancelCd;
            if (_local1.msg == Mod_TravelEvent_Base.SUCCESS){
                this.get_activity_info();
            } else {
                this.renderMsg(_local1.msg);
            };
        }
        private function renderMsg(_arg1:int):void{
            switch (_arg1){
                case Mod_TravelEvent_Base.CD_TIME:
                    if (this._autoClearCdBool){
                        this.cancel_cd();
                    } else {
                        this.close();
                        _view.showTip(TravelEventViewLang.CdTime);
                    };
                    break;
                case Mod_TravelEvent_Base.REACH_MAX_COUNT:
                    _view.showTip(TravelEventViewLang.ReachMaxCount);
                    this.close();
                    break;
                case Mod_TravelEvent_Base.NO_INGOT:
                    _view.showTip(TravelEventViewLang.NoIngot);
                    this.close();
                    break;
            };
        }
        public function show():void{
            loadAssets("TravelEvent", this.render, TravelEventViewLang.LoadAssets);
        }
        public function render():void{
            this._travelEvent = (_view.getAssetsObject("TravelEvent", "TravelEvent") as ITravelEvent);
            _popup.addView(this, this._travelEvent.content);
            _view.center(sign, this._travelEvent.content);
            this.get_event_and_answer();
            this._travelEvent.onSureClick = function (_arg1:int, _arg2:int):void{
                answer_travel_event(_arg1, _arg2);
            };
            this._travelEvent.onAutoClear = function (_arg1:Boolean):void{
                _autoClearCdBool = _arg1;
            };
            this._travelEvent.onClose = function ():void{
                if (_autoClearCdBool){
                    get_event_and_answer();
                } else {
                    close();
                };
                _view.activities.playOpenFunctionMc();
            };
            this._autoClearCdBool = false;
            this.get_activity_info();
        }
        public function refreshTravelInfo():void{
            this.get_activity_info();
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        public function cancelCd():void{
            var callback:* = null;
            if (_view.vipEnabled == false){
                return;
            };
            var timer:* = _view.toolbar.travelEventCdTime;
            this._cdIngot = Math.ceil((timer / 60));
            if ((((this._cdIngot <= 0)) || ((_view.ingotEnough(this._cdIngot) == false)))){
                return;
            };
            if (!_view.consumeAlertSetting.isAlert(ConsumeAlertSetType.TravelEventCD)){
                this.dialog.yesLabel = TravelEventViewLang.Sure;
                this.dialog.cancelLabel = TravelEventViewLang.Cancel;
                this.dialog.hasCheckbox = true;
                callback = function (_arg1:uint):void{
                    if (_arg1 == AlertButtonType.Yes){
                        cancel_cd();
                    };
                    if (dialog.checked){
                        _view.consumeAlertSetting.saveSetting(ConsumeAlertSetType.TravelEventCD, true);
                    };
                };
                this.dialog.show(Lang.sprintf(TravelEventViewLang.ClearCd, HtmlText.yellow((this._cdIngot + TravelEventViewLang.Ingot))), (AlertButtonType.Yes | AlertButtonType.Cancel), callback);
            } else {
                this.cancel_cd();
            };
        }
        public function clear():void{
        }
        public function close():void{
            _popup.closeView(this);
            this._travelEvent.close();
            this._answerValue = [];
        }

    }
}//package com.views 

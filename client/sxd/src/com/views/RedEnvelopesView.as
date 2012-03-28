//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import com.protocols.*;
    import com.assist.view.controls.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class RedEnvelopesView extends Base implements IView {

        private var _redEnvelopes:IRedEnvelopes;
        private var _showLen:int = 0;

        public function show():void{
            _inStageTipTitle = "";
            this.get_envelopes_info();
        }
        private function renderShow():void{
            loadAssets("RedEnvelopes", this.render, RedEnvelopesViewLang.LoadAssets);
        }
        public function get_envelopes_info():void{
            _data.call(Mod_RedEnvelopes_Base.get_envelopes_info, this.getEnvelopesCallBack, []);
        }
        public function envelopesList():void{
            _data.call(Mod_RedEnvelopes_Base.get_envelopes_info, this.showEnvelopesCallBack, []);
        }
        public function getDate():void{
            this._data.call(Mod_RedEnvelopes_Base.get_date, this.getDateCallBack, []);
        }
        public function get_envelope(_arg1:int):void{
            _data.call(Mod_RedEnvelopes_Base.get_envelope, this.getEnvelopeCallBack, [_arg1]);
        }
        private function getEnvelopesCallBack():void{
            var _local1:Array;
            if (this.inStage){
                _local1 = _ctrl.redEnvelopes.getEnvelopsList;
                this._showLen = _local1.length;
                this._redEnvelopes.getPackedList(_local1);
                this._redEnvelopes.lostTimeInfo = _ctrl.redEnvelopes.showTime;
            } else {
                this.renderShow();
            };
        }
        private function showEnvelopesCallBack():void{
            var _local1:Array = _ctrl.redEnvelopes.getEnvelopsList;
            var _local2:Date = new Date(2012, 0, 27);
            var _local3:Number = (_local2.time / 1000);
            if ((((_local1.length > 0)) || ((_ctrl.player.serverTime < _local3)))){
                _view.activities.addActivity(ActivityType.RedEnvelopes);
            };
        }
        private function getEnvelopeCallBack():void{
            var _local1:Object = _ctrl.redEnvelopes.GetEnvelope;
            if (_local1.msg == Mod_RedEnvelopes_Base.SUCCESS){
                _view.showTip(RedEnvelopesViewLang.GetSuccess, "", TipType.Success);
                this.get_envelopes_info();
            } else {
                this.renderMsg(_local1);
            };
        }
        private function getDateCallBack():void{
            var _local1:Number = _ctrl.redEnvelopes.GetDate;
            this.envelopesList();
        }
        private function renderMsg(_arg1:Object):void{
            switch (_arg1.msg){
                case Mod_RedEnvelopes_Base.SUCCESS:
                    break;
                case Mod_RedEnvelopes_Base.TIME_ERROR:
                    _view.showTip(RedEnvelopesViewLang.TimeError);
                    break;
                case Mod_RedEnvelopes_Base.NO_GRID:
                    _view.showTip(RedEnvelopesViewLang.NoGrid);
                    break;
                case Mod_RedEnvelopes_Base.FAILURE:
                    _view.showTip(RedEnvelopesViewLang.Failure);
                    break;
            };
        }
        private function get dialog():IAlert{
            return (_view.alert.iAlert);
        }
        private function render():void{
            this._redEnvelopes = (_view.getAssetsObject("RedEnvelopes", "RedEnvelopes") as IRedEnvelopes);
            _popup.addView(this, this._redEnvelopes.content);
            this._redEnvelopes.tip = _view.tip.iTip;
            this._redEnvelopes.drag = _view.drag.iDrag;
            _view.center(sign, this._redEnvelopes.content);
            this._redEnvelopes.onClose = function ():void{
                close();
            };
            this._redEnvelopes.onTip = function (_arg1:String):void{
            };
            this._redEnvelopes.onGetEnvelope = function (_arg1:int):void{
                get_envelope(_arg1);
            };
            this.getEnvelopesCallBack();
        }
        public function close():void{
            var _local1:Date = new Date(2012, 0, 27);
            var _local2:Number = (_local1.time / 1000);
            if ((((this._showLen <= 0)) && ((_ctrl.player.serverTime > _local2)))){
                _view.activities.removeActivity(ActivityType.RedEnvelopes);
            };
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._redEnvelopes.clear();
        }

    }
}//package com.views 

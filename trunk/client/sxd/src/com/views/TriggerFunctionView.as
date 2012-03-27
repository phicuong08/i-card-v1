//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.haloer.net.*;
    import com.assist.view.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class TriggerFunctionView extends Base implements IView {

        private var _triggerList:Array;
        private var _campWarList:Array;
        public var isFirstCamp:Boolean = false;
        private var _trigger:ITriggerFunction;
        public var onStart:Function;
        private var _light:Class;
        private var _functionOpen:FunctionOpen;
        private var _triggerUrl:Array;
        private var _newTriggerList:Array;

        public function show():void{
            if ((((this._triggerList == null)) || ((this._triggerList.length <= 0)))){
                return;
            };
            loadAssets("TriggerFunction", this.loadFunctionAssets, TriggerFunctionViewLang.LoadInfo, false, true);
        }
        private function loadFunctionAssets():void{
            var progress:* = function (_arg1:int, _arg2:int):void{
                _view.panelLoading.updatePanelLoading(TriggerFunctionViewLang.LoadInfo, _arg2);
            };
            File.loadList(this._triggerUrl, this.render, progress, null, this.error);
        }
        private function error(_arg1:int):void{
            _view.alert.confirm((TriggerFunctionViewLang.LackImage + this._triggerList[_arg1]));
        }
        public function triggerList(_arg1:Array, _arg2:Boolean=true):void{
            var _local3:int = _arg1.length;
            var _local4:int = (_local3 - 1);
            while (_local4 >= 0) {
                if (_arg1[_local4] == "Stunt"){
                    _arg1.splice(_local4, 1);
                };
                if ((((_arg1[_local4] == FunctionType.CampWar)) && (_arg2))){
                    _arg1[_local4] = FunctionType.CampWar;
                };
                _local4--;
            };
            this.triggerUrl(_arg1);
            this._triggerList = _arg1;
        }
        public function get_war_mode():void{
            if (FunctionType.isOpened(FunctionType.CampWar) == false){
                return;
            };
            this.isFirstCamp = true;
            _data.call(Mod_HeroesWar_Base.get_war_mode, this.getWarModeCallBack, []);
        }
        private function getWarModeCallBack():void{
            this.isFirstCamp = false;
            _view.activities.getWarModeCallBack();
            var _local1:Object = _ctrl.heroesWar.getWarMode;
            var _local2:int = this._campWarList.length;
            var _local3:int = (_local2 - 1);
            while (_local3 >= 0) {
                if (this._campWarList[_local3] == FunctionType.CampWar){
                    this._campWarList[_local3] = ((_local1.mode == 0)) ? FunctionType.CampWar : FunctionType.HeroesWar;
                };
                _local3--;
            };
            this.triggerList(this._campWarList, false);
            this.show();
        }
        private function render(_arg1:Array):void{
            this.loadFunctionBarEffect(_arg1);
        }
        public function loadFunctionBarEffect(_arg1:Array):void{
            var list:* = _arg1;
            _view.panelLoading.close();
            this.renderTarget(list);
        }
        private function renderTarget(_arg1:Array):void{
            var list:* = _arg1;
            this._trigger = (_view.getAssetsObject("TriggerFunction", "TriggerFunction") as ITriggerFunction);
            _structure.alert.addChild(this._trigger.content);
            var newList:* = this.triggerDataRender(list);
            this._trigger.onStart = function ():void{
                if ((onStart is Function)){
                    onStart();
                };
                close();
            };
            this._trigger.triggerUrl = URI.triggerUrl;
            this._trigger.newFunction(newList);
            _view.center(sign, this._trigger.content);
            _view.guide.trackPartners(5, this._trigger.content);
        }
        private function triggerUrl(_arg1:Array):void{
            var _local4:String;
            this._triggerUrl = [];
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = ((URI.triggerUrl + _arg1[_local3]) + ".swf");
                this._triggerUrl.push(_local4);
                _local3++;
            };
        }
        private function triggerDataRender(_arg1:Array):Array{
            var _local4:Object;
            this._newTriggerList = [];
            var _local2:int = _arg1.length;
            var _local3:int;
            while (_local3 < _local2) {
                _local4 = {};
                _local4.map = (_arg1[_local3] as File).loader;
                _local4.sign = this._triggerList[_local3];
                this._newTriggerList.push(_local4);
                _local3++;
            };
            return (this._newTriggerList);
        }
        public function isOpenTrigger(_arg1:String):Boolean{
            if (this._newTriggerList == null){
                return (false);
            };
            var _local2:int = this._newTriggerList.length;
            var _local3:int;
            while (_local3 < _local2) {
                if (this._newTriggerList[_local3].sign == _arg1){
                    return (true);
                };
                _local3++;
            };
            return (false);
        }
        public function clear():void{
            this._triggerList = [];
            this._trigger.clear();
        }
        public function close():void{
            this.isFirstCamp = false;
            this.clear();
            _view.cancelCenter(sign);
            _structure.alert.removeChild(this._trigger.content);
            _view.guide.startTrainingGuides();
        }

    }
}//package com.views 

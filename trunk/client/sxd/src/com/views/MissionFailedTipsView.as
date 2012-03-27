//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.*;
    import com.haloer.net.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.assist.server.*;
    import com.lang.client.com.views.*;

    public class MissionFailedTipsView extends Base implements IView {

        private var _tipsUrl:String;
        private var _tip:IMissionFailedTips;
        public var missionId:int;
        private var _list:Array;
        private var _infos:Array;

        public function MissionFailedTipsView(){
            this._tipsUrl = (URI.assetsUrl + "icons/mission_failed_tips/");
            super();
        }
        public function show():void{
            var _local3:Object;
            var _local1:Array = MissionFailedTipsType.getTipsByMissionId(this.missionId);
            if (_local1.length == 0){
                return;
            };
            this._list = [];
            this._infos = [];
            var _local2:int;
            while (_local2 < _local1.length) {
                this._list[_local2] = ((this._tipsUrl + _local1[_local2][0]) + ".swf");
                _local3 = {};
                _local3.sign = _local1[_local2][0];
                _local3.info = _local1[_local2][1];
                this._infos.push(_local3);
                _local2++;
            };
            this._list.unshift(_view.getAssetsUrl("MissionFailedTips"));
            this.loadResources(this._list);
        }
        private function loadResources(_arg1:Array):void{
            var list:* = _arg1;
            var error:* = function (_arg1:int):void{
                _view.alert.confirm(Lang.sprintf(MissionFailedTipsViewLang.Lost, list[_arg1].replace(/^[\s\S]+\//, "")));
            };
            File.loadList(list, this.render, null, null, error);
        }
        public function render(_arg1:Array):void{
            var list:* = _arg1;
            if ((((_view.missionMap.inStage == false)) || ((inStage == true)))){
                return;
            };
            this._tip = (list[0].getClassObject("MissionFailedTips") as IMissionFailedTips);
            this._tip.onClose = this.close;
            this._tip.onFunctionOpen = function (_arg1:String):void{
                openFunction(_arg1);
            };
            _popup.addView(this, this._tip.content);
            var temp:* = [];
            var len:* = list.length;
            var i:* = 1;
            while (i < len) {
                temp.push((list[i] as File).loader.content);
                i = (i + 1);
            };
            this._tip.renderImages(temp, this._infos);
            this.reposition();
        }
        private function openFunction(_arg1:String):void{
            switch (_arg1){
                case MissionFailedTipsType.QiangHua:
                    _view.upgrade.switchSelf();
                    break;
                case MissionFailedTipsType.MingGe:
                    _view.lodge.switchSelf();
                    break;
                case MissionFailedTipsType.PeiYang:
                    _view.roleMsg.switchSelf();
                    break;
                case MissionFailedTipsType.ZhenXing:
                    _view.superDeploy.switchSelf();
                    break;
                case MissionFailedTipsType.QiShu:
                    _view.research.switchSelf();
                    break;
                case MissionFailedTipsType.YaoYuan:
                    _view.farm.switchSelf();
                    break;
                case MissionFailedTipsType.XueXiJueJi:
                    _view.studyStunt.switchSelf();
                    break;
            };
        }
        public function clear():void{
            this._tip.clear();
        }
        public function close():void{
            if (inStage == false){
                return;
            };
            this.clear();
            _popup.closeView(this);
            this._list = null;
            this._infos = null;
            this._tip = null;
        }
        public function reposition(_arg1:Boolean=true):void{
            if (inStage == false){
                return;
            };
            if (true == _arg1){
                _view.toolbar.reposition();
            } else {
                this._tip.reposition(Structure.minStageWidth, Structure.minStageHeight, Structure.maxStageWidth, Structure.maxStageHeight, Structure.stageClip);
            };
        }

    }
}//package com.views 

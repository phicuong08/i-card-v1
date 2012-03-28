//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;
    import flash.net.*;
    import com.assist.view.sound.*;

    public class SettingView extends Base implements IView {

        private var _target:ISetting;
        private var _cookie:SharedObject;

        public function show():void{
            loadAssets("Setting", this.loadComplete, "", true);
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("Setting", "Setting") as ISetting);
                this._target.onClose = this.close;
                this._target.onVolume = this.onVolume;
                this._target.onMute = this.onMute;
                this._target.onCount = this.onCount;
                this._target.onConsume = this.onConsume;
                _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
                if (SoundManage.mute == 0){
                    this.closeSound();
                };
                if (_view.getCookie("Sound_bgVolume") != null){
                    this._target.bgVolume = int(_view.getCookie("Sound_bgVolume"));
                    this._target.gameVolume = int(_view.getCookie("Sound_gameVolume"));
                    SoundManage.bgVolume = int(_view.getCookie("Sound_bgVolume"));
                    SoundManage.gameVolume = int(_view.getCookie("Sound_gameVolume"));
                };
            };
            _popup.addView(this, this._target.content);
        }
        private function onVolume(_arg1:int, _arg2:int):void{
            SoundManage.bgVolume = _arg1;
            SoundManage.gameVolume = _arg2;
            _view.setCookie("Sound_bgVolume", _arg1);
            _view.setCookie("Sound_gameVolume", _arg2);
        }
        private function onMute(_arg1:Boolean):void{
            if (_arg1){
                this.closeSound();
            } else {
                this.openSound();
            };
        }
        private function onCount(_arg1:int):void{
            if (_view.townMap.inStage){
                _view.townMap.otherCount = _arg1;
            };
        }
        private function onConsume():void{
            this._view.consumeAlertSetting.show();
        }
        public function closeSound():void{
            _view.toolbar.soundMute(true);
            _view.setCookie("Sound_Mute", 2);
            SoundManage.mute = 0;
            if (this._target != null){
                this._target.closeSound();
            };
        }
        public function openSound():void{
            _view.toolbar.soundMute(false);
            _view.setCookie("Sound_Mute", 1);
            SoundManage.mute = 1;
            if (this._target != null){
                this._target.openSound();
            };
        }
        public function loadInitSound():void{
            var _local1:int = int(_view.getCookie("Sound_Mute"));
            if (_local1 == 2){
                this.closeSound();
            };
        }

    }
}//package com.views 

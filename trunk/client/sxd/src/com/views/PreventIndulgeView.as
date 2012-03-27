//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import com.haloer.net.*;
    import com.assist.view.interfaces.*;
    import flash.text.*;
    import flash.net.*;
    import com.assist.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;

    public class PreventIndulgeView extends Base implements IView {

        private var _preventIndulge:IPreventIndulge;
        private var _mask:Sprite;
        private var _againstWallowsState:int;
        public var blackScreen:Boolean = false;

        public function show():void{
            if (URI.preventUrl){
                _view.alert.confirm(PreventIndulgeViewLang.PreventIndulgeInfo, this.openPreventUrl);
            } else {
                loadAssets("PreventIndulge", this.render, PreventIndulgeViewLang.LoadInfo);
            };
        }
        public function openPreventUrl(_arg1:uint):void{
            navigateToURL(new URLRequest(URI.preventUrl), (/wanwan\.sina\.com/.test(URI.serverName)) ? "_blank" : "_self");
        }
        public function close():void{
            this.closeUI();
            if (true == this.blackScreen){
                _view.alert.confirm(PreventIndulgeViewLang.ThreeHours);
                this._mask.alpha = 1;
                this._data.close();
            };
        }
        public function clear():void{
            this._preventIndulge.clear();
        }
        private function render():void{
            if (this._preventIndulge == null){
                this._preventIndulge = (_view.getAssetsObject("PreventIndulge", "PreventIndulge") as IPreventIndulge);
            };
            if (inStage){
                this.closeUI();
                if (false == this.blackScreen){
                    return;
                };
            };
            this.addMask();
            _popup.addView(this, this._preventIndulge.content);
            this._preventIndulge.onOkBtn = this.validate_id_card;
            this._preventIndulge.onCloseBtn = this.close;
            this._preventIndulge.onCloseBtn = function ():void{
                close();
            };
            this._preventIndulge.render();
            _view.center(sign, this._preventIndulge.content);
        }
        private function addMask():void{
            var _local2:TextField;
            if (this._mask == null){
                this._mask = new Sprite();
                this._mask.graphics.beginFill(0);
                this._mask.graphics.drawRect(0, 0, this._view.stage.width, this._view.stage.height);
                this._mask.graphics.endFill();
                _local2 = new TextField();
                _local2.autoSize = TextFieldAutoSize.LEFT;
                _local2.htmlText = htmlFormat(PreventIndulgeViewLang.MustRest, 18, 0xFFFFFF, true);
                _local2.x = ((_view.toolbar.width - _local2.width) / 2);
                _local2.y = (((_view.toolbar.height - _local2.height) / 2) - 25);
                this._mask.addChild(_local2);
            };
            this._mask.alpha = 0.3;
            var _local1:Boolean = (((_ctrl.player.againstWallowsNotify == Mod_Player_Base.TIMEUP)) || ((_ctrl.player.againstWallowsInfo == Mod_Player_Base.AGAINST_WALLOWS)));
            if (_local1){
                _popup.addChild(this._mask);
            };
        }
        private function removeMask():void{
            if (_popup.contains(this._mask)){
                _popup.removeChild(this._mask);
            };
        }
        public function closeUI():void{
            this.clear();
            _view.alert.hide();
            _popup.closeView(this);
        }
        private function validate_id_card():void{
            this._data.call(Mod_Player_Base.validate_id_card, this.validateIdCardCallBack, [this._preventIndulge.identity]);
        }
        private function validateIdCardCallBack():void{
            var _local1:Cookie;
            if (_ctrl.player.validateIdCard == Mod_Player_Base.SUCCESS){
                _view.activities.removePreventIndulge();
                this.removeMask();
                _view.openEvent();
                this.closeUI();
                _local1 = new Cookie("PreventIndulge");
                _local1.clear("MustExit");
            } else {
                this._preventIndulge.renderOkBtn(PreventIndulgeViewLang.VerifyFail);
            };
        }

    }
}//package com.views 

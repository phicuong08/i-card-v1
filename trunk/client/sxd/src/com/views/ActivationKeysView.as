//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.events.*;
    import com.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;
    import com.protocols.*;
    import com.lang.client.com.views.*;

    public class ActivationKeysView extends Base implements IView {

        private var _ak:IActivationKeys;

        public function show():void{
            _data.call(Mod_Item_Base.get_empty_grid_number, this.loadResource, [1]);
        }
        private function loadResource():void{
            loadAssets("ActivationKeys", this.render, ActivationKeysViewLang.LoadInfo);
        }
        private function render():void{
            this._ak = (_view.getAssetsObject("ActivationKeys", "ActivationKeys") as IActivationKeys);
            _popup.addView(this, this._ak.content);
            this._ak.tip = _view.tip.iTip;
            this._ak.drag = _view.drag.iDrag;
            this._ak.webDomain = URI.serverName;
            this._ak.nickName = _ctrl.player.originNickName;
            this._ak.url = URI.activationKeysUrl;
            this._ak.onClose = function ():void{
                close();
            };
            this._ak.onSuccess = function ():void{
                success();
            };
            this._ak.onDebug = function (_arg1:Event):void{
            };
            this._ak.init();
            _view.center(sign, this._ak.content);
        }
        private function success():void{
            var _local1:String;
            if ((((_ctrl.player.packNum < 1)) && ((_ctrl.item.result < 1)))){
                _view.alert.confirm(ActivationKeysViewLang.PackFull);
            } else {
                if (_ctrl.player.packNum >= 1){
                    _local1 = ActivationKeysViewLang.CheckPack;
                } else {
                    _local1 = ActivationKeysViewLang.CheckWarehouse;
                };
                _local1 = htmlFormat(Lang.sprintf(ActivationKeysViewLang.Succeed, htmlFormat(ActivationKeysViewLang.Gift, 12, 16631433), _local1), 12, 0xFFFFFF, true);
                _view.alert.confirm(_local1);
            };
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            this._ak.clear();
        }

    }
}//package com.views 

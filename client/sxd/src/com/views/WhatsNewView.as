//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.haloer.net.*;
    import com.assist.view.interfaces.*;
    import com.assist.*;

    public class WhatsNewView extends Base implements IView {

        private var _whatsNew:IWhatsNew;
        private var _tempData:String;

        public function show():void{
            if (_view.login.first){
                return;
            };
            this.loadData();
        }
        private function loadData():void{
            var http:* = null;
            var url:* = null;
            var version:* = URI.gameVersion;
            if (_ctrl.player.lastPlayVersion < version){
                http = new HTTP();
                url = (((URI.assetsUrl + "whats_new/") + version) + ".txt");
                http.onComplete = function (_arg1:Object):void{
                    _tempData = (_arg1 as String);
                    loadResource();
                };
                http.load(((url + "?v=") + URI.getVersion(url)));
            };
        }
        private function loadResource():void{
            loadAssets("WhatsNew", this.render, "", true, true);
        }
        private function render():void{
            this._whatsNew = (_view.getAssetsObject("WhatsNew", "WhatsNew") as IWhatsNew);
            _popup.addView(this, this._whatsNew.content);
            _view.center(sign, this._whatsNew.content);
            this._whatsNew.tip = _view.tip.iTip;
            this._whatsNew.drag = _view.drag.iDrag;
            this._whatsNew.onClose = this.close;
            this._whatsNew.onDrama = this.playDrama;
            this._whatsNew.data = this._tempData;
        }
        public function playDrama(_arg1:String):void{
            _view.dramaPlayBack.onSelect(new XML((("<drama uri=\"" + _arg1) + "\"/>")));
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        public function clear():void{
            removeResource("WhatsNew");
        }

    }
}//package com.views 

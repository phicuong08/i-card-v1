//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;

    public class PanelLoadingView extends Base implements IView {

        private var _panelLoading:IPanelLoading;
        private var _hadCallShow:Boolean = false;

        public function show():void{
            if (this._hadCallShow){
                return;
            };
            this._hadCallShow = true;
            this._panelLoading = (_view.getAssetsObject("PanelLoading", "PanelLoading") as IPanelLoading);
            this._panelLoading.init();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
            _popup.removeMask();
        }
        public function clear():void{
        }
        public function updatePanelLoading(_arg1:String, _arg2:int, _arg3:int=1, _arg4:int=1):void{
            _popup.addMask(true);
            if (_popup.hasView(this) == false){
                _popup.addView(this, this._panelLoading.content);
                _view.center(sign, this._panelLoading.content);
            };
            this._panelLoading.setLoadingProgress(_arg2, _arg3, _arg4);
            this._panelLoading.setLoadingText(_arg1);
        }

    }
}//package com.views 

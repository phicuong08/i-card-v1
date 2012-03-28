//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.*;

    public class ProgressBarView extends Base implements IView {

        private var _progressBar:IProgressBar;

        public function show():void{
            this.showProgressBar();
        }
        public function showProgressBar(_arg1:String="", _arg2:int=6, _arg3:Function=null):void{
            var loadCallBack:* = null;
            var title:String = _arg1;
            var second:int = _arg2;
            var callBack:Function = _arg3;
            loadCallBack = function ():void{
                if (_progressBar == null){
                    _progressBar = (_view.getAssetsObject("ProgressBar", "ProgressBar") as IProgressBar);
                };
                render(title, second, callBack);
            };
            loadAssets("ProgressBar", loadCallBack, "", true, true);
        }
        public function clear():void{
            this._progressBar.clear();
        }
        public function close():void{
            this.clear();
            _popup.closeView(this);
        }
        private function render(_arg1:String, _arg2:int, _arg3:Function):void{
            _popup.addView(this, this._progressBar.content);
            _view.center(sign, this._progressBar.content);
            this._progressBar.onClose = this.close;
            this._progressBar.show(_arg1, _arg2, _arg3);
        }

    }
}//package com.views 

//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import com.assist.view.interfaces.factionWar.*;
    import com.lang.client.com.views.*;

    public class FactionWarSignUpListView extends Base implements IView {

        private var _target:IFactionWarSignUpList;

        public function show():void{
            loadAssets("FactionWarSignUpList", this.loadComplete, FactionWarSignUpListViewLang.Loading, true);
        }
        public function close():void{
            _popup.closeView(this);
        }
        public function clear():void{
        }
        private function loadComplete():void{
            if (this._target == null){
                this._target = (_view.getAssetsObject("FactionWarSignUpList", "FactionWarSignUpList") as IFactionWarSignUpList);
            };
            _popup.addView(this, this._target.content);
            this._target.onClose = this.close;
            this._target.initRank(FactionWarSignUpListViewLang.SignUpTip, _ctrl.factionWarMap.signupList);
            _view.drag.iDrag.addTarget(this._target.dragTitleBar, this._target.content);
        }

    }
}//package com.views 

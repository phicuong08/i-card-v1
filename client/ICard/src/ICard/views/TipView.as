//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views {
    import ICard.assist.view.interfaces.*;
    import ICard.assist.view.controls.*;

    public class TipView extends Base {

        private var _tip:ITip;

        public function show():void{
            //this.iTip.addTarget(_viewMgr.toolbar.content, "演示");
        }
        public function clear():void{
        }
        public function close():void{
        }
        public function hide():void{
            this.iTip.hide();
        }
        public function get iTip():ITip{
            if (!this._tip){
                this._tip = Tip.getInstance();
                this._tip.oParent = _structure.tip;
            };
            return (this._tip);
        }

    }
}//package com.views 

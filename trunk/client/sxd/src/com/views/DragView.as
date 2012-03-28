//Created by Action Script Viewer - http://www.buraks.com/asv
package com.views {
    import flash.display.*;
    import com.assist.view.interfaces.*;
    import com.assist.view.controls.*;

    public class DragView extends Base implements IView {

        private var _iDrag:IDrag;

        public function DragView():void{
            super();
            this.iDrag.onMouseDown = function (_arg1:Sprite):void{
                _popup.updateFocusView(_arg1);
            };
        }
        public function show():void{
        }
        public function clear():void{
        }
        public function close():void{
        }
        public function get iDrag():IDrag{
            if (!this._iDrag){
                this._iDrag = Drag.getInstance();
            };
            return (this._iDrag);
        }

    }
}//package com.views 

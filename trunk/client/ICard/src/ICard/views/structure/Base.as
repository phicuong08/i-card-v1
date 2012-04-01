//Created by Action Script Viewer - http://www.buraks.com/asv
package ICard.views.structure {
    import flash.display.*;

    public class Base extends Sprite {

        public function closeAll():void{
            while (numChildren > 0) {
                removeChildAt(0);
            };
        }
        private function hasChild(_arg1:DisplayObject):Boolean{
            return (((_arg1) && ((_arg1.parent == this))));
        }

    }
}//package com.views.structure 

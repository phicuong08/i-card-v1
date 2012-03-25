//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.geom.*;
    import spark.components.*;
    import mouse_keyboard_mgr.*;

    public class SuperDragGroup extends Group {
		public var __slot1;
        override public function startDrag(_arg1:Boolean=false, _arg2:Rectangle=null):void{
            super.startDrag(_arg1, _arg2);
            MouseMgr.getInstance().setCursor("drag");
        }
        override public function stopDrag():void{
            var _local1:Point;
            super.stopDrag();
            MouseMgr.getInstance().clearCursor("drag");
            if (parent){
                _local1 = parent.globalToLocal(localToGlobal(new Point(0, 0)));
                x = _local1.x;
                y = _local1.y;
            };
        }

    }
}//package custom_control 

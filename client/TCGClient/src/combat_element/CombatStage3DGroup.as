//Created by Action Script Viewer - http://www.buraks.com/asv
package combat_element {
    import mx.core.*;
    import flash.geom.*;
    import custom_control1.*;

    public class CombatStage3DGroup extends MyGroup {

        override public function addElementAt(_arg1:IVisualElement, _arg2:int):IVisualElement{
            var _local3:Point;
            var _local4:Point;
            if (_arg1.parent == CombatStage.getInstance()){
                _local3 = new Point(_arg1.x, _arg1.y);
                _local4 = globalToLocal(CombatStage.getInstance().localToGlobal(_local3));
                _arg1.x = _local4.x;
                _arg1.y = _local4.y;
            };
            return (super.addElementAt(_arg1, _arg2));
        }

    }
}//package combat_element 

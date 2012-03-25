//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import mx.core.*;
    import spark.components.*;

    public class MyGroup extends Group {

        override public function addElementAt(_arg1:IVisualElement, _arg2:int):IVisualElement{
            _arg2 = ((_arg2 > numElements)) ? numElements : _arg2;
            return (super.addElementAt(_arg1, _arg2));
        }

    }
}//package custom_control 

//Created by Action Script Viewer - http://www.buraks.com/asv
package task_guide {
    import ui_element.*;

    public class GuideMouseSign extends MouseFlashSign {

        private var _stepInfo:Object;

        public function set stepInfo(_arg1:Object):void{
            this._stepInfo = _arg1;
            x = GuideSystem.getInstance().getPosById(this._stepInfo["x_position"]);
            y = GuideSystem.getInstance().getPosById(this._stepInfo["y_position"]);
        }
        public function get stepInfo():Object{
            return (this._stepInfo);
        }

    }
}//package task_guide 

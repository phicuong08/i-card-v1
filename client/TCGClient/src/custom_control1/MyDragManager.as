//Created by Action Script Viewer - http://www.buraks.com/asv
package custom_control1 {
    import flash.events.*;

    public class MyDragManager {

        private var seemsLikeDrag:Boolean = false;
        private var dealFunc:Function;

        public function MyDragManager(_arg1, _arg2){
            this.dealFunc = _arg2;
            _arg1.addEventListener(MouseEvent.MOUSE_DOWN, this.mouseDownHandler);
            _arg1.addEventListener(MouseEvent.MOUSE_UP, this.mouseUpHandler);
            _arg1.addEventListener(MouseEvent.ROLL_OUT, this.mouseRollOutHandler);
            _arg1.addEventListener(MouseEvent.MOUSE_MOVE, this.mouseMoveHandler);
        }
        private function mouseDownHandler(_arg1:MouseEvent):void{
            this.seemsLikeDrag = true;
        }
        private function mouseUpHandler(_arg1:MouseEvent):void{
            this.seemsLikeDrag = false;
        }
        private function mouseRollOutHandler(_arg1:MouseEvent):void{
            this.seemsLikeDrag = false;
        }
        private function mouseMoveHandler(_arg1:MouseEvent):void{
            if (this.seemsLikeDrag){
                this.seemsLikeDrag = false;
                this.dealFunc(_arg1);
            };
        }

    }
}//package custom_control 
